Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161FD47E2BE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:56:34 +0100 (CET)
Received: from localhost ([::1]:49922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mi0-0004H7-RE
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdJ-0004Hj-W9
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:45 -0500
Received: from [2a00:1450:4864:20::432] (port=34746
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdH-0008Oa-JN
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:41 -0500
Received: by mail-wr1-x432.google.com with SMTP id s1so11008235wrg.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ogRjYWYAou3o09X8Bc73cvf2JYVG5TqbPazpTT+XBgE=;
 b=FATWLlisAC9pofBLxv7odWrHW/yw/YR3yZaGVMadXw+P5XwSNfeXOQ84CmnOywPlPU
 TIICOlHEKrtA3dZck5otrNg+J+LO2IyKwaS0KSLny5ZXz2jyJ8L0BMcDcX3j0TifJmeh
 +fh5JbcdlvZUm38cFURJkRnrL9T/18K0WVHDDDrIhsFSSUpodaTpKTwN72TZzbM9s61j
 mKZpW6DZRt/VShFRTi4FYadFd+lEGQQcCfjeNeBr1zKUaykVcJ5HJOyvstKNrDew0RR5
 ZnLe/iXUxa5ajSv2Zf28icubtA3g+xtn1bF6FpFJDFbkUYq/kVbsGDeIUQRMPYTcH+mc
 KLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ogRjYWYAou3o09X8Bc73cvf2JYVG5TqbPazpTT+XBgE=;
 b=ZVpsHAIVSSgNWyUv6Nw0LoE/Ky0jh/Z9RgPfS8VBFY9XznxORsCkBtGpZ2ztVdlF93
 a28e3oge2t4fyl0wRDXtdQuY3sxvGFpFc74PT3AHPRjndiP/HEDUnHSVqJfCWyoqefSX
 2XRKd/f7UhM7RQ+TrEnXKDw33xBC0LIsqzckdX6+4PH6qdumoSPpYh3hmOTX1XmmLMJB
 nIEzZHJUdpBjz7lr6yryVOdruQncZlw7Wh1pJB28oFhpdDj3oyGOsvoPqXCT+9OaWhIN
 7cEoN7GVdhvShCAN95HZIPvzSSfK3JO0u6LbiLqu6TLMoEm3xRm/YCvUfX2T+taWEyBg
 CP1Q==
X-Gm-Message-State: AOAM530X+VEhjjiMPUj5Pbxp5NdoK8i/MDfgW/yWaT0i8KxGiw0O8EnA
 6VG3eN0gWL3BatN30uoVsCGXXC3ed38=
X-Google-Smtp-Source: ABdhPJyCIVgPzzJe8InQJwZRQUfxYpFBxPvXUEHl+dl+Y+VOheK2xuZ8YYjD6ID/vSOUBFtx4jRPOg==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr1501898wrp.351.1640260298379; 
 Thu, 23 Dec 2021 03:51:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] meson: cleanup common-user/ build
Date: Thu, 23 Dec 2021 12:51:23 +0100
Message-Id: <20211223115134.579235-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
index b0af02b805..879628ab68 100644
--- a/meson.build
+++ b/meson.build
@@ -2377,7 +2377,6 @@ blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
-common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
@@ -2629,17 +2628,6 @@ subdir('common-user')
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
@@ -2857,6 +2845,7 @@ common_all = common_ss.apply(config_all, strict: false)
 common_all = static_library('common',
                             build_by_default: false,
                             sources: common_all.sources() + genh,
+                            include_directories: common_user_inc,
                             implicit_include_directories: false,
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')
-- 
2.33.1



