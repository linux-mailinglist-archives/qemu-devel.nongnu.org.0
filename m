Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C3494EBC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 14:17:51 +0100 (CET)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAXK2-0005Au-4g
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 08:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVH3-0004Fl-5X; Thu, 20 Jan 2022 06:06:38 -0500
Received: from [2a00:1450:4864:20::329] (port=55953
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGz-0001xz-4X; Thu, 20 Jan 2022 06:06:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id c66so11231065wma.5;
 Thu, 20 Jan 2022 03:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xPHUAsR02tGl97Ap5cxvHh0G/aTL5XzanhOn1Ca3aRY=;
 b=QU5k8silBjaX21Obx1+veqdvqyIySO5RV2Hj6k3VgwGQwMutTi+I2kjsreq6jS5Kpc
 90xZNqtDZX/ueEP+o/It9UkjRubEwQH/ALHNoNPg/RO1KcdHsKOwwqueAuAw4LjkO7FW
 xV1X4EK2v04wP7OU1UHY9rHERKnO3/rRBRA2SCBLz3+RVJIBn2ZmQ00N+2BDfJtlzCSo
 Lcsoz3f74ftaLFQAe1zE+ZGHS1DggnxBBC5QhAT60ffHVkuF/1tTTmny3YZTlhIOiJns
 zeAvrkL+Rm8NP8Olb+dGOJL18uJZbyvLdbk4byAM0aSzHjhOgd+Tt+vSPK1oWUm7EyYQ
 AyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xPHUAsR02tGl97Ap5cxvHh0G/aTL5XzanhOn1Ca3aRY=;
 b=KzJM+g9tAaD/hUXJbdVQXG2XI9oZzCuAYOHO94rzEsVxvt40SQV5StwuW/+9iGg/Qh
 /2XRdeRu6usX5U/lWMbzGNH5thGmT6eM4SDXW4N5hejU3c5UQ5c11rkrOsJd7u0dDKK3
 cfs5TRZcJmx7VKH4X8NDljKnJ5xfiGY6R7ZGcdCQLO4zkXwB4WT9c2rJGxRs19EsUVSD
 qXs3/iD02PZ8DhGObJoRgZ2mYmao98UYisaf9JPpOn+z4fn4eqGijRttU4hAPEq1xsTJ
 Ya0jO4hRNB8udyO6MDpbX4QvAEsr0tqbPy8BK6uV59zKWXGJtF0k0rSfJwLAY6Q0bS1+
 i3wQ==
X-Gm-Message-State: AOAM531NFqfgvx9gKXWH23dP7+7nQjEqQrxELGOUHCFal4MWZS5lLpP8
 0XKCLOUooeF3Hi05KFJiTipZamjgArE=
X-Google-Smtp-Source: ABdhPJw74IEEk7DQcm2AsJnFI4LunRFn9IYrMNRx8rzcOKrHNZQ9oazFKapXzK6jL773DfJZCSbi4w==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr19868864wrb.675.1642676777644; 
 Thu, 20 Jan 2022 03:06:17 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 f14sm2548821wmq.36.2022.01.20.03.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:06:17 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH v2 6/6] tests: Manually remove libxml2 on MSYS2 targets
Date: Thu, 20 Jan 2022 12:05:45 +0100
Message-Id: <20220120110545.263404-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120110545.263404-1-f4bug@amsat.org>
References: <20220120110545.263404-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


