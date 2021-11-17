Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9075B454AC2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:15:56 +0100 (CET)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNbH-00041Z-LD
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:15:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQO-0000VH-Al
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:40 -0500
Received: from [2a00:1450:4864:20::333] (port=44620
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQM-00034W-Rn
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2506713wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+C1KzH3n3AYinXGQ8uyvLlpcpSps+ImD5AtGxkQR3Ok=;
 b=mfcQaHRMNZjyhnajgEM5vbJTySZgC8QpCz5igt8A29Htw3CGcOB/7+R3ll59QL4QxV
 O3Xog/DsAMGrsF1SLWNKb/Mk5bm07d9/fwIRFesN9t13evHQ5R3jeKTReqrn3mI86Dr7
 WRb2APUGlzQV/2FgBgYbxrY1jxWLA/DcTqlk8oG6ecWW7HwaxlPoqFSzCVNczIZ+WQFD
 m4Z8osHwonwf3mTMUGItreEK8wrxjU+YOwwDt1aVuugFaZLGUTOKmK6nBFVIplNog9fm
 MNtkpnbLFlto5qOJNjXGwOrXT39E3EAfjDWPLoa8sgCv8/elAj44uOy/qQq4aQ2IdE2d
 nuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+C1KzH3n3AYinXGQ8uyvLlpcpSps+ImD5AtGxkQR3Ok=;
 b=bA93aM1ZdmtMUNylp0ueLibewn+DOCa6exijwjO4T2g9YKUUq7Tl3D0Ppwrs+XURl/
 K4vQTTeqFy6ecIVEswIpwcKift9l0wDSnNPdm7l9v3S2j609eR1RwQSpkDXcpyDYwcI8
 O3NIqKcURfArHqCnAEBdULvz0BbeDlo0vNEMWV6+RAM97P6UCuzP3LYeVyYxJGHIq0Ud
 i472d5FoQvjO6jpW7eFgSgtmcWCs2kDdi2dhrKSv7W+NqvmRfjvs5QC40SnG2YMln/su
 tzJM2Z1FzCSbYmrhM3ZnjHrE2ZrHWocILYNaGliATVqXZJuIasrdJ+t8VEnSOvZ63YcF
 YBtA==
X-Gm-Message-State: AOAM533Mpb78TmiPshS6STJ/oM29s6Q8z890DVg9vxIMcj/xZJO3BoSV
 DFgx7xuEAU1nod2OTmjPH9srhRNoSB5K8/bbPqg=
X-Google-Smtp-Source: ABdhPJxV0kShUOGRIXZSOZ23UVPq2ODlbfueK7GxFxYKuorRVIZ5ppHozC8BnXD3DoLOPhvS57CSyQ==
X-Received: by 2002:a1c:a301:: with SMTP id m1mr904862wme.118.1637165077356;
 Wed, 17 Nov 2021 08:04:37 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/17] meson: Add build infrastructure for common-user
Date: Wed, 17 Nov 2021 17:04:08 +0100
Message-Id: <20211117160412.71563-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first objects to be added will be target-independent,
and so built once for the host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build             | 16 +++++++++++++++-
 bsd-user/meson.build    |  2 ++
 common-user/meson.build |  1 +
 linux-user/meson.build  |  3 +++
 4 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 common-user/meson.build

diff --git a/meson.build b/meson.build
index c58abf0d0d..387f7fe1c9 100644
--- a/meson.build
+++ b/meson.build
@@ -2359,6 +2359,7 @@ block_ss = ss.source_set()
 bsd_user_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
+common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
@@ -2603,15 +2604,28 @@ subdir('tcg')
 subdir('fpu')
 subdir('accel')
 subdir('plugins')
+subdir('ebpf')
+
+common_user_inc = []
+
+subdir('common-user')
 subdir('bsd-user')
 subdir('linux-user')
-subdir('ebpf')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
 linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
+common_user_ss = common_user_ss.apply(config_all, strict: false)
+common_user = static_library('common-user',
+                             sources: common_user_ss.sources(),
+                             dependencies: common_user_ss.dependencies(),
+                             include_directories: common_user_inc)
+common_user = declare_dependency(link_with: common_user)
+
+user_ss.add(common_user)
+
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 87885d91ed..25c3976ead 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -2,6 +2,8 @@ if not have_bsd_user
    subdir_done()
 endif
 
+common_user_inc += include_directories('.')
+
 bsd_user_ss.add(files(
   'bsdload.c',
   'elfload.c',
diff --git a/common-user/meson.build b/common-user/meson.build
new file mode 100644
index 0000000000..4f5c0f2f88
--- /dev/null
+++ b/common-user/meson.build
@@ -0,0 +1 @@
+common_user_inc += include_directories('host/' / config_host['ARCH'])
diff --git a/linux-user/meson.build b/linux-user/meson.build
index bf62c13e37..d6fa4f4d74 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -2,6 +2,9 @@ if not have_linux_user
    subdir_done()
 endif
 
+common_user_inc += include_directories('host/' / config_host['ARCH'])
+common_user_inc += include_directories('.')
+
 linux_user_ss.add(files(
   'elfload.c',
   'exit.c',
-- 
2.25.1


