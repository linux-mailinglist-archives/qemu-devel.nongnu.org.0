Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298866A2846
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:22:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqim-0005Jy-LP; Sat, 25 Feb 2023 04:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiF-0003rj-RV
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:28 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiE-0002uZ-4P
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:27 -0500
Received: by mail-pf1-x434.google.com with SMTP id n2so823211pfo.12
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
 b=g+jflMy5QF9Gh/OL/ohI7+fjhI7M0kP5qvxSb5g8UT9M8xaGcXCe9uRs/lwuNrU5rE
 5EqLG55PBjl0NmaNSOSJ+QYhGehD8Qg/SpDVTV2H3leFXs1sLcD3h5eKKWY0rhKAKR+z
 o6N7x2+wTQS8StN7D4pLkB/xW68whQYVoA3Sja8BGhqlOGTbUdBovd3EprqTe5+AKfNq
 w+IJAfDfKOh+vNXBoPjoHkZNH9Yc7Kei8PdTmnJR9d8XqhOTqSn4SYlDi9fZowdmsUIp
 1m/pH/993a/x6gWm0+kIwhMDk1CHFMfkL3Y0LvGQ/k0/eqx1i/LQxKV8jWEtbmJruy9O
 a3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
 b=RxE5YZTpnzWyGrd4yPjiAdzyuuO4C8wGJYb5r3YIxrERH8UP04pCre5wbRQcM3Y4x2
 u2IKJ7pvD9D4/LX6JN+UbfoeGddSj9ZTy8UqKjl1UBy7i7dKpwb2yz0NwpAEAvcm3WMo
 woMPiEsifI0WkG30zhQqCLRPq+laauC9b+3aUNFFjuGxmHa55m7F61/MnzzkoGzaO5i4
 MmkAGvd628xt1kmhVgFeHnFjqnFHr6QeCQvE6bh8PZrRqHMEqKgspxTzI7FzWuPDpRDz
 fWacW/ZdU0bRo9AOLwN94/1gIoMQ2L2IdgSrCeM6z+ytGFkRZVfn1diAcsvoXGJuYRwd
 WHMQ==
X-Gm-Message-State: AO0yUKWNAAIG+twyR9cRaJbCr1g8neVqJl9m0oRKTgZruwPmMXaab5kW
 CfDWQDxeP0kN12Zh2nPCN9PbMZ+B0H92n+pJHWw=
X-Google-Smtp-Source: AK7set+x1C8SnZrSQyqPUiv0kZzro8g22+YPpCx77QTwa/aSX+udXgpTS49sqp9c43TOzPU9AeXBHw==
X-Received: by 2002:a62:6286:0:b0:5dc:6a64:6704 with SMTP id
 w128-20020a626286000000b005dc6a646704mr7309360pfb.7.1677316764660; 
 Sat, 25 Feb 2023 01:19:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 43/76] target/mips: Drop tcg_temp_free from
 translate_addr_const.c
Date: Fri, 24 Feb 2023 23:13:54 -1000
Message-Id: <20230225091427.1817156-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate_addr_const.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index 96f483418e..a510da406c 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -30,10 +30,6 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
     tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -54,8 +50,5 @@ bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     gen_load_gpr(t1, rt);
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1


