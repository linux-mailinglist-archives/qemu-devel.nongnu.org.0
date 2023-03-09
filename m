Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C536B2E1B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:07:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWr-0004WK-PA; Thu, 09 Mar 2023 15:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWp-0004VQ-7g
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:19 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWn-0000ik-OC
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:18 -0500
Received: by mail-pl1-x631.google.com with SMTP id y11so3231991plg.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l6CFbosDiYAMU+jusyTRphNJi1txpa+W3tQKJLZ5mTI=;
 b=dFYoz6n2i6UOTQ9gerfFYuQf07duKNy6sucUnqTAtAdHjkr2xbT44b4b8GuoOMIWfl
 1juMx6UhYCnd/S+v6pl7BpbJjKN6IbeqwFybEwaPiQvOKPfgl1C8xukwGT66FQTlhdD2
 1NQEZ1zOrbdvLuNo+JUQ8PWiMAgo1qmaD4RAYMaj4bvRP+4DHGYRmc8gSGyszKGregFc
 IpAjlv0gFUzS/TmBZpLVVQjaOmxG015NX5EEXgpY0CsRXsdjxHTrXUPCa8Tns4Qz+9xj
 K/CM5SyE/7sJCoWt8NFgBq4NFoQDVPeY44+PBK4rIpdlO8vMRWdjvHgj9RK2ex2GQOXI
 Kajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l6CFbosDiYAMU+jusyTRphNJi1txpa+W3tQKJLZ5mTI=;
 b=SeGUDQ5IKNEsz7ZnSiG6p3ayrtQmYMu0eAQ+YfGG+e7F796tGOP7mGyuFy/3c8q62Q
 PVIigboMspA0jU0DIB7duoJi79dfguHVaLGsuMWbKdnWgjrczmWWcxSInFAbpOJM3bp6
 PyYrel/F6Z8GBDtarbT486PrKVV+fyB/BtRXyu3SEC34I6kg/EzlTRWjOE7XMqaEJFhm
 8zKzYI1aiRou6cxxl4ZvTqbV1XbXFogSN+//nCtVg9nkKKFf0LSU/69LIZguHCxg8x1M
 6m7q0nmyNUqFEtVxUBRNgE0i6qzpzA9+0VC+P7sKZbgzdZV+lQ3Rwvl31VkfJQajWlai
 SJng==
X-Gm-Message-State: AO0yUKWLyON6Q01m8lgLAsib3vpfcQi9qbXfeZzovn4YldFmFCGCIRwf
 dZegyWHEj6Dx6yrnDmGeqUGUij35t1Yw66e21Ss=
X-Google-Smtp-Source: AK7set9IcoLbD8nezshzFBtWLvbB8gTfN6RtISjf369HCGVp5Q7bCRAJIaXIRuMogq91M5NCzZuDJw==
X-Received: by 2002:a17:90b:4d83:b0:237:b702:499f with SMTP id
 oj3-20020a17090b4d8300b00237b702499fmr23455016pjb.22.1678392377001; 
 Thu, 09 Mar 2023 12:06:17 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 28/91] target/nios2: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:47 -0800
Message-Id: <20230309200550.3878088-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Message-Id: <20230306175230.7110-14-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/nios2/cpu-param.h b/target/nios2/cpu-param.h
index 177d720864..767bba4b7b 100644
--- a/target/nios2/cpu-param.h
+++ b/target/nios2/cpu-param.h
@@ -16,6 +16,5 @@
 #else
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


