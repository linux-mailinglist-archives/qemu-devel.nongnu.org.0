Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244844BDC3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:26:32 +0100 (CET)
Received: from localhost ([::1]:41742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkjsF-0007z6-2O
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:26:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mkjqm-00063M-I5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:25:00 -0500
Received: from [2a00:1450:4864:20::532] (port=36725
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mkjqj-0003Wd-Uw
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:25:00 -0500
Received: by mail-ed1-x532.google.com with SMTP id o8so7953193edc.3
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7LLTWN9UgDvyvjcHOuDv4ZDvA2WxP/GAzVMDqAZ3/nw=;
 b=CbC2Kx/Kr5WA+bcYVij+eWVVmxKNIawUw8H8Ba1Btod+Rs5jxcU8wMFMMBnTbYEP7Y
 +3a7I5VKRRnAFnm0dG8dHd6JBM8B/24O+JtEszmiGTo46qo/mBEyftMo8r8drN1/Bpnp
 SsJfZsMdNXcZoquaruLWdYexk2/V1obVOMC2IZF/IrqCc67IqPCkFR9bo9WHKGlvhm+e
 SCGVg5K8+ev5rPzwCOBKooq+uudQo5W3OJ7OHWlt9fGHJ2/RuvYfobW2cpHVMdsH1n9l
 Tb4xdZgfRW5X609bm4eY/SXuSuPgkq5J1RbLLvMJ+sG1j6QDvyZ5zg9FFYXvISj+GKN8
 41+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7LLTWN9UgDvyvjcHOuDv4ZDvA2WxP/GAzVMDqAZ3/nw=;
 b=Qfr8I5MI/4dYNi2yom/DCQ6dvyuN4ipbhV9D5KW6QOrgrSCc3hbp1t3SvPLJF7K5P9
 o9DNN7qmivb13dPLGGuAZLKq5ox/Halc3hwTZxlUqhWwJkxAb4tctqRQSwj9IukhrVk+
 UDOQbp+G631OcqzEXBbBjZIQnoTV7kJPmBS6PYT4pH6y4pqtZ/oXHbRPQo2dKdbNTejA
 ItVM7NOViPGZHpTCfle0COINH8FDufmkMa9lWKS16tiQXzxjXvoK4J6OcVhv5nmL3AMb
 BCUzT+6IZ5Ml01BicBqYdau5vCMQWquSmYJG+8OoYhwkVpT4mZtrAnJ5DeaYJRg/v0ps
 BrjA==
X-Gm-Message-State: AOAM530ZnRQqUWClv7Bb1ylzOlEJEHZTs1Dds+bQ5y4WyLYYXMUXxG+S
 wnEWnFimfgLQTPZpw/frv9y0gQgxZBI=
X-Google-Smtp-Source: ABdhPJxX5JnQqNTl7KcR05WhFHUcl68AIWNyl97RIRc2R42miTPfth7E4o/1bQS3u3wv5DuvQjZPEA==
X-Received: by 2002:a17:906:7304:: with SMTP id
 di4mr18182001ejc.474.1636536296618; 
 Wed, 10 Nov 2021 01:24:56 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id v10sm12054060edt.24.2021.11.10.01.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 01:24:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: remove useless libdl test
Date: Wed, 10 Nov 2021 10:24:54 +0100
Message-Id: <20211110092454.30916-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dlopen is never used after it is sought via cc.find_library, because
plugins use gmodule instead; remove the test.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/meson.build | 2 +-
 meson.build           | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 137a1a44cc..7a0a79d731 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -10,7 +10,7 @@ tcg_ss.add(files(
 ))
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
-tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c'), libdl])
+tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
diff --git a/meson.build b/meson.build
index d714ebdb37..06ab63625e 100644
--- a/meson.build
+++ b/meson.build
@@ -566,13 +566,7 @@ endif
 spice_headers = spice.partial_dependency(compile_args: true, includes: true)
 
 rt = cc.find_library('rt', required: false)
-libdl = not_found
-if 'CONFIG_PLUGIN' in config_host
-  libdl = cc.find_library('dl', required: false)
-  if not cc.has_function('dlopen', dependencies: libdl)
-    error('dlopen not found')
-  endif
-endif
+
 libiscsi = not_found
 if not get_option('libiscsi').auto() or have_block
   libiscsi = dependency('libiscsi', version: '>=1.9.0',
-- 
2.33.1


