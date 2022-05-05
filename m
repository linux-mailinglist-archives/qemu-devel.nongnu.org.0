Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDAB51C9ED
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 22:06:11 +0200 (CEST)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhjm-0006Qt-P4
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 16:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZg-0003y4-2e; Thu, 05 May 2022 14:51:41 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:33984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZd-0004u7-Tt; Thu, 05 May 2022 14:51:39 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso5113740fac.1; 
 Thu, 05 May 2022 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JfkptA3k6zDvg13eWVud+CrqF77f1D11YWXmGhqaOao=;
 b=Mldqv95+6lsD9SUB8pfrQmnTEhAraTu58huEMsflDKjpq89zaQiUw7q5vHNZilXd9M
 kHKBBjX/fzxwMhjez+VcLQ/bJhwxURIhKeZLb5KPzEQ7YYYCXj1hC9RmecP26yVJ1Jzz
 fpnKFHdfjAn2BBXPqy1Wz8jO1if0Z5E6BiviuPE6FgNqRYEQhAtXNyYxO2JGiEFJ/N5e
 7OI1ZMN5kxOJqP+Ddt6lWYaRCgUJAn4b7sDAYf1sjEArvCS3evpJCjK6nb9Z95cPhOkP
 50WNZwabP+9OCstgIsvr7OvctJSjMzN40TJ1y1m7gsZMwUO8Xf5joE3fznWEVVfNRbaD
 Zm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JfkptA3k6zDvg13eWVud+CrqF77f1D11YWXmGhqaOao=;
 b=3YVGSbvTinS24L8m1oBLFlxrz0Ehkh+YuBS00Cf0HhGXsvxSJ9qsm388GSD5OzQm0C
 /m3Jo6N+3NfVRWcIGs1b34PP6TEGGXkJwx77b8PiUbU2iC4QnH/s4RDVw1Jh3bf6l7aP
 uGWbbs/ItpQm99ZwSdCq6P2J3eXYOdp5LWJbCxXU7J3hF4l1pkx92iF4+xVzkgg65Xy2
 rJvp9XjQ7JcgwIDk8i4q3pOAsol25zvi3e+xrRtiqg7Wdd+3VgtrmWrUoXcxoY1owcFP
 5FX71gV5+0zHpIqjMrZs1u4T51a6retqqsqNW7QK5Ip7YUh7kZ6iqJV2/YsurDx+zXr7
 q9rw==
X-Gm-Message-State: AOAM532ZsdYvBuGO+6fr8DCaCdMtjGqzDQ0Ayhq+32h0GFSgb2K3oRNZ
 zEtpdRjxcdRLLsP9kGevg1R+9ituJGA=
X-Google-Smtp-Source: ABdhPJxxRBQX75BEXfvUaGuayUsdSWIJLt8K8WaDUtyh+9n5DRQLvUG8ZA2e0F/6u6ltQSpiUV7rYg==
X-Received: by 2002:a05:6870:c20c:b0:ed:dbd5:59d2 with SMTP id
 z12-20020a056870c20c00b000eddbd559d2mr2814355oae.239.1651776696433; 
 Thu, 05 May 2022 11:51:36 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 29/30] target/ppc: Add unused msr bits FIELDs
Date: Thu,  5 May 2022 15:49:37 -0300
Message-Id: <20220505184938.351866-30-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Add FIELDs macros for msr bits that had an unused msr_* before.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-22-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index af249239d5..4577cfcc23 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,16 +354,31 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, SF, MSR_SF, 1)
+FIELD(MSR, TAG, MSR_TAG, 1)
+FIELD(MSR, ISF, MSR_ISF, 1)
 #if defined(TARGET_PPC64)
 FIELD(MSR, HV, MSR_HV, 1)
 #define FIELD_EX64_HV(storage) FIELD_EX64(storage, MSR, HV)
 #else
 #define FIELD_EX64_HV(storage) 0
 #endif
+FIELD(MSR, TS0, MSR_TS0, 1)
+FIELD(MSR, TS1, MSR_TS1, 1)
 FIELD(MSR, TS, MSR_TS0, 2)
+FIELD(MSR, TM, MSR_TM, 1)
 FIELD(MSR, CM, MSR_CM, 1)
+FIELD(MSR, ICM, MSR_ICM, 1)
 FIELD(MSR, GS, MSR_GS, 1)
+FIELD(MSR, UCLE, MSR_UCLE, 1)
+FIELD(MSR, VR, MSR_VR, 1)
+FIELD(MSR, SPE, MSR_SPE, 1)
+FIELD(MSR, VSX, MSR_VSX, 1)
+FIELD(MSR, S, MSR_S, 1)
+FIELD(MSR, KEY, MSR_KEY, 1)
 FIELD(MSR, POW, MSR_POW, 1)
+FIELD(MSR, WE, MSR_WE, 1)
+FIELD(MSR, TGPR, MSR_TGPR, 1)
 FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, EE, MSR_EE, 1)
@@ -371,12 +386,22 @@ FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, FE0, MSR_FE0, 1)
+FIELD(MSR, SE, MSR_SE, 1)
+FIELD(MSR, DWE, MSR_DWE, 1)
+FIELD(MSR, UBLE, MSR_UBLE, 1)
+FIELD(MSR, BE, MSR_BE, 1)
 FIELD(MSR, DE, MSR_DE, 1)
 FIELD(MSR, FE1, MSR_FE1, 1)
+FIELD(MSR, AL, MSR_AL, 1)
 FIELD(MSR, EP, MSR_EP, 1)
 FIELD(MSR, IR, MSR_IR, 1)
 FIELD(MSR, DR, MSR_DR, 1)
+FIELD(MSR, IS, MSR_IS, 1)
 FIELD(MSR, DS, MSR_DS, 1)
+FIELD(MSR, PE, MSR_PE, 1)
+FIELD(MSR, PX, MSR_PX, 1)
+FIELD(MSR, PMM, MSR_PMM, 1)
+FIELD(MSR, RI, MSR_RI, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
 /*
-- 
2.32.0


