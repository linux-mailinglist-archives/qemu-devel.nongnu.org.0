Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83676A13AA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:19:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKrI-00009a-5z; Thu, 23 Feb 2023 18:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKrF-00008L-Su
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:37 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKrE-0000Vt-CR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t15so12351386wrz.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MU+ruNFcMxjYNRIZZwSLh+qUkPoKgiT+z5IyxNl3xk0=;
 b=pkpnpdSaNx/9vRw7tB+m1weBupRcTLPhaBTE8t5BLaNAqRnJYH5YBmcTzyxMTxtbpi
 opyHGmasbSASO03fqOHPiCQJPTOcFYcnYld/FG3H5I8MSKZzXL7jZDqhjgls8797hyrn
 EPhPyjkaEgo4Tp1ICkFwK5VYfllSEybQ7H4KKq57YnpSmsZdE5Fq4SFHauAgL7DF2Z+Y
 ooLRWlNFk0o7yPfgHuSTogofdGXEqJfIXNSZoPsXUiZd/yanEVTzd94OjooAFQj5ULqL
 xOjZqHv/1jM5z63w0ELnt4WkvWZzquVzBwpnlhgBOkpUf5vsoQHbmeW+2mRDp0zqTlbk
 BY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MU+ruNFcMxjYNRIZZwSLh+qUkPoKgiT+z5IyxNl3xk0=;
 b=k4Dh8oIkvCRHyhUS0XE4iV+J50zEHdkx94OcORM+pMHaxjnktuidtzG+4XkALjt13s
 0RFpGNeWYF000gqyBsVrYAMQohubmbTdjmRT6DZ1SfLyEmKiXP2JFSaYp9HfosjbiTFJ
 VKqBS3VuEbeuGCcmqevvQU3S4Z/PdmD1VLCJc9RMme28/jh/XsHQfINwDf0VEca90F3Z
 +EgSFe/68UwqlSUcP7bSPpzsP2sehUez9hfb0XDAPbxMBkAASOZ8sJfnlYeVflLVw/kG
 FDnJCtOYFCWy4c/8Z4OSm/v6vy2aq5uYXd71h36QLit+78h5F8fSlerRhCIAyKY3bycM
 bJQg==
X-Gm-Message-State: AO0yUKXuJUkGdaPMYdTELai5N34kdGUM/VPhmI+S0O2WuBiVohjjc/tm
 PAEsjLuFuXZzinkb4pK2Q+N1bLYKfhknNp/n
X-Google-Smtp-Source: AK7set+qMAzSVqNbxdDgg96+aO0d+LuSzOLTYjKlgsVIRPNauwIr0PdT2VfcDpe0gIkfX1GOyFvlpg==
X-Received: by 2002:adf:f292:0:b0:2c7:1b4b:d729 with SMTP id
 k18-20020adff292000000b002c71b4bd729mr553600wro.65.1677194315410; 
 Thu, 23 Feb 2023 15:18:35 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1c6a05000000b003dfe5190376sm715100wmc.35.2023.02.23.15.18.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 15:18:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 7/7] dump: Rename x86-specific file as win_dump_x86.c
Date: Fri, 24 Feb 2023 00:17:55 +0100
Message-Id: <20230223231755.81633-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223231755.81633-1-philmd@linaro.org>
References: <20230223231755.81633-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

win_dump.c is x86 specific. Rename it as such in case
someone is willing to add win_dump-aarch64 :)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/meson.build                    | 2 +-
 dump/{win_dump.c => win_dump-x86.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename dump/{win_dump.c => win_dump-x86.c} (99%)

diff --git a/dump/meson.build b/dump/meson.build
index 6ae07e6fed..d899949a73 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -2,5 +2,5 @@ softmmu_ss.add(files('dump-hmp-cmds.c'))
 
 softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'],
-                if_true: files('win_dump.c'),
+                if_true: files('win_dump-x86.c'),
                 if_false: files('win_dump-stub.c'))
diff --git a/dump/win_dump.c b/dump/win_dump-x86.c
similarity index 99%
rename from dump/win_dump.c
rename to dump/win_dump-x86.c
index ffeef4b738..5ee9a1d764 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump-x86.c
@@ -1,5 +1,5 @@
 /*
- * Windows crashdump
+ * Windows crashdump for x86 targets
  *
  * Copyright (c) 2018 Virtuozzo International GmbH
  *
-- 
2.38.1


