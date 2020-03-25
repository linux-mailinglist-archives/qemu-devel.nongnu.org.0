Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87527192C0C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 16:17:13 +0100 (CET)
Received: from localhost ([::1]:37910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH7mK-00052g-G7
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 11:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jH7kz-0003Sk-Iv
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:15:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jH7ky-0007wu-IS
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:15:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52388)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jH7ky-0007w7-CF
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:15:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id z18so2890871wmk.2
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFcHuHvBSlpN6GNuePYdv4kQDYYjvabQ2NuBORJmALw=;
 b=Co16tyqrY5fzBTuelgKZD/cxPhYSX1O+54bxQ5de2a9RvOcs4EPiFnzLlu1RWoM2Nm
 T7R3P+rK3GKOJX15WvGHjcJTleY7CVyU5PunVZTRCibxoDgN08wwT4EP3vp82IXGTWZA
 4Y5ReJLGekSnV20lNAhgfRW8/UHL0oos1tMt3vpO7QiQxYpAuGGdgs4wILb7IFHr4kAa
 GryqvuGG3UM0pvU0jC/RDBSZOxrVLcPLyqsgiQ3T2F5aYR9GYti3Clzt1rDvCvhKOW4A
 qVSoDAfl+IKvVQIsSMtRSiu+DygdekQ5lQt0IcsNt6+O0qN283GyLrrlfXeNsU/25F6n
 iBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFcHuHvBSlpN6GNuePYdv4kQDYYjvabQ2NuBORJmALw=;
 b=iwqMt8g/RxFBCFiVEEnZtod20a4KMc73E80ySzbP5FsiRtaOxHUQ9KhQuczbPvRAZA
 YzSnoIHEZgZitRd5xhFYZJMBCgOuiorJWfbXblcMhUYPe/yhVk234myB9apuv46YZjDa
 JC8U1RgjQNV0mmNyB8WuPwdTgmJoRV0AREP04YcUOXo/8KWmZdrk+3jGXElO1q/wgMbp
 0lM4qIQx7LHTX7gPY9NXHjgPe9+YRDMqr6NsM9MzPvt0Kt8yi/okuxwjsUWxGrLqkg/Q
 R3wj6FSlXcuUSUxMaYqDb6pZqNjMvTLF3Hl7PKEUCqyPdcZ22HN5AT2DVSB6LEaAc/2M
 cxAQ==
X-Gm-Message-State: ANhLgQ29i1+oXDu59ed3jYtLSTfV9Qtg/rLSToG4IO+WztJZOYuf0CPi
 lyeV4T9ngUho21HmEpkax2/ajg==
X-Google-Smtp-Source: ADFU+vuyoq88A6cYt7BBW/doMzxjP0CZjSyD9Q30EUXKdt4Lg1BogjxO0dranvONd4hhv78Cv2XkDg==
X-Received: by 2002:a1c:1b0e:: with SMTP id b14mr3898561wmb.8.1585149346146;
 Wed, 25 Mar 2020 08:15:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u5sm28139225wrp.81.2020.03.25.08.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 08:15:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89B721FF8F;
 Wed, 25 Mar 2020 15:15:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/11] tests/vm: update FreeBSD to 12.1
Date: Wed, 25 Mar 2020 15:15:35 +0000
Message-Id: <20200325151543.32478-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325151543.32478-1-alex.bennee@linaro.org>
References: <20200325151543.32478-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200310083218.26355-4-kraxel@redhat.com>
Message-Id: <20200323161514.23952-4-alex.bennee@linaro.org>

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 58166766d91..298967fe9cf 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -24,8 +24,8 @@ class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.0/FreeBSD-12.0-RELEASE-amd64-disc1.iso.xz"
-    csum = "1d40015bea89d05b8bd13e2ed80c40b522a9ec1abd8e7c8b80954fb485fb99db"
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.1/FreeBSD-12.1-RELEASE-amd64-disc1.iso.xz"
+    csum = "7394c3f60a1e236e7bd3a05809cf43ae39a3b8e5d42d782004cf2f26b1cfcd88"
     size = "20G"
     pkgs = [
         # build tools
-- 
2.20.1


