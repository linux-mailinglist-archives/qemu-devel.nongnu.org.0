Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176E489BC4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:05:05 +0100 (CET)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wEK-00012u-0Y
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:05:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqt-0001vs-Jy
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:51 -0500
Received: from [2a00:1450:4864:20::535] (port=37733
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqo-0000Sa-Rz
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:48 -0500
Received: by mail-ed1-x535.google.com with SMTP id o6so54496494edc.4
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qU88x7OCGbAXGQHVucos0yBbnx+ISBbawYTCCn29Sk8=;
 b=ASufLHP7AdVfYvm4LxgmBtx1BdhYYVtnnz9r15dRExE39ihcs7HRkH4mD5XxhJdCRW
 RU+sobn2ea9iQqiLqCIWDIlQlYqwOECWkTVQzfbyD/tU3avf0A3le75qfIYMlV9tf0r1
 RgtMkF4FgkUz6n1RnWi92HmCK17MmC30fay3KD78fvKDNkov1Jfr3KeFnFrLzR4dazjL
 wuiw45tq20vHsZzYkOSd2ZPFymMR0nyNyhRJClCQmMUw4UIGcaIACdrm2Fw2tH/RK9SX
 DbEMisFjAbGjdJRvj0I2y6Rj1TgM6COoZpVSohkZ7Mp/hoPFCWahyxlYn+f+Ybv99kMn
 MzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qU88x7OCGbAXGQHVucos0yBbnx+ISBbawYTCCn29Sk8=;
 b=ST3zDarwGWD7GTiwlRD3a/yzThPc+EzQIFeeMiHGYDjkaVdHwk9WttL6OLWqeX0Ef8
 /LP5+sNGZjNvKSNH2aRQCizhFkeOw+CXsK6MiKyqGewiWwHMo4+E3o0C7HWdAJ/fEKNT
 N9roGbyHPWfuSMRFo4BxX8s7x80jYjB0hEQybXnxOIW1Gwbpm1rOK3ZvPq7WxvDfBFRA
 8wMc/tUwwVk99RA3Qy+izfaJSuuby7A6V1Fxx+LfMm97OECSsZInJw+RIcY6NWORuzmu
 stKKCrbSR2u/uT0kUvByBhLSwFC3wBCmWg8sr7/HaD5wcfLhAxSeGerzsGN24J4IT3Qy
 XxGg==
X-Gm-Message-State: AOAM532tgRJj48a3ilhXGlWMkWvufjl/8x9YMLx58gFGFHNKir+El0bC
 D/04S7IPIGx278YUhmgD+dfWHD4twXY=
X-Google-Smtp-Source: ABdhPJwKhexQJTeEYNAg5x/oZFSzvXhGzHTOomrPEgrdybrvRNSva7aYc4GeLs/JP/OwOyKIml7q3g==
X-Received: by 2002:a05:6402:3584:: with SMTP id
 y4mr4341772edc.232.1641825644374; 
 Mon, 10 Jan 2022 06:40:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/18] meson: cleanup common-user/ build
Date: Mon, 10 Jan 2022 15:40:19 +0100
Message-Id: <20220110144034.67410-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not necessary to have a separate static_library just for common_user
files; using the one that already covers the rest of common_ss is enough
unless you need to reuse some source files between emulators and tests.
Just place common files for all user-mode emulators in common_ss,
similar to what is already done for softmmu_ss in full system emulators.

The only disadvantage is that the include_directories under bsd-user/include/
and linux-user/include/ are now enabled for all targets rather than only
user mode emulators.  This however is not different from how include/sysemu/
is available when building user mode emulators.

Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 common-user/meson.build |  2 +-
 meson.build             | 13 +------------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/common-user/meson.build b/common-user/meson.build
index 5cb42bc664..26212dda5c 100644
--- a/common-user/meson.build
+++ b/common-user/meson.build
@@ -1,6 +1,6 @@
 common_user_inc += include_directories('host/' / host_arch)
 
-common_user_ss.add(files(
+user_ss.add(files(
   'safe-syscall.S',
   'safe-syscall-error.c',
 ))
diff --git a/meson.build b/meson.build
index de111d6fa1..5f0b6300b4 100644
--- a/meson.build
+++ b/meson.build
@@ -2399,7 +2399,6 @@ blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
-common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
@@ -2651,17 +2650,6 @@ subdir('common-user')
 subdir('bsd-user')
 subdir('linux-user')
 
-common_user_ss = common_user_ss.apply(config_all, strict: false)
-common_user = static_library('common-user',
-                             sources: common_user_ss.sources(),
-                             dependencies: common_user_ss.dependencies(),
-                             include_directories: common_user_inc,
-                             name_suffix: 'fa',
-                             build_by_default: false)
-common_user = declare_dependency(link_with: common_user)
-
-user_ss.add(common_user)
-
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
@@ -2879,6 +2867,7 @@ common_all = common_ss.apply(config_all, strict: false)
 common_all = static_library('common',
                             build_by_default: false,
                             sources: common_all.sources() + genh,
+                            include_directories: common_user_inc,
                             implicit_include_directories: false,
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')
-- 
2.33.1



