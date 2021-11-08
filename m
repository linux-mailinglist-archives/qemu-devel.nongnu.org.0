Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5404478FA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:54:18 +0100 (CET)
Received: from [::1] (port=37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvje-0000My-1K
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhf-00060H-Co
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:15 -0500
Received: from [2607:f8b0:4864:20::d34] (port=37850
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhd-0002o4-SN
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:15 -0500
Received: by mail-io1-xd34.google.com with SMTP id k21so80909ioh.4
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4/CwsutaIOyDt2WjHRLiQgEBPJ5vyd4yg3qN35Y9Ogo=;
 b=YicToWzSexndkpQoE7u/jETLTD4+gfvW2i099/jciU9HV9sE5nfmXOqMMiAiT4e35F
 A9l0O6rYvbFNc6tKrvb/6oOG2miMQiHTgOAgapkrRppoSngI/D+dJGHnhfBkNJ1hgHvC
 XQVbpLijy0gm7Du/nkI+QH/FrMnl0eFyiMa4aCPmAP3exIL69zv7938yeynJNca7NMCT
 GKIK90Rlpx8mp+wMX7I9j3rwT5AZYmqhfYwkLnqrELv/EZUT3X6yB//0+WfmQGqX+FvP
 O7tG82F0SXMeKQWyyVWEANq8YcntuTNVQusm/Yd/Dcwq0NnDbDTrMvZzR0k7lJanHAru
 UgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4/CwsutaIOyDt2WjHRLiQgEBPJ5vyd4yg3qN35Y9Ogo=;
 b=VFe37o/m0yOseunFmE8aaAoZBdsHXkjjCYz+jiZgwTvHvfjFdI0y9kleTna8Dp6aB3
 i+FHKp/AvbjYwMhYexSGzv+YqloJUb0dfOy2F9zGh8dLxy2kx0WVZWaBMdGLaHU3oTCR
 JcK1iemvUh6fPpqxUH6G3EdVfhG5Nk9WLJ/V6ZiqMSWM89CdH2sKEHhvZM1dHc9XYXCw
 sK6uF345GQhWXNn9l5D3jYatJWptm6DiPpdzwMkLXKm+W8N+UeMDjheT+7sH4HdIAp11
 qkuHxMQyMQUJnpXILUpP/IEytxAkph6/vm7LQx+AaNr3pQW3rjIJXuI3DWazKXBIYSB1
 zFkw==
X-Gm-Message-State: AOAM532zIkhjOPZ26S4LGrQj4zOPtCi9qXtzFAwnAhPp8HX/Prk74xsL
 J13k+8lPTv9ZUoZ3v+cmJAJ4J6E97otLNw==
X-Google-Smtp-Source: ABdhPJyZse4gQcD7NeFqUEhTNrfbfHzyufmnvF3lCNeiR54F4YWMsfuKIL+6DyOMchpMA0fpbqCGiA==
X-Received: by 2002:a6b:f706:: with SMTP id k6mr10431594iog.155.1636343532682; 
 Sun, 07 Nov 2021 19:52:12 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/37] bsd-user: create a per-arch signal.c file
Date: Sun,  7 Nov 2021 20:51:02 -0700
Message-Id: <20211108035136.43687-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a place-holder signal.c file for each of the architectures that
are currently built. In the future, some code that's currently inlined
in target_arch_signal.h will live here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/signal.c   | 1 +
 bsd-user/x86_64/signal.c | 1 +
 meson.build              | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/i386/signal.c
 create mode 100644 bsd-user/x86_64/signal.c

diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
new file mode 100644
index 0000000000..ac90323365
--- /dev/null
+++ b/bsd-user/i386/signal.c
@@ -0,0 +1 @@
+/* Placeholder for signal.c */
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
new file mode 100644
index 0000000000..ac90323365
--- /dev/null
+++ b/bsd-user/x86_64/signal.c
@@ -0,0 +1 @@
+/* Placeholder for signal.c */
diff --git a/meson.build b/meson.build
index 26c58123e9..14b0bb2042 100644
--- a/meson.build
+++ b/meson.build
@@ -2888,7 +2888,7 @@ foreach target : target_dirs
       base_dir = 'bsd-user'
       target_inc += include_directories('bsd-user/' / targetos)
       dir = base_dir / abi
-      arch_srcs += files(dir / 'target_arch_cpu.c')
+      arch_srcs += files(dir / 'signal.c', dir / 'target_arch_cpu.c')
     endif
     target_inc += include_directories(
       base_dir,
-- 
2.33.0


