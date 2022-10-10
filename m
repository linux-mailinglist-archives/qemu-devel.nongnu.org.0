Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615455FA0BA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:57:19 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuDW-0004cJ-El
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilyaoleinik1@gmail.com>)
 id 1ohirP-0001H2-Tr
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 22:49:44 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:33507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilyaoleinik1@gmail.com>)
 id 1ohirN-0001MK-N1
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 22:49:43 -0400
Received: by mail-lj1-x233.google.com with SMTP id a25so5773249ljk.0
 for <qemu-devel@nongnu.org>; Sun, 09 Oct 2022 19:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s9cvo7yAilvvHgh6jW8Jq0E5gX/BYEXjpQRnQMYvkYc=;
 b=J7/+4J2GYL72/AmbF9HWYmadqi/wEycDDyErOA4s/kQi77yVajxTvEkvanQqEHyUgo
 tjXXtySx3RmZIAQrSjpjEfR/G5VfLyLgGch8vyqriH1em4IKNTOZYrn66vNOI8zgbBdd
 ifkWW0sXhWhUy+A2a5oo2hNx+f6/0tCWnVNEKM3p9d+X2tVOqalZYnFuPbTVKoknvmzr
 hXTRJxp3biKABCj9rvA7P+NtE62r7J3Zs/sm1QBE50gLrgadmzMAqryzqzT2oYOgWvm/
 QtdmCRGNnisnyDOyFyGfD5/XBd7+VY3jKSJqOuGKLnvcI1XXG9qLQqk/3+VdUM5sBqn9
 vZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9cvo7yAilvvHgh6jW8Jq0E5gX/BYEXjpQRnQMYvkYc=;
 b=JPN9bLkJHDnWy1LCAXtV9MFfVTW9FyHvjXfISFZ+oeUrS3W99pGNdgcYaRrzW9GpMr
 eS89OuXgCdeonJOUjsSeyXuscM7pAg7yB3T57BiHRLjYuGnAYjEmEBVOK2Bl8dHaRLb7
 vMttUiBRRDNDYPV/aRHjoec5dcTk4Y8Syq6z2sOsys6OrU1H6wYKiSrWJvNSn0xCacFW
 wtkA6jQDnHCgyeBIgKIBosT6FkkhrvbzBe1ugeBSFCdGhg+a/oGSXrkICIgqf4wH0L2b
 O4gbH4NFpkPDlKEi5sHQzd4WPs+wjKM1fGa2rRHKCXzBmjKbYEDl/zMZSf6vWvkB5teB
 N0gw==
X-Gm-Message-State: ACrzQf13VuEGpSQfiuHYGUvyd7SJ08v2xbjhZPPhm8UQ56vsOpVaXxXi
 W2EN6ooq43FLyyO7ezrwozgI3Q18xv9Q+Gum/rn9Tg==
X-Google-Smtp-Source: AMsMyM6dSWfTllzJWqLXto0+f/IuGsuNtNDtkDhq78+XGH2i/sbH9qyoKiLEn2EJnHsP1Y2vB7PL2Q==
X-Received: by 2002:a2e:978f:0:b0:26a:a62e:8f2c with SMTP id
 y15-20020a2e978f000000b0026aa62e8f2cmr6050817lji.153.1665370178168; 
 Sun, 09 Oct 2022 19:49:38 -0700 (PDT)
Received: from 101RC001.gtrk-amur.local ([91.142.149.163])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a2eb5a2000000b0026bf0d71b1esm146598ljn.93.2022.10.09.19.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:49:37 -0700 (PDT)
From: Ilya Oleinik <ilyaoleinik1@gmail.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, yang.zhong@intel.com, f4bug@amsat.org,
 richard.henderson@linaro.org
Subject: [PATCH] i386/cpu: Adjust cpuid addresable id count to match the spec
Date: Mon, 10 Oct 2022 11:49:34 +0900
Message-Id: <20221010024934.2517-1-ilyaoleinik1@gmail.com>
X-Mailer: git-send-email 2.37.2.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=ilyaoleinik1@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Oct 2022 10:49:15 -0400
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

For EBX bits 23 - 16 in CPUID[01] Intel's manual states:
"
*   The nearest power-of-2 integer that is not smaller than EBX[23:16]
    is the number of unique initial APICIDs reserved for addressing
    different logical processors in a physical package. This field is
    only valid if CPUID.1.EDX.HTT[bit 28]= 1.
"
Ensure this condition is met.

Additionally, apply efb3934adf9ee7794db7e0ade9f576c634592891 to
non passthrough cache mode.

Signed-off-by: Ilya Oleinik <ilyaoleinik1@gmail.com>
---
 target/i386/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad623d91e4..e793bcc03f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -245,8 +245,8 @@ static void encode_cache_cpuid4(CPUCacheInfo *cache,
     *eax = CACHE_TYPE(cache->type) |
            CACHE_LEVEL(cache->level) |
            (cache->self_init ? CACHE_SELF_INIT_LEVEL : 0) |
-           ((num_cores - 1) << 26) |
-           ((num_apic_ids - 1) << 14);
+           ((pow2ceil(num_cores) - 1) << 26) |
+           ((pow2ceil(num_apic_ids) - 1) << 14);
 
     assert(cache->line_size > 0);
     assert(cache->partitions > 0);
@@ -5258,7 +5258,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
         *edx = env->features[FEAT_1_EDX];
         if (cs->nr_cores * cs->nr_threads > 1) {
-            *ebx |= (cs->nr_cores * cs->nr_threads) << 16;
+            *ebx |= (pow2ceil(cs->nr_cores * cs->nr_threads)) << 16;
             *edx |= CPUID_HT;
         }
         if (!cpu->enable_pmu) {
@@ -5313,12 +5313,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             switch (count) {
             case 0: /* L1 dcache info */
                 encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
-                                    1, cs->nr_cores,
+                                    cs->nr_threads, cs->nr_cores,
                                     eax, ebx, ecx, edx);
                 break;
             case 1: /* L1 icache info */
                 encode_cache_cpuid4(env->cache_info_cpuid4.l1i_cache,
-                                    1, cs->nr_cores,
+                                    cs->nr_threads, cs->nr_cores,
                                     eax, ebx, ecx, edx);
                 break;
             case 2: /* L2 cache info */
-- 
2.37.2.windows.2


