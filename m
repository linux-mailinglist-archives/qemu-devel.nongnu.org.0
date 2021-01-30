Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE362309171
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 03:05:54 +0100 (CET)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fe5-0004Sg-UR
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 21:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fS1-00080Q-FM; Fri, 29 Jan 2021 20:53:27 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fS0-0000GN-0p; Fri, 29 Jan 2021 20:53:25 -0500
Received: by mail-wm1-x331.google.com with SMTP id m1so5253867wml.2;
 Fri, 29 Jan 2021 17:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
 b=S8gP7rmCHgjQ7YTM/ADW7lbRknMIzFi/kvGjnDTBiXVwxuHAweAduqVLnoWGJLI2Ik
 JfdEKMmuSM3Uo8wpGPc7O5efkIfwempgLB5LYyAxcpbOduzxSzOy25mGYctn0157CNuf
 zV0ZhHXDZP2UT03nYTizMXR4Vs40tQPbvbnOmuxLCvtPCrY0PMsdGMwTdM2ArhKkBchH
 TWyvRrzcqLAWdaanShYSz+sOqcrd7NvfsPGFpWW+5oIunY8vE5ZXCX2iLvPjoaAaSoPR
 DrMJQdIPKVgaAINimQlPBxGcMGIfkres1tY3aYap3kkTCgMibqAulTso5blHDtdlfoUu
 cwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
 b=Ca5/CC1lJtVxGo0MmmRz/WHaYmzBiMzk4p+P0GVBfWir0RSp3JHvszRMM3p9IID1Pw
 1qz1EGsP5Hyhq7YsMUsSePeO6TyP0ukuH2kB0D3PLqiJbLRCScsZAuGmNPAY+7B9vDgW
 FwyxOojLIQ6aeqkeJVIYAz3QnsxnjD8T/096CyvJEP4JvNDnUMKCTXxidEI+7Dwr+5Hp
 wI/9eL/ci/PJHQYW7thD6cC1fpHNWa3nRgwIsW3wMeW3d+oCYDEWKfV+ASJJdOeyRH6d
 dM0Wl+3aFSnK/UCuuayod5GIjCI+pM0BMuR/ToYFUgLkMMr60gRPdngSd+PgdzMb0xlh
 3vjQ==
X-Gm-Message-State: AOAM531W0qda1TF9AuX9Z9WL8i8FextQYyyHxbHslrVdNa1tThh2s6P/
 PMHlWDJBxmW+ASaMXxTvt81QcvM2Hgg=
X-Google-Smtp-Source: ABdhPJyiwfRfgUFvof6J96IEb3nlU6yPh2kst4/42gIlUzuKzVr51L9y/LCynY6WSCm+1mWXoo7usg==
X-Received: by 2002:a05:600c:2204:: with SMTP id
 z4mr5915886wml.138.1611971601791; 
 Fri, 29 Jan 2021 17:53:21 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g1sm15181177wrq.30.2021.01.29.17.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:53:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/11] target/arm: Do not build TCG objects when TCG is off
Date: Sat, 30 Jan 2021 02:52:26 +0100
Message-Id: <20210130015227.4071332-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Samuel Ortiz <sameo@linux.intel.com>,
 kvm@vger.kernel.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
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


