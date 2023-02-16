Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5869A269
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlN-00004u-TQ; Thu, 16 Feb 2023 18:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlH-0008TT-Uf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:00 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlF-0008Pt-Mq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:33:59 -0500
Received: by mail-il1-x133.google.com with SMTP id v13so1422522iln.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/ho+o97t3oUvsCX6/tWPXAhBUu89VuwLZO+3r6EySU=;
 b=wiE0LN3y8BKkKs8xy87FAv2iMZzyCAWmNAs+w3jnfDJ1OSprBEW/4DOqf8ugdXKveX
 OPITdnidZM5T/j6m5KTSX/iqzj3sINr3E3yJK1NxM6Ly9pvzBv6OkTXVuY09kcNoQEFr
 BUEjD/HnZz6IYeUqTnS+oOo5uMy70N4Vff5u/QPcQcXtGUv4ydL0KIHCTyyAzCUiyV4L
 8e1pQptIYuluzQBFXKf8R6CIJqFcXuW4OITyLHkKhiCw6mZ8B3Za515ICU9OvFZ//v/p
 GhMUfdes3+PVblOUNMHQPUPCgPP/vti8Ou4MaFT5L/bkQwfPo0WcimcDIB/o19rRtY3s
 ZnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/ho+o97t3oUvsCX6/tWPXAhBUu89VuwLZO+3r6EySU=;
 b=LAGXWKKd1xwSGR5tVaZJyVFXGvdUYOg+EYURKSGkgNUCBanZHFPPW2tSKJlY6MPde5
 Nk2DBGj9Y5F6KD1R/icrq+uAztz+UmZunyaQ6J2wzFt6QiAso2TlI1AFN3FLbIGHvkzH
 5LsUe7mu548+HQsOSimF1YiKhXhF0T4Ek/f3VTJrv+sD0nYBA8I/faWSCVKqO6AlLoF1
 bN+T+H5fbA1yu8dIx6nvcObUZ7lRQBOt52U369gL95dr76lXUDxhO0XWMwDqiGjgCWJd
 W+OQywFso+73mfGb6LUU5YUAVzBVoLzzooHPGcioHTTM4DDOKTzRz8Yr/Vahi4EKJlA0
 h4Gg==
X-Gm-Message-State: AO0yUKW8nl/mtitCBUvptANR+7fUnkf8G0HloHtuktG2PczqzccwJcAe
 +y+uVDc3sjEseJmL/7fw+noiRmNHq+5NVJaX
X-Google-Smtp-Source: AK7set9wFCc8TRtXuUC/5Ce+IzLz9p4AA+HzrtoHvcplp4BTsm6ZkHi8/pqD/Ca6Dta1Mm98EGMWig==
X-Received: by 2002:a05:6e02:20c4:b0:310:fd98:1cc2 with SMTP id
 4-20020a056e0220c400b00310fd981cc2mr6832298ilq.13.1676590436230; 
 Thu, 16 Feb 2023 15:33:56 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:33:55 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 02/11] build: Don't specify -no-pie for --static user-mode
 programs
Date: Thu, 16 Feb 2023 16:33:44 -0700
Message-Id: <20230216233353.13944-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 64960c6000f..eb284ccf308 100755
--- a/configure
+++ b/configure
@@ -1313,7 +1313,7 @@ if test "$static" = "yes"; then
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


