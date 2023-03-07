Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E126AEDA5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:06:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaq-0006UY-60; Tue, 07 Mar 2023 12:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbao-0006Rd-8K
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:18 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbak-0000Im-2Y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:18 -0500
Received: by mail-pl1-x629.google.com with SMTP id a2so15027236plm.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=moPr/XgYh7M1tPYDuUPSk8SN+xsBabcL34ytlxstCi4=;
 b=nWfwrr/FZo1+GWmzxDjtFxuOUG8sjGXhSn1IcNSPnamqmwEpYwTPzfgkFEIKi6y+Nk
 RVCGfo4tWkSHiK3XNsCvkh42j2Lf9rKWZ6eEYU6lSM8/KCSstwuETidq1itqOfj9TQWk
 5AUAdZ0XbinyRZQaSUIsaCmdPXSTPO2uX8VqU8dUukgRFwRuKqFXQ+sxmNPSagBeGqqD
 KkDp/U9nRrxlTKhbqoq64K8Ju+ZjUmE0ZRWGehifrH73nlAq3puTOUZ/WCwGr2EG1EMt
 ZCGjORo5KajQiWm2haE7vSK8oUmoZ+uXdSYbV+DAYaex0OSyC6OpagGrgSwXIT8oJDlD
 jVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=moPr/XgYh7M1tPYDuUPSk8SN+xsBabcL34ytlxstCi4=;
 b=QegqH1UwxJUuwtJ9mJ9PPqV5rgAqba+xFOaiGweAg0K7FrNmiAwZMce0Hk8Az4o7v/
 OfLc4AwWaYKa47ilgkMDOE2NxTpf8U0VuYPgUS6GgndJD1hKCvbqoTrLw0ljKOxi8sQb
 fWiLk3Oh+OtSsEQaWOyjMStuLWOuJAHaJen3rcAWJbNWx1CtuWjGQmRuDSZJRlgDa6u8
 HTjyeftHuJkiUyDlnYRYirkHWwH0KWLveFngXdIjINbInFrxk6XhoSYdw+i84Y0lUURE
 zn2yaMqD1x4sLAR2ijvWH5q6fCQythx0uc/CHfBz1FiDyBjrDrsVW3tjM7cG2k0nXCq3
 gZIQ==
X-Gm-Message-State: AO0yUKVFTUn52cVyWQgYx7n2omRyIZSos8Im9A+WMzfU1AQi66b7DaCd
 p4friFW3mqch/1GKnvjQWiAxl3Di5SPFRr0RDV8=
X-Google-Smtp-Source: AK7set856W4dxPbUalzCAl0yuJIrSQX4S7uZwLqGHoITdrqABosKcagLNg9sg/gHFRJ6k+3EYtNfiA==
X-Received: by 2002:a17:903:32d2:b0:19b:441c:3913 with SMTP id
 i18-20020a17090332d200b0019b441c3913mr18439803plr.44.1678211952875; 
 Tue, 07 Mar 2023 09:59:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 29/67] target/openrisc: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:10 -0800
Message-Id: <20230307175848.2508955-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Message-Id: <20230306175230.7110-15-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/openrisc/cpu-param.h b/target/openrisc/cpu-param.h
index 73be699f36..3f08207485 100644
--- a/target/openrisc/cpu-param.h
+++ b/target/openrisc/cpu-param.h
@@ -12,6 +12,5 @@
 #define TARGET_PAGE_BITS 13
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 3
 
 #endif
-- 
2.34.1


