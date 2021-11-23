Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF345AA89
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:49:33 +0100 (CET)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZvA-0002hr-Iu
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:49:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkT-0004pT-6T
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:29 -0500
Received: from [2a00:1450:4864:20::42a] (port=41487
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkR-00052J-QT
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:28 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a9so40276003wrr.8
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EG4DMUGXVEyZNv1Q4b/NktcGLb+o4TMJ3Kcuz4Efvk0=;
 b=VmB3ArHRas2JsubwzWGCImBIQHihsJKdV4h4a6Tw7prAar7RzvHEkVr18HXMIToOgk
 pZggtwS+EJpbtuAU2Hz/SCE2hLAv/9hrLUa4G16pvycuihkPqRfUqNFI1ZvCVhCJDNrg
 PotuyUUgn1ADWiquV9aBuk0SDPlAB7J/4+CKqAvUpDNo550aSTMWuNoa3nMGaiSWnPTT
 lteG9r+CfmwuSQLHOtMGtIoD3MqcG3gJZiSg8a1qXnNzv1NdImuHl67a80Ztg986G4eP
 nDHiG4yTDNPRS/6BK3bXLcP+MQVnT1P2N8ychLXfeoojIsyViTNX7K+jIXjKsPVzo3hB
 1f8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EG4DMUGXVEyZNv1Q4b/NktcGLb+o4TMJ3Kcuz4Efvk0=;
 b=HHThhQqyiFihKngKIJkuxtJMHK05VW5kZhOaICcLtSETlTgEWFHw5S1V6F0lMqVD6A
 IRhh01paRNPBwfkR7n48vGuOSqMoXf0aLEYGvyKCiwSC2kBdiDIpFwd1k/ysXW/SrcHi
 oYfHkBQRafUYY0eF8OEUREBMehtas6K6omKSEB2GU3GS7ozU9/S0rsLI0MApj3nPOVMj
 1JkXWyzLRx8m5VonRNLBHhjbLSFmFS/p8/aHCB0f9Rx28UJxcbJ9REOMl9abuBBDLV47
 nlNCmDq+EMWR+vCPwZYMZnJPxYNBOn8uDlLd9XMvHqh88z5pyG0K+k10W8QRDL0GfOoC
 WI1Q==
X-Gm-Message-State: AOAM533oNl7AnrwPpNS/9nCX3CCqnZRIfjAz77j4mT2r/I3lSj6ZLUA0
 mEHzoR0glP+3mM6o8NLTpR1oplrVS8NfOOtq35o=
X-Google-Smtp-Source: ABdhPJxn72u8wECnVCOUIJ3DA84zE4AtnUyHm+HH4iObUbcFffl/jYoKk4FB3Y3m+bRgKg18ccT4FQ==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr9324459wrq.120.1637689106475; 
 Tue, 23 Nov 2021 09:38:26 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/16] meson: Move bsd_user_ss to bsd-user/
Date: Tue, 23 Nov 2021 18:37:59 +0100
Message-Id: <20211123173759.1383510-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have no need to reference bsd_user_ss outside of bsd-user.
Go ahead and merge it directly into specific_ss.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build          | 3 ---
 bsd-user/meson.build | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index bf7af382de..e425129011 100644
--- a/meson.build
+++ b/meson.build
@@ -2363,7 +2363,6 @@ genh += hxdep
 authz_ss = ss.source_set()
 blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
-bsd_user_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
 common_user_ss = ss.source_set()
@@ -2618,8 +2617,6 @@ subdir('common-user')
 subdir('bsd-user')
 subdir('linux-user')
 
-specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-
 common_user_ss = common_user_ss.apply(config_all, strict: false)
 common_user = static_library('common-user',
                              sources: common_user_ss.sources(),
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 25c3976ead..9fcb80c3fa 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -2,6 +2,8 @@ if not have_bsd_user
    subdir_done()
 endif
 
+bsd_user_ss = ss.source_set()
+
 common_user_inc += include_directories('.')
 
 bsd_user_ss.add(files(
@@ -17,3 +19,5 @@ bsd_user_ss.add(files(
 
 # Pull in the OS-specific build glue, if any
 subdir(targetos)
+
+specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-- 
2.25.1


