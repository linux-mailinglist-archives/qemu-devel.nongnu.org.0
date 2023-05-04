Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25E6F6976
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:04:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWl3-0005eQ-Cf; Thu, 04 May 2023 07:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWl1-0005e1-N5
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:04:19 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWl0-0003aS-4B
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:04:19 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-953343581a4so47394266b.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683198256; x=1685790256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EqsWyKgIel10u0a8d6iD4G1u4ltjttpGWCj5zn8Ru+s=;
 b=VE0kgulNQj7h4yTR2HGiBz+Tboc5l9l7w9R7fTKDkfFIpSNOjCnfIVdHXCSM/L8YqQ
 Vie8IZf6a4wD/n5jcLGX5wKvCYmPdDFxhXOMsfT8eAyr3uwbILgdmzDyIBECuzb3Pqqi
 2rUjGw54t5/rt1PVM5xBJ7xGvn5mExET6DBfOvJjo+dOREiL1T/YrkoC4tmodo4ZHoNO
 zuuF9dySWlj0ATyXWRq7RNew1dF5lw8SLGi2hHIbh8EdmMmkr6X2e4D6OYcmoFyoQ7OW
 p/BntFVeV0iVlqNaE0aqXMkCl+ZaOpn4cvqucWy0WqvjLSsY8df5uPaM2hT1cppK6X5j
 CSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198256; x=1685790256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqsWyKgIel10u0a8d6iD4G1u4ltjttpGWCj5zn8Ru+s=;
 b=l5XmUlskubRQWKWDuz+A+nm0uwN3nmMQXM1fbABQEDXPuX4Mo8jU9w+wWi/vr8Q8dm
 NVFodSE1524XCn5Ehdm7N3/joQ5spdxNlFYSwVuCA442jFknobslzRNvWpeRXFwOKFqL
 Yf9zgRVG6tZGELJg+vlbrNv9w86Z/A6gxZ5M7v4ORb4FB5AkFOQ16Its07HEh63CVe5f
 ND4k0tfsiPuD3D1XxWv8dIXtGYpReYUavA+2x1iUh/Qr2/wmO+Am4frdZ0VOO51nl4pp
 HxHAzplfRhC4c/xGryzLCCSgqZjO8bdSwPcaaWhEATb5nMT20LAmkLoVwUHl83lcPg0b
 AgNg==
X-Gm-Message-State: AC+VfDxXlfCnzAqZf1nVhx7R7inYanEJWU79JpH/OtrVlFyClhr5M+hy
 OMkrnbwMk5tcsYbWe9sywyZXv0hwOswZQ2qWnKQFRg==
X-Google-Smtp-Source: ACHHUZ4qPGrbu7FG+PEXAawFPv3ZFK6CcpLXj1Rf+yXidTpUFtTx9gh15Xa3QjNDaySyZf8dZKD8tQ==
X-Received: by 2002:a17:907:743:b0:959:b745:d16f with SMTP id
 xc3-20020a170907074300b00959b745d16fmr6127030ejb.51.1683198255955; 
 Thu, 04 May 2023 04:04:15 -0700 (PDT)
Received: from stoup.. ([91.223.100.49]) by smtp.gmail.com with ESMTPSA id
 d5-20020a17090648c500b008c16025b318sm18626175ejt.155.2023.05.04.04.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Move translate-a32.h, arm_ldst.h,
 sve_ldst_internal.h to tcg/
Date: Thu,  4 May 2023 12:04:11 +0100
Message-Id: <20230504110412.1892411-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504110412.1892411-1-richard.henderson@linaro.org>
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These files got missed when populating tcg/.
Because they are included with "", no change to the users required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/{ => tcg}/arm_ldst.h          | 0
 target/arm/{ => tcg}/sve_ldst_internal.h | 0
 target/arm/{ => tcg}/translate-a32.h     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename target/arm/{ => tcg}/arm_ldst.h (100%)
 rename target/arm/{ => tcg}/sve_ldst_internal.h (100%)
 rename target/arm/{ => tcg}/translate-a32.h (100%)

diff --git a/target/arm/arm_ldst.h b/target/arm/tcg/arm_ldst.h
similarity index 100%
rename from target/arm/arm_ldst.h
rename to target/arm/tcg/arm_ldst.h
diff --git a/target/arm/sve_ldst_internal.h b/target/arm/tcg/sve_ldst_internal.h
similarity index 100%
rename from target/arm/sve_ldst_internal.h
rename to target/arm/tcg/sve_ldst_internal.h
diff --git a/target/arm/translate-a32.h b/target/arm/tcg/translate-a32.h
similarity index 100%
rename from target/arm/translate-a32.h
rename to target/arm/tcg/translate-a32.h
-- 
2.34.1


