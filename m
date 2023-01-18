Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D783C670FA9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 02:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwzG-0001zp-6z; Tue, 17 Jan 2023 20:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzD-0001yM-KL
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:31 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzC-0002E7-1J
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:31 -0500
Received: by mail-pl1-x629.google.com with SMTP id b17so27832080pld.7
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 17:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJICZPpEEH1YcFNc4HKSAZHC1I0j/ycDAOKP1+ciRvM=;
 b=ZDdSPp1lvFUT3nkatBK0VpJ036GL0DmupgGx9xVzbbAe4BFuCTfJr1iCQFUztPIzD8
 Ez7HPemwTiwpX/3CE1+EAhzHsz5vovEXGDUu1ohEHGLBoI/8+EU8TIDwbNY84owiOm7v
 AHDNihsIBx3muvavpx6eUTpN1ptf9oA3uzgKVJ2QvWXr28f4r98dVzCHRWhkpqafXNP6
 IZ209/ysTYTeELxYS1EEsUHLUaHtJNktTaJ4rcxeiHgwLrjaEyy4iPRgEl+qm+CyHC4S
 ncn5LXloorspmhmLbiZ9QiwpmIsGcJWErNozo/pRpiCIUOMwoVpQaReFGa3z7gvdRufh
 eWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJICZPpEEH1YcFNc4HKSAZHC1I0j/ycDAOKP1+ciRvM=;
 b=pH0gu7NCZ9yW0yokrwfWbXVq5jR7/TAycbiA4fBj8UNgRWaji7zNxeGZ++FLW3rk+i
 mqnWe3AO85fF3IULTjmnawPCGVFGOLqJ3Oibi5Y7OVnFjG2Vf319Gv3OtHEAO3+JnjnP
 Pvf2Ac0HqQ78Y5euSWS21i64j9a02RiOgu0WiEgfBBMugzpmCe0vezdEzq9Sv56JFtSy
 ktjTk5oYusgd+pebSyEmtdLtR1iw5Cj5ulsSAXUeyz9D3hQ9lRPrQJJ0dek67eeVSSmm
 5gqFvItX50ac5ZgrwjAslI96ZHKqOn2bJK1jmQqhDTFMxXgSjqKRKO807c1sFXDcNULA
 8HVw==
X-Gm-Message-State: AFqh2kq5v50n5pPxgVsDu+ewdkXlvo1kOOAYRa0OT0KZSTMC3M0wr6bi
 wHWMNV69s1YNEZUoTeTZJ97e+VpQfZZ1XASI
X-Google-Smtp-Source: AMrXdXsOhulXIq2XQNm+EprtsAv7h+PkbFgDqz8kiTMgfAE2pH2p0Ci7Oy3kEtouF2sbRkgTjTEJsQ==
X-Received: by 2002:a17:902:ce08:b0:193:3594:82e4 with SMTP id
 k8-20020a170902ce0800b00193359482e4mr6337015plg.18.1674004288619; 
 Tue, 17 Jan 2023 17:11:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm21660259plp.217.2023.01.17.17.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:11:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name
Subject: [PATCH v2 01/10] target/loongarch: Enable the disassembler for host
 tcg
Date: Tue, 17 Jan 2023 15:11:14 -1000
Message-Id: <20230118011123.392823-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118011123.392823-1-richard.henderson@linaro.org>
References: <20230118011123.392823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reuse the decodetree based disassembler from
target/loongarch/ for tcg/loongarch64/.

The generation of decode-insns.c.inc into ./libcommon.fa.p/ could
eventually result in conflict, if any other host requires the same
trick, but this is good enough for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c                      | 2 ++
 target/loongarch/meson.build | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/disas.c b/disas.c
index 3b31315f40..c9fa38e6d7 100644
--- a/disas.c
+++ b/disas.c
@@ -198,6 +198,8 @@ static void initialize_debug_host(CPUDebug *s)
     s->info.cap_insn_split = 6;
 #elif defined(__hppa__)
     s->info.print_insn = print_insn_hppa;
+#elif defined(__loongarch64)
+    s->info.print_insn = print_insn_loongarch;
 #endif
 }
 
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 6376f9e84b..690633969f 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -3,7 +3,6 @@ gen = decodetree.process('insns.decode')
 loongarch_ss = ss.source_set()
 loongarch_ss.add(files(
   'cpu.c',
-  'disas.c',
 ))
 loongarch_tcg_ss = ss.source_set()
 loongarch_tcg_ss.add(gen)
@@ -24,6 +23,8 @@ loongarch_softmmu_ss.add(files(
   'iocsr_helper.c',
 ))
 
+common_ss.add(when: 'CONFIG_LOONGARCH_DIS', if_true: [files('disas.c'), gen])
+
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
 
 target_arch += {'loongarch': loongarch_ss}
-- 
2.34.1


