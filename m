Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C459C510
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:34:41 +0200 (CEST)
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBJv-000525-Q1
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9PA-0004tr-Vz
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P0-0001cQ-5g
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:56 -0400
Received: by mail-pl1-x631.google.com with SMTP id m2so10259879pls.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xOAKE939prezp00RTq/5i5dmdsj8gga6ARA2/sjO9wc=;
 b=aEUlWy3UoR7d+JIoPwO0XW8pQ3zIAH5rPvxXw/p8Y6AVOQqt6VrkcneDRnWb5YbPH6
 h/M4gSWKD6EVLRL7j6MiMNcjdLmw/EklPOTSgi5rsJvLFUaSvPAaxjkDpZjh+Nni0leT
 0DQ3n1gG1OEHI+TwAzM3CzKYp3GYsK9wXaggQlj2hv1jQSjF1Ra5fpsVM7W4feIBR+qN
 V8QIFKLe+fre52IGb8PP5wjXpgrNvoudilOFNwBiDPgZYyr4dhkLWfoHwftpdVeuzm5S
 wfqkAj1Xk6qTaQSgl6zBap7fUY6LVVcGa2kpEKZ51BiC5AeMI1jGBEBVHHmZzSy399a2
 u4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xOAKE939prezp00RTq/5i5dmdsj8gga6ARA2/sjO9wc=;
 b=PsA9rSMHTHAoj2tERxddx+bCVv5WgCGDUrL9vwT/hMed24JYhBxQ+gIkHIK7syBh2q
 CoJNae1zG1qjLdGew4RLA6BZISQMl4wy8aDZKmrqwr7SuVapOI0y3GTnSkLlyaKJsajp
 H0lwG4FhnC3YrvSuCRn7F+3CQgV42YQNDzhSptiJ8AkBM9N2eST3yy5S0Gt4c56TLUdO
 o8XFotvz3PL9vfZJlPpK5rXWBT620oK53KWzI8CnWq15gKcCZ1I7zc39eRLGcBCEE1hi
 GQJ/pOXIYc2v9DgUZDPFw3AWr+ioMyffNT3uT+5+sL/qLuMr6jkKkNhrOyBGJ0wPjouI
 0G0A==
X-Gm-Message-State: ACgBeo3rNHGSrtTbL/9nhs0UU6UJFIRBMdbbkaZr3x8MfjPsk2bFSP5P
 Rpwo+OK/eDFnf41+YAgsTB/FF76IVr4AiA==
X-Google-Smtp-Source: AA6agR51iiSdsWShyljGQPwYpGknEzoy+EYr3M25RyepeI81nAvo43d+QVPog90NDIN4bo3yR6sbXg==
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr23543343pjb.98.1661182295513; 
 Mon, 22 Aug 2022 08:31:35 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 61/66] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Mon, 22 Aug 2022 08:27:36 -0700
Message-Id: <20220822152741.1617527-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index de8b3392a8..46012a349b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1


