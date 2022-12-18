Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4256504BF
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:21:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p714i-00018S-OT; Sun, 18 Dec 2022 16:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714F-000133-W3; Sun, 18 Dec 2022 16:19:45 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p714D-0001yF-UQ; Sun, 18 Dec 2022 16:19:31 -0500
Received: by mail-lf1-x129.google.com with SMTP id bp15so11053242lfb.13;
 Sun, 18 Dec 2022 13:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46C2MF6RZfVqrMZvxDPCl1p+Oawy3L4vspnUr+kuxSg=;
 b=SuHtJD+TqVsdi8cGt/UsgFD7BskAxt95Xc1JP31T0ZUe24Hs1g5dO0UpULtvB4Dser
 +xVoCTlz9Q5pyJ9i2wQfGkyKRu17u4AK6Ls2H7zvv60UHaEKhOQTaOnKHWvhHL62NpqT
 u+yV4agXTIsXnBmJARPqpFUjCGW/fZBQvuXqD9MD5UAnDbvAnRD0mYSpgSoah8c2iz4E
 fYJN7EwKCK+cTrtQnaTvx3wyZOLz87wQ/wcCZl0wC5SNs1RHVURYgrkRcfBwQVgwZUGI
 7i2+4QdyTK7Z4CWfFlYz7McVl//NzENZuzr8ISaDwXKgYboBgi5I4LNka8poYcKtpwzm
 6C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46C2MF6RZfVqrMZvxDPCl1p+Oawy3L4vspnUr+kuxSg=;
 b=oY/+NeRRAglP8d09OMHXoXzmie/W7aVmSbiljoBX0hfMXtDYZ5timk++B/SukQ2mcy
 n+ZBII0eNDrPQC6oGw7aS9ZjqHJvtIg9N1mR0eadhOhbiOzcSAl838Bo1hx6Y1vSBOCz
 oB4K5Zo0fNxGnzyG5TCnJbzBnOmM3mPz6AKfs3eov3Z+QUiBWmxq/NNR846l7NQlUEhB
 Ug7rISeFaDW04dbeSX1DYXhqWLWpofg80JCzCQHQUWCWW2NvA61yfVmBDSdLRguZ0TwZ
 mEPyFVyxwAtfiFUjzpF4IuAFmth8TgA8P9BMjMSCYwUlTY/hFXRF2vPviaYMUhTfhPQW
 9LfA==
X-Gm-Message-State: AFqh2koLmprPOKskRw4wv8+j1oJ5FSUHmsNy+HGIR9065tjqrOP8b0SS
 hSilUySsBUBP3Qd0mavb6SV8otpzBlcCMtgK
X-Google-Smtp-Source: AMrXdXty4r1fFIDSE0WVSUIJascwDSayiUSZtMKc1Vq1A6lS6NwxcRxztb+Gf8z/46fbiyzwsw4UjQ==
X-Received: by 2002:a05:6512:31d2:b0:4c2:fcbc:efa2 with SMTP id
 j18-20020a05651231d200b004c2fcbcefa2mr2954948lfe.44.1671398367522; 
 Sun, 18 Dec 2022 13:19:27 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 w7-20020a05651234c700b0049464d89e40sm902620lfr.72.2022.12.18.13.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 13:19:27 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 7/7] docs/system/arm: Update Allwinner with TWI (I2C)
Date: Sun, 18 Dec 2022 22:19:18 +0100
Message-Id: <20221218211918.3592-8-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

TWI (I2C) is supported so docs are updated for Cubieboard and
Orangepi-PC board.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 docs/system/arm/cubieboard.rst | 1 +
 docs/system/arm/orangepi.rst   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
index 344ff8cef9..8d485f5435 100644
--- a/docs/system/arm/cubieboard.rst
+++ b/docs/system/arm/cubieboard.rst
@@ -14,3 +14,4 @@ Emulated devices:
 - SDHCI
 - USB controller
 - SATA controller
+- TWI (I2C) controller
diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index 83c7445197..e5973600a1 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -25,6 +25,7 @@ The Orange Pi PC machine supports the following devices:
  * Clock Control Unit
  * System Control module
  * Security Identifier device
+ * TWI (I2C)
 
 Limitations
 """""""""""
-- 
2.30.2


