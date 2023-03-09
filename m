Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C606B2E56
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:15:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWl-0004R9-FF; Thu, 09 Mar 2023 15:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWi-0004Pz-Rs
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:12 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWh-0000if-AH
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso2993698pjs.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GhpiX4IsSTHgjxwng6jZ9Kljb09uXbL21WEfKnQkccI=;
 b=AZHe67eQTB66jhzLrvkL05L2YKcbkIInk77ko5e5OSjQJ/N59g0JCDpRbRmIUdRt++
 HyrpkjeYV0e89nyxRK4m6XW1HL8YAxBF1feGFmCo1y3d1QzBW7zrCPGpRs5agBLNv/n0
 EDhs16IAqMUIRPAUnrpNabjQW9LjCCgw6Zn9cjrONfD3LWZVUptkHbXYBD0XxUTEaFI2
 bl+k8aSdQkKzP7rDwJaOjpXjSCjDzwepiGUzHp0AMR2ajZUrs3EcWaxNRaRCG6TST92E
 EC+z0c2ry6GnnHrBZADs45AVEFhaf6Y+5aVRtUlATD9tTqFZsCYJ2uCDLQwQoscNo9be
 9PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GhpiX4IsSTHgjxwng6jZ9Kljb09uXbL21WEfKnQkccI=;
 b=lYYjruVXMzC9CwHL7JvZchGHWziMhSuZxwlqvqUp5uiAK1K6FBh9k5SzkNZt590GkF
 1wfCyxQDP5Hu/QPXfXMQ0WNVGH6kiaMNawbToM8ThBRipPm8GY6731MKTpMA4B2CiJmy
 JDlApXTUjx3EKe/hc6Zzubmc/PYYqqotkElmjQqy7x2hjj6eIRVhDM6SP4zaR9/WotXo
 B+ytoMQgBfbEeIrLymgj/rGVZMgtg8xm1cNwVsW3sA5Q7QYuZ+L3UEdakc3F3qIvoZfn
 pxCa923eeVpPQKUTQB1ARzzeKNF2SGTHU/A0KlQ/GGLbQEItFLWIrAMD+x9ZFgCOaSD7
 NA0A==
X-Gm-Message-State: AO0yUKWB76iB4HyA7o0V9jGJ3JwEmLomp8gAxm1j9fTOtGOmSmtUu2d1
 Rdq6iKVueeXc7b2U38X/OXNYFTV/jUk3vArU/oU=
X-Google-Smtp-Source: AK7set/2lbFJKmy0Lsk3pBklrt0jqfamGbZCdvwUOsyzqAqxzgEXbg+4kkUUUn7tuAOQo65ydXBOOA==
X-Received: by 2002:a17:90b:3142:b0:237:a50e:1781 with SMTP id
 ip2-20020a17090b314200b00237a50e1781mr23697322pjb.24.1678392370621; 
 Thu, 09 Mar 2023 12:06:10 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 21/91] target/hexagon: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:40 -0800
Message-Id: <20230309200550.3878088-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-7-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/hexagon/cpu-param.h b/target/hexagon/cpu-param.h
index e8ed5468d9..71b4a9b83e 100644
--- a/target/hexagon/cpu-param.h
+++ b/target/hexagon/cpu-param.h
@@ -24,6 +24,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 36
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define NB_MMU_MODES 1
-
 #endif
-- 
2.34.1


