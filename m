Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA06587FB9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 18:08:34 +0200 (CEST)
Received: from localhost ([::1]:54488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIuRd-0001Mb-4Y
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 12:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIuEb-0004HW-Sp
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIuEa-0002Fp-5j
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659455703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhX4jrXbk9vtFV2Hwaj6etLo6FGmqS+rhjQArHZ+ODw=;
 b=JReHz4IlAQKNPGmkUHDimAdNsi15ezGGGI9ptvZ4qLgyrvkt8H3UFuwG+9wXl1+KYd8wFP
 b0VHFwtvGe5bazqILiNBXsTRLWzXfJXHNkAGesn8iWFTwUWeYGqAMmqyv1wGN4zu+PkiSE
 xyFRqvvt4vcPPP4d5BE5BdwjsE0ZZe0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-vKXp5DJvPcGv-X34qtwVuA-1; Tue, 02 Aug 2022 11:55:00 -0400
X-MC-Unique: vKXp5DJvPcGv-X34qtwVuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B50E811E7A;
 Tue,  2 Aug 2022 15:55:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25D4B141510F;
 Tue,  2 Aug 2022 15:54:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, thuth@redhat.com,
 peter.maydell@linaro.org, vgoyal@redhat.com
Cc: peterx@redhat.com,
	quintela@redhat.com
Subject: [PULL 5/5] virtiofsd: Disable killpriv_v2 by default
Date: Tue,  2 Aug 2022 16:54:47 +0100
Message-Id: <20220802155447.216018-6-dgilbert@redhat.com>
In-Reply-To: <20220802155447.216018-1-dgilbert@redhat.com>
References: <20220802155447.216018-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

We are having bunch of issues with killpriv_v2 enabled by default. First
of all it relies on clearing suid/sgid bits as needed by dropping
capability CAP_FSETID. This does not work for remote filesystems like
NFS (and possibly others).

Secondly, we are noticing other issues related to clearing of SGID
which leads to failures for xfstests generic/355 and generic/193.

Thirdly, there are other issues w.r.t caching of metadata (suid/sgid)
bits in fuse client with killpriv_v2 enabled. Guest can cache that
data for sometime even if cleared on server.

Second and Third issue are fixable. Just that it might take a little
while to get it fixed in kernel. First one will probably not see
any movement for a long time.

Given these issues, killpriv_v2 does not seem to be a good candidate
for enabling by default. We have already disabled it by default in
rust version of virtiofsd.

Hence this patch disabled killpriv_v2 by default. User can choose to
enable it by passing option "-o killpriv_v2".

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <YuPd0itNIAz4tQRt@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 7a73dfcce9..371a7bead6 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -767,19 +767,10 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
         fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling killpriv_v2\n");
         conn->want |= FUSE_CAP_HANDLE_KILLPRIV_V2;
         lo->killpriv_v2 = 1;
-    } else if (lo->user_killpriv_v2 == -1 &&
-               conn->capable & FUSE_CAP_HANDLE_KILLPRIV_V2) {
-        /*
-         * User did not specify a value for killpriv_v2. By default enable it
-         * if connection offers this capability
-         */
-        fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling killpriv_v2\n");
-        conn->want |= FUSE_CAP_HANDLE_KILLPRIV_V2;
-        lo->killpriv_v2 = 1;
     } else {
         /*
-         * Either user specified to disable killpriv_v2, or connection does
-         * not offer this capability. Disable killpriv_v2 in both the cases
+         * Either user specified to disable killpriv_v2, or did not
+         * specify anything. Disable killpriv_v2 in both the cases.
          */
         fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling killpriv_v2\n");
         conn->want &= ~FUSE_CAP_HANDLE_KILLPRIV_V2;
-- 
2.37.1


