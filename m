Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3139331008
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:52:45 +0100 (CET)
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGJQ-0007y4-Jt
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHw-0006KT-70
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHu-00018Z-AJ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:11 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso3836567wma.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ig15pshghu+eCUM7ti/ab+kHioEFzPWJ0umuCSDYnY=;
 b=z5G/ThX5vPlSTYpr7+kb7A9dA6jKSNWXefTep1CiZP5IZ35DvMyUWjd0WiPrDCpZxX
 pSqDjdLFnPVzlIQSzzb/DjfdA/dI87aQ7fDGeZTkeZvbwysAvDMkYIgWjuTqqcnBi5mp
 3SyhgvJkcgjj5EIuPDOubzrZ61QwYUYjkYulj8Fg8eO+k87qqpKvRwheUjaXNlQAKmXf
 A/U/c6OzA6wt9KiB3k0bD7LCmPH+IUO+hWdIKy+d5QRZp51cwoFc6KsqsM9KB8LJMWnR
 iR/587KYDN9YDW99T8qAnHhF9+EWuBWVQluXFUieqScoq3H4wx5+s+3sn62gUzWAIUQz
 /TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ig15pshghu+eCUM7ti/ab+kHioEFzPWJ0umuCSDYnY=;
 b=akHLmzZIqDznuRd2Zh0tVYuaUiYFCzifPiWdsxB35DrZqA/vnjkSR0t/potiHVvHvZ
 rsXniQrS7TUqV6DRPnowrdE9f/RgZHrlL27karywFelzNpYTE78T5BuCGJ4qdsuy6aNM
 n2eWTcxd0VT4Iwodyz2ofjKa6VqtU7a2peJQj3gC+MFyMI3r29pnIQlmy/P3l7+KGh4v
 JPJujjyM9teF3TP3RDq1uKig2zfQX/hR3e+KP5+tRwbVp9do5fa/7fgHx5zruVDyGtA2
 /1VLExKC5B3Xhs0n0ODaLkWhx7i36x9gD5taAnG+LO5WLXC2jOcqQvLjbfzkmlN2cIrR
 rJNQ==
X-Gm-Message-State: AOAM531Y+PbKS5tcfvkQWEgYBE82rO6gXnC1md5U/779djfZxaq5ehA8
 PxB/xsBGgiAfVd9MKNe4bvwDNQ==
X-Google-Smtp-Source: ABdhPJxurSzXGLGBVD7idYq0wkzYO2wNBR6PJ2CMdIeAhIl9OVosRzLmVRC3/NACA/RzY2nl+wRRRw==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr22396937wmj.26.1615211467336; 
 Mon, 08 Mar 2021 05:51:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 75sm21051147wma.23.2021.03.08.05.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7C961FF87;
 Mon,  8 Mar 2021 13:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/18] docs/system: add a gentle prompt for the complexity to
 come
Date: Mon,  8 Mar 2021 13:50:47 +0000
Message-Id: <20210308135104.24903-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We all know the QEMU command line can become a fiendishly complex
beast. Lets gently prepare our user for the horrors to come by
referencing where other example command lines can be found in the
manual.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210305092328.31792-3-alex.bennee@linaro.org>

diff --git a/docs/system/quickstart.rst b/docs/system/quickstart.rst
index 3a3acab5e7..681678c86e 100644
--- a/docs/system/quickstart.rst
+++ b/docs/system/quickstart.rst
@@ -11,3 +11,11 @@ Download and uncompress a PC hard disk image with Linux installed (e.g.
    |qemu_system| linux.img
 
 Linux should boot and give you a prompt.
+
+Users should be aware the above example elides a lot of the complexity
+of setting up a VM with x86_64 specific defaults and assumes the
+first non switch argument is a PC compatible disk image with a boot
+sector. For a non-x86 system where we emulate a broad range of machine
+types, the command lines are generally more explicit in defining the
+machine and boot behaviour. You will find more example command lines
+in the :ref:`system-targets-ref` section of the manual.
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 75ed1087fd..9dcd95dd84 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -1,3 +1,5 @@
+.. _system-targets-ref:
+
 QEMU System Emulator Targets
 ============================
 
-- 
2.20.1


