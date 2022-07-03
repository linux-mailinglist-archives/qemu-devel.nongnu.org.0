Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDC5564677
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:40:20 +0200 (CEST)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w5T-0005xe-UB
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSS-00052S-4l
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 05:00:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSQ-0004Cm-Nv
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:59 -0400
Received: by mail-pg1-x536.google.com with SMTP id e132so6290165pgc.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0b/YbMxnm80Cwom01Lw/iY4YJnZmRZ4e/YON8i35GFw=;
 b=RwXSPHkcFBNj2lGMzkSrvJyTYsmMoHP68SP4L1OVXX+G3vxVJsRkp08MOtYwrLeL9s
 o/aqHbydcYLGqsGCCsAjPDXCgIhV36uvpzSpNF9J4CIJhmD7VtaOHti5NioQ+3jmsfbi
 FgTaJR/zcsaELdx7drZbJGBC6S/IbhQ4C1EHCaV24xNGCLhWODejj70oxIRERHfRPicH
 OIfWmzg3kVUhn0aRlOP+/IMEcf2eoZOeRqmEh3z3U3IZOy+GkAG5bAOwzPomgAxQ1M8M
 5mUNTokPgxMiDn4eE2BJDBw+DR3kPrGqyrURnT+O4+tiEv9kvQ0+kc2pVxASEICo2WCh
 /4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0b/YbMxnm80Cwom01Lw/iY4YJnZmRZ4e/YON8i35GFw=;
 b=INZdl4Y8nZNCDp29Khtj2DALZqZAO3uA/PdJvmbkugCPywm7997UtUmbwyhEEFgosV
 s40sC8uNn+8vhtVbg1fAhgmaj75e/GvccfaXMa0W/F4be6xGXF8r4k4Gml4FNwvUcvfP
 ub1t13A0mTeDQiu/cdh70MxDz7gHjHCKLHIG+QF2Pj/86Uphv0bTCqFbsxlT8UC1kogF
 wllOmvuVusdO7/Nd5c7UOkZZ4a/dj/KDU6FEm4LzQffU3M71/7yzxQgF9RrHSZWbVQzn
 u/ieqGTbe1hYH5AveB/Syk861BYHTRCU6nWDHUK1n18FA4lTb2oZaHMmhAmwYcWPTOq9
 uVNQ==
X-Gm-Message-State: AJIora9t60lUL87o8S+9aurAenEW7oW5m7/07Quy9Rro4C6LF79fBdbX
 xUcIV3Jl1CkNhYdS5P0GfnCDvX+wD1Vi6Pnr
X-Google-Smtp-Source: AGRyM1uVi/dxvWUPybquXzlaXxaSrHGhh8VFmfktjW0gzp8JUqXXSl8GNO1qpmNDlWi5r8N3WpLNKQ==
X-Received: by 2002:aa7:86c9:0:b0:525:3d39:8d0f with SMTP id
 h9-20020aa786c9000000b005253d398d0fmr30684758pfo.54.1656838797474; 
 Sun, 03 Jul 2022 01:59:57 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, WANG Xuerui <git@xen0n.name>
Subject: [PATCH v21 12/13] default-configs: Add loongarch linux-user support
Date: Sun,  3 Jul 2022 14:29:12 +0530
Message-Id: <20220703085913.772936-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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


