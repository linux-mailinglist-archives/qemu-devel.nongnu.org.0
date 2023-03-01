Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC736A735B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7e-0005R1-J2; Wed, 01 Mar 2023 13:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7b-0005GF-LZ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:11 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7Z-0006nk-Au
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:11 -0500
Received: by mail-io1-xd2f.google.com with SMTP id 76so5742339iou.9
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HyoNTDTr1ptMH6svOCZXN1cA+3jNNlRrvcRLazIEkVE=;
 b=hXpxCsztjCQwxS8WiFX9EXn8zbBVjGO+lt1g18uaoPvQm8OJTkmOWsPrjF7nDqjYyv
 UU79/zkosxYNTs8DxE8amF7sgOKiImTLDRhEgs0gwMJ3WeD4CJoRSU3uX2jVvDRV2goj
 yJX/u63pW5REJO2K+iDw4VlOxtY7uZkicCv2XaBfl3/ST0KGMrWOyLj+57uf4bjxB0dc
 FyGEcavf1t6U+EreAZEBsHDlLk5tn49bNzWAIsmjUD0ZG2dA/EMb3A2DHxtACz4baMNe
 FkIk9IewESsoVho7uNaoeCmBw8/B7PZebcXoZM0CcAg0fj1mJ3CoCmSrRGBjGOVatuHm
 xw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HyoNTDTr1ptMH6svOCZXN1cA+3jNNlRrvcRLazIEkVE=;
 b=ADV61NS7AZxeBJTNH8f3BVqEgrnewtNbaQ913BCeHbwkx65wG8NawzZQkV7sTTtxZw
 jWbE+PdjyxGCB2X6PDuqBLcU2RfE/Ibfa64atSUlENxwPloN+HCBVZX3leWTWNQ+ltDN
 VwNt8bwrERn0JhLpria+/E29M+HvWmuou0zJKs6PIY8FQIu24373RkKz4USqMuooHapE
 eEhvZKUXlT25N7SKjTTBOwBk4CizUYDTppSP/BmOquriC2cAorkMXrGlTKAjJmzL7Rov
 3fsopUI+F6S4IWefn/3Q8163rntd34FkkmBQudEGBbh2An892M54WVu/tnPsUg65hTQz
 jBmQ==
X-Gm-Message-State: AO0yUKUt8W7Hh0mHAyb7M6azgYkZQHpvKRO7tceDxqdSFpuHwiRm70VW
 yu+SV0ok25neA8L6a+mLRe9lCvTpxQ9z75JH
X-Google-Smtp-Source: AK7set+cWcDYzVCfW1MS4MPHP29EpBa0UGTZRf2L4Y718Zs8rlt6PqH45Xh9q5932nV/qf4OskaH7A==
X-Received: by 2002:a5e:890c:0:b0:74d:114c:8331 with SMTP id
 k12-20020a5e890c000000b0074d114c8331mr4679957ioj.14.1677695047816; 
 Wed, 01 Mar 2023 10:24:07 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:07 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 02/10] build: Don't specify -no-pie for --static user-mode
 programs
Date: Wed,  1 Mar 2023 11:23:45 -0700
Message-Id: <20230301182353.21559-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

When building with clang, -no-pie gives a warning on every single build,
so remove it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2a8a9be8a18..24684f47b6b 100755
--- a/configure
+++ b/configure
@@ -1347,7 +1347,7 @@ if test "$static" = "yes"; then
     error_exit "-static-pie not available due to missing toolchain support"
   else
     pie="no"
-    QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
+    QEMU_CFLAGS="-fno-pie $QEMU_CFLAGS"
   fi
 elif test "$pie" = "no"; then
   if compile_prog "-Werror -fno-pie" "-no-pie"; then
-- 
2.39.1


