Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3615445E93
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:26:15 +0100 (CET)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miprq-0004pZ-Qg
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplh-0004Fn-FS
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:53 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplf-00043M-2B
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:53 -0400
Received: by mail-io1-xd32.google.com with SMTP id q203so9161676iod.12
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=av0Dv2nhr+A9RjUWFgiLGe/ya97+oVzXha6GTTS/bK4=;
 b=FL8PpF/bRQjurmKXUiXCaEzmEmu1BIFgiiJo97Bntca3FNHooDZKmhcXvOALhlZXFT
 kwGRaFndRybwqQlCo6089MA5hlfFdFwer1/TPY1YvlHI6lITZc7SUwsklI2o2Y5nMD4j
 9TKrZip2X1zxhfCer6QHwElBTKZFl4cI++A7bOJHPtpMYy51FoDK+nsJl0/sjZDBLoMm
 ORSEsNEGV4ZG4CD1KUuPB42o4nsWZJ+vIcLegA44GKiuIGdUp25L+W1y5vw956SqL2Yh
 BJsGqaXu+7/KYe8BTod1bSRvkmbRNxObWl1shmFHois0kJ6JVRNXM8SgsOnDFkbC+3EK
 BKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=av0Dv2nhr+A9RjUWFgiLGe/ya97+oVzXha6GTTS/bK4=;
 b=DdqZ0odWfi/2nn0tSIgyUvS9tX1vtIbQeQCX3Oxvja9u/VbMTIfl8ZvFOAiJunqV4s
 3YeUNNOFDn4fWtlyQgx/K1plSkpM4sd0aabA1fMTMXMlHsfibMsQM/+9dtdtKUoDW60C
 Bw0VF+8p6K3ypmsliEeILy80wd26DSDhhBkDsuytKdny7MUrgci3E32DXXoU4N8c+X0/
 mZoL/ljm81cEsionzjwi5aM7vHVHHytowR2L8ABa6RjJQKneaAAgHuWAQ2VvV85gVcIT
 KsClThXG1+UKGjRzdPLmRKOQKPYwQwwBXVPHkymgPfS5v3THeFNRdZ798hAu9fz+K1xm
 0JcQ==
X-Gm-Message-State: AOAM530rwTI1vUwrSpaJTYLU44J22t+vuvOxrzH9olugMiIZFlJ30NCC
 T45bHOWOFAu+CiFbdZvB8OFTDs4u96L09A==
X-Google-Smtp-Source: ABdhPJze3OlhIZYiAvDFxr/mQj024QZqGlPPdxsN09L8oX6kXJyhRRhWvTQmMeGil2Qk0QSaJ//JHQ==
X-Received: by 2002:a05:6638:1606:: with SMTP id
 x6mr6760992jas.17.1636082389335; 
 Thu, 04 Nov 2021 20:19:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/36] bsd-user: create a per-arch signal.c file
Date: Thu,  4 Nov 2021 21:18:44 -0600
Message-Id: <20211105031917.87837-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a place-holder signal.c file for each of the architectures that
are currently built. In the future, some code that's currently inlined
in target_arch_signal.h will live here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


