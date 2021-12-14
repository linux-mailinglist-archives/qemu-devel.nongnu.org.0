Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD34739AC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:40:22 +0100 (CET)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvrh-000452-Fw
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:40:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwveD-0008N4-83
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:25 -0500
Received: from [2607:f8b0:4864:20::42f] (port=38684
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve8-0005TW-O0
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:24 -0500
Received: by mail-pf1-x42f.google.com with SMTP id g18so16407059pfk.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGfLGGGTH1EqFPSWJdPeDV41FqhsvuJx8DurTLn0ZgA=;
 b=LWpMNkj5rGjMc424FuA3hYlINik861oWS3mwah2SCpln/HZOZ/UwBbdue37k3Rf0F3
 NfU5ZPH/CjxO/TGLJkeWH6C1Crnuuna3Wd689tEfj2AcMYEbhIRwDkf0Ha9A3MHFM8MF
 VaKHSdSpAZC98T/XDiK6d1QyalSPimkMeDTb8evQaoCHUEAFFopn4rp28XlcQfpnRVKV
 Jl0baZyB7MFcoiYAupHHH++6YJa5EpTsVr11g/Z9IrQ5gdENt/17soljdR48oy56UNLN
 LeRl/RbjwhviVKUNkBSkwh5cS2yfqTFwwzuo8slhMNUZnSnjwtfh1x9tFbORc4XeNHEt
 MsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGfLGGGTH1EqFPSWJdPeDV41FqhsvuJx8DurTLn0ZgA=;
 b=hvjXu4rlAvanHq1aJVOl/+5SKn9h3Xk/ecggh8M0WdkRpj2M0koV/KQjksrKSllIf3
 P1Bf5aLkc5QZ4IRuOtYwjGHGViAk/rQKY/u9jKIvaSHHILt0HSA0B2S4j3VQsvcT+SQ7
 neQ+XDSR5xTGsqIXeW01Ggf7fA7nBnrOgO6XZPSV2pfLRdU6OIFfUjnDLRwWSGkxRs9J
 v6ZiohoowwMbGdhTymc/AcBmHLdz4DRN/b4tYvBYRMwc40hGMLBTBG3CMyN1uTqhbmLx
 WwcW5tu+Nz1zCEfAmOkLilrtZVIsj2I2H//IRL39P6nZ9FWmt4wk1Tj6YBze5grySIyf
 NHfQ==
X-Gm-Message-State: AOAM531rPOaK43y97zn1YXfXV77VPqjwUWdw9vQQDd0HFeU5JbLAXGPP
 /ihr30FqkPULwj7L6VEec3zyznfuPFA/2Q==
X-Google-Smtp-Source: ABdhPJzN0zdfCjbUXVX1VI1GCfilMTkcjeomfEoLJSqNqv2bEtIXFKK7X8HxmBKgb8OYHKga3WWkFA==
X-Received: by 2002:a63:fa42:: with SMTP id g2mr1370957pgk.239.1639441578488; 
 Mon, 13 Dec 2021 16:26:18 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/15] linux-user: Move thunk.c from top-level
Date: Mon, 13 Dec 2021 16:26:02 -0800
Message-Id: <20211214002604.161983-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So far, linux-user is the only user of these functions.
Clean up the build machinery by restricting it to linux-user.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                   | 1 -
 thunk.c => linux-user/thunk.c | 0
 MAINTAINERS                   | 1 -
 linux-user/meson.build        | 1 +
 4 files changed, 1 insertion(+), 2 deletions(-)
 rename thunk.c => linux-user/thunk.c (100%)

diff --git a/meson.build b/meson.build
index d5ac65b877..cd97b154bd 100644
--- a/meson.build
+++ b/meson.build
@@ -2621,7 +2621,6 @@ subdir('linux-user')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
 common_user_ss = common_user_ss.apply(config_all, strict: false)
diff --git a/thunk.c b/linux-user/thunk.c
similarity index 100%
rename from thunk.c
rename to linux-user/thunk.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 6dc3e1cd1d..3fd57f8fac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3076,7 +3076,6 @@ Usermode Emulation
 Overall usermode emulation
 M: Riku Voipio <riku.voipio@iki.fi>
 S: Maintained
-F: thunk.c
 F: accel/tcg/user-exec*.c
 F: include/user/
 F: common-user/
diff --git a/linux-user/meson.build b/linux-user/meson.build
index bf9d945504..fcf7d40f23 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -15,6 +15,7 @@ linux_user_ss.add(files(
   'signal.c',
   'strace.c',
   'syscall.c',
+  'thunk.c',
   'uaccess.c',
   'uname.c',
 ))
-- 
2.25.1


