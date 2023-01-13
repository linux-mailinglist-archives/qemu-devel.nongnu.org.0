Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D956698F6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKHM-0007q0-Ah; Fri, 13 Jan 2023 08:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHK-0007pU-CZ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:30 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHI-00053H-LH
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ay40so15301380wmb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YX3naq5ZNqjOTiMOy0rg53RIUBd9djjd4qY57KHB7I4=;
 b=WjTtB4O9lF85m9xCCcQb5fvIhTZH14VKjxXb6Q3SUt9Gr2AsMTaUlITFig7dsa7nV9
 Yt2Gku65ibAgT34l+1YnuepjlSN4zLCZ2/PDwFyIUdF2lYdzZLqP6k4gfhBWooaRRuyZ
 r5/19bx7PKg0+EKAf1GFbMKHUs5jsP2bTkPZajruEnq5knoiYDlafU4UVDejfz22Q3hA
 ac/EkfRtfD9UrwowtKTzRG6APonn50JhCd5IbdQFHmw8gJ0EiDI23rcA9p65U7PLl76T
 7xWvOiiWvm4KTiWkef43n4k7nU3HSSqtJRSxgkrOzMfyP9ukDkT442vga5+OduVf96P4
 bMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YX3naq5ZNqjOTiMOy0rg53RIUBd9djjd4qY57KHB7I4=;
 b=H3X3J7UeclYj7Ig7HodAdbJDjBC7IQKix+tXlcKukZgBa+EbU4Who1FrVt+y85np99
 GrgYlxzz1hqZtkc6gCh50lz0Cyuxloee1sCmwc9pdlw2l6bggnspnMiJMH2HCh0MRjyC
 etmY+nNZUw1bmDXgiOi6bsjc/020t/JgUthx6vbJPrqusr1D5ycBEUgygsC2MZtJGyax
 8IjSNJhrsS//rSluCzcVeRJfUdBv0/xzQ0AgCnAuCx87DRR936eS8TdnZ99SCuEwRQ9d
 lkej0PyJ//aQlVbBXxZO+eln1nwJfTQydtkVJQvXFV+sdSUS/wnKq7KKXEuK/no7xLZ2
 f22w==
X-Gm-Message-State: AFqh2kpUKAsp9xLk7lO1PHI+q0h5Nb+6Bx8Px2q6hA8XBdG6J8fPvWhs
 5fRETMO2r9CAL6yi47NNHEIbTQ==
X-Google-Smtp-Source: AMrXdXuhSVul3bEemh9977cOh1gJC8l15WRyDBktCMDP3532N0vhe7/Bb3/gl5CBUjV0xfE3qKIYyw==
X-Received: by 2002:a05:600c:a0f:b0:3cf:7704:50ce with SMTP id
 z15-20020a05600c0a0f00b003cf770450cemr59571404wmp.38.1673617167180; 
 Fri, 13 Jan 2023 05:39:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bi6-20020a05600c3d8600b003d9df9e59c4sm22299090wmb.37.2023.01.13.05.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 05:39:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DB921FFB8;
 Fri, 13 Jan 2023 13:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, peter.maydell@linaro.org,
 Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: [PATCH 1/4] docs: add hotlinks to about preface text
Date: Fri, 13 Jan 2023 13:39:20 +0000
Message-Id: <20230113133923.1642627-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113133923.1642627-1-alex.bennee@linaro.org>
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Make it easier to navigate the documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/index.rst  | 16 ++++++++--------
 docs/system/index.rst |  2 ++
 docs/tools/index.rst  |  2 ++
 docs/user/index.rst   |  2 ++
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/docs/about/index.rst b/docs/about/index.rst
index 5bea653c07..bae1309cc6 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -5,19 +5,19 @@ About QEMU
 QEMU is a generic and open source machine emulator and virtualizer.
 
 QEMU can be used in several different ways. The most common is for
-"system emulation", where it provides a virtual model of an
+:ref:`System Emulation`, where it provides a virtual model of an
 entire machine (CPU, memory and emulated devices) to run a guest OS.
-In this mode the CPU may be fully emulated, or it may work with
-a hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to
-allow the guest to run directly on the host CPU.
+In this mode the CPU may be fully emulated, or it may work with a
+hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to allow the
+guest to run directly on the host CPU.
 
-The second supported way to use QEMU is "user mode emulation",
+The second supported way to use QEMU is :ref:`User Mode Emulation`,
 where QEMU can launch processes compiled for one CPU on another CPU.
 In this mode the CPU is always emulated.
 
-QEMU also provides a number of standalone commandline utilities,
-such as the ``qemu-img`` disk image utility that allows you to create,
-convert and modify disk images.
+QEMU also provides a number of standalone :ref:`command line
+utilities<Tools>`, such as the ``qemu-img`` disk image utility that
+allows you to create, convert and modify disk images.
 
 .. toctree::
    :maxdepth: 2
diff --git a/docs/system/index.rst b/docs/system/index.rst
index e3695649c5..282b6ffb56 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -1,3 +1,5 @@
+.. _System Emulation:
+
 ----------------
 System Emulation
 ----------------
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index 1edd5a8054..2151adcf78 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -1,3 +1,5 @@
+.. _Tools:
+
 -----
 Tools
 -----
diff --git a/docs/user/index.rst b/docs/user/index.rst
index 2c4e29f3db..782d27cda2 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -1,3 +1,5 @@
+.. _User Mode Emulation:
+
 -------------------
 User Mode Emulation
 -------------------
-- 
2.34.1


