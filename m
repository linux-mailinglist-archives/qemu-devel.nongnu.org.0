Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED62D59D5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:58:34 +0100 (CET)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKaf-0002TE-5r
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQo-0001Mc-Mu
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQT-0006wv-ST
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id v14so4386142wml.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p66ItyVUUDgsJmX+asFUUV4x21/M0eoLBAxP7LbbHO0=;
 b=O5F/9Bs0TsHbgM4IWfkeFDQdoIXjcWv5lKM8ymAmS4HPV8+kgDU8Emf8bY0PYVsQPu
 igdYuSdsM2i76pp6fKAIMFtGJho7TTG+QaGkaxN1jb6WHFuDCLDmjEJCVeB9DJzGygjd
 8k3N8oCmcyMc3NmI1HRs2xk5dnFP0zgg4BD7NsO1idZma+PVzTExA8I/cJQQh7lm07sl
 CEuroaXDW3qa/N/671G5+c6X6cfXHXaCUk90hejhhHAS8tbpNUUOrMn4Yizukfecnkhq
 ZjueQ9ArvNIOX3RB1qsdc47RFY9rRaiWD4ZkKYPlmIcEj141ySsLOyY/pP3P45a+ceAa
 wv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p66ItyVUUDgsJmX+asFUUV4x21/M0eoLBAxP7LbbHO0=;
 b=LHei/tsXsfnD6a9mpfkNs1WmQPBmbr3vDCOkXTfN7Da8B0BCulKpBvRSndjuSLVtlo
 A0pN7vpBZ+D9DqQUbPqZ3LhpQjo7DlahoLoUiKQCkiOhjsHv9koP+M2XnqCDm+M0Ra8W
 xSw7NxGduPbxwwUhF0ytD4h8miBhf/2SmJXOtWxofLVeYqwmEEY56reXh7jsdfbBm0RD
 ABNeJQu3/1fxR8N4sPYr2VbgB0p1FgXyaRlqa8fDflyWC9u6D3ULff6KiRiTjlAHRxGm
 +3T1xe2iph+dCvV58rO61ks14nB0Gthi3Yu2xJGZgQc/85HIXoy6sZAJAnGwwRYjHp0F
 IKZQ==
X-Gm-Message-State: AOAM532NQyWJnpiosbMsRB0Eq2vtLfT0bEH7thcLuhnj5HidkZ8JuUvG
 sEq0F35e2RopamK49Wxt2vpiMtIVrgbVvg==
X-Google-Smtp-Source: ABdhPJworMboWkFRvwy/ZBQ554fCcvZIx6heGRP6Oa4zB3dA97umCOvJA2p4iBsQtJ2j7U4HJmAKTg==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr7905612wma.74.1607600880034; 
 Thu, 10 Dec 2020 03:48:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.47.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:47:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/36] hw/arm/smmuv3: Fix up L1STD_SPAN decoding
Date: Thu, 10 Dec 2020 11:47:21 +0000
Message-Id: <20201210114756.16501-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

Accroding to the SMMUv3 spec, the SPAN field of Level1 Stream Table
Descriptor is 5 bits([4:0]).

Fixes: 9bde7f0674f(hw/arm/smmuv3: Implement translate callback)
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Message-id: 20201124023711.1184-1-jiangkunkun@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index fa3c088972e..b6f7e53b7c7 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -633,6 +633,6 @@ static inline uint64_t l1std_l2ptr(STEDesc *desc)
     return hi << 32 | lo;
 }
 
-#define L1STD_SPAN(stm) (extract32((stm)->word[0], 0, 4))
+#define L1STD_SPAN(stm) (extract32((stm)->word[0], 0, 5))
 
 #endif
-- 
2.20.1


