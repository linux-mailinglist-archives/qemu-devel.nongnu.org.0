Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C03EB608
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:21:01 +0200 (CEST)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEX7M-0000Lg-KA
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4i-0005yv-AP
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4g-00019O-N8
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l10-20020a05600c4f0a00b002e6be174c29so2810072wmq.0
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwsRmN+On96JlTIEqDrfPOxNFjdnyRq58apo5gMpvTk=;
 b=p9le70mF9teyB9QiwtTF3Q7MmormSg/wO6A3fKftC92iY2oxwMG0uV0pqCPAwa7vFJ
 hG1va1lBAdhCfrHTzPafO3IPPbS9PaNDd9UdoV4CmD9AVo5zCzzRazqlNwNUn8/qlPSA
 tASBOQMIS7N1xDWeT9ZRWwEClY29Fqz4+FvecWxLdTOSng8FIY1ei0e/1WATZK8U4Suz
 7u7QUvYChJ8BT7PXdV/mWq42AAqgH3k0kfzPMEnCXM8+AFBCvCf6O685wOyIZ8vd/Z0A
 pOqvN11b+BUcsHBI5b9/Qv2BVL76SjBZXui7QwU46tOcIYWNtlSQcbbYXTkG+tEvp1nJ
 O6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwsRmN+On96JlTIEqDrfPOxNFjdnyRq58apo5gMpvTk=;
 b=HsEhXmLpXxV0HQZGA5y9cMOARV70k2KSN8ApNoQAKevz0C5GMzXR5vceFViuUpPmjd
 2jkIsCHji4ZS0VnmKJqDhAWQ9wAMb3fOYKCzP7u3QIJWX1swMdWhZ5LMicPWRDIDsq1e
 rOKw3D899rrp9Au/F51VFcwfBEFgGZVhlqflH18UmqUZ5/ade8mZ2ergyPwgm1V+kAm/
 9FBznO3g4yZ+hn1FjZfX7VbjAjW4LiBjnZwhVr813vWodY3Iy6uLMt0WhHuT5DCdKrLh
 Pe8BbsZgODieOxOyt+1wppzKqaUmd/5CpayuKbvn4ItcKHeoLHzxLEOBSVfL/56rq9of
 KEBA==
X-Gm-Message-State: AOAM533hjQETa3eLcIK4lu0es1AprNJYPa6QMl4TxTpn4AxWepyTqbMB
 32Bqvei8orWroBjuoOokGK31Lg==
X-Google-Smtp-Source: ABdhPJzA/+5ErX6vNYbhRGUvsZL4xI7hoMrwUEt7kwrPtmQVdEDtM+GtEobMxcywZ8dhtNg5gb2C4A==
X-Received: by 2002:a05:600c:5114:: with SMTP id
 o20mr2665051wms.176.1628860693052; 
 Fri, 13 Aug 2021 06:18:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 2/7] linux-user/arm: Set siginfo_t addr field for
 SIGTRAP signals
Date: Fri, 13 Aug 2021 14:18:04 +0100
Message-Id: <20210813131809.28655-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
to the PC where the breakpoint/singlestep trap occurred; this is
what the kernel does for this signal for this architecture.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/arm/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 69632d15be1..007752f5b74 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -453,6 +453,7 @@ void cpu_loop(CPUARMState *env)
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
             info.si_code = TARGET_TRAP_BRKPT;
+            info._sifields._sigfault._addr = env->regs[15];
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_KERNEL_TRAP:
-- 
2.20.1


