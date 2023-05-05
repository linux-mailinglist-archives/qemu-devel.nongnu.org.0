Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1236F7A4C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujs7-0000gS-AJ; Thu, 04 May 2023 21:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujs4-0000UX-DU
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:29 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujs2-00072n-Qq
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:28 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-52079a12451so801931a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248665; x=1685840665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9xDxBR/PUFexvpCP/tmv2vmExxBV4so69CnlLNO4rLM=;
 b=sf5F9KLPe7bQEBXsw1ELgNj21Ec4Y1N7DkfH+SvWEG9mhDw/UdS3+0qMeJRdr04ezd
 ZPuOEMcjxwXcbVKmDhMqjT8omoJgRzcCuNsJ/9zwhGjojopPVKBFyD1TEKujJ5zaiXzx
 xxWlo2Ee7xACffFgvGbI/77LYugO9TT1ss5bAFl/djfdgKt95KWP8DAP+nbtRjPcaBwr
 LOTpVWG/8/d1ASJs+YbpyxgiEJ8izBpvv65phgx2E6jMP91xZp0bt8YUpUxaye6QHizE
 t2GE43sYqcj3GswaskrcHAHrYx/M0sF4vIvXD4UFKUvFrnMTuFKNVgL00f6aGs5Hm6Lm
 goeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248665; x=1685840665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9xDxBR/PUFexvpCP/tmv2vmExxBV4so69CnlLNO4rLM=;
 b=R0iyJIDt2iaztHRaOui2rR8OEIKoa3d0pN0CvjX75s1/nDTbRke+x0lXfV8gsiFS+u
 hld3ZybTblu4xRHnLejbpuLuuWLezXnmDCYRPBln9+Ubq++zmpsp3/pIqikZyeyLJ0PW
 Ob7E3H6wR18vnQtHbjp2XM6ws9Q3BogjfB7sN5dznwwPqLTwDAXlF0+qgzhodlnRpiMR
 e+qJ5u+sCl1kCH/cmUHiuAw7Hl56UFWWCYwTjF+cFsqYXri4id3pQRL+Z5Vj3EzM3gZ8
 yLAJeC5ctYSqaDgCXflyQHaZyymzp3/T0i6dtOCz2m0NhIESO8G9PrhKlkE141OvwlkT
 faNw==
X-Gm-Message-State: AC+VfDxEpQ/WmBdInM+YVVUZQ/3+Jov32F3K42frcfCQ2DS3Ql021eoC
 fA3AKQfz6YTZXKky1qUVUZ7vIxvVeFc37g==
X-Google-Smtp-Source: ACHHUZ5h3v1DaNDxg8AzxjPvwyvu2QJ1aRs68B4N2N3qwtknmedsKvWM8X3EsKZSoLJORSzipHSuMw==
X-Received: by 2002:a17:902:b40f:b0:19e:839e:49d8 with SMTP id
 x15-20020a170902b40f00b0019e839e49d8mr4991363plr.59.1683248664998; 
 Thu, 04 May 2023 18:04:24 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:24 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/89] target/riscv: Remove redundant call to
 riscv_cpu_virt_enabled
Date: Fri,  5 May 2023 11:01:32 +1000
Message-Id: <20230505010241.21812-21-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

The assignment is done under the condition riscv_cpu_virt_enabled()=true.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230327080858.39703-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 824f0cbd92..e140d6a8d0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1706,9 +1706,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 riscv_cpu_swap_hypervisor_regs(env);
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPVP,
                                          env->priv);
-                env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
-                                         riscv_cpu_virt_enabled(env));
-
+                env->hstatus = set_field(env->hstatus, HSTATUS_SPV, true);
 
                 htval = env->guest_phys_fault_addr;
 
-- 
2.40.0


