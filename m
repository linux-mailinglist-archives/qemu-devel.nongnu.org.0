Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EC748825D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:31:10 +0100 (CET)
Received: from localhost ([::1]:33208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66fc-0004YD-CG
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:01:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0005Ja-NE
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:02 -0500
Received: from [2607:f8b0:4864:20::12b] (port=35603
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0003LF-AU
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:56 -0500
Received: by mail-il1-x12b.google.com with SMTP id b1so6516840ilj.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDeeTs/ZwISiL/2qknbpHkl3Yjz2NvR7d+xYIi8TXws=;
 b=Ql5oNOcEn/6JvsMBf2wGZHXMwA2kxy32V6QjiHcbI4AMu27MQVEz4xuP6faM8ZyjwF
 DVuxmWjEZONYCMCITEevrZhTOQBfXQ7b5ed8+rtl2izIKyjzfBKvR5tVad+9nOr/nQhx
 D5kpqpvPxbl9gPmC0Man15KgwABbvboDrJKwlBuiEMNEyIu4LyMTlsDra2UZbbA7dOXk
 Yqw0uMQ/FlOQL3Hmcu1LDpRxJGHDl4Nj/atFlW8gAoSM/53VROCSUBKTALX12J8rmvBM
 /TT86fZ2VL1pi5K5XQxxgYo6QJGkJboUglMi12MsR1El0o5rPZtYQ05k/4NhUc6ruuvZ
 odcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDeeTs/ZwISiL/2qknbpHkl3Yjz2NvR7d+xYIi8TXws=;
 b=NE1YwZuZLfMJTIjJTUCzvgKVIstifsabKO/Pssk8e5tZPAZjyjV9yMJI9jaEXUcF84
 +A9bVxg31fQVY/HDKMxamXLN1m9bFOQZcqJen2oDtUf/0M4h293z1AfD+/SzWXZ0vwmQ
 t0gi0HQBu9axhr+pv9GJF5NwWkgGR3JXFOlHM9ma7jCzBLWFvvgz9amEqDYJJ33HfCZj
 hRG4GK+WWDEBeb9wS1zo/EyP6tH0wzeI8PfH4kWKRc7Ebu08BFQGYJxLwmyBU0PEMuA3
 MLYP2fCkkfwxbY1J+nyI5iIyUjB8TI2zswi6U4lAFkppzIY9MugXraIuDAuaUJwOLrWQ
 H+8w==
X-Gm-Message-State: AOAM531Jaz+uE7w2UoDWxMcWgbBkS9t3EjpgpPaYRxy7fqiZqQ4quOaG
 4XNNAKuAuVxy9UiLf697Bj6pnE2UoL1uNtbH
X-Google-Smtp-Source: ABdhPJy+VCmZwBPLCgX9vgaqJrIymoFl2MwV+qiI5UT2Ig4HNO7CF1WPouhyYdB6O/9DmTEgIJSGPQ==
X-Received: by 2002:a05:6e02:1bc5:: with SMTP id
 x5mr31494703ilv.255.1641627470799; 
 Fri, 07 Jan 2022 23:37:50 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:50 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/37] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Sat,  8 Jan 2022 00:37:08 -0700
Message-Id: <20220108073737.5959-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, kevans@freebsd.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 4bb753b08bb..55f742b0a8c 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -27,10 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-struct target_sigcontext {
-    /* to be added */
-};
-
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-- 
2.33.1


