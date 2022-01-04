Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB22484440
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:08:48 +0100 (CET)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lQd-0003Sy-FZ
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:08:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGK-0006v4-7y
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:08 -0500
Received: from [2a00:1450:4864:20::535] (port=41669
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGI-0004Qs-PF
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:07 -0500
Received: by mail-ed1-x535.google.com with SMTP id b13so149500791edd.8
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qU88x7OCGbAXGQHVucos0yBbnx+ISBbawYTCCn29Sk8=;
 b=NRBmkX11JCg0x2enOqRgf+rXUYu4nP6FcyE/JnKMteW/9ihgzfAdSWVqqsMKyJRMRL
 Sf8ZjYoZ0YYMfttU0QWNCUWQ1QNX5rCi1PvyTOyUUrQhzGf2KcQG8y9lR+/tu/mpgFVM
 bIRFOA5PG1cCs06GdRF/dfFyv31NCaaTKZpKImRtLmFLIh3btZL+Gj6yuisWxtvOGC5S
 OORnSocGrPSInqDP1q4bA1NsTawpqT5jto3cfZHt3jDryhGlZkbBq4fhZFzVU3bkl7md
 6QCVAK1okMfy3+kAlLyAerbO7IMjC2CKlg75jDAxAQ3GTXfzA3F+gNgHHtB4etR2sAz1
 KsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qU88x7OCGbAXGQHVucos0yBbnx+ISBbawYTCCn29Sk8=;
 b=Rbe8U1RivsdzJHvafHE+xJEojPM+Wx1rInplbEKDT3+9RtzXA4ulnS72EURfpONiRQ
 cHCjpOVTJUkxeMNNsKHHXu+oe/xbVAYC/kNDTBOLjpKD251YMH9vRj0MGlNm0zNOz36D
 NNh6BifLaP4i/R+1fzduwI0SM2Ps1K+VYCornUHfvVVnAahiBIYx+lcEwX6OukoEByS/
 A/36PxTzZ9D3PFhfOjaJEIOdHioI1s3FyZkG3f+1VUZrVx5+ubrmpnl1KUQUMD1YibY5
 /MQWuZBID+DX3i/OAXQaqWBqKFjfVDXpuRJZu8ffjqmEdRKMX+G62NDNQkZ3rTTgT0OB
 cmbA==
X-Gm-Message-State: AOAM532W9s3nbxPO1900hFCt2EKIzvk6e2k/i1Iy/JUgW90gIyl5FHdT
 ot04MYXJE83twPjqc2ASsQH5Z/56D74=
X-Google-Smtp-Source: ABdhPJxSChZwJTsF8u5cKN747xb36ha3Xc9iUvBsHou1yrthneZrKtBtr0i8Pmi3kV+wv7imNBxaWQ==
X-Received: by 2002:aa7:c1c1:: with SMTP id d1mr45631162edp.416.1641308285375; 
 Tue, 04 Jan 2022 06:58:05 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] meson: cleanup common-user/ build
Date: Tue,  4 Jan 2022 15:57:37 +0100
Message-Id: <20220104145749.417387-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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



