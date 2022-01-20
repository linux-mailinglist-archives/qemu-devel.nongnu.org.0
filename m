Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F7495079
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:43:55 +0100 (CET)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYfK-0002gk-NW
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:43:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVeq-0005ao-TJ; Thu, 20 Jan 2022 06:31:13 -0500
Received: from [2a00:1450:4864:20::32c] (port=44912
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVen-0006bq-Kd; Thu, 20 Jan 2022 06:31:12 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so12935117wms.3; 
 Thu, 20 Jan 2022 03:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vabZUgXCc8y6pgkTLFnvHt9OHIbqfyKMtptKUA3UOiA=;
 b=qeZ+Kd0kz90xUXDc45o5XWWSg9iVSaJAzd/+z6vZ5LdRaY63noG4NwCNSlcqQ3+Tld
 dIgAXF18877Hpqai7hJDWKRj+fsrvyvBuLjxGef9gmiKR1zITpPpQ9RQUcod2oJiurfV
 iSNd7KHKBaeqHr9cNU9QzbRbtUWrarA4+JVzzXm89adz6hO4QBpNRi5QyzUyPuTRQQR2
 L40B+xLZupTIQO07kfGS11Xs3a2j+HWtL1eSuKJr9WLtkQmg+UlkAPEnU63/RvB7+9XW
 U3/YusF/6CJSq/LHlJPCk1DlBVHtVmOZcvrhBPg695u0/m43mMc/AYx7Z6j05RNdG4pk
 lZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vabZUgXCc8y6pgkTLFnvHt9OHIbqfyKMtptKUA3UOiA=;
 b=6KmG872/ka4FiKU+NUgieg6wZWnDh4YY0cJLqc4uaz8gOcSw/eB6qJH9uAvocYHFTC
 liQl4ygtVj2eM+N0SIq911DWTeOjoT2LJ0nsr0m5eZ/vh2ov8g8w7lG35MxbvCTZDBmd
 HS7Z+GSR+M+I3U6qeUGDkkyDOIhyxWVdCKPC93mlS26oQ4kHg1nDfHmYx470xyganLaw
 6/lPBoIfmWuJSljyF8VT8BIma3WcNSiRa9gs31G3eU4sfdHT6NTawRsYDE5uCVeecghI
 8pGMYcUTD/GlN4TV8mnCJKHTt8Pg+StdwpOdFzIghwPkXvfUI/GD3GcUqH+IGmKAGr/Z
 SorA==
X-Gm-Message-State: AOAM531CLJjbIyHh21m1AwFkq0bqRY8gz2ytfNC/IVj+kTQZHqJVFeaM
 lw3X8YBwaEbyYLTBAgkNLS8wqO1EP0I=
X-Google-Smtp-Source: ABdhPJxxI4afl6FS1H2vRJEN+veUJBzkKmtZAek7DgGVf2yFczwJqRMa7tjsF23DU9aHIfGosHiGKQ==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr22526109wrr.54.1642678254613; 
 Thu, 20 Jan 2022 03:30:54 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 o3sm2613248wrq.70.2022.01.20.03.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:30:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 7/7] tests: Manually remove libxml2 on MSYS2 runners
Date: Thu, 20 Jan 2022 12:30:16 +0100
Message-Id: <20220120113016.268265-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120113016.268265-1-f4bug@amsat.org>
References: <20220120113016.268265-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

lcitool doesn't support MSYS2 targets, so manually remove
this now unnecessary library.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .cirrus.yml              | 1 -
 .gitlab-ci.d/windows.yml | 2 --
 2 files changed, 3 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 02c43a074a1..7552d709745 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -32,7 +32,6 @@ windows_msys2_task:
       mingw-w64-x86_64-libgcrypt
       mingw-w64-x86_64-libpng
       mingw-w64-x86_64-libssh
-      mingw-w64-x86_64-libxml2
       mingw-w64-x86_64-snappy
       mingw-w64-x86_64-libusb
       mingw-w64-x86_64-usbredir
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 62dd9ed8329..1df16303491 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -44,7 +44,6 @@ msys2-64bit:
       mingw-w64-x86_64-libssh
       mingw-w64-x86_64-libtasn1
       mingw-w64-x86_64-libusb
-      mingw-w64-x86_64-libxml2
       mingw-w64-x86_64-nettle
       mingw-w64-x86_64-ninja
       mingw-w64-x86_64-pixman
@@ -80,7 +79,6 @@ msys2-32bit:
       mingw-w64-i686-libssh
       mingw-w64-i686-libtasn1
       mingw-w64-i686-libusb
-      mingw-w64-i686-libxml2
       mingw-w64-i686-lzo2
       mingw-w64-i686-ninja
       mingw-w64-i686-pixman
-- 
2.34.1


