Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DB699ADB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnM-0008Jx-Mt; Thu, 16 Feb 2023 12:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnJ-0008CE-QY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnI-0007tG-89
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id n33so2119474wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2zywtH9b/6tdry3j6/dUKW82Gbwh6aCOng5TK2UZt/4=;
 b=ghGqCNFEWrHVq3z297yQlCPhbR3oBgJYuRsWM5FcbGkXo0HnxhXWAU4Bv8UB8T48Qy
 yVxYt3ehjZa56/t8tKZRqIhZCWji1EYBUbVtmn2bmu4dL8rLL59MBVwR5I+IoZE/kU3T
 jGG/M4Yo4woAYq7tHIu7mDT9c/C1TOQ0Wy3a6j/g5qGZYUNniFfb4tfpiw4Mv47x9xLB
 9fVTbreSsIuzwi+O+4nV8/uaJJcag1djS8ZXNvwqxytnhykoJSE3YYb2Upg0QvG+A33u
 kh9rCPGd2kjQcYQVgVOozvWzrCOuNWYsl3kIMdo6OJdrytOcCvzi8ir/HjRT/i/PQfsW
 3Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2zywtH9b/6tdry3j6/dUKW82Gbwh6aCOng5TK2UZt/4=;
 b=rvzOJntj4u4qMT1efH61R5c42WAnhbVo9kTsZIBm2Fci6+FgfNYH/jrNh8s0cOUEm7
 xH5N/ebuPP/bCwS2UsP9TJWZIx8qv4MTupuuS7knDYz8+TdrFpxAKhgV1HQrBnX0owMO
 6ba5I2DVBkareRS6hhj2k1WfSO7LsDYsSH2X/7/xmhlsMiN8zGrmazEx/hOTNWrMORfh
 Wu97FolyLxS6Qs2nKZ0eY3rYd+DGNWTUtPo611iuDqQ7BaEE7SyfgGeETGc3KkhilHWs
 uZyttQhuo9MeMj6OZpuEHnY8sWrv8AjlHZtjUCTlN/DFR7136kDbI00sEx7DQ+IHdNa3
 J5dw==
X-Gm-Message-State: AO0yUKW1Ug4WID3ZPmhitorIgUbVwWc+Edoy3uPzn7jBmlda9Yc4YIpa
 eW04rsRfsb0mvY71Y573vkKx6oNKdY0rNAT5
X-Google-Smtp-Source: AK7set94bmXnVCeVSBUumtqzSiJO2ekrIcClI87UIxFkhyfIc0uNylEF6+VYg3M6Rmn+yG6WVMcsYw==
X-Received: by 2002:a05:600c:318f:b0:3e1:f8af:8772 with SMTP id
 s15-20020a05600c318f00b003e1f8af8772mr6156749wmp.9.1676567498850; 
 Thu, 16 Feb 2023 09:11:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/30] MAINTAINERS: Add myself to maintainers and remove Havard
Date: Thu, 16 Feb 2023 17:11:09 +0000
Message-Id: <20230216171123.2518285-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Havard is no longer working on the Nuvoton systems for a while
and won't be able to do any work on it in the future. So I'll
take over maintaining the Nuvoton system from him.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
Message-id: 20230208235433.3989937-2-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd54c1f1401..94659e42c2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -807,8 +807,8 @@ F: include/hw/net/mv88w8618_eth.h
 F: docs/system/arm/musicpal.rst
 
 Nuvoton NPCM7xx
-M: Havard Skinnemoen <hskinnemoen@google.com>
 M: Tyrone Ting <kfting@nuvoton.com>
+M: Hao Wu <wuhaotsh@google.com>
 L: qemu-arm@nongnu.org
 S: Supported
 F: hw/*/npcm7xx*
-- 
2.34.1


