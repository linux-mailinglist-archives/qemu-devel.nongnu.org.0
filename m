Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7356D89BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:39:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoI-0005PP-2u; Wed, 05 Apr 2023 17:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo7-0005KK-Tn
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:46 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo6-0005dD-Aj
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:43 -0400
Received: by mail-il1-x12f.google.com with SMTP id h11so19505547ild.11
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N8f0c0zWU0uf6KygAvtJ1QQK3oFJ68EqdIaad3VmCHw=;
 b=WcKg6DHxtwKuCxPiKbXzDlgVNt/oS8V4wQB+2ckROdhWcf4key7b7E34f8VhWWF5tj
 Bo8pC0WnUFzGwt9Nou3Vfp2TdXyer/VhtbSUckKGITxd8oKwyMIEkS3Q+yMtkMrGMijx
 TU+4flxrsrYKl+u6jUpXe7cd0RFwOGII8RqsSTqrNiiJVs/Czr1wKwx9tWWsL+aFjgcY
 o6C3hR2amAirxc5pC5/Lk0D2zp7TXIXJkF3/uallRmooYVHdqiln6Fqi4JOxYJbAUMix
 ZEHRlqZ97vg4yHgdSXguzizVd/6UPPWiykQ/8SMrd7kmu1Enid+eyO7DF+wUCBiql7nY
 4ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N8f0c0zWU0uf6KygAvtJ1QQK3oFJ68EqdIaad3VmCHw=;
 b=Ab8Clg30CPTzgAEpn3WTxl8/TcbBE/RTB7HSCujOLgpoNe2nPBKtviEg0348Znnd1Q
 OTLtbUnLY+IyMDjRo1wRrIGOXsJaFi43DbVOHZIaDW/qNrb5ihPvIrNA5rKYPhYv9FY/
 d5DBwSEEiDybn+YTcHCzV6ZvAsKWZ1aksWKgniP47k24RcMtSkeI3lxoYi5hiN8F/pD8
 fwW8JTIS/ZjZeW+CzQG2qX/mrPfSL/J5oVR4KfzzDttwcWsnlvoOXsUOLcU9cPLGZZyZ
 TfuMNahiE46SZpjmxRwwaY9M9EgX56xTCTXnD49NG0bLIE4dm4XBAYwDYrOuVcqYhwM0
 0iKA==
X-Gm-Message-State: AAQBX9fKU0+FvMs+QEnJHweCTz6y+eCYAs0Y4aJy+eS6xEYcr6CWzFcq
 RI5EPAATvWo7E7hx7pwy4WyEZFt+s7vea1b7iBg=
X-Google-Smtp-Source: AKy350ZDd/Mnz+HJANkpJqgIG/zQmfUNStlLhfeiAer8g5ymkjGxfYbgdSdCplRb5pUQlQF1OU3XmQ==
X-Received: by 2002:a05:6e02:14c:b0:317:99d0:8afa with SMTP id
 j12-20020a056e02014c00b0031799d08afamr5500364ilr.12.1680730600906; 
 Wed, 05 Apr 2023 14:36:40 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 16/16] bsd-user: Implement SIGSYS on arm
Date: Wed,  5 Apr 2023 15:36:12 -0600
Message-Id: <20230405213612.15942-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

When a system call returns ENOSYS, send a SIGSYS to the process (to
generate a core dump).

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 517d0087644..c4b21fef713 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -127,6 +127,14 @@ static inline void target_cpu_loop(CPUARMState *env)
                     env->regs[15] -= env->thumb ? 2 : 4;
                     break;
                 }
+                /*
+                 * Emulate BSD's sigsys behavior on unimplemented system calls.
+                 * XXX may need to gate this somehow or arrange for sigsys to be
+                 * masked in some use cases.
+                 */
+                if (ret == -TARGET_ENOSYS) {
+                    force_sig_fault(TARGET_SIGSYS, SI_KERNEL, env->regs[15]);
+                }
                 if ((unsigned int)ret >= (unsigned int)(-515)) {
                     ret = -ret;
                     cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
-- 
2.40.0


