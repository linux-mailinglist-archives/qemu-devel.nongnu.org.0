Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E169A274
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlO-00006C-Jz; Thu, 16 Feb 2023 18:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlJ-0008UK-A1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:01 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlH-0008QE-CK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:00 -0500
Received: by mail-il1-x131.google.com with SMTP id j12so1075454ila.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UDKo+pEqLr25ECZFRWghhYmC5CZ9G4l3ZCThpSQaZZ4=;
 b=41vk+tWM/pdvJBVS6Iyh7OGaTVfZ4wD+WXTssRJ2pHuzV83CFgwyBc6c9+Y8BJ6fjE
 y+ILjYfcaOaFd/AXqhKpeU/QUMvqlSG5b/6XqF60rJg3F18rxojhlEUEx3iTirIo9UbB
 ZHNVXv/e2os7ULMEk1fT3OV1hb1w2sknqPeXs2IsAkzRYPr3Wi7JMMC8plTpLzEon6wM
 ABqVxJdRXtMPRNfOOHsUyUDJVtURgrTHtnwl8ppJUOM+94wJB8r/nouqeWpsjnXUwrLW
 +3LzOWXU0aAuIS4JUwrE4p4pTgMkjJR1cSnvguI37Z70m3cBFghvxxgLScx2IGoMBXnC
 hOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDKo+pEqLr25ECZFRWghhYmC5CZ9G4l3ZCThpSQaZZ4=;
 b=gER+b11vIITOt46L2JfiL+lz+2MBob+eSXf2hyeJ0Dks3wJkqhgDOZyBiiM5KyK24n
 dRWb8icEUzm6Mkheo0Stpt9T7CZz0PljXwxG5bdPesnbj/waQzVmEkmx5mWQIzQVnCoR
 of83mEobj+Y3dWAD6NfV2n40uBYWR/H0KnZdQ6a4kkCcAv4tCG2tsAZ4Bgll6Vjap13P
 +G10dNYvrAAXOgEzR1B6LrK9pxdKl5LiQFTwddKl9pl8+OOivv6qBQ05hV8qe735kdNv
 vX+tZvSSe4LCLyG0nX0bbOCljOjLKa0OEW7xnsQh4FGihoUWl2S30Z3Ys7bB5cH1WJ5I
 5FfQ==
X-Gm-Message-State: AO0yUKXJWMAL8rYTxsp9vZIW2HQxEgE4dR+ZzYmHIs+sfelZEv6kLMKx
 vxRQ/0RNngK8xRFdBc4erqrrog3qXP2YW2bD
X-Google-Smtp-Source: AK7set8gomZ0aX49pS5dFfuZUrBCsUz9anrh6NHck/SlKGEhEjUqEIV/+HnlEwV+OqHwiE9I9N4dlA==
X-Received: by 2002:a05:6e02:1c29:b0:315:7004:3e69 with SMTP id
 m9-20020a056e021c2900b0031570043e69mr7183896ilh.13.1676590437659; 
 Thu, 16 Feb 2023 15:33:57 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:33:56 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>
Subject: [PATCH v3 03/11] bsd-user: Add sysarch syscall
Date: Thu, 16 Feb 2023 16:33:45 -0700
Message-Id: <20230216233353.13944-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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

From: Stacey Son <sson@FreeBSD.org>

Connect up the sysarch system call.

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index b4a663fc021..e00997a818c 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -491,6 +491,13 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_undelete(arg1);
         break;
 
+        /*
+         * sys{ctl, arch, call}
+         */
+    case TARGET_FREEBSD_NR_sysarch: /* sysarch(2) */
+        ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.39.1


