Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A717D6A65EE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCek-0000aX-65; Tue, 28 Feb 2023 21:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeg-0000CH-Qw
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:22 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCef-00035H-7w
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:22 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so11571164pja.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoYJtmo0lBs2eMf823MgF9+5OZaydqa/4ulH3x5z6qM=;
 b=IwjbyXYkQpKxIsrNKn6LFKbTpSa/y259pXZXrneRBK5zwJ16v2GXasC8H+s6E5fodB
 k2Cr7WkOoCRoNWdtN2/WV5pfsZPDIgq3mC0pT3MEnh1ZHZF0cUSJDrVI72Kn+wd2uVBU
 yjkNs2avRH/tWRBd7Aw6VndPL/cT5lmRoGEdytwZexayGFa4i3sn4BNQinSUATFCZwCf
 oBmmJK06dBe6oKIkyv33mqTRTsxGhLulCTaQemygLOO0YCZjbgVIL1DzRSSljtmL+Fhp
 yn2r3yQ9pePTNGoPsu2AjvQCD8GILQ5jhVjzQ7PMqzUGUmYU5ck8c+m11XFuKNNTehrh
 OhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoYJtmo0lBs2eMf823MgF9+5OZaydqa/4ulH3x5z6qM=;
 b=AYLkPsOzv8u3umJEFcWbLUnwlml6SRKUH1D2xzPZEWpYeFY5/+EcvT7uQ1yr4vScJh
 ylyBl53/IWp5JTd2xAt+XWAoX9X5+grRDFvFiAxJf/6zmaMVABU/zkoSDZDp22XU7q6P
 d6pFZjPzp2HJc0/1PQ8jx2GHBeVENuj+tedWh0dyyDCD7fQ6dRW15j30YJh/1ZB06AtW
 KStfyPjhNJK+d0MyweyBpwzSlVmtv2CCg4fLNGtpBI+OwU69myoHUNEP1ood99IFvo+F
 +fN1f8A+O4dMBIVzB9b4MC6qVk2MhRoStYSmPo6ZS8hV8nQykczVoneolIOGkpFApeW/
 Nfmw==
X-Gm-Message-State: AO0yUKXa6FFV+MoJwP99EqzfHanRoHmmPPhWR5FzBKTcfdSwyQ5V6ppa
 j6Ov+XQLooZbzlQXgSZNvK3orinLAckvcbt9xaA=
X-Google-Smtp-Source: AK7set+BBcEoNRK/KzM0dv+jd+d4h5uUeFzz0i+8jTIPNnD5rBFJQuwrmbJVmkLH3qvm0tvJqQuRxA==
X-Received: by 2002:a17:902:ea08:b0:19c:c184:d208 with SMTP id
 s8-20020a170902ea0800b0019cc184d208mr5131736plg.66.1677639440392; 
 Tue, 28 Feb 2023 18:57:20 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 20/62] target/rx: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:01 -1000
Message-Id: <20230301025643.1227244-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-17-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 219ef28e46..67452e310c 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -44,7 +44,8 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
 {
     RXCPU *cpu = RX_CPU(cs);
 
-    cpu->env.pc = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    cpu->env.pc = tb->pc;
 }
 
 static void rx_restore_state_to_opc(CPUState *cs,
-- 
2.34.1


