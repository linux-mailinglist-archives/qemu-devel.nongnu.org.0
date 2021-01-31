Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED362309BD7
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 13:06:47 +0100 (CET)
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BV8-0005Yi-Lb
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 07:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BGG-0002Qd-DO; Sun, 31 Jan 2021 06:51:25 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BGF-0005dB-0t; Sun, 31 Jan 2021 06:51:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c12so13511893wrc.7;
 Sun, 31 Jan 2021 03:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
 b=slxe/n+gWVTJ0YqCL3Bn1rdJcLxnKsXS1n7WF9oDy93hJBrTu2I3a2iCbMx2QDDRf6
 cvW4fsFH+RBNOH8Xizz/iAt4S26E5y/x/GNkhqNZmKoFK0IiYXFUyThdM4/jwqc/fgDh
 Y8sSf3tw+ovhP/bOMS00qPGcsrcwEr4MAVjaD4Adx0t14YzqI1NvnOJU9VgFgQeaG54O
 V+6f04a2Rwu6cmu95TNxszsXA3x1TBUu0rBat0w9gSOTxcp7PNPqNvAJyHXskdJMCaKx
 yFY9GcHTyxHSb+UJ+i+xVssw6kxrn3Nc/CZDLYpgrtE9kqvzklrUNMRkM1Y9GXFVF1zD
 r1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
 b=IwEIa9v4EqoLNPq/v0nDuNplk0V+9thwoHcd0oIpHMkDNTkjcpuxtKTfDorz6B+f24
 QKs/PHZ/bj7+vvTyopR3hRj45QuHY3Nrq1dQawkIO1FjZzXUsDM2767DjAc0J72u7oO6
 9M5Ik/Ue1EyIV/hfBM1MyOVc6PQhVsipUBZoQxqZFzWpasWr86tt6U2Q3Ljn3ReZIMMH
 TLoVRUKfD75xP547LX0BsiLtqypTj7w0tu+5mnCvqvm+6TMQpDHEoY9U+ZHdGTDoBb5V
 3i+RAi3tuvf0k/U1jKplWJj54VY3dRCHtWxRbeTtmvURq5YAaxo7FsvaxJ4URUb3bv9W
 VcQw==
X-Gm-Message-State: AOAM531ZGCoLVZNx9BTHAiK/v6GlUXDPJmsU3SMG4im2yhyMIXAFmBZq
 rn93I2WIa0PCiesPOIaEIN8vbsAtfKE=
X-Google-Smtp-Source: ABdhPJyhH4FzLWznIwV2JMINXQ8Kq1HB+Q7Ewfh1h/EdNga37TZknXhQRMlYya4ZrjBKEH1uV/ip3A==
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr13497246wrz.38.1612093880944; 
 Sun, 31 Jan 2021 03:51:20 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id h23sm17669371wmi.26.2021.01.31.03.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:51:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/11] target/arm: Do not build TCG objects when TCG is off
Date: Sun, 31 Jan 2021 12:50:21 +0100
Message-Id: <20210131115022.242570-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Samuel Ortiz <sameo@linux.intel.com>,
 kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Samuel Ortiz <sameo@linux.intel.com>

We can now safely turn all TCG dependent build off when CONFIG_TCG is
off. This allows building ARM binaries with --disable-tcg.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
[PMD: Heavily rebased during more than 2 years then finally rewritten]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index aac9a383a61..11b7c0e18fe 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -27,7 +27,8 @@
   'gdbstub64.c',
 ))
 
-arm_ss.add(files(
+arm_tcg_ss = ss.source_set()
+arm_tcg_ss.add(files(
   'crypto_helper.c',
   'debug_helper.c',
   'iwmmxt_helper.c',
@@ -38,12 +39,12 @@
   'vec_helper.c',
   'cpu_tcg.c',
 ))
-arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
+arm_tcg_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
 arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
 
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
-arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+arm_tcg_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'helper-a64.c',
   'mte_helper.c',
   'pauth_helper.c',
@@ -52,14 +53,16 @@
   'translate-sve.c',
 ))
 
+arm_ss.add_all(when: 'CONFIG_TCG', if_true: arm_tcg_ss)
+
 arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
 ))
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('psci.c'))
 
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.26.2


