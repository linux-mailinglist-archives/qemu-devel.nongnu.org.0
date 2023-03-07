Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4BE6AECF8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:00:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbag-0006La-4l; Tue, 07 Mar 2023 12:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbad-0006EF-Qf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:07 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbac-0000Fz-CX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:07 -0500
Received: by mail-pl1-x636.google.com with SMTP id i3so15005009plg.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MV5pEC52nCPWqBzbeUOdVINSCMliJWyWEJrq1km5k7g=;
 b=YgbImkdb4nKW0YA/W8C3lKeOBlj3dVe7cU0uZuxifamrOKJcPeHLlA5vAKtx0tfRuk
 emzgl+Gr625jlddk6B4zg6S1djLFlrBYDMUzQfOAsnk408gkpUEMrrsuJfuH6NzcwaJ8
 rwYsDN9bncTn1KZROlOuyx3V6gOL3BfQtnWxHCMB17hM4WU9x05P4Z7LKWw4Zrr/OOV3
 Fd2aY2KOsf+LSY1xERHagug50EwhEnamHOsSt/s9ve6ae3fpaPxobQUQBfxqwe11otjA
 qfRksQAoPrqubtNRMBu/6/bEgnOm7ByHdspz23FQD93I1WwI/anxpOJaaLHSlO7hb9N9
 CM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MV5pEC52nCPWqBzbeUOdVINSCMliJWyWEJrq1km5k7g=;
 b=gIrZQ93moN/MltqiNcN4QYeZtddH7rqZIk1sVWSfALSRETbq65lO1m9ypJhJzOU+yZ
 8YQ3WWybaBnIgoRa0qarSle8ARRUtV8YulLlvSJZZOamZPnntddSKiRQVZvMDrmf6N94
 e+3DKyXEEkVeQV2omlmPVH4hjRJKVVKUBc4fNGRp377W1yD7250JgrPwAmxr8BjyVP2H
 sAndiJexWkg3qPl9AUbXld1+M5Sh6Q/+k3ynPTTDxDtYrL6lmyIn6ZuLDJZ81FvIQlLv
 jpNZzeygy4jC4HVERBiINEfP6n2nLP5DlXT7Qi4mf5hb2Ptt1tN1WyZiddn3GfE3CggV
 1/FQ==
X-Gm-Message-State: AO0yUKW7T+HPHDDb5I6ZS3gbdRr8yRYyRsHhJkL1dpXZyGxf7p93R0e9
 E/o1q9M87Q7M2JoysPjlGGmgCW3pEvbsnwaKGSI=
X-Google-Smtp-Source: AK7set+AqrKuy8GGSyXPQPzLO+sUSPFsAH50Jc6OI0hobXeEh6y5Rh78HdFsBMJXpfPSi3VR/XUKbA==
X-Received: by 2002:a17:903:41cd:b0:19c:94ad:cbe8 with SMTP id
 u13-20020a17090341cd00b0019c94adcbe8mr18732037ple.36.1678211943181; 
 Tue, 07 Mar 2023 09:59:03 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 17/67] target/alpha: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:57:58 -0800
Message-Id: <20230307175848.2508955-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Message-Id: <20230306175230.7110-3-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/alpha/cpu-param.h b/target/alpha/cpu-param.h
index 17cd14e590..68c46f7998 100644
--- a/target/alpha/cpu-param.h
+++ b/target/alpha/cpu-param.h
@@ -15,6 +15,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS  44
 #define TARGET_VIRT_ADDR_SPACE_BITS  (30 + TARGET_PAGE_BITS)
 
-#define NB_MMU_MODES 3
-
 #endif
-- 
2.34.1


