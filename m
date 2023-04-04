Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086B6D67E5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:53:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjixW-0007JH-Os; Tue, 04 Apr 2023 11:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixO-0006x0-Te
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixN-0004uz-9l
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:26 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso34412612pjb.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+WZ/JeLd2TCORRW5pywaUIN6+48/A6dV/BPHE6Q81A=;
 b=vAOqESGyqSb9Oz923Ox8+oDJXp4cheQBEX2f/gtiyfJeew0KTfqfNhqe+VPdO2goLG
 zbmE6SHLdxmG73liTort4X1KCIq7F2lkcYKy6+eO00ytW8H13yEgADKHfzs1QqMgpCDY
 346UNhC9nf+EgEtCXt1Wi8X4WrLEw7/pN3ph3CpmGsBvacmZm2dumM0TCuW3fxFdoO+P
 WA8ULvH5BjIkAjJvgKynBh+9c7ztuuPtjYqBtwasToBn/HGhC304RVKWYAnClQLp/aDN
 ckis4w5A8kL9oGAXGUVFsXdEPkxywQcl7GgrelSr4gR+rG9i0+nBr5GZMm3gSxhpSIPu
 yWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+WZ/JeLd2TCORRW5pywaUIN6+48/A6dV/BPHE6Q81A=;
 b=u20MVjDctMy2Ib9vk6rDHHy51ypDjIe7g/NRIxwZ0+ft8eZOkVm5/u7bK25VQbNmPu
 Q43pdOhYWKlnA2lRSvT58QPOitmZP1Y6+dNvlFX+dav1CklA9WPjIm9GSiC8kr1fPTWh
 xYJKq+ddpnc3lQMXnksW3ZonO8twTyiBdn2CVUSJaPXB6voIWxXle783RA0znf1oNvmw
 mYk5mKmpVRnaehY29LjArsHNWeUc7pZppIiCtwIk6WnHtku4dFDYCX6AcQ5cJl6qbs1j
 ZaU2+7l9zIXcckE4JyNJ2uxLi7dF2nmpUhuHtvw9H7dfnEN9hcAPfzOmP1m9onGSTqJQ
 pZZA==
X-Gm-Message-State: AAQBX9fa3UvcJ2EkJl/ja54H3At4ZXQSbr4dT8Y29i09hsDDSPKqea9/
 DaKIWuTexc6smUZcGZ85iRQuIZzXlj2LGjrLEtE=
X-Google-Smtp-Source: AKy350YdfIFwbt95tO3PWmEoondKIJ5PtbFCR6Y3Km9qbeBoh5sFVwGKICDj3PaYLGMHFZ/fuUFs9Q==
X-Received: by 2002:a17:90b:1e0b:b0:23b:45be:a15a with SMTP id
 pg11-20020a17090b1e0b00b0023b45bea15amr3116757pjb.25.1680623543826; 
 Tue, 04 Apr 2023 08:52:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 nl5-20020a17090b384500b00233ccd04a15sm11562013pjb.24.2023.04.04.08.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:52:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
Subject: [PULL 2/4] accel/tcg: Fix overwrite problems of tcg_cflags
Date: Tue,  4 Apr 2023 08:52:18 -0700
Message-Id: <20230404155220.1572650-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404155220.1572650-1-richard.henderson@linaro.org>
References: <20230404155220.1572650-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

CPUs often set CF_PCREL in tcg_cflags before qemu_init_vcpu(), in which
tcg_cflags will be overwrited by tcg_cpu_init_cflags().

Fixes: 4be790263ffc ("accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Message-Id: <20230331150609.114401-6-liweiwei@iscas.ac.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index af35e0d092..58c8e64096 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -59,7 +59,7 @@ void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
 
     cflags |= parallel ? CF_PARALLEL : 0;
     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
-    cpu->tcg_cflags = cflags;
+    cpu->tcg_cflags |= cflags;
 }
 
 void tcg_cpus_destroy(CPUState *cpu)
-- 
2.34.1


