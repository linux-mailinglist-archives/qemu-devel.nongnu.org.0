Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716352DFD39
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:07:40 +0100 (CET)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMmh-0005uU-C2
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR0-0004on-NH
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:19 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQr-0007iq-8v
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id 190so10102965wmz.0
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jM3hkD4CvKdZOABArp0NAjoE5fJXpKMpDEFZ8ZRfbww=;
 b=p8aFyLKR3J6XHwoqW+v81SVJJcziWaM+dHmi+w5JY3EZZR3d3Z08OoeNa9fopwj6wd
 eq/sQwFKmpZfAR5/hf2pig2EN8e2tWfu5Wqador1h5Kic/RpBkNXqAjQlzMWG/78yQPi
 HNQx2mgwNz0L/J5SvtZlELv4ySzvtowpo9jqJL4g6C70hvE2KaiB93LurWLHar1yBZil
 jJLYTQYq9+97Gv7gROQJ9LLEOOPXx5vYASBzPWGfBQ9eGJtlZXFzB7kYJ1RODQpaWajA
 6Y5wgn8aVopOIKVTTIvk2Ehb/tDyiIrvetxbxvIA9dSa3Exjr2dJ3Q4SUA441KDR9laH
 Xq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jM3hkD4CvKdZOABArp0NAjoE5fJXpKMpDEFZ8ZRfbww=;
 b=Ftw6lsqoqsNctCA/B/DUJ8V+EbytZhmYlm0ZiRmzPyc/6aO+G15ORAEnkg/IIpg5T4
 9NmFGGynhsBxdJ0Zf0mOjKsWOhg0AX/uf3kRzd/yuPAjvwmI/Wm7yY+USNxjsn74MsO+
 zoyZFhbCKBjyWZLMUrS8UiSNAcrxZL5HhrLztmOPyyDzmmO3NJgLU3MQIa/ZzVsONKL8
 l4uymQjye+ponB99q8P7gI62zAytNHkhKkfoK8INH8C5l282G+ockVqpLbWRVKDc6225
 u4p/9Yu7YiNY8Vsbjx7tlylRkS6gydaoKH6qHkxfXUo5kepGrBZMZ6AjBHP9xL0WCTqz
 ji/A==
X-Gm-Message-State: AOAM532gpLd4NiBz4Qg2LnHz/DUqfYFglDU//grs2cSDhb2ocs3VVeXX
 stQRnQ1eFhZV9Y5fTNUsgPYF6lTvtpA=
X-Google-Smtp-Source: ABdhPJzhl/1wzOaHLn3PyzVJkEJJRyc4XXVJu7ARMwa7luXm4cOkHCIGQF27nvIJGA8c1nh7mXKGUA==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr16961171wmb.112.1608561902836; 
 Mon, 21 Dec 2020 06:45:02 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/55] target/i386: Check privilege level for protected mode
 'int N' task gate
Date: Mon, 21 Dec 2020 15:44:07 +0100
Message-Id: <20201221144447.26161-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

When the 'int N' instruction is executed in protected mode, the
pseudocode in the architecture manual specifies that we need to check:

 * vector number within IDT limits
 * selected IDT descriptor is a valid type (interrupt, trap or task gate)
 * if this was a software interrupt then gate DPL < CPL

The way we had structured the code meant that the privilege check for
software interrupts ended up not in the code path taken for task gate
handling, because all of the task gate handling code was in the 'case 5'
of the switch which was checking "is this descriptor a valid type".

Move the task gate handling code out of that switch (so that it is now
purely doing the "valid type?" check) and below the software interrupt
privilege check.

The effect of this missing check was that in a guest userspace binary
executing 'int 8' would cause a guest kernel panic rather than the
userspace binary being handed a SEGV.

This is essentially the same bug fixed in VirtualBox in 2012:
https://www.halfdog.net/Security/2012/VirtualBoxSoftwareInterrupt0x8GuestCrash/

Note that for QEMU this is not a security issue because it is only
present when using TCG.

Fixes: https://bugs.launchpad.net/qemu/+bug/1813201
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201121224445.16236-1-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/seg_helper.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 1255efe7e0..5f2ee6aa7e 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -634,6 +634,24 @@ static void do_interrupt_protected(CPUX86State *env, int intno, int is_int,
     type = (e2 >> DESC_TYPE_SHIFT) & 0x1f;
     switch (type) {
     case 5: /* task gate */
+    case 6: /* 286 interrupt gate */
+    case 7: /* 286 trap gate */
+    case 14: /* 386 interrupt gate */
+    case 15: /* 386 trap gate */
+        break;
+    default:
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
+        break;
+    }
+    dpl = (e2 >> DESC_DPL_SHIFT) & 3;
+    cpl = env->hflags & HF_CPL_MASK;
+    /* check privilege if software int */
+    if (is_int && dpl < cpl) {
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
+    }
+
+    if (type == 5) {
+        /* task gate */
         /* must do that check here to return the correct error code */
         if (!(e2 & DESC_P_MASK)) {
             raise_exception_err(env, EXCP0B_NOSEG, intno * 8 + 2);
@@ -661,21 +679,10 @@ static void do_interrupt_protected(CPUX86State *env, int intno, int is_int,
             SET_ESP(esp, mask);
         }
         return;
-    case 6: /* 286 interrupt gate */
-    case 7: /* 286 trap gate */
-    case 14: /* 386 interrupt gate */
-    case 15: /* 386 trap gate */
-        break;
-    default:
-        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
-        break;
-    }
-    dpl = (e2 >> DESC_DPL_SHIFT) & 3;
-    cpl = env->hflags & HF_CPL_MASK;
-    /* check privilege if software int */
-    if (is_int && dpl < cpl) {
-        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
     }
+
+    /* Otherwise, trap or interrupt gate */
+
     /* check valid bit */
     if (!(e2 & DESC_P_MASK)) {
         raise_exception_err(env, EXCP0B_NOSEG, intno * 8 + 2);
-- 
2.29.2



