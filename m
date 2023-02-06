Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC868C9A4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5N-0001q0-2d; Mon, 06 Feb 2023 17:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA4y-0001i5-Or
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA4w-0004QP-1s
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11920018wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4gyS8VSD6RIzTedBzt7OIRvLu1nwoR5LZytAL+qtYA=;
 b=M0jkkyt+5OA03Ycl5VLUGKKEtqBl6coUbdTH6Dxixe+6IAEiK7xLR6nDhOkjDL41Oy
 P0zwEHgnfmurEJ17sVxDvcrBtPTbiKOiNroNcydc8oY721IEnr7Gs/g+y+vNwmHLBWIp
 UAWRkacDWwLyxGTM7uhCmotCHHg1VYE4XREeuOkPBNr8OPSz37x3MSam5Pn6VGeFsHRX
 qc+YWiPGLicw8SqkappHHWVNN//ANKcblzJcRxx4PVdiouZ/kx90XnH1Vh9NgEf1srsB
 pHe+yBR/1IGXZ5umvvftuCCsqZ524+vFUDgX6V0qZn9YCl4iAWswT/RafqrsRHfpShHh
 7u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4gyS8VSD6RIzTedBzt7OIRvLu1nwoR5LZytAL+qtYA=;
 b=jeNwkItHWCr4+UDu1+vBNcNajqdOMCtYvsxu16lNovkmed3mVdrLpVGMYjrf5Z5bhI
 5UKYw2yDFhwht2ITxuf4dx55bcHNkkLJZvTPXSYCObveeTDMKqZWcvUnVWdEPGgCWae3
 02q0Gwsr2XzhHh5GUPjWHicWVqiEJsLVsjdyYTMSIf5ml8iQhjXOqgGOp9k1gjJkJfVL
 k/f2FPuCoigIamQXmQnwNyUdu3/R7YeTbdr45i6X7VQUyPfhCywVJktZ5tmUUZYiw/2q
 zYBEdVwqgbCAlYqhN6NZ7M31z86zhgwQe4VCLcnYnOxL2TsbfQ7y3TiQGRoeeJqcKfM3
 1aoQ==
X-Gm-Message-State: AO0yUKUXCnU3aVwuypioxMnNf/0GxrYwP2ol/RnX+Zj5J/mEfJi46SjI
 v5d/EIlNvcWnW9pFOZWLQ73eFp9Ssfz9FnjV
X-Google-Smtp-Source: AK7set/V1Uj9XdLZYMpmrKo8XiJYWOgoqz5KRNO0S0Q/FaSbl4w28eRi80uLAW/3fmieYP0xvRWn8g==
X-Received: by 2002:a05:600c:1613:b0:3df:b5ae:5289 with SMTP id
 m19-20020a05600c161300b003dfb5ae5289mr1115598wmn.8.1675722910146; 
 Mon, 06 Feb 2023 14:35:10 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c512500b003c6bbe910fdsm18922037wms.9.2023.02.06.14.35.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/11] hw/intc/armv7m_nvic: Use
 OBJECT_DECLARE_SIMPLE_TYPE() macro
Date: Mon,  6 Feb 2023 23:34:52 +0100
Message-Id: <20230206223502.25122-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
similarly to automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 0180c7b0ca..07f9c21a5f 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -16,10 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_NVIC "armv7m_nvic"
-
-typedef struct NVICState NVICState;
-DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
-                         TYPE_NVIC)
+OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)
 
 /* Highest permitted number of exceptions (architectural limit) */
 #define NVIC_MAX_VECTORS 512
-- 
2.38.1


