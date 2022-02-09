Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054CE4B0107
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:14:50 +0100 (CET)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHwAj-0007dQ-4A
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:14:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvyT-0004ik-Qs
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:02:09 -0500
Received: from [2607:f8b0:4864:20::634] (port=45893
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvyM-0003Dc-M8
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:02:08 -0500
Received: by mail-pl1-x634.google.com with SMTP id w20so233787plq.12
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7llCYmEtdzunbAQvJPeBYUb+uBMoKX2xk3BFF/zNgZs=;
 b=Bn3FQPR8yons6EvT97LjHdEEvP7sLz75A9c/P6Y7scwvM+y58c5aBrxX88IRq7T9OQ
 N57ViVcnLFr+8JFm3o92wUyTP2ZNrLTAcJTlVHBSNgzhx2Aaev5LW4gMzMpWYUdTkzXG
 xjut2em/jAMnbamBPYn5a9gMc6m8r3vHlnkR36s+rtgQwN+2jT0YNUIToh51Owz4CWtl
 RQVRzIPU9xU8keSSVxh9JFWL02g8Qy+WXNTYoD9TP/XJbNGQClybcAWDMltYGWF1qufX
 U6sVee6ktYwbE573FWLc4503UCqrhcKlU6SjUxObnIlQp4THSepmZQafdIdcta26CGmY
 TUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7llCYmEtdzunbAQvJPeBYUb+uBMoKX2xk3BFF/zNgZs=;
 b=FgO+7dUbbOcITysWcWR3DezerdXomDY65iTsPQ5bV9Hc8CKbYAXlAlj8RuLGhkYY4P
 GbIq0533PhfmtvINcMqafVmHcGRJPBWu3O2defgZ3D5erxkFx0n/XthLuOuv228zhhni
 VrQEQ3l5ZZYB8VvNMPQtU2YVNCQOy8a7ABySEXAZzu+SH/y9t2MqKaHT7iEesEyqNP99
 AzSFnAMBMXhbyxtBBtNlW5s9I2AyLw0HK7UuGnvsVTrgtL5gDzzFtDHz70gLZHi2q8Rt
 yvdPEyLCoFkAVN2XgyQjk22+H8ZqlTvUbAxcNr6ev0j4MCopd992S86yDy0P6qn85NdE
 gv5w==
X-Gm-Message-State: AOAM532vyn7nFEZlE+7xepxzmcbjs+rqkrLGKqJkUYS+KB2mADI2T/ys
 EuEZSO3TJFoxjXK5NmR1hPmZ7naYbRY=
X-Google-Smtp-Source: ABdhPJzGOhEJBlKtFj5zDcwvRnmOI1DLBylx22QGLuxcEvhIwQPd6VMvwaem3gNKA9Xkf4kr6cqLSg==
X-Received: by 2002:a17:90a:d343:: with SMTP id
 i3mr6108692pjx.104.1644447709623; 
 Wed, 09 Feb 2022 15:01:49 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q2sm14907780pgt.47.2022.02.09.15.01.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:01:49 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 9/9] user: Share preexit_cleanup() with linux and bsd
 implementations
Date: Thu, 10 Feb 2022 00:00:30 +0100
Message-Id: <20220209230030.93987-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

preexit_cleanup() is not Linux specific, move it to common-user/.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 {linux-user => common-user}/exit.c | 0
 common-user/meson.build            | 1 +
 linux-user/meson.build             | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename {linux-user => common-user}/exit.c (100%)

diff --git a/linux-user/exit.c b/common-user/exit.c
similarity index 100%
rename from linux-user/exit.c
rename to common-user/exit.c
diff --git a/common-user/meson.build b/common-user/meson.build
index 26212dda5c..7204f8bd61 100644
--- a/common-user/meson.build
+++ b/common-user/meson.build
@@ -1,6 +1,7 @@
 common_user_inc += include_directories('host/' / host_arch)
 
 user_ss.add(files(
+  'exit.c',
   'safe-syscall.S',
   'safe-syscall-error.c',
 ))
diff --git a/linux-user/meson.build b/linux-user/meson.build
index de4320af05..25756a2518 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -9,7 +9,6 @@ common_user_inc += include_directories('include')
 
 linux_user_ss.add(files(
   'elfload.c',
-  'exit.c',
   'fd-trans.c',
   'linuxload.c',
   'main.c',
-- 
2.34.1


