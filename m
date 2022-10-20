Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C816061AE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:32:36 +0200 (CEST)
Received: from localhost ([::1]:42990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVev-000485-S9
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:32:32 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVRS-0002rk-Ng
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5w-0002d2-SS
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5t-0000nQ-SY
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n12so33796611wrp.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6ZlX/GdPaZ36NnknHeGOl5vJSXm8qxKKINm9d0mPmI=;
 b=VP4FYyrG+MCN21PT4kGODgeszD7Rj+N7uZ+WrS9XBG3+cJdb93wiwXAXrj9gp9t6SZ
 AUL53zpD65sGWqbaYUhnMAJ8Ptri0zYGC9PGb115KhHDSmgXlat7dJ/qybIj5xcypl5R
 MyFQRX6zpRmuF/hxfyC/6FTNP12RIKxpS3Na7W8/2UQd//t1KuzuP5A2Q4EbWvF9jS8O
 bdXYpGlAWOzEOsc6H/xugVlsGpVgFNB/f95LZKVkePDetBSrDVm+01Ojm+9cnXhveRL+
 wFv5wTTYBz88w5r7ZMMEwoOzYSy4SAJXqhKO7/TSkQN8TzmxDq44vZ2BBRZyVxr8rZyy
 6sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6ZlX/GdPaZ36NnknHeGOl5vJSXm8qxKKINm9d0mPmI=;
 b=M0KFHgiJ8l88XowMDADBs8Wg7s52J2cTpsVKqCY0zbLCg3Ou7OHzLxUkoJXPUFcwfm
 qYOvirEukT7fMFQgPmaBwLk2PVWzlom4iGYoa/nVcWWVf3h8QzPfz+BPLAQsM4zKEbZx
 vHvsZq2JW4GqOg9CmODL2rQNWg3K7+WRvZdFQla9vUWttkyaVZse+AkH7rl9uOM+DXDC
 DwIafKq9PnMpBYboYAPXYrZmRZoqvRcUl7Z4vf8B3tEzbB2UQhqaT2Xo76o67sHDXzAE
 g7R3Yf59IDHLsRZOAEnrdhITTMVzemVwkEaXcIYaPWAyqHZ/ZiHzGEH+mkjqo13llsb0
 yvKg==
X-Gm-Message-State: ACrzQf2vCfiyIm92KO6f/VwKtIiwQpgKlRJ2c76/QK2iuFtQTIjeJcAt
 N/UmAr++k+mbXGGiuchbEJvw8w==
X-Google-Smtp-Source: AMsMyM5RSJlxMAvIAHet6I8qYSDzCFUl3mDqT/fgXk9bJhEDhk2k26IMlQXz+mNpOE+yMC27DBCCRA==
X-Received: by 2002:a05:6000:1c03:b0:232:1b9a:eb47 with SMTP id
 ba3-20020a0560001c0300b002321b9aeb47mr8239086wrb.661.1666266731749; 
 Thu, 20 Oct 2022 04:52:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b003c6c76b43a1sm1864459wmq.13.2022.10.20.04.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 571071FFBB;
 Thu, 20 Oct 2022 12:52:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v3 03/26] tests/docker: Add flex/bison to `debian-all-test`
Date: Thu, 20 Oct 2022 12:51:46 +0100
Message-Id: <20221020115209.1761864-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Johansson <anjo@rev.ng>

Adds flex/bison to the debian-all-test-cross container which was missed
in the previous CI patch. These dependencies are required by the
idef-parser patchset for target/hexagon.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221011173229.57909-1-anjo@rev.ng>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 2 ++
 1 file changed, 2 insertions(+)

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


