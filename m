Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F285E488255
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:29:01 +0100 (CET)
Received: from localhost ([::1]:34680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66OR-0001WR-Jz
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:44:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IV-0005I4-G5
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:58 -0500
Received: from [2607:f8b0:4864:20::d34] (port=42730
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IQ-0003K9-Pi
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:55 -0500
Received: by mail-io1-xd34.google.com with SMTP id o7so10063380ioo.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQyeT4ATSzu88iMyeOafl0yabm+zECQCG8Im0X8yUyY=;
 b=Tufuf/IzDp1UdsKysWDSBm0sbV2wDEJnQN3MGH9DcStLMk+QWbOVvgQUF7rLaUhKUz
 cEQjn/h3VJS9sbNnZhyHBs97FSD6c0NtLS4RFDRgb5bNsEis1BdP+3L2qM2orR+1Gk4l
 uugSnewYR8TU/yt1M3qGD9betFGgz7vyOiozSnST0Nb9YXwAhdoqxo4Cz4FIw5L/nEAv
 L92nQ9d2RPBMs+DZRguTUQoNC06wPx5Net5xSnepUxPfuaNCKKKczC/zJ90hO5nHL2Td
 V4TszAKczGz6HbW6worGXbku3Nfv2SZGk4UlyZRR6lQFJyJszMTVF33NipSZy7sQkBTu
 zkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQyeT4ATSzu88iMyeOafl0yabm+zECQCG8Im0X8yUyY=;
 b=Jge4eTnWX3CJPoM8SSJszRe2iS5R5Bxx1Mi97+OgbyufI72OuGgYmyD0kyq1l39FWr
 OIEZO0hgKIjXlHI89K9jbllKsNpLi9aXcgXsDZYhhQ+QGZQcOxWNJe0RhnNz0Jpttrao
 adfQLlY7Hl84XdAfnNjG32jB+JcpXyryjjXQAPqgp77r7qGlQZFXsfAh1FziUCsdgZN1
 aYX0grEuMd811S6p9hWPaZWQiWk3LUOti7UleNfHENwhluNLJgidOu4DnGNgh3GZ/wX4
 YPIba7OTug6eDXWY/SbIz6kxJOzLgZhmiCcaiJVI1q0z3PbAy/OML1RRmCdisRxzLdPt
 7B9A==
X-Gm-Message-State: AOAM531xboYZiChFf5GsqcP6R9B2rHvwP5vGfgKU0fiZw+xahpe6jpGm
 ei62u5R868klbjQeO/bDFsTE3+KnWR4MJW4b
X-Google-Smtp-Source: ABdhPJy7dFz0gO3vzF+46RW9RsSwGGfCpwcTtP9Ea4zBPYqD/yZIlshCsVXuWvgEYRLbx4sC+kXJcA==
X-Received: by 2002:a05:6602:13d3:: with SMTP id
 o19mr31004447iov.4.1641627465720; 
 Fri, 07 Jan 2022 23:37:45 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:45 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/37] bsd-user: create a per-arch signal.c file
Date: Sat,  8 Jan 2022 00:37:03 -0700
Message-Id: <20220108073737.5959-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
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
index 00000000000..ac903233653
--- /dev/null
+++ b/bsd-user/i386/signal.c
@@ -0,0 +1 @@
+/* Placeholder for signal.c */
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
new file mode 100644
index 00000000000..ac903233653
--- /dev/null
+++ b/bsd-user/x86_64/signal.c
@@ -0,0 +1 @@
+/* Placeholder for signal.c */
diff --git a/meson.build b/meson.build
index 53065e96ecf..c1b1db1e28c 100644
--- a/meson.build
+++ b/meson.build
@@ -2933,7 +2933,7 @@ foreach target : target_dirs
       base_dir = 'bsd-user'
       target_inc += include_directories('bsd-user/' / targetos)
       dir = base_dir / abi
-      arch_srcs += files(dir / 'target_arch_cpu.c')
+      arch_srcs += files(dir / 'signal.c', dir / 'target_arch_cpu.c')
     endif
     target_inc += include_directories(
       base_dir,
-- 
2.33.1


