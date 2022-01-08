Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D356488298
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:49:02 +0100 (CET)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66xh-00018C-MB
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0005JS-Jr
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:02 -0500
Received: from [2607:f8b0:4864:20::131] (port=33577
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0003LO-B8
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:56 -0500
Received: by mail-il1-x131.google.com with SMTP id o20so30869ill.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LuLB1GCaE27UYhebE8MEe7wQj0GNFAlmAIMZ+t4rYog=;
 b=rmhy6MmztDwLR6K8HP0DJCWbyWNsectKMkBk0Kce3mJPQVacAPxDXp+9EO1VwhTHGO
 9BfxfSj6EVAb/YIOKOpHZcT9vEx1MhTuBPba3CMh1cshNXWDOLpXTiDUhNRNSCKt5U5O
 6YO2E8EGiVvfUFaFnqwCF5yNW4eeRHz6FtOWvviBB9ctQfI7M5qHPx8RtCRu3UbYGiKk
 4T0cJ+goijz2eRFKVHfGr+Pe7JzEqruITUwrG4ZTPUlXq7S04GDQoKE2NxROflIKD9qF
 yTyBHWTR14N4iZ3yrmkMgc9SbrIatWX5R5kIiy8rEB/wxZPa8bJCSezfi7477+D7Q5h6
 5CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LuLB1GCaE27UYhebE8MEe7wQj0GNFAlmAIMZ+t4rYog=;
 b=B9eduI9mNkIc/cdAGJ74kclUdO/swhCEr28d0ezu1jPVZdbiB7Eihx0kV0nBn4bkrA
 40T1L5pmMxjBJd4QPqun61tuS8mHvXm+zwz3Qnyc7MJsiT2WDs3JK7sxe8QCcr12G7x6
 DfV1LUlru+XXHEIVj+tR+fMDKqOsDNDtXW7RkYCCtyR+KCe7aGvtfIycwwTYn/r3lRR/
 C23jrbl5aqHnJ0HJf1ji5vJMmPbq/LcdkWoexvwK7GRuVXi5cJrKVhkgHkMDwNUdNKpG
 JWRT7DU/NMEq2BplmHr/fW/ukjh2wkompPogbr/gwb3lhtrDiqGu9eZcQ3lp56pAPSVo
 711A==
X-Gm-Message-State: AOAM532Sl6JXmSj8UPC0sIZCeEJKwhr4fhK4wHxw4TJIKZyWChbPfqsM
 WYfuNAxZrkObHIz1hdtZMMQ5x42AzWB5Lycp
X-Google-Smtp-Source: ABdhPJyMQxavm3Q1NeKZA9S3jAu0rcWPW/XqrTGGnKSJi4A5Q7rMttmvXjyOzDJR8H0/UZZYumOq7g==
X-Received: by 2002:a05:6e02:1c06:: with SMTP id
 l6mr1361840ilh.239.1641627471664; 
 Fri, 07 Jan 2022 23:37:51 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/37] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Sat,  8 Jan 2022 00:37:09 -0700
Message-Id: <20220108073737.5959-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 55f742b0a8c..e84aff948c5 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -30,14 +30,7 @@
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-typedef struct target_ucontext {
-    target_sigset_t   uc_sigmask;
-    target_mcontext_t uc_mcontext;
-    abi_ulong         uc_link;
-    target_stack_t    uc_stack;
-    int32_t           uc_flags;
-    int32_t         __spare__[4];
-} target_ucontext_t;
+#include "target_os_ucontext.h"
 
 struct target_sigframe {
     abi_ulong   sf_signum;
-- 
2.33.1


