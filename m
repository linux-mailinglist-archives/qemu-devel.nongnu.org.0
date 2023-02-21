Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22469EB3D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUc15-0005Eo-7A; Tue, 21 Feb 2023 18:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0w-00059Y-Bv
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0t-0002aN-Kr
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:25:38 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k14-20020a05600c1c8e00b003e22107b7ccso287492wms.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7XCyvkdm6DP0Jui7XSb0+VPfOdaD+dTmIQzSrRKlao=;
 b=FUVVDitLHTx3NBH77U/HrfszCBCKJJBsnR54CItVnAdU+fEQU3Quk+FtVxBpcD4+Rr
 wj8zg4d17SDpB27uJ2hokLy/EvXeEGnaVs+99IWNN60gNLOtiL51/R6AmxsOmC/LvlWs
 CbGJdAu4GGAeHpQDhsQb6w7K2Zihr0G4ij0NuV7W7mcdy0r8dUv/dhITim7SfSfCc7gM
 3wGhcJulNGOlaZw/Mj/+UW+NX3qvkvz22ArlvsAp8eBFArd2IVfvrYk9zbzl9551wl4P
 W7GE2cjCrGhJ9H+jYeOaSATdcW+jcxCse8j5GICzc0lu7OrLjBdoHMk7pjzLPAhHkxLu
 9WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7XCyvkdm6DP0Jui7XSb0+VPfOdaD+dTmIQzSrRKlao=;
 b=ifINoSMneE2LnV1DnXCsjKy3C+lG+sHSH+ILkcJkf+pTTnjE44mHZ/C5muGDYIzksx
 0bILiwTvrjNdUB5PwywfaQJpf45X2qwQp1wWK5ha2aKQbMFYH3vv+vi7wjsWA0bzyejW
 5Xc8JO1L2RqUNAtlgLEDGsa86kR6RSz8AfCeSs56og9cqUMHyGwBRYAiLe0jop4aGR0P
 rMfLu0EMIOVzP2CQXWXo1iTaShTIvsQkAESHEMayqSrWjsdSVaByP7J9I/gyKXXgzuxS
 mKSO1M0XQp/1lziKhGVS/UdQT5iQOeqWibNMXDsYeXFtpIXwBLDOlK9Mwr+fCBw72fw9
 RQ+A==
X-Gm-Message-State: AO0yUKWVTKEr/Fx9xs5IJU/1+utLgrrNWJ6hf1WLVZvtFZR45OLAF1Eh
 HHldHEA2rpG0XVC03/MAf6JbMoVFkwL8LsMj
X-Google-Smtp-Source: AK7set9TifsiJCRQ0BJ+N+S1l84xbAVuDN+JKiZ/oefWDU4v60J0e6Idllw+llPO5zMn3j72xCtvcg==
X-Received: by 2002:a05:600c:3088:b0:3dc:5c86:12f3 with SMTP id
 g8-20020a05600c308800b003dc5c8612f3mr11829602wmn.1.1677021933999; 
 Tue, 21 Feb 2023 15:25:33 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c211200b003dc4fd6e624sm6050300wml.19.2023.02.21.15.25.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] scripts/checkpatch.pl: Do not allow assert(0)
Date: Wed, 22 Feb 2023 00:25:17 +0100
Message-Id: <20230221232520.14480-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221232520.14480-1-philmd@linaro.org>
References: <20230221232520.14480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit 262a69f428 ("osdep.h: Prohibit disabling assert()
in supported builds") we can not build QEMU with NDEBUG (or
G_DISABLE_ASSERT) defined, thus 'assert(0)' always aborts QEMU.

However some static analyzers / compilers doesn't notice NDEBUG
can't be defined and emit warnings if code is used after an
'assert(0)' call. See for example commit c0a6665c3c ("target/i386:
Remove compilation errors when -Werror=maybe-uninitialized").

Apparently such compiler isn't as clever with G_DISABLE_ASSERT,
so we can silent these warnings by using g_assert_not_reached()
which is easier to read anyway.

In order to avoid these annoying warnings, add a checkpatch rule
to prohibit 'assert(0)'. Suggest using g_assert_not_reached()
instead. For example when reverting the previous patch we get:

  ERROR: use g_assert_not_reached() instead of assert(0)
  #21: FILE: target/ppc/dfp_helper.c:124:
  +            assert(0); /* cannot get here */

  ERROR: use g_assert_not_reached() instead of assert(0)
  #30: FILE: target/ppc/dfp_helper.c:141:
  +            assert(0); /* cannot get here */

  total: 2 errors, 0 warnings, 16 lines checked

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 6ecabfb2b5..d768171dcf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2982,6 +2982,9 @@ sub process {
 		if ($line =~ /\bsysconf\(_SC_PAGESIZE\)/) {
 			ERROR("use qemu_real_host_page_size() instead of sysconf(_SC_PAGESIZE)\n" . $herecurr);
 		}
+		if ($line =~ /\b(g_)?assert\(0\)/) {
+			ERROR("use g_assert_not_reached() instead of assert(0)\n" . $herecurr);
+		}
 		my $non_exit_glib_asserts = qr{g_assert_cmpstr|
 						g_assert_cmpint|
 						g_assert_cmpuint|
-- 
2.38.1


