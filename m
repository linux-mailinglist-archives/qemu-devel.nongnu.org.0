Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96B56513D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:47:15 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ifi-0003cq-TE
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITa-0000V0-11
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:42 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITW-0004yT-RL
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id 145so8417554pga.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0b/YbMxnm80Cwom01Lw/iY4YJnZmRZ4e/YON8i35GFw=;
 b=CRY6RshiwBLlnl9QYYQfwEFnz4yi/NVT4UtEzszm+gIX3dbeUaZPY2OQ95s559FOlL
 jl+SyuVBsX1cPBS/+nC49tYXQL4QzgaxZbGEI0VSoOTDxKQKke2noEPCiLO3PJeb2Bxg
 sXrce5t/ExBeDWXFvBmEvBIEL3pwVdJl+v5ys7YqpD8qbcZvMttvQ7NMaFaSfVeoQSZy
 HgkpugZVzxiAh4Zz4CtEB1eUomddKM3t9Cs7VpfoV6C3pXfFjCGtHs9QnAsmyvVfSqUx
 y8oT0HRanyhDR6TZxpr7NSX+gibRZOU8EFyAzjANwkayW8wJenkoL/CWO0+ByAYo8Quj
 aGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0b/YbMxnm80Cwom01Lw/iY4YJnZmRZ4e/YON8i35GFw=;
 b=fJ4C1fNfNhJm7enXFWHxlAqnWw7vp4UZ+CkBwODauVpn/Jg3wlVm1GIfllaOzXibHn
 RIfx7wwWecX1N2jGAG0FfOZ63rw74BXIhEXjYJXCnKBjYCnbHbLbM1FPO3raE2IRAaGB
 7bo9djd8eL3uEp5+UZtN5ZtgLOPPy+LDePgRQzAfX00vhSrEYDoODQyjDAO9DJNKp7fg
 /hm6E/KktjSJlbFNXNPGrEDPKhbwpHNcDqjtkzgFXXha6glzI1KpYtBcJcgmznPqZxIG
 Lx7J3Cw8KC1HsktTFPa65LNiAOIonQrWTrwxFxhTvYA0doju8eOjgFb3dHZTmYixbubP
 oMOA==
X-Gm-Message-State: AJIora+VXRSYyRJUtLLZSYg0ym7CH5xMYYWz+Y6Fe8pID69W7pzhdAFX
 catAyj8Gtqy4h3Vkt5QiXGa2aQRmgqRUA8Ar
X-Google-Smtp-Source: AGRyM1tV4OT2AvYG8keLQf+A0pFglNprr+xvUoQ3r2ljPVmRaptYy+mg4h5Zzpcm/vVS9LWUCUfgaQ==
X-Received: by 2002:a63:2bd0:0:b0:412:2f70:f0ac with SMTP id
 r199-20020a632bd0000000b004122f70f0acmr5506971pgr.465.1656927277496; 
 Mon, 04 Jul 2022 02:34:37 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
Subject: [PULL 12/23] default-configs: Add loongarch linux-user support
Date: Mon,  4 Jul 2022 15:03:46 +0530
Message-Id: <20220704093357.983255-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

This patch adds loongarch64 linux-user default configs file.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: WANG Xuerui <git@xen0n.name>
Message-Id: <20220624031049.1716097-13-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/loongarch64-linux-user.mak | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 configs/targets/loongarch64-linux-user.mak

diff --git a/configs/targets/loongarch64-linux-user.mak b/configs/targets/loongarch64-linux-user.mak
new file mode 100644
index 0000000000..7d1b964020
--- /dev/null
+++ b/configs/targets/loongarch64-linux-user.mak
@@ -0,0 +1,3 @@
+# Default configuration for loongarch64-linux-user
+TARGET_ARCH=loongarch64
+TARGET_BASE_ARCH=loongarch
-- 
2.34.1


