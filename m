Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2E3CFE39
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:53:11 +0200 (CEST)
Received: from localhost ([::1]:47020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s3S-0003fh-JO
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rte-00010z-3V
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:43:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtc-0005VV-Ha
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1seFm9k4hBvj3dV8pqZnTfUxP5CfPuhkGJILwrP/ssI=;
 b=YZYuOYNUYfLFr4qCDNSsQfTuS6yVpKx2j+2g/G4pDZXXbGyVCsQviM9Z5qKKRafESbWBpW
 KuxJhODAY3NkqbtlDoLIWD+RO+JMkc7Cg/Ouy//j9M5Y8gUycAhHpN3C7e7f0NbyqZLv6W
 Kf3HVUzY/vUIM+xaZiZWB4txBiih2wg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-_UNgKfvjNsKR-CjHgl8VrA-1; Tue, 20 Jul 2021 11:42:58 -0400
X-MC-Unique: _UNgKfvjNsKR-CjHgl8VrA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m4-20020adffa040000b02901404c442853so10480256wrr.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1seFm9k4hBvj3dV8pqZnTfUxP5CfPuhkGJILwrP/ssI=;
 b=TFBiTMzdhHwslmin/oHk7wFrm5mlVvXmDfa09O9ebhf+RpDeWKN6kA0pmbxNiPEZNn
 DmL9ovFRBInwsz1B5x4S1z62u8oa3g4Cln3tEXvZ59Q8Jum4zmFwE2QCdlmNPOxf2fMM
 NSfYRoo72Ac1bBaKTvXN9BkrpvxLWmlOB8crd1+j6HEZmMaf3CDOWwyRKcCKI/7ptZnK
 kiNp26edkMfjdSMh6fo6GBSTSDnQUG5Oo4+ZyfCxwpi3yJMGP4+axymHjnRYgeqJtLxM
 tzn4rg54noyndfnaNwoGaKhrV6bNpgBn0HBDjeD3nZadgO8ow7jwrPPBWems8ylrho1N
 g+KQ==
X-Gm-Message-State: AOAM533lF49Ko2FpZmOFoRyna7+4gYIXeq/A0jqv2za1GI41vu8Brlmz
 azIYy0Ev0XLmKbd0UwxElZ9j0mmK/05P7AeeRvn9oAZjGM1GR3/obuoQJJZbXolGuEbGBgnvVgh
 xTXflPKmzUVQkvGKplge9G64SALn3DbfY8pEw4PqBcSrjKHF5aSwAQKoXrmBOByLD
X-Received: by 2002:a7b:c1c2:: with SMTP id a2mr31004369wmj.15.1626795776985; 
 Tue, 20 Jul 2021 08:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG8A/XIMJ/ADxcZWxG6BmwhT7HbRSF0XnnTa9EQN3+kJrwgloCRWG+TVsgwAmnsTguRjXUjA==
X-Received: by 2002:a7b:c1c2:: with SMTP id a2mr31004345wmj.15.1626795776755; 
 Tue, 20 Jul 2021 08:42:56 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 g138sm24019610wmg.32.2021.07.20.08.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/17] hw/tricore: fix inclusion of tricore_testboard
Date: Tue, 20 Jul 2021 17:41:41 +0200
Message-Id: <20210720154141.3919817-18-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Because commit f4063f9c319e39 ("meson: Introduce target-specific
Kconfig") ended being merged after commit 582079c9d27fc8cfff9f49
("hw/tricore: Add testdevice for tests in tests/tcg/"), we
inadvertently added a symbol clash causing the build not to include
the testboard needed for check-tcg.

Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210720114057.32053-2-alex.bennee@linaro.org>
[PMD: Updated description mentioning commits merged]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configs/devices/tricore-softmmu/default.mak | 1 +
 hw/tricore/Kconfig                          | 3 +--
 hw/tricore/meson.build                      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/devices/tricore-softmmu/default.mak b/configs/devices/tricore-softmmu/default.mak
index 5cc91cebce7..cb8fc286eb2 100644
--- a/configs/devices/tricore-softmmu/default.mak
+++ b/configs/devices/tricore-softmmu/default.mak
@@ -1 +1,2 @@
+CONFIG_TRICORE_TESTBOARD=y
 CONFIG_TRIBOARD=y
diff --git a/hw/tricore/Kconfig b/hw/tricore/Kconfig
index 506e6183c17..33c1e852c33 100644
--- a/hw/tricore/Kconfig
+++ b/hw/tricore/Kconfig
@@ -1,9 +1,8 @@
-config TRICORE
+config TRICORE_TESTBOARD
     bool
 
 config TRIBOARD
     bool
-    select TRICORE
     select TC27X_SOC
 
 config TC27X_SOC
diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
index 47e36bb0778..7e3585daf8f 100644
--- a/hw/tricore/meson.build
+++ b/hw/tricore/meson.build
@@ -1,6 +1,6 @@
 tricore_ss = ss.source_set()
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testdevice.c'))
+tricore_ss.add(when: 'CONFIG_TRICORE_TESTBOARD', if_true: files('tricore_testboard.c'))
+tricore_ss.add(when: 'CONFIG_TRICORE_TESTBOARD', if_true: files('tricore_testdevice.c'))
 tricore_ss.add(when: 'CONFIG_TRIBOARD', if_true: files('triboard.c'))
 tricore_ss.add(when: 'CONFIG_TC27X_SOC', if_true: files('tc27x_soc.c'))
 
-- 
2.31.1


