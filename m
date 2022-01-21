Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7391495E25
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:08:18 +0100 (CET)
Received: from localhost ([::1]:36888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArmD-0006kh-In
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHa-0003So-IG; Fri, 21 Jan 2022 05:36:40 -0500
Received: from [2a00:1450:4864:20::330] (port=53218
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHY-0003ud-VU; Fri, 21 Jan 2022 05:36:38 -0500
Received: by mail-wm1-x330.google.com with SMTP id v123so17103940wme.2;
 Fri, 21 Jan 2022 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d80KwHGlUU/dphzpKAg6cdeTZhh7cy9ZxguMqHrvJaA=;
 b=l6GL+sMcVbnnvfnnUcVuwCorEkUKv8FQBv82xzd4/dSgOlRli+J3JASGMa/ytR8ktm
 YW3GI2NkxYUWGo/ye0EerZE+BnOuVTOAm5mdiFH11x8Vvo8ufkpFq3vJL2Uzcm4qCY4i
 rcqOVNp1Bg+rzMx+wv+b3ZVhYUFXPA1Xa6Sagf93yzGF/eO0VNDPIT79waB09L2ogbxk
 X44E1yHGSlaLnjCS1IZyBSrE62bPRVHmHFLbyEr3YUrbVytcAj2oNQhr8itc6Ki/W7rT
 Anw1aVhmsWWkwvZitxgmmsNkC5lWJlqXzkmd5HNqPvg8nPeW78SX73YqlolJH6xhlteX
 F6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d80KwHGlUU/dphzpKAg6cdeTZhh7cy9ZxguMqHrvJaA=;
 b=q/vEDhB63AhoHsZkQAaTWki/dhNR3+kpZH1Ad5bCkIyICAR/o6lbyem2EEVIiFwOjD
 Z9eih1i6Fhl4bFft6nd7065ubyKpP0zmxdXmiR/FmoiOFHJ0tmFLVio1rYnZSt+oTvWt
 LATj/B1DNCe1SeIpZy2jSL/Xc5JFVDoFLgXY/LmMeIYcqIBxCOyVFvdPwcxnzsWwuokw
 +pn6Dl4aIASc8FdaGSgg7XhgPQ4eFGVgrCn7AlHf3Ox6zA9cbrutCCyW20aqbx5Jrne0
 Y64cCWHq0gi5KZO1dwuUkaWMKuJbwB7hWnsFhK8GjQCdKRSaYYBb4oajObLgpbLqbknv
 ZHRQ==
X-Gm-Message-State: AOAM531R7qXJLlyq3+3aIWhv9ilIf3SscX4wZ3eV1EPiyRqQJqgLvytS
 w064opWVQTmaYHDBjX60TDPiovj1UYU=
X-Google-Smtp-Source: ABdhPJzG3ziMN1591+ZVbt9IBzLxPVIx6c3Xte0eeZR3ijxuiDvlLJzgPv5kEzxs2QrOmn9Kde8Z9g==
X-Received: by 2002:adf:f68e:: with SMTP id v14mr3439122wrp.585.1642761395052; 
 Fri, 21 Jan 2022 02:36:35 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 l24sm4450301wme.17.2022.01.21.02.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:36:34 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 2/8] gitmodules: Correct libvirt-ci URL
Date: Fri, 21 Jan 2022 11:36:17 +0100
Message-Id: <20220121103623.288054-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121103623.288054-1-f4bug@amsat.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
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

Correct the libvirt-ci repository URL to avoid this warning when
cloning / refreshing the submodule:

  warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/

Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitmodules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitmodules b/.gitmodules
index 84425d87e28..f4b6a9b4012 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -66,4 +66,4 @@
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
-	url = http://gitlab.com/libvirt/libvirt-ci
+	url = https://gitlab.com/libvirt/libvirt-ci.git
-- 
2.34.1


