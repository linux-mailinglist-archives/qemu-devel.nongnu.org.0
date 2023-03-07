Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A96AED1C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZban-0006PV-Au; Tue, 07 Mar 2023 12:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaf-0006L2-Iq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:09 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbae-0000Cq-37
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:09 -0500
Received: by mail-pj1-x1030.google.com with SMTP id y2so14026618pjg.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwpAWgOZ7X/aE7KkyG745OZAl38CYPr4icqO96kO9cU=;
 b=bTV0l5b8fNPFTxTdeaQP7ZKvrs1mdwVg+8PtMabSbNmDKi3DBYww6QkCwqsTBW+OQ6
 F5doRXm8YOuI1D9Tk0D8S4H2DNYP9Gb84qBeg8IIKHGEAdghVQIB8ePhbTyn77w8g4te
 9wINxUV+0BEdtEGH9rQziqumOsXwII0re2KC3njauXylHknDGe0oj72PoJdqjLnVj7lD
 lmi2HGq7XCWU2KGGO2PyFRj8DH0Kh+CJ3yK8mFTq2G9vvd59LvHMaZvc4OxpaiuQNhg1
 9ZUf5qkqfaR5kpkbX9dB9lCnsCBFlpDIFuboTqCFLWZinK+DE1MS2gc8uF3NjIRxrva1
 H8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwpAWgOZ7X/aE7KkyG745OZAl38CYPr4icqO96kO9cU=;
 b=MA8ppaxxtM+blooXPgTY9Z9bp93jdtdYDWOGFpEnhJ9sVoc4ooKr+pKoLLhTxQeaiX
 TKgq1Lrp1fhdHyfn0njYYUoCK3Z7nRyurOD1IIjwq00xgLtcMvF0bfqI4E+YqlHO6fVp
 ZrKU7kcsRj4nRTmEypvrq5vdj7xpA5LB2VHS/6EnqNEqxD7ed7rBuISw0ofj6lAg0rcj
 BgFiH0ZmzoviQ5Y6W8ij3wVHkNEEhM3fSWxYLN6GAPMrj9DUOAs+1lG6Hbls7NrofCiI
 klKROEQhHtpAKZ2UIt20OVmySJDr3VDK2ai4e8hcNrELWv5jB3UzBjGDF6r2Hcyd95Um
 PEZQ==
X-Gm-Message-State: AO0yUKW+z4RiS5h05/iTH6a/21RmK40NdyQI0wOIK4hneKy1srskSvkK
 l/kOy6vOEk3iFnK+o6lR8qUN7vJ5iw2KMkUNmYw=
X-Google-Smtp-Source: AK7set+kc+BrhJyxBJMirxnWIvnr5aDzyA+8OsapHxGXvWADGSpYZlrN6xc+NFKXWSALCShCz/wX1g==
X-Received: by 2002:a17:903:1103:b0:19c:da7f:a234 with SMTP id
 n3-20020a170903110300b0019cda7fa234mr19359910plh.67.1678211947184; 
 Tue, 07 Mar 2023 09:59:07 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 22/67] target/hppa: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:03 -0800
Message-Id: <20230307175848.2508955-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-8-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/hppa/cpu-param.h b/target/hppa/cpu-param.h
index a48a2701ae..c2791ae5f2 100644
--- a/target/hppa/cpu-param.h
+++ b/target/hppa/cpu-param.h
@@ -29,6 +29,5 @@
 # define TARGET_PHYS_ADDR_SPACE_BITS  32
 #endif
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 5
 
 #endif
-- 
2.34.1


