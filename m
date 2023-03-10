Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBABE6B3437
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 03:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paSR2-0005ch-Rn; Thu, 09 Mar 2023 21:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSR1-0005cV-Jc
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:43 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSR0-0001wF-0W
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:43 -0500
Received: by mail-pg1-x52f.google.com with SMTP id s17so2266687pgv.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 18:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678415080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GG2aqHgGCiNg5mZ5qJ5G1bt8sGQLaCInJg5o3vlkQmc=;
 b=GYkSFtI3dAfTikw1U/qOvXdvNQnPugbe3wMoUTZvBt40L0U3VkmOrmqm6BF41mHBjJ
 g8bn4PdgQ4rvxiJd6O3K4HV14jASSoTPxLCv2dwbcXZMxD5ek9wqh4mHf51NHJAcVuHy
 RZeNWvRNBc7nlUo0zfTTaRrqWzi6QZ1Gle9Z5dgp6ZPNurTnVNq0tuFiKKUPwGF24tI9
 lxp5k9jVzyKFDgtQgc7WNA9ksbhO+VfzPq1RxaeblJP7JoromCfSKoIC4FWeSt6rd3KL
 t1/CxUvnF/DA/X6w97VgnFOYSlQ+SLcBVifZthEeWI/w3hzfa2Ttq8YoBn/AnepvRCN5
 DDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678415080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GG2aqHgGCiNg5mZ5qJ5G1bt8sGQLaCInJg5o3vlkQmc=;
 b=hXJkT4ZcGaX3tS+YvNsf8pN5WFbVWnu2LpuHfKSvmK1x+LQL4ElcAqqaq89dsdLTDy
 gBT2gfggqZLYRFpT2LA5VGKjNu67YAOL53uSAr9KywCDt5bRFROS2H6i53A9HyCme1N8
 eEDsZNjnhaFd2E6kghzGv+nBL5O/ELGagd5ke0CR6Y9g3XNxIAdB5QaFSWlV+S2g630o
 bhRiuDfqzpS73N2aDa0/khn54XvXBWGU3ohK8gzGCAQt2JjRiECPhePUIri6CwLTelXT
 2UVDhaqbTFvhbql+r3PtrocL6FFHsQjIEPdOdK6/v2OCnB04ToiizJuxyNAC6XjrX82L
 SB7Q==
X-Gm-Message-State: AO0yUKW/4gQs+C01Z/DBt0waO6LCEWMBiADGiefWMNHpxS/vHfq/MtNw
 ilmLysAOEGxUwD2MnKJwzI3FrCghZ/zpfBzi8aE=
X-Google-Smtp-Source: AK7set8LqLdX79l/eu5fEi8C9WP65pcU5KzykTMQKlNPWgDsgvRaWkun7YUMYsXXrWpTMg1SiJI52Q==
X-Received: by 2002:a62:1c48:0:b0:60e:d286:56d with SMTP id
 c69-20020a621c48000000b0060ed286056dmr19365644pfc.1.1678415080471; 
 Thu, 09 Mar 2023 18:24:40 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa78187000000b00571f66721aesm246081pfi.42.2023.03.09.18.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 18:24:40 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v7 3/6] memory: Introduce memory_region_transaction_do_commit()
Date: Fri, 10 Mar 2023 10:24:22 +0800
Message-Id: <20230310022425.2992472-4-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Split memory_region_transaction_do_commit() from
memory_region_transaction_commit().

We'll call do_commit() in address_space_to_flatview() in the later patch.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 softmmu/memory.c | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index a992a365d9..33ecc62ee9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1093,34 +1093,41 @@ void memory_region_transaction_begin(void)
     ++memory_region_transaction_depth;
 }
 
-void memory_region_transaction_commit(void)
+void memory_region_transaction_do_commit(void)
 {
     AddressSpace *as;
 
-    assert(memory_region_transaction_depth);
     assert(qemu_mutex_iothread_locked());
 
-    --memory_region_transaction_depth;
-    if (!memory_region_transaction_depth) {
-        if (memory_region_update_pending) {
-            flatviews_reset();
+    if (memory_region_update_pending) {
+        flatviews_reset();
 
-            MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
+        MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
 
-            QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-                address_space_set_flatview(as);
-                address_space_update_ioeventfds(as);
-            }
-            memory_region_update_pending = false;
-            ioeventfd_update_pending = false;
-            MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
-        } else if (ioeventfd_update_pending) {
-            QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-                address_space_update_ioeventfds(as);
-            }
-            ioeventfd_update_pending = false;
+        QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+            address_space_set_flatview(as);
+            address_space_update_ioeventfds(as);
+        }
+        memory_region_update_pending = false;
+        ioeventfd_update_pending = false;
+        MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
+    } else if (ioeventfd_update_pending) {
+        QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+            address_space_update_ioeventfds(as);
         }
-   }
+        ioeventfd_update_pending = false;
+    }
+}
+
+void memory_region_transaction_commit(void)
+{
+    assert(memory_region_transaction_depth);
+    assert(qemu_mutex_iothread_locked());
+
+    --memory_region_transaction_depth;
+    if (!memory_region_transaction_depth) {
+        memory_region_transaction_do_commit();
+    }
 }
 
 static void memory_region_destructor_none(MemoryRegion *mr)
-- 
2.20.1


