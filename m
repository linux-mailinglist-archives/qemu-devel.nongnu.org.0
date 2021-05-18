Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C499388244
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:39:53 +0200 (CEST)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7RQ-0006X9-GC
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Ng-00077J-AT
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lj7Nb-0007Oi-E6
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621373753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5yvAN4kT53e/nIfmuECRDsUp0kSLNj/hY2xN7GrUq4=;
 b=TLol5U/8wnnB/yB7KAvFiySnOpwiHeTiHFLSNO5Wb105+GwfPayAKl7uQM4vzm2UHlh5Gj
 unsLKbMYdschOLlJA6yOery4iIk6SKYMFNMWBbDjajQIVfJCeNhnqYShMfypysdnxhh986
 zkudylWWD9qkMBpB78WFvr679sUzKg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-Jfm69jm7OXOoBgsrWHXmyQ-1; Tue, 18 May 2021 17:35:51 -0400
X-MC-Unique: Jfm69jm7OXOoBgsrWHXmyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0135FCB6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 21:35:50 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-77.rdu2.redhat.com [10.10.114.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9EB460C04;
 Tue, 18 May 2021 21:35:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5F097223D99; Tue, 18 May 2021 17:35:46 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 1/7] virtiofsd: Check for EINTR in preadv() and retry
Date: Tue, 18 May 2021 17:35:32 -0400
Message-Id: <20210518213538.693422-2-vgoyal@redhat.com>
In-Reply-To: <20210518213538.693422-1-vgoyal@redhat.com>
References: <20210518213538.693422-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ckuehl@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't seem to check for EINTR and retry. There are other places
in code where we check for EINTR. So lets add a check.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 9efdbd8ffd..755d7fb25c 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -421,6 +421,9 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
 
         if (ret == -1) {
             ret = errno;
+            if (ret == EINTR) {
+                continue;
+            }
             fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
                      __func__, len);
             goto err;
-- 
2.25.4


