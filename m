Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3E231FA2A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:59:24 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6JW-0008LU-Sm
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD6IC-0007p6-Qw
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:58:02 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:32935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD6IB-0007kl-Ed
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:58:00 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so8669497wrz.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 05:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9radKPSxlwGcajNNUssEqp0YrJJSLbZ+CJRvJx2O36A=;
 b=pAuNIGuII+hqXQ+41KLAd6Lzz0dlCGs25ZC56R07A1k1yKA2wvYSS86pp9XLVswjmW
 MLHBquc5gr7Y6IG+PojbTyfEcOFe8UnDfdmT0j/xYfbQ1pJFIcqvWttedXSJVlHC1nUl
 rYmfDvHQ6u+xpfvBq8qhYsbPKLEhvMGr3xoWfk0vGXPhiH3io6Z1pDEaugR97BMjcxwl
 +MVJ+bszJmtoB5y4oPs3he878yVR5WHOmo4f6BMAvXgva8IM3PBHLSUpqiyiVI7PeKwG
 pwi0QWwhXx4ofUcUPRQl7bSLmhRTNJpZC1nKSlAKrNMq6Vwo03ckx1NWAP2q+KBziScT
 RpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9radKPSxlwGcajNNUssEqp0YrJJSLbZ+CJRvJx2O36A=;
 b=D51zxvth9XI/nCwqHgJI3exzOP3cGpOblx9z5ZE/eNFk3suJNsurluD4ZWUzPomlSC
 Kr1diBsOHa9YsYRrgbSNryUZyFUTrho+yvAZirP/OlXSF/lYcjl6Uqn1uMFN/4XUge3v
 GJ2MCy2/kVZulyMJ18/qX83SP8sUsROruZ/wgKP+7BYxaUKTbCSYph44OoqbeJ0R2ymN
 NAyOVtpfBHrjAeuESNasGo87/k0ZVTKD1b3UF6BfTkVIFVgMbY1Dci0qMbxmTkWEiyVq
 mWPcBvf7bbRvKBy4nczZfjOthnoe3H5o6RXP7OD1TrdOKsPZGpKKVddJmVNuMzDkqYsE
 X9Lw==
X-Gm-Message-State: AOAM531nFAHT5Gh+XuhEX85bdW023N/nT1vPNGqWD6JP7VtidIG6QSxG
 6V92mSb4tUJm53PxyuH2ElA2JLiMBuQ=
X-Google-Smtp-Source: ABdhPJwbWc2c0XhjCt889C4E028X2hUb+7IWBTOUMzAlBFcVMHxOt3iLm3UWTU1aBi6VnOBJF7sJ1g==
X-Received: by 2002:adf:d239:: with SMTP id k25mr9660062wrh.308.1613743076149; 
 Fri, 19 Feb 2021 05:57:56 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y16sm13061278wrw.46.2021.02.19.05.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 05:57:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] exec: Poison Hexagon target-specific definitions
Date: Fri, 19 Feb 2021 14:57:54 +0100
Message-Id: <20210219135754.1968100-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 3e7a84eeccc ("Hexagon build infrastructure") added Hexagon
definitions that should be poisoned on target independent device
code, but forgot to update "exec/poison.h". Do it now.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/poison.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index d7ae1f23e71..6bb86f6c2f0 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -10,6 +10,7 @@
 #pragma GCC poison TARGET_ALPHA
 #pragma GCC poison TARGET_ARM
 #pragma GCC poison TARGET_CRIS
+#pragma GCC poison TARGET_HEXAGON
 #pragma GCC poison TARGET_HPPA
 #pragma GCC poison TARGET_LM32
 #pragma GCC poison TARGET_M68K
@@ -73,6 +74,7 @@
 #pragma GCC poison CONFIG_CRIS_DIS
 #pragma GCC poison CONFIG_HPPA_DIS
 #pragma GCC poison CONFIG_I386_DIS
+#pragma GCC poison CONFIG_HEXAGON_DIS
 #pragma GCC poison CONFIG_LM32_DIS
 #pragma GCC poison CONFIG_M68K_DIS
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
-- 
2.26.2


