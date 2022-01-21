Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE709495FFF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:53:44 +0100 (CET)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAuMK-0003rr-0S
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtZG-0008Q1-Sn
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:11 -0500
Received: from [2a00:1450:4864:20::330] (port=45661
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtZD-0000ly-2q
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso22201656wms.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 05:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmhL/OO2/CergPGLZmyF9NCYKTuS6CMx+Lqk/P5jTQc=;
 b=mndCJDuhhu0qYDXJBYqSnD+T1R17xsOe3e1DGcsS7JAB1wrgP5oylx4J8x0r3k6kuD
 6M+YrwVEhLxS/7sJeffrgai/GTnR5ddtPKUOk5wa7VZ9GhtKgHI23iQ2bhEY7KJteOnG
 jjWZkYeN9HjnTXhr1sFGpXsFIloqMF0LC4IKW/ABnI71ak+DtSGBA3wq9ngqjF1oVGhV
 kEhfYdzvhUifGzzhlXxyAPgSkOwLsCbFLwSOL5jLeht7TmMCcS6QHuNHTCaXxDQ9RZLb
 e83l1Jmw7q500n5fOwKnbLrJvR6qX2ZREcU44Dzm8cAhexpkoO4hR8DneK0EE904FLhJ
 uNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jmhL/OO2/CergPGLZmyF9NCYKTuS6CMx+Lqk/P5jTQc=;
 b=evkZgpR+TqI0hLIAjMyKgjBmHFlvm6wWZiw4LDuN4wMkXYBvTQCYI+x6L0qDrhVPUf
 c6UUrLQPVynenSevpYvqUoN3j0K3jSu6XoC4d80pYbZJENgcrPt39qhI9UdtSv/ZgRkr
 onwBcCfev4sDQFLP1U7AzoVbbY+wLmpuX9Dg/SqoPpsaG9X/SdldkZ0ZoXVTe7lPtvNM
 AbpmVkyOgkgA4Soo9UTNVV/jCfEeCusEyFymaj1eC6+NMKFpJbVk+oubECXJOy4wI5lF
 qsodgz4lapSIqTyCEJ+nyRrma4+xeNN/qcPEIlcasqNVu9fpiMqyWUZe8YnG+dQUbeZJ
 E13w==
X-Gm-Message-State: AOAM531vQmlo9m4Y+GQqK57602bk9fwNKEsQrXMZjUYsAQCXP9bn02NQ
 16bvI6+kt7Dh+HNlL6KE51MIhaUwBDY=
X-Google-Smtp-Source: ABdhPJzLi4kgwKFMXEhHB4lEQ5+FWStB0kaVnTD5iDFRwa7N1S3IiOlBEwxDYXk/SnUPShlAWATbdA==
X-Received: by 2002:a5d:4605:: with SMTP id t5mr3917615wrq.517.1642770175280; 
 Fri, 21 Jan 2022 05:02:55 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 l6sm7346022wry.75.2022.01.21.05.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 05:02:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 6/7] tests: Manually remove libxml2 on MSYS2 runners
Date: Fri, 21 Jan 2022 14:02:21 +0100
Message-Id: <20220121130222.302540-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121130222.302540-1-f4bug@amsat.org>
References: <20220121130222.302540-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

lcitool doesn't support MSYS2 targets, so manually remove
this now unnecessary library.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .cirrus.yml              | 1 -
 .gitlab-ci.d/windows.yml | 2 --
 2 files changed, 3 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 02c43a074a1..7552d709745 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -32,7 +32,6 @@ windows_msys2_task:
       mingw-w64-x86_64-libgcrypt
       mingw-w64-x86_64-libpng
       mingw-w64-x86_64-libssh
-      mingw-w64-x86_64-libxml2
       mingw-w64-x86_64-snappy
       mingw-w64-x86_64-libusb
       mingw-w64-x86_64-usbredir
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 62dd9ed8329..1df16303491 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -44,7 +44,6 @@ msys2-64bit:
       mingw-w64-x86_64-libssh
       mingw-w64-x86_64-libtasn1
       mingw-w64-x86_64-libusb
-      mingw-w64-x86_64-libxml2
       mingw-w64-x86_64-nettle
       mingw-w64-x86_64-ninja
       mingw-w64-x86_64-pixman
@@ -80,7 +79,6 @@ msys2-32bit:
       mingw-w64-i686-libssh
       mingw-w64-i686-libtasn1
       mingw-w64-i686-libusb
-      mingw-w64-i686-libxml2
       mingw-w64-i686-lzo2
       mingw-w64-i686-ninja
       mingw-w64-i686-pixman
-- 
2.34.1


