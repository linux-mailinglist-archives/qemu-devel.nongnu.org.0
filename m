Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC946F0666
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:11:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1ON-0004DC-Fo; Thu, 27 Apr 2023 09:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps1OK-0004CX-Cb
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:10:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps1OI-0000Ws-Ol
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682601029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KSnsF99boBCTrrdRTl9kGpCWqd9BQguuGwJL+S7hfJA=;
 b=NXGQGjXN+kyfteDlELEBWA6O3m7JzZSpczLZweilwVBPBLvAKgWCOl4w9D5eRa0EDEZsJs
 duPwMGDsSQnbYYAH0w6TTk8uR/b11+DhbEt+ZsIOIs22twrIoB6G91wn0YLlJE78igZhmI
 aNT8xK/BO2QHGZm3gE7xGz/YsKm33kM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-HWBjiBN2NDKjEkdxCrN-lQ-1; Thu, 27 Apr 2023 09:10:27 -0400
X-MC-Unique: HWBjiBN2NDKjEkdxCrN-lQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94f29909e11so787759266b.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 06:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682601026; x=1685193026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSnsF99boBCTrrdRTl9kGpCWqd9BQguuGwJL+S7hfJA=;
 b=gOyRdDvn563YrtfJSv4RsE1GUOc1WUO3un+BmCrZLVLzuYlepjHCqHoboux/ktiUTV
 cgDMvKmfLq+C9rDPGSTB+2udrh4fip0RHkvqJ4N4b9b/RduRh+hXb7ytdC2QFlex5hVH
 shqe8t9eTbrTl/vXusGlcaJlxC1Pv0eOgQIup0A747bn783kRb1rNbNNrxjVBsylGuHd
 r5OXP3mcIJw8jGuibzCr+8lZiPxhwPZShhpRJfbxgc0xCL1JInmdN4aLpS1FgFeR5mns
 qETkGsKr1Kk1qFRcnKofOhIMYdGeJAVVCKZSEJt73ILWzIyQIQcGaajaPbqGsp/tsCAg
 F9+g==
X-Gm-Message-State: AC+VfDwkfnK6C+iX7IuGDNNBW0P7X32EvtCsqM8afOpGercOHnKf+km3
 df1k/H4y6X5bvNVNQXOjnVG2NhoMQj51jZP0PLBkmVuwtkOygL4Fw9j1hFw0MntGj2nUlAcDFy4
 tpXW8lOv7J2HsmYFnhDuQD9TCLiMCh97v6WnT80va1KCoMpbd6oE5L/QxQtMBoPve+sXq3VOII4
 mMFA==
X-Received: by 2002:a17:907:8687:b0:953:7bb2:28d8 with SMTP id
 qa7-20020a170907868700b009537bb228d8mr1612462ejc.21.1682601026099; 
 Thu, 27 Apr 2023 06:10:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5S3GYQBrK+av3rMDoseY+u6wOdrccOeBlkjXNTYq9KDJbkiY5oSzxUqUwTeeW1qcx4i1Qmpg==
X-Received: by 2002:a17:907:8687:b0:953:7bb2:28d8 with SMTP id
 qa7-20020a170907868700b009537bb228d8mr1612432ejc.21.1682601025652; 
 Thu, 27 Apr 2023 06:10:25 -0700 (PDT)
Received: from [10.168.80.215] ([131.175.147.17])
 by smtp.gmail.com with ESMTPSA id
 me9-20020a170906aec900b0094a962da55dsm9550952ejb.195.2023.04.27.06.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 06:10:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH] tests: virtio-9p-client: Rreaddir fields are all mandatory
Date: Thu, 27 Apr 2023 15:10:23 +0200
Message-Id: <20230427131023.105801-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If rreaddir.entries is NULL, the resulting dirent list is leaked.
Check that the rreaddir case is filled correctly in the caller
when treaddir succeeds; this then makes it possible to remove
the conditionals is v9fs_rreaddir.

Reported by Coverity.

Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index e4a368e03660..17125e78deae 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -579,6 +579,7 @@ TReadDirRes v9fs_treaddir(TReadDirOpt opt)
             v9fs_rlerror(req, &err);
             g_assert_cmpint(err, ==, opt.expectErr);
         } else {
+            g_assert(opt.rreaddir.count && opt.rreaddir.nentries && opt.rreaddir.entries);
             v9fs_rreaddir(req, opt.rreaddir.count, opt.rreaddir.nentries,
                           opt.rreaddir.entries);
         }
@@ -600,9 +601,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
     v9fs_req_recv(req, P9_RREADDIR);
     v9fs_uint32_read(req, &local_count);
 
-    if (count) {
-        *count = local_count;
-    }
+    *count = local_count;
 
     for (int32_t togo = (int32_t)local_count;
          togo >= 13 + 8 + 1 + 2;
@@ -610,9 +609,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
     {
         if (!e) {
             e = g_new(struct V9fsDirent, 1);
-            if (entries) {
-                *entries = e;
-            }
+            *entries = e;
         } else {
             e = e->next = g_new(struct V9fsDirent, 1);
         }
@@ -624,10 +621,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
         v9fs_string_read(req, &slen, &e->name);
     }
 
-    if (nentries) {
-        *nentries = n;
-    }
-
+    *nentries = n;
     v9fs_req_free(req);
 }
 
-- 
2.40.0


