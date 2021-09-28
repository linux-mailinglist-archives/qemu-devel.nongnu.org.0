Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B947F41A534
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:17:49 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2gm-00028G-R2
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QX-0004dh-LB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:01 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:38469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QQ-0005lQ-N9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:57 -0400
Received: by mail-qk1-x736.google.com with SMTP id q81so35435937qke.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxfPZ7H57dcm7rNQ+f9pWEPpiqUmhBqRaotBBFRVjb0=;
 b=YGa3VXgnsv1ZhAKLGxpTNhGV1j0LVxdubi9hdKKWCT44kE/8Ux7nh0+yT/abpmYAbW
 A4LsWdffxyBAQ/k6E2Fhwyol/HakzYOgihe58NxsbC2Ns9VMp8A21w7adHe8X5OQWetb
 Czab4BcHcpKTChCtpOE7qstALQf1e4MjWAvcIZP37P912TN2zMP1EOsDJUkurEUQOxG+
 XWBwDQKMiuAWsroT56hHQRne5qSiM77Y3noFwgGNdkJw1SnRTp8EFdhCCUUTKVrECwjf
 wTJFKslRc/8sJUWJhsp46+Y13fxfUWaC1JwC/srK+QXn2UDceSOYKxbtFYJzle2K7VBi
 oHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxfPZ7H57dcm7rNQ+f9pWEPpiqUmhBqRaotBBFRVjb0=;
 b=lbo3XJiW2xdq8RItqd/o8zm11bU9d5bO1zCcV+w0nsBOJF1bLY6MUvvCqy7rll/5S9
 4HsbVNUeg/EZEV59wSbs87GmCo08kxLbvCsqhcmIIB4MbqhIkiW9jFmWAFsHUYmQ05RT
 TUqNQp3xcBdqLljlt+FgsenOntdDkRIpegJ6xTvcDRFGAK7QqFYIBCvddTz8qfIXTm1X
 jARxSxWspENC7vXB4dkEu4qR8bQnN9A8+HVjBz3HeFJgd1LfuaPNmDBZzjAbBr9k/lgd
 wLkV8EQO03DvfXa11KqoyudpxW6S371ps4blagUsJ09ADCstpwzXb9HEQh5lzxojU/IS
 JolA==
X-Gm-Message-State: AOAM530hJi3oCzmE2VqH4oGah43RzGXKdQyXdsU8t1Yh+9JjYzLcnSGs
 3ZFJMYPEDeBLKhIa0gG/FT2kuViZL5uiUw==
X-Google-Smtp-Source: ABdhPJzZFHRsD3ejBksaNuIpk5cBGLGwoUCcwRjXoN8mCQ08QuMJvT8tDCy0IJHOEH+aGQR/wM1K8A==
X-Received: by 2002:a05:620a:41a:: with SMTP id
 26mr3165208qkp.380.1632794453848; 
 Mon, 27 Sep 2021 19:00:53 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/25] linux-user/mips: Tidy install_sigtramp
Date: Mon, 27 Sep 2021 22:00:28 -0400
Message-Id: <20210928020039.184412-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The return value is constant 0, and unused as well -- change to void.
Drop inline marker.  Change tramp type to uint32_t* for clarity.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/signal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index d174b3453c..64072779b9 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -87,10 +87,8 @@ struct target_rt_sigframe {
 };
 
 /* Install trampoline to jump back from signal handler */
-static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
+static void install_sigtramp(uint32_t *tramp, unsigned int syscall)
 {
-    int err = 0;
-
     /*
      * Set up the return code ...
      *
@@ -100,7 +98,6 @@ static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
 
     __put_user(0x24020000 + syscall, tramp + 0);
     __put_user(0x0000000c          , tramp + 1);
-    return err;
 }
 
 static inline void setup_sigcontext(CPUMIPSState *regs,
-- 
2.25.1


