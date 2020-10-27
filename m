Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF029CBC1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 23:07:34 +0100 (CET)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXX7t-0005iW-3D
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 18:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kXX02-0006Vw-0z
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 17:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kXX00-0000gM-9X
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 17:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603835963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6stckMsSxJwoGs0qORIoM6nIL9/LNiCXptGi3RC248=;
 b=bxjnTXkUD4pK0KJwXqMMzZhabdmy2m4vxxoWDKaUCkk6ujMef9k727D5N7FTQhRzgRxGqn
 Z2VH0itE5Ev9Fc6vQp0R1LWeAmwktDxBdCvIqAesWjuLJlP4Xs6GYncYn7Ad3OlPSgMrCx
 cK5cxARIYZW9NAdfz7Mkuq3sCwuC5OQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-az3Xu2djPqKtpeiwv72E5g-1; Tue, 27 Oct 2020 17:59:19 -0400
X-MC-Unique: az3Xu2djPqKtpeiwv72E5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F65C61239;
 Tue, 27 Oct 2020 21:59:18 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E165210013DB;
 Tue, 27 Oct 2020 21:59:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] iotests/291: Stop NBD server
Date: Tue, 27 Oct 2020 16:59:04 -0500
Message-Id: <20201027215914.619460-3-eblake@redhat.com>
In-Reply-To: <20201027215914.619460-1-eblake@redhat.com>
References: <20201027215914.619460-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 17:59:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

nbd_server_start_unix_socket() includes an implicit nbd_server_stop(),
but we still need an explicit one at the end of the test (where there
follows no next nbd_server_start_unix_socket()), or qemu-nbd will linger
until the test exits.

This will become important when enabling this test to run on FUSE
exports, because then the export (which is the image used by qemu-nbd)
will go away before qemu-nbd exits, which will lead to qemu-nbd
complaining that it cannot flush the bitmaps in the image.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201027164416.144115-3-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/291 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/291 b/tests/qemu-iotests/291
index 77fa38f93d31..b7320bc7adf2 100755
--- a/tests/qemu-iotests/291
+++ b/tests/qemu-iotests/291
@@ -128,6 +128,8 @@ nbd_server_start_unix_socket -r -f qcow2 -B b3 "$TEST_IMG"
 $QEMU_IMG map --output=json --image-opts \
     "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b3" | _filter_qemu_img_map

+nbd_server_stop
+
 # success, all done
 echo '*** done'
 rm -f $seq.full
-- 
2.29.0


