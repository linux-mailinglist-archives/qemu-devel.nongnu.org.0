Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59A6F7A4E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsH-00025d-3T; Thu, 04 May 2023 21:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsF-0001wb-Ce
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:39 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsD-00075A-Lq
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:39 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ab13da70a3so11258645ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248676; x=1685840676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjjcvaCoss6g2C9XP+Va16VVgd05AoBG7zQPBN7oS/g=;
 b=XX7xMqzWtmb4dPB9Kq2amVx0nXiZ5Hofz84mqlhoW1scvoCJg7+VoBKCJ9TCEeaEId
 r5r8ui875zABFQYKb6X8LjBNkAgzC7COxNB6egHyTjd7Ra52rT29KlPCZ+XV3WPuX4To
 LiH29d7H4IzR7iJsT9+SfraI3eqC7M19eiXRKi017141kCc52cUzk0t74KnzOInUxrP2
 1rLbeLKI2TRupUQVi4J/wJRzttVnrBYu9KvdycYp7VY3GL1CuGcnDKkK1adcZpDa1jdH
 v5eV2JQNDubIGDHrRCU6IebGlgolJqoPMCEpDedQy/VmF0wdbZRcfVTUYsusRoizIXn2
 E3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248676; x=1685840676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjjcvaCoss6g2C9XP+Va16VVgd05AoBG7zQPBN7oS/g=;
 b=dchF9gVtg2JhQwmjDsO+JZ8gt+BLW6lj9BNXwNDjUfRcEp3h8UDg2cEP8ShzL4ofhK
 jTvjf6AGJALMgzw+GWuOtDbywXBODMG4Jw5tp00Mb/PpqYSlqhULse3gTuVsRSWybEKc
 zdb15k/OwLrnhDuMhCRW693iy8xNW7yit7vQaUTAObx/dTqo+PjWNWD53pf9PaGCtPoD
 FCvan7HsWXkL9Ujx+2hbikOfo2niHuby657T2nrBZwMMSx0YmWsiZHwgBVrU07gShfyK
 ccibuhMhjdM1d5ag8wsW9CLq6q5MAgrmVceEe2VV2n74RfEb7qDMq8HwqVaQJ+mZemoB
 JQew==
X-Gm-Message-State: AC+VfDyoAdmBvPQ7+aVSV5OR4lvneqhLCXOFBxCrjYss+sFCz8Vv3VvY
 OUZXrmZWOkr22phwP36tRUIfyTDrB8K+BQ==
X-Google-Smtp-Source: ACHHUZ6jGuN/x6qkyqCpe1V93KMXPRu8DLZ+SCAiUb0HjR1X6VAf5Pzjg1ScSigxNa1418yEzRP7Ug==
X-Received: by 2002:a17:902:da90:b0:19a:a520:b203 with SMTP id
 j16-20020a170902da9000b0019aa520b203mr6357637plx.25.1683248676134; 
 Thu, 04 May 2023 18:04:36 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:35 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/89] target/riscv: Remove check on RVH for
 riscv_cpu_set_virt_enabled
Date: Fri,  5 May 2023 11:01:35 +1000
Message-Id: <20230505010241.21812-24-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62e.google.com
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

In current implementation, riscv_cpu_set_virt_enabled is only called when
RVH is enabled.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230327080858.39703-5-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 62fd2c90f1..b286118a6b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -563,12 +563,9 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env)
     return get_field(env->virt, VIRT_ONOFF);
 }
 
+/* This function can only be called to set virt when RVH is enabled */
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 {
-    if (!riscv_has_ext(env, RVH)) {
-        return;
-    }
-
     /* Flush the TLB on all virt mode changes. */
     if (get_field(env->virt, VIRT_ONOFF) != enable) {
         tlb_flush(env_cpu(env));
-- 
2.40.0


