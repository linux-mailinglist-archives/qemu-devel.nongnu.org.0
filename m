Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577126B3438
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 03:26:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paSRX-0005fO-1s; Thu, 09 Mar 2023 21:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSRC-0005eN-4b
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:59 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSR7-0001y0-SK
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:51 -0500
Received: by mail-pj1-x102c.google.com with SMTP id l1so3997798pjt.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 18:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678415088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnbAFlawzzcdAvvBRPDdzj3j81OcWEFdiP4smmXMd+s=;
 b=DieprWgRgRew+dXyufCsVgj0d50LlijffMFjhqZKc+vBW5HH4BMYPACjkuvAEJmuYZ
 f4/99bgSq3Vxn//Ay2n87IxglJffmGBRO3ISv44Z96ObO1Y/zgSPdSPuR/LkGsIBzjqr
 G/9MWbNF7llg9COoWpPnOs2rFkCd7UV1GxusnDDfocl2TEib6b2CqiYEYnBpqbWduFeY
 92R4rTYKYyAljtDXLvZGh4creWQPm0TB0QHWvANtEJmGtqdmKRTA7gT9iJM62kym0lx1
 Vuzka+uFxlj0YEk0ukY5uprZqDzLLv4pipqPkMOd53Xw71oF5juYJBfb1/fdok07unke
 3qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678415088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LnbAFlawzzcdAvvBRPDdzj3j81OcWEFdiP4smmXMd+s=;
 b=j/7AeAj7cx+RXXQD8+8A75hASxXMIJ2RtTc7Zc0TsXh3Yy7br6b8leT9rT9yqdYrqZ
 0r2XrpKEJ2UqOiBTbSfP39p5zx3FMvp42fKjkhdMoBDB58Lxc+fgm8r0f65RIiyUk0i7
 YP8IVCc4kVGRK8TG1kmsqI4r7T5HFcEXaPpWErCJlniAocW1K/x3OSxxz4vry6Cnrir9
 r4Guxwv9hKdq0v2gpsdBwiA9olwrhK6mae0KuEiNMPVq59QQG0wIQSbm7qAZpfIrFx8R
 9Earw6hV92AADD3NWpeqRQxiQYpt6codKve7f1bbArILMoG3ohmkgYNYJz9GXmhKvGWG
 Evcg==
X-Gm-Message-State: AO0yUKXzEME6VR+gAHHIYg0rwoUimH6faYvfTL7CWzitRmuvoVIRwVQJ
 HyTwnWUMjysVhFAm7dXL2aVRsTdVWWQU9XmmwGs=
X-Google-Smtp-Source: AK7set9HMN7cMugKW2H0r49hoKs1J7aGA/7PPyDgIX2Jcx0vqC8gcJPFSXgUXV3FM6DWiWIeMfXt4w==
X-Received: by 2002:a05:6a20:8b23:b0:cc:5be9:fe63 with SMTP id
 l35-20020a056a208b2300b000cc5be9fe63mr19877271pzh.8.1678415088476; 
 Thu, 09 Mar 2023 18:24:48 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa78187000000b00571f66721aesm246081pfi.42.2023.03.09.18.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 18:24:48 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v7 6/6] memory: Introduce address_space_to_flatview_rcu()
Date: Fri, 10 Mar 2023 10:24:25 +0800
Message-Id: <20230310022425.2992472-7-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x102c.google.com
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

In last patch, we wrap vm_load with begin/commit, here we introduce
address_space_to_flatview_rcu() to avoid unnecessary enforce commit
during vm_load.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/exec/memory-internal.h |  2 +-
 include/exec/memory.h          | 20 ++++++++++++++++++++
 softmmu/memory.c               |  2 +-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 100c1237ac..1432240449 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -30,7 +30,7 @@ static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
 
 static inline AddressSpaceDispatch *address_space_to_dispatch(AddressSpace *as)
 {
-    return flatview_to_dispatch(address_space_to_flatview(as));
+    return flatview_to_dispatch(address_space_to_flatview_rcu(as));
 }
 
 FlatView *address_space_get_flatview(AddressSpace *as);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index d6fd89db64..235e3017bc 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1100,6 +1100,9 @@ bool memory_region_transaction_in_progress(void);
 
 void memory_region_transaction_do_commit(void);
 
+/*
+ * We recommend using this by default.
+ */
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
     if (qemu_mutex_iothread_locked()) {
@@ -1123,6 +1126,23 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
     return qatomic_rcu_read(&as->current_map);
 }
 
+/*
+ * We recommend using address_space_to_flatview() rather than this one.
+ * Note that if we use this during a memory region transaction, we may
+ * see obsolete flatviews. We must bear with an obsolete map until commit.
+ * And outside a memory region transaction, this is basically the same as
+ * address_space_to_flatview().
+ */
+static inline FlatView *address_space_to_flatview_rcu(AddressSpace *as)
+{
+    /*
+     * Before using any flatview, sanity check BQL or RCU is held.
+     */
+    assert(qemu_mutex_iothread_locked() || rcu_read_is_locked());
+
+    return qatomic_rcu_read(&as->current_map);
+}
+
 /**
  * typedef flatview_cb: callback for flatview_for_each_range()
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 6a8e8b4e71..33d14e967d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -815,7 +815,7 @@ FlatView *address_space_get_flatview(AddressSpace *as)
 
     RCU_READ_LOCK_GUARD();
     do {
-        view = address_space_to_flatview(as);
+        view = address_space_to_flatview_rcu(as);
         /* If somebody has replaced as->current_map concurrently,
          * flatview_ref returns false.
          */
-- 
2.20.1


