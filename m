Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF14D2CF8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:18:59 +0100 (CET)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtPG-0000Tw-Jk
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:18:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRtMy-0006qm-3C
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRtMw-0005Ky-HF
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646820993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ztR8EzopVkIpxowpTtriAjn3jDSjbO2eWUI5fKeOcKA=;
 b=L09G/haVH34B6sjx4kQlgoWqvQJvU51AoJIGYa82Tzapzes5+yCbxwFuwmoiZmEFOUmQoi
 NMZ7qYPaIPcLo1di10UFv+LOGQ9PpduQNLY+XBZxwoWPCbEZNuP0cs/u7NU3zAauDS2RVP
 vYOiw/rq57vLtX90dKjvA2NxL7yoltQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-n-pSKb52N_CFf_ztbeePlg-1; Wed, 09 Mar 2022 05:16:32 -0500
X-MC-Unique: n-pSKb52N_CFf_ztbeePlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D5801006AA6;
 Wed,  9 Mar 2022 10:16:31 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8673B710AB;
 Wed,  9 Mar 2022 10:16:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH] tests/qemu-iotests: Use GNU sed in two more spots where it is
 necessary
Date: Wed,  9 Mar 2022 11:16:26 +0100
Message-Id: <20220309101626.637836-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two spots have been missed in commit 9086c7639822 ("Rework the
checks and spots using GNU sed") - they need GNU sed, too, since they
are using the "+" address form.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/common.filter | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 21819db9c3..f6e6b3bd04 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -106,13 +106,13 @@ _filter_hmp()
 # replace block job offset
 _filter_block_job_offset()
 {
-    sed -e 's/, "offset": [0-9]\+,/, "offset": OFFSET,/'
+    gsed -e 's/, "offset": [0-9]\+,/, "offset": OFFSET,/'
 }
 
 # replace block job len
 _filter_block_job_len()
 {
-    sed -e 's/, "len": [0-9]\+,/, "len": LEN,/g'
+    gsed -e 's/, "len": [0-9]\+,/, "len": LEN,/g'
 }
 
 # replace actual image size (depends on the host filesystem)
-- 
2.27.0


