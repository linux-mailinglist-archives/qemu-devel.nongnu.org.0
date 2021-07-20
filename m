Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1763D0573
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:34:00 +0200 (CEST)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zFP-0000CU-Rg
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8y-0003Ue-DW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8w-0005g1-U5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:20 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n4so296253wms.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WYU1SDVBi1H9TE7ZAxmDV7sTA7P58oVTwrNfK0gYDk=;
 b=S4OWexLU/YUUFwYJyaI3IO97vEYACXyHR4FZb4+zXNIZTZflEdCWf3HYpsgf+eyH8Y
 paGp/z0qSHJeaO1kmEyVkMB+dWxKZDghdEtOFjpOOQe4iKGD67a6LrurUbdrjefJiX2R
 /pI3V0yzTeUlaz+Ob3g562KfH6qgy31iMMWuHAI7ky7ShafxTi/F0AOvoe7vRwqPmLvM
 xm//7Hz/1c63n2hI+EGr723gHd1DfzJsXURAuMaDybB8a0iPXZAiWdM+LR/R8/DCbeb6
 pxqa7DQHEIEorFke5gR5KXAbEZGOeRBresrdnXJL0OyMDPpvL9dajlUvhDtIwdFQcqdY
 Q95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0WYU1SDVBi1H9TE7ZAxmDV7sTA7P58oVTwrNfK0gYDk=;
 b=OgWQlWnu2ryh6VuFhlV7+RWpJHJmuZ7GyxmWzyKcmIu1LLD8N0AOntw85CRdWLxkMh
 7D+NopsMEOSSoSmb9Mf2+mMX22ddXzr14ISb2X8bKpSUWaLcLQwzA5QA5f+dY/abnwUk
 l7OgLroKx1rIdJpTWO747t0axSR/5ykcgDjKYZqjGoumfoE4K9XLfGEfke5JC1W4N8IY
 zhnvsOHEw0f94XmmFA2984zPsxnQEvzRSjDVQ7sMp4Q0JKrQdOVCT/9ME+jB6nPD0Rgi
 7x42Pn1krF1HB6ATvAxFCGXMFU18trJilJkNFy+19LiZrXBMAe6pcHXtMl11k4UNKKPc
 hklw==
X-Gm-Message-State: AOAM5301nKGd2hkg/GUS2bZbmRWz8b9rkDFKi6ijtyGsYUNGFBiuA4/w
 zK8y77mYUyoWj9tgwsW2G08GAA==
X-Google-Smtp-Source: ABdhPJwVoZSon9TFtC9RfasMYd7o2ceVY48nBh/m6cukg8IwrzORmUYF2sg5Y7JaX7T4A1xknMW0Yg==
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr33954626wmi.179.1626823637621; 
 Tue, 20 Jul 2021 16:27:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm11218242wrm.42.2021.07.20.16.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86CA11FF96;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/29] contrib/gitdm: add a group mapping for robot scanners
Date: Wed, 21 Jul 2021 00:26:42 +0100
Message-Id: <20210720232703.10650-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This mostly affects Reported-by: tags

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714182056.25888-9-alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-robots | 7 +++++++
 gitdm.config                   | 3 +++
 2 files changed, 10 insertions(+)
 create mode 100644 contrib/gitdm/group-map-robots

diff --git a/contrib/gitdm/group-map-robots b/contrib/gitdm/group-map-robots
new file mode 100644
index 0000000000..ffd956c2eb
--- /dev/null
+++ b/contrib/gitdm/group-map-robots
@@ -0,0 +1,7 @@
+#
+# There are various automatic robots that occasionally scan and report
+# bugs. Let's group them together here.
+#
+
+# Euler Robot
+euler.robot@huawei.com
diff --git a/gitdm.config b/gitdm.config
index c01c219078..7378238c20 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -43,6 +43,9 @@ GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-individuals (None)
 GroupMap contrib/gitdm/group-map-academics Academics (various)
 
+# Group together robots and other auto-reporters
+GroupMap contrib/gitdm/group-map-robots Robots (various)
+
 #
 #
 # Use FileTypeMap to map a file types to file names using regular
-- 
2.32.0.264.g75ae10bc75


