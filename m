Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D079D47F4CC
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 01:16:58 +0100 (CET)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1HDd-0006fM-CP
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 19:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1HCW-0005yu-7K
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 19:15:48 -0500
Received: from [2a00:1450:4864:20::52e] (port=35439
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1HCU-0001le-M1
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 19:15:47 -0500
Received: by mail-ed1-x52e.google.com with SMTP id y22so46912985edq.2
 for <qemu-devel@nongnu.org>; Sat, 25 Dec 2021 16:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XXNJQWkHzAXVVhXM5Ss3pMhuUSDY9ZmuPr81h1v/+7s=;
 b=lIQL0v4Uxk09tJ+Jovw9ClfjZLn5BLgK8pMeOjsPw0OKVoiSyiyH0y0hNxzWE9lcoi
 +oZVNIVb0+WMFSVjXaF9KD1br0Y8b9qyHLw4E8WcSf99LTR/sVlHS3mvmPLToX/Rd7r/
 vR7jp72elbaoo5s7Y74Z3+VhjPvrSdVfX0QU+wZiQJiBohO+A/aqeUY6d+fIU0NYmL6F
 r5ADVfOhFZt8pdEHPPizLBMJsUjpg+iiyMEfHu49UrSxPZa2xoZPCWHf/ltle9B+NL+8
 V4DRKEwTi1PE6EbB4DKj6+t0LSecGmPz97GvbsQ6gBRSJYGg89oTBeAWldsB7uEdjKPv
 tquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XXNJQWkHzAXVVhXM5Ss3pMhuUSDY9ZmuPr81h1v/+7s=;
 b=b87l0ROdEOf+5Q09cViQnzsU/M6jnFjDyJyxjD0EvX+jbuZaI+QnBh+n4WDWgbLNFK
 4fRiIjYvvO9OuXRQWNkQ1O8+VFaoHZW40z59vFwoIR8BtMK9qDlHlGJLmX/LnFZFF1ct
 eje/fa70+hqv1YDRkaTVveth7vpvkYbhSqEeyc1OGS0M6CMPZEyRAlHG121HAHm/ZtQL
 LtoFOSsNjHOUmTTJO9KnelJD1Q7nffjiUiBY4mWmsYA29JypHFPMAc9ZPSnHEn/n2oSr
 lCTQmCcTBZyn+5TSZlHsYCe9Y9lMWytMNRzdforte25ZwklC5fUPjgd7901QP5aW8MPB
 hi/Q==
X-Gm-Message-State: AOAM5320fWAEwrBKJmmB/YgUQHwCzp5Y3cUCCilQLXznnGmM2El9xwFr
 nYpDYA7gr08E494Go0G/dBcJ0tvA4Wn/+g==
X-Google-Smtp-Source: ABdhPJzUv283+tdIIX3JEpp3lGyJE7wqS1KiEoqdnU7M5WuwFpAOfXFgQfsPhgGOw2NbMcc+3tqrUA==
X-Received: by 2002:a05:6402:26d3:: with SMTP id
 x19mr10977697edd.35.1640477744801; 
 Sat, 25 Dec 2021 16:15:44 -0800 (PST)
Received: from x1w.redhat.com (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id oz31sm3809221ejc.35.2021.12.25.16.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 16:15:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: Fix target-specific Makefile variables path for
 user-mode
Date: Sun, 26 Dec 2021 01:15:41 +0100
Message-Id: <20211226001541.3807919-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 812b31d3f91 refactor missed to update this path.

Fixes: 812b31d3f91 ("configs: rename default-configs to configs and reorganise")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 63cf1b2573f..2d6ec70156e 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -33,7 +33,7 @@ all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
 ifeq ($(CONFIG_USER_ONLY),y)
--include $(SRC_PATH)/default-configs/targets/$(TARGET).mak
+-include $(SRC_PATH)/configs/targets/$(TARGET)/default.mak
 endif
 
 # for including , in command strings
-- 
2.33.1


