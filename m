Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0827310F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 19:47:28 +0200 (CEST)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKPuQ-00054A-7y
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 13:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kKPon-000877-0v
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 13:41:37 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kKPod-0000Gz-AC
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 13:41:36 -0400
Received: by mail-pg1-x541.google.com with SMTP id l71so9676033pge.4
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uTrm0sdq7gARiBpxaC3cYgqckLUxE92nb3e9fV7DsLA=;
 b=jFLDZ5ATXaWvlzcXmV/xiQcxecmzsVuh+EuyF/7534wfuniNgqC7AfEH/1LCBv0uAI
 nwcQwj25X+tGTdlQjtIYcJgQgnY/0d7tr5X6oPSdutKJIQko6/MtQaRcCuIOePJVenWa
 6rgGTq3FfcziZgmiV0kt1uFVDQQMRKlKyHF+fetL4+IuzKHe/PjgU0zopCzUsu+uAUc9
 non6MHMmZT13jCo8kBzRcjcfl/uU3koDGl+/gKE1A9A5y/QvFKAgrjdPFQiG1kTFIF7r
 MaOcyWUzLpBZeCYU4izWBiHVoXWVBNjTqu4ZwtgOrso8knAjmpXfU/nsn9NwaG8ex2BD
 EJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uTrm0sdq7gARiBpxaC3cYgqckLUxE92nb3e9fV7DsLA=;
 b=HUOVdV1LVEHQTo78CeUwcYqQLgGEoChEaevJwMPj0XihI5UAmyR8R1vKb6yIAq+Udl
 6WBcDwu8vP5JqHkfNNlpqtyZwUZK1uM1aakcmcUyANfcXmpDjY5fyXayO2vMZwshmBWS
 sYZ2eqk+x8EAUVOub0bKmmhNI1UVOuBcnoGv4eYOV+6VjWXZ+M0y9f1oVq70gHVky/OS
 /ILDrh+XHz67y8r1RsXmJqS6Z8zSOWOZgRspoZykJRYBGd7RIElj1Bw6aKYyH9O9vId7
 veLQXPEcGrLLKzUjAXy4U4n8QPDP3KP96EqZqDTcvxoTFR7jhFXjRf1wFxOVp79gwXkC
 jMqg==
X-Gm-Message-State: AOAM531oVQiz5PqQRp1qgUD2OzuO58sCWkhf6rRxHwCljRAtiyN5t3yx
 Zp+djbcBtIja31ZRyRDWnmJPbogWBoa65g==
X-Google-Smtp-Source: ABdhPJyK70BxsOILtMf7FpeZBdTNVbvwiYGabIz8KA5FQFl1ib1r54jAac+F3M7J6dT0qjNx4S62oQ==
X-Received: by 2002:a17:902:fe88:b029:d2:2a16:254 with SMTP id
 x8-20020a170902fe88b02900d22a160254mr957689plm.23.1600710084094; 
 Mon, 21 Sep 2020 10:41:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x4sm12585379pfm.86.2020.09.21.10.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 10:41:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/11] capstone: Update to upstream "next" branch
Date: Mon, 21 Sep 2020 10:41:09 -0700
Message-Id: <20200921174118.39352-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921174118.39352-1-richard.henderson@linaro.org>
References: <20200921174118.39352-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This branch contains a number of improvements over master,
including making all of the disassembler data constant.

We are skipping past the 4.0 branchpoint, which changed
the location of the includes within the source directory.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 capstone    | 2 +-
 meson.build | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/capstone b/capstone
index 22ead3e0bf..f8b1b83301 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
+Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
diff --git a/meson.build b/meson.build
index f23273693d..4c92b43fe5 100644
--- a/meson.build
+++ b/meson.build
@@ -677,6 +677,7 @@ if capstone_opt == 'internal'
       'capstone/arch/X86/X86DisassemblerDecoder.c',
       'capstone/arch/X86/X86ATTInstPrinter.c',
       'capstone/arch/X86/X86IntelInstPrinter.c',
+      'capstone/arch/X86/X86InstPrinterCommon.c',
       'capstone/arch/X86/X86Mapping.c',
       'capstone/arch/X86/X86Module.c'
     )
@@ -701,7 +702,7 @@ if capstone_opt == 'internal'
                                c_args: capstone_cargs,
                                include_directories: 'capstone/include')
   capstone = declare_dependency(link_with: libcapstone,
-                                include_directories: 'capstone/include')
+                                include_directories: 'capstone/include/capstone')
 endif
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
 
-- 
2.25.1


