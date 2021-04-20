Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F83365CA6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:51:00 +0200 (CEST)
Received: from localhost ([::1]:37392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYseR-0003IT-1w
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbB-0001f1-AQ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsb9-0003ME-Qs
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so13458441wma.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fOv18K+unub7ZcSn/HwTIzHYjgGINDh3Dq3WE9rC+yI=;
 b=HeWJrZL5P6pZHyUIGQj2wqIXoWEoWiW3SlTnGAGQrA0Cba04yoZfgs5UkJvtKEFeT+
 kAazKfbVrCrnJHb12H04AMbyn2+59YrKteVySydZgEDTO27frRfHw43ni/Uikn/j85Lc
 s/Mdj5Qy9pjUQw2aMufp52ctmTu+CwnZB+IsEeTBfiOz+qHbRg58+24GmmP9f4/UNuQr
 P3USfD/556ybqexytkB6qccck7NENCc4TOs9xdI23BdjNprJNEmr2OSwRHaxZ4D3Sn3z
 HNv0JOCJMfe+5D7NhjtMStI5W0qATLUooMVpb70VVmzZ9K3Y0owwBgdgE3E6+m07UpVj
 Sh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOv18K+unub7ZcSn/HwTIzHYjgGINDh3Dq3WE9rC+yI=;
 b=M9DZ822xEanreUoxZF+QAK7uHzGL7BfPAB0WTNz+XtogfZ9qzFK53zTMNfCqerBYZA
 A4DCpLB8GxC7z8DDPNh+hKdJoVhxPGJ5dYvSfijUPXcevffQvZlOCCGDG8nVnoZkO7kD
 vkEc+6oBwEi7y23jzwx8CTTrENB6ypeZgn/NCWtm8jzRz0s4yW84B5kFZthGzbUhcy5O
 W3298rjLN01YYHfvpzC8oYS1f+O+wqGwYax0J99CQIlOSWTuTt3kdd4ZvQED8VlTW/Jn
 GuS46+bIUmrrxpm/PtwJCS5oJOVkITtA3zpfAwohHYtwSuPhGQhSEThqo+bxbCXcko0A
 Fvow==
X-Gm-Message-State: AOAM531/R2S0OrDpIy3mOOEkqSG0GtpEfctJTBli1jz9pLc5jG0o2+dX
 drxNx8+8Umh0tIzmEP616Fk64LNqZhc=
X-Google-Smtp-Source: ABdhPJwySjN6pR1mUzIjvX3vtaSQND49s4ZMtmRhF5BxBBHl0Yy+hI9czo2az3HouecalAe5yJDgpQ==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr5011471wma.80.1618933654202; 
 Tue, 20 Apr 2021 08:47:34 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id d5sm25025824wrx.15.2021.04.20.08.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 08:47:33 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] virtiofsd: Changed allocations of fuse_req to GLib
 functions
Date: Tue, 20 Apr 2021 17:46:36 +0200
Message-Id: <20210420154643.58439-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420154643.58439-1-ma.mandourr@gmail.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the allocation and deallocation of fuse_req structs
using calloc()/free() call pairs to a GLib's g_try_new0()
and g_free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 58e32fc963..812cef6ef6 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -106,7 +106,7 @@ static void list_add_req(struct fuse_req *req, struct fuse_req *next)
 static void destroy_req(fuse_req_t req)
 {
     pthread_mutex_destroy(&req->lock);
-    free(req);
+    g_free(req);
 }
 
 void fuse_free_req(fuse_req_t req)
@@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct fuse_session *se)
 {
     struct fuse_req *req;
 
-    req = (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
+    req = g_try_new0(struct fuse_req, 1);
     if (req == NULL) {
         fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate request\n");
     } else {
@@ -1684,7 +1684,7 @@ static struct fuse_req *check_interrupt(struct fuse_session *se,
         if (curr->u.i.unique == req->unique) {
             req->interrupted = 1;
             list_del_req(curr);
-            free(curr);
+            g_free(curr);
             return NULL;
         }
     }
-- 
2.25.1


