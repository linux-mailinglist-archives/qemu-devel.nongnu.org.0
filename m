Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117B2B0C9D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:28:04 +0100 (CET)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHKF-0001AW-Lo
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kdHGx-0006Pq-In
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kdHGv-0001Tk-4V
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605205475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHwqCeJZDiQPS314siGwvkIrLZjzamSIvtbSpwUbJZE=;
 b=dkXAGchhqcSAkaLnZBP3fj1A4PqjmfaSvFHfsVUNao83K9EtFIICprIu7bLYvFMvRCOnL1
 IT+8HuMKGitPvCu2JerMxgw+IKEv+O2vlR+bWt6mQTOlTuBonG4IdN2ze8FIW45ROQ0pSz
 5edKE6dcOYnIz73T+cLVGtzMLXS+P1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-Cssm7dusPvCFSmjSSFbCOg-1; Thu, 12 Nov 2020 13:24:32 -0500
X-MC-Unique: Cssm7dusPvCFSmjSSFbCOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC4F58049D0
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:24:31 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-211.rdu2.redhat.com [10.10.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB6F11002C1A;
 Thu, 12 Nov 2020 18:24:28 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5CD67222E35; Thu, 12 Nov 2020 13:24:28 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 1/2] virtiofsd: Save error code early at the failure
 callsite
Date: Thu, 12 Nov 2020 13:24:17 -0500
Message-Id: <20201112182418.25395-2-vgoyal@redhat.com>
In-Reply-To: <20201112182418.25395-1-vgoyal@redhat.com>
References: <20201112182418.25395-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change error code handling slightly in lo_setattr(). Right now we seem
to jump to out_err and assume that "errno" is valid and use that to
send reply.

But if caller has to do some other operations before jumping to out_err,
then it does the dance of first saving errno to saverr and the restore
errno before jumping to out_err. This makes it more confusing.

I am about to make more changes where caller will have to do some
work after error before jumping to out_err. I found it easier to
change the convention a bit. That is caller saves error in "saverr"
before jumping to out_err. And out_err uses "saverr" to send error
back and does not rely on "errno" having actual error.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index ec1008bceb..6407b1a2e1 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -686,6 +686,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             res = fchmodat(lo->proc_self_fd, procname, attr->st_mode, 0);
         }
         if (res == -1) {
+            saverr = errno;
             goto out_err;
         }
     }
@@ -695,6 +696,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
 
         res = fchownat(ifd, "", uid, gid, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
         if (res == -1) {
+            saverr = errno;
             goto out_err;
         }
     }
@@ -707,15 +709,15 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             sprintf(procname, "%i", ifd);
             truncfd = openat(lo->proc_self_fd, procname, O_RDWR);
             if (truncfd < 0) {
+                saverr = errno;
                 goto out_err;
             }
         }
 
         res = ftruncate(truncfd, attr->st_size);
+        saverr = res == -1 ? errno : 0;
         if (!fi) {
-            saverr = errno;
             close(truncfd);
-            errno = saverr;
         }
         if (res == -1) {
             goto out_err;
@@ -748,6 +750,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             res = utimensat(lo->proc_self_fd, procname, tv, 0);
         }
         if (res == -1) {
+            saverr = errno;
             goto out_err;
         }
     }
@@ -756,7 +759,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
     return lo_getattr(req, ino, fi);
 
 out_err:
-    saverr = errno;
     lo_inode_put(lo, &inode);
     fuse_reply_err(req, saverr);
 }
-- 
2.25.4


