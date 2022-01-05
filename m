Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D7485402
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:02:22 +0100 (CET)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56ru-0004kO-17
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:02:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gN-00088Z-5v
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:27 -0500
Received: from [2a00:1450:4864:20::52d] (port=46917
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gC-0004BY-BY
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:21 -0500
Received: by mail-ed1-x52d.google.com with SMTP id n30so50120189eda.13
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDOzIOq3YZIQbmOkHWOVk0HkK0osTnjPM1dEzBgMF2M=;
 b=mSkqIJ4iUDUvE9kfJYsAzs/V9opj80+QovWQDOSunEHY6A0q0ClORvqu/BtYQocN1B
 QfreXoTjCDAKpFQzfmqJlFe1khenHnJiKqY7WHDqjoP9zt7j5ZNK0rZVTFb3/II3lmm+
 NwXFs1bSkXA0c1XxY1tftUR26H0/TNZ7JskfWhQPgbkvLUJGfvDCUYoEB8zp/MoJzYPJ
 OESs73/tWHVBh9bTEvtBkTHMxZBdVqIA2oIN4SVZ7Dkbzw1AfXOVdNkfJsQ6Ku8NK3r0
 1hryT1SK5okqxQb1QmBmZiNIJLdcQAak9Jfqwp5i33E44brwv0FYergJZLeTevLhaQLy
 UrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zDOzIOq3YZIQbmOkHWOVk0HkK0osTnjPM1dEzBgMF2M=;
 b=yEKrh9Z0DIjDTi1s3mhElXVnHughRqcCDPJiNYfT1o1vEFd6W4we//jiOSyMl/HuSo
 BzLGWFFIUOIHYLRgbRBRTt258R8Xc89B3z4UzFvi2jWPjNiJyb2C6Uy8NVnbxgZTHrCx
 jbPfseSIczwoNSz5DaSN7BzmMcyVu4pAHKiLo2KCbpQ8VB5MIbsTfwqFAvJG1ErXhnuK
 8YSL92bDbXSe2mAW0JFELX0WVXn+itAzX1tjh/kCOid2Ij7cU+8fb8LSrtDlISuPEMfP
 iY4eTfNCIC8gfNl6Zyjg6B1YH1AxqRpd/EYgXeAw/1q0pgIyz++ajqsx16Ln8E5CgpwT
 06Qw==
X-Gm-Message-State: AOAM532eRt19RhithWRX5VpGnXG7zEgQYuwl2DVUnuV2g3EFcqBVwnbk
 bUYeNZ7GhRl5OwH2VChLIjqskg==
X-Google-Smtp-Source: ABdhPJy0xvvpgJ+dsYunPnKnte64UXFSri3vHR9XxTubCrJIalQb9fqHOJXPQZwoShey3VeAciVq2Q==
X-Received: by 2002:a05:6402:35c2:: with SMTP id
 z2mr53672746edc.136.1641390613638; 
 Wed, 05 Jan 2022 05:50:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z22sm1064721edd.68.2022.01.05.05.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F7241FFBB;
 Wed,  5 Jan 2022 13:50:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 03/34] meson: require liburing >= 0.3
Date: Wed,  5 Jan 2022 13:49:38 +0000
Message-Id: <20220105135009.1584676-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

openSUSE Leap 15.2 ships with liburing == 0.2 against which QEMU fails
to build.

../util/fdmon-io_uring.c: In function ‘fdmon_io_uring_need_wait’:
../util/fdmon-io_uring.c:305:9: error: implicit declaration of function ‘io_uring_sq_ready’; did you mean ‘io_uring_cq_ready’? [-Werror=implicit-function-declaration]
     if (io_uring_sq_ready(&ctx->fdmon_io_uring)) {
         ^~~~~~~~~~~~~~~~~
         io_uring_cq_ready

This method was introduced in liburing 0.3, so set that as a minimum
requirement.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-4-berrange@redhat.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 53065e96ec..0e52f54b10 100644
--- a/meson.build
+++ b/meson.build
@@ -440,7 +440,8 @@ if not get_option('linux_aio').auto() or have_block
 endif
 linux_io_uring = not_found
 if not get_option('linux_io_uring').auto() or have_block
-  linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
+  linux_io_uring = dependency('liburing', version: '>=0.3',
+                              required: get_option('linux_io_uring'),
                               method: 'pkg-config', kwargs: static_kwargs)
 endif
 libxml2 = not_found
-- 
2.30.2


