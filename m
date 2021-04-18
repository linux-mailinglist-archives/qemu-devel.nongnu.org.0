Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8298C3636BA
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:46:09 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAYi-0006KW-IU
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALF-00039u-E3
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALD-0004YC-UG
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so31517405wrr.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Sr8nTDroetZqZndBjXDWbbfb5wBJI092fFAFOodnfE=;
 b=uKpQbqHNOHJjqvNkvrLIFC4qAC22q0eTLb4fJtYTyc0H0dgJ72+RtpPqmItWnU6Zok
 v3txRWk09w3n1So0D90yDaOszK/u5f61lOxPNBzVQQ1UO9vROmukWj1t6m/8BaWJEg5j
 8qIm3FzF+ZkUZev74oQQWAYl406jKy22f+26np+sc0Y2usmhqP3ncxCiU+eJ67YP692T
 py/6EV59bg1BojKXWGHYhcwqj5uoBYEQVLhO4VGaGWRsbOfrg/hmJMM+NbIiIJuOB4VV
 tqznwehR8iDieYkteU/7rdecBlj6k5t4LHF2wEPFyUT4/MO9JrotMLkV+u6eRDPGggk+
 PLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/Sr8nTDroetZqZndBjXDWbbfb5wBJI092fFAFOodnfE=;
 b=ezvuyEGjEBrNxmtswrrVYE/iFIWeWBuWMOKeK4uKnqEKh5LuILfQxWnpZW86DckEzG
 juz3TFKR2vG7RfDD1Q8mXLlAjsFb1gfnwhrMldNlURMGRxDKOepln604O1MC5aJdDcv5
 fx6IGAskiB+RsL2ZzdkPtjj2e1yWjlPEDptrVdHoFK1+ZgLkANqTQUHZHHnG2h2cPVS0
 ZmZ3/kr2giPfNWBy6rDS7o3dU+JZgFClolVBKm8bcyOaWYBpIHDDsafbHeRhE/COk7Ma
 vaYL6qlPzyhphyfRh11lay8qdMnoDNVoYBBx1AFQp/O31iYgtkmQftcGOxD7A109fJJO
 mA4Q==
X-Gm-Message-State: AOAM53245F9Kyt0aTQUHzSeWdrrkV0T4EPisgLkUcKox9BrXzBXHEXNk
 P0FMfVxd9K9IbrvoLaAYisqlpt9BM4JzUQ==
X-Google-Smtp-Source: ABdhPJy7i46suQAUOOlD7i6Tc8DN1LQMeOtoG9YPtZUq+ByShKhREQhKx4Zdn3uXbPHSNAbZWd4zng==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr9898923wrs.204.1618763530489; 
 Sun, 18 Apr 2021 09:32:10 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f7sm16490729wrp.48.2021.04.18.09.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/26] meson: Introduce meson_user_arch source set for
 arch-specific user-mode
Date: Sun, 18 Apr 2021 18:31:15 +0200
Message-Id: <20210418163134.1133100-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the 'target_softmmu_arch' source set which allows
to restrict target-specific sources to system emulation, add
the equivalent 'meson_user_arch' set for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index d8bb1ec5aa9..1ffdc9e6c4e 100644
--- a/meson.build
+++ b/meson.build
@@ -1751,6 +1751,7 @@
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
+target_user_arch = {}
 
 ###############
 # Trace files #
@@ -2168,6 +2169,11 @@
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     qemu_target_name = 'qemu-' + target_name
+    if arch in target_user_arch
+      t = target_user_arch[arch].apply(config_target, strict: false)
+      arch_srcs += t.sources()
+      arch_deps += t.dependencies()
+    endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
-- 
2.26.3


