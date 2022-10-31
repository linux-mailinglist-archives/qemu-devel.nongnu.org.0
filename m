Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C26137B5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZL-0002Si-Vd; Mon, 31 Oct 2022 09:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0007uH-Rl
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYX-0001El-LW
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id l32so7107665wms.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43yJcVbTIzRPiFdwiOz7pAS4lyfDXgLdaPUV9kvWN6k=;
 b=N2mlqZ37SSfL8DvQlUWg1n4/BAAPmVRnK1mqcFj5xjRCpolS16FceoS/6YHdRVXjEg
 HJNTVJJT4iHiSaZ4p1EE/sUgzcOQ+UThvK+CfB8dag9PJocdCJ2J4sIUu3bOGfV7VvEZ
 Cx2GapTpvtVyL/nDLHa28hr+f8L/221l1fWaGBz1GsqneS+ei3+x/S9hZem1FbpHM9Aj
 5M+XeyFzwMEcdE2nKF9C/e+A3lv1ohxJDdQ6Ka23y8r3QPQ0VWMBHUTl1ZkMOf1p/cbV
 wITymu06y+FasZba6/CcALNvijtUTeWPdr3o1dFHqIqpaUJw83UhKbJPFq62dtHDWFBl
 zu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43yJcVbTIzRPiFdwiOz7pAS4lyfDXgLdaPUV9kvWN6k=;
 b=M8liE5volFKeo/JVjkYaIBET+6bdninv8SVE84QdUhAt+qsi4a/fteCcPHvyxU0/ed
 yzA3sR8bZGFfmKs32iwosX4gc35cz4Bz321UXqz3YprfnYOm7wBiKsMOpYIBo1nn+WRz
 UP+l2E3q0SZQSwcLGobB2/5nGaKTOBTk3OaNLg4LhUUXgcB7hx8BQJbIJTl/nMb0NdDV
 NSdL7rJ+0Uxfq+HuSxDctPkTqDSV+MDvF2+XolkHvW+65vNI9pa7sI7IcdKO5bSfbC5M
 MXEFm23XPAlPBKLuWfMFIQq2xrHlBkGPeHdcLSIpYrrzEPyIeYXkoLmhrpNIbVlYX7GU
 N7ew==
X-Gm-Message-State: ACrzQf3jCbvX6rkz/uPETeRLkxmEMNsyEhTCzM5QupON+1r5pV/5GcPe
 ZGbGlA397ez1ZAeW5LKU9Y3Hzw==
X-Google-Smtp-Source: AMsMyM42b+p1jOmcUF/uZabll1Xyb2vPWy6GN+d5j76mjX3WTUa7/Zp8nVWSVVGDIuhoLOfy3TH7WA==
X-Received: by 2002:a05:600c:3585:b0:3b4:a308:1581 with SMTP id
 p5-20020a05600c358500b003b4a3081581mr18459913wmq.77.1667221818494; 
 Mon, 31 Oct 2022 06:10:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a7bca58000000b003cf47fdead5sm7156932wml.30.2022.10.31.06.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79AFE1FFBD;
 Mon, 31 Oct 2022 13:10:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 05/31] tests/docker: Add flex/bison to `debian-all-test`
Date: Mon, 31 Oct 2022 13:09:44 +0000
Message-Id: <20221031131010.682984-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson <anjo@rev.ng>

Adds flex/bison to the debian-all-test-cross container which was missed
in the previous CI patch. These dependencies are required by the
idef-parser patchset for target/hexagon.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221011173229.57909-1-anjo@rev.ng>
Message-Id: <20221027183637.2772968-4-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index 2beb077fb4..8dc5e1b5de 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -20,8 +20,10 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
 # Add extra build tools and as many cross compilers as we can for testing
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         apt install -y --no-install-recommends \
+        bison \
         ccache \
         clang  \
+        flex \
         git \
         ninja-build \
         gcc-aarch64-linux-gnu \
-- 
2.34.1


