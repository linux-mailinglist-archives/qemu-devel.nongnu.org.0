Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA069ECE6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexN-0007Tv-Kt; Tue, 21 Feb 2023 21:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex1-0007HW-3Q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:48 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewx-0001XQ-Ry
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:46 -0500
Received: by mail-pl1-x62f.google.com with SMTP id bh1so7211273plb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIb9lNHS+CMTRMz3x9CJbUe7BEB0EF5QrLaX3CcdAas=;
 b=nW/SRaXVdGDcoZthPrOF7bk6TL6nF4VHsHXd4wZ7l3v4Ko+k2xSZx77FtEGSaQac5r
 GvJ+NLvQ7NWo95gz1sjtkLIUQue1YD+wNU0rQx4kkPxh76csAyxfxbRynZ3qDcrA/7VL
 L6/ZGAek1WFH7cnQkVWA2bfb9WV9q9qIylDtr6mZ7wYBc/Rg0U8yprcw2ZroAToNzd3r
 CEuCs0U2M0F/5pVPpzAvVXdCqbAolesIS9IwZ4sI/jqFhaeJ9CgeQBaoHx98GZGKZ7FQ
 fSgeNglcAkjh7WTDjvRyv+T9Hp+S33ENMTAOPoxGpRVpEAqbe+luuKyp5OrVAh5d8itz
 e/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIb9lNHS+CMTRMz3x9CJbUe7BEB0EF5QrLaX3CcdAas=;
 b=nYgWgVdp/IkrZjOH7Wu2DUJyY1xa4K1EJc3SP/orEvTSNApWv1vZvQtxZmAprZbFG8
 egFKZ1V6W0sYdR4D9NPeJdrh1eq/4AVVtKmGr7GgmdJasuUiJ9wW0kN3TwoRRvVDqr01
 Dwlk2/mn43PotMiITY6FadZgGoMrQKCy5XfwbJMwF6bHzjAbn4NLqji/vNXc6mdrdyo1
 p8OUNbkoKxlBkZNSECPgVQxVGqOHArC8mZAbd9TQFtDX95kFMXxZrFJen4inJub8KOLg
 91fEtmoS6dNHUODlRcmzH9RPSmIpOV+IizSvVxKbMkHObvkih4QFWnFAEla8ohAJHApr
 oLlQ==
X-Gm-Message-State: AO0yUKWLbWzm1uxuY/S/JR0zBzNUbcufmiI4nNpL4f3zhP3GL7jGpTF1
 oukBqrK3Od6VUmTdlQ/dJDPXPF3xmnqQmS7D1Qc=
X-Google-Smtp-Source: AK7set9oMP7E8Wy7FLg0MvW0UrI1cUZGNuCej1ZJmLZAo3jOluhIwLoecp54Mfmk1FhrBRePulKJBg==
X-Received: by 2002:a17:903:24e:b0:19c:32b1:185d with SMTP id
 j14-20020a170903024e00b0019c32b1185dmr8567590plh.39.1677033220678; 
 Tue, 21 Feb 2023 18:33:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/25] target/arm: Handle m-profile in arm_is_secure
Date: Tue, 21 Feb 2023 16:33:12 -1000
Message-Id: <20230222023336.915045-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 12b1082537..7a2f804aeb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2426,6 +2426,9 @@ static inline bool arm_is_el3_or_mon(CPUARMState *env)
 /* Return true if the processor is in secure state */
 static inline bool arm_is_secure(CPUARMState *env)
 {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return env->v7m.secure;
+    }
     if (arm_is_el3_or_mon(env)) {
         return true;
     }
-- 
2.34.1


