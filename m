Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F8669C8C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:37:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnN-0001aP-Ni; Fri, 13 Jan 2023 09:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKn2-0001GE-JW
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKml-0003ra-5v
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:05 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ay40so15364310wmb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CkFzzLkhlrLOuC53SyPlsstsHQP1png5eWd8aBX/7JQ=;
 b=m5zI9E8SQdQhB2Q5EZ/xy091uBW9QT1EyLcPcdW2AKfDYClv11MgQpAyUAppnbzJct
 rpGVm4fEEfbgsMX1DNoX5eSIvpfUY7k9n2ZSrXSxXKrdDq568h9iuWLy+fv344Yo4n/U
 4HFp1dTwevtW/0cYlSetJqYyyYZbt+QNqq2vDZP4eHF6BB7wP3E/uZoA7dfYXNHyKWG+
 R0G3S1VgwIvrQ7bM4U/dOREYTVs1dM7f6W84DgCh9b12frBHxrHvhrG+DDPyniSWtym4
 y1tawIhdcs8JYPfSceY+sds87L+icNRj8jZLqpyN6ouXNI1sghq+s1ICYqecHXbGjMcq
 o97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CkFzzLkhlrLOuC53SyPlsstsHQP1png5eWd8aBX/7JQ=;
 b=HAGb1goYiV28T6vLaFPgc0LFcQmtpFhkI15YylN/AS2MjI/XBDN6eY60NIQrat4O2P
 05f7elfMdNIXAg5hVaPqDLn5YlMNzJnCXZVl5HOKVPQmc0PwqAz9rlFPluUP6S9L2QG5
 nxGINZeH00THcaTmfFD1/mwy7WLz0aQ/fH2ydCSyzJC5mArg6Byila62bqoTAEeN7yHz
 L/8TYHCtLnLz7Biv/BFBJEscw/eP/R1sWK+zUvWRyaf2svU/QRzU/an6b2VieDJc3GtO
 NC/kVLyOjoBlVrS1AqL2WuF0HJ8UCbbhbcTinTSfWI9WDyJt4LuG4i3maWjltLW/lZr2
 cCgg==
X-Gm-Message-State: AFqh2kqlCXE2xv4wdDW4mCTSAIgFt3S3JzE/1COOtlMBWWepO1aZ7yqW
 Tqpvr5fU1tUDe17DetuOu6LQAkAXZuGPgdKA
X-Google-Smtp-Source: AMrXdXt9hVA238W+Qf8aR0T1TYNOavIrNOMplCr//tlf3DXFyZJ2WSPS2/k8lgSBsuTaWpXghWfvig==
X-Received: by 2002:a7b:c447:0:b0:3c6:e63d:adaf with SMTP id
 l7-20020a7bc447000000b003c6e63dadafmr59429537wmi.31.1673619117938; 
 Fri, 13 Jan 2023 06:11:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/38] hw/misc/sbsa_ec: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Fri, 13 Jan 2023 14:11:23 +0000
Message-Id: <20230113141126.535646-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This model was merged few days before the QOM cleanup from
commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible")
was pulled and merged. Manually adapt.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-13-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/sbsa_ec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 6f19c21195a..86b23a5372f 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -21,8 +21,7 @@ typedef struct SECUREECState {
 } SECUREECState;
 
 #define TYPE_SBSA_SECURE_EC "sbsa-ec"
-#define SBSA_SECURE_EC(obj) \
-        OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_SECURE_EC)
+OBJECT_DECLARE_SIMPLE_TYPE(SECUREECState, SBSA_SECURE_EC)
 
 enum sbsa_ec_powerstates {
     SBSA_EC_CMD_POWEROFF = 0x01,
-- 
2.34.1


