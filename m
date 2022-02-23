Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1424C1F2B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:56:01 +0100 (CET)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0YC-0003sR-OF
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:56:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0BE-0007EU-Bv
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:17 -0500
Received: from [2607:f8b0:4864:20::430] (port=45919
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0BA-0001K9-Ht
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:32:14 -0500
Received: by mail-pf1-x430.google.com with SMTP id u16so178385pfg.12
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWBxuwt8V3FGFQ5JHqGb8ST2XOZhCQVYfBFh0OJ1LZY=;
 b=hTKynpU4Atz5CQAPq4e1VBoM/n3yAK6l9EAAFoCfoay8cSuB4Tqvb+K72ISi9BSJX1
 XlWvYbk560KMVvprHxfct4DKelHCbncfqoPiUZxmBCw24AmTFEc7KP6s9+gWrUF/HpsK
 bsHc7w82jzDe5F6HmTRYqE5YeHrhTQL5XdcI6tkzcqCTlwcvLTOUv1+wTxqAQyVUZPKB
 jlyFXmdAYAwET/LhRgq9Y39iL4ACpgUdwOpGMzPQeuv6P7bPjOjiHz+N1bxuS/+37dyu
 Eaz878KttbQb6ZKenbSz1RJYdghtWV6NA7yMI3KPVMbKXHGXNEx7PrHnfuVvWqtVqT0r
 RKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWBxuwt8V3FGFQ5JHqGb8ST2XOZhCQVYfBFh0OJ1LZY=;
 b=G+Bbjszok4ILOLKyjc8Y4lhQYHHTYRJKsoLv+kmOgk3fIy2KVvhbqS2YkXYPnfKFf/
 5QyLuAWDiNHOVjhLwYTiCoweBF2wI2+3fAhN9gf1ah5r8aRIGgsM0T6ab+S8D3QZnFOZ
 1lJOD6y7ahODp4hABVeI1v+tlJsYPexamSpOPq3o4JAU7LAaMD5XHjHxRZNU145+P/Is
 FdV+Fv6DnQ3ydMNDxqpDOcsy+NiQOm2YGpWwT49EFJuv6Uarapx1PlPFV6FLYAVcr+cQ
 m0U+XGviiuUYpCflKIBPTsZOGCw0diiylUhzSVdOz0jtng9Xp8n7SK3ZcipioH1plDZ5
 5gbg==
X-Gm-Message-State: AOAM532TqsWyL5+XkCjTk7UbAyYMKeSpS9xUXb+9wblfOyXFIB1AZCrT
 rYobae/ToDcakAHOhcDsSJllHuKod8b0IQ==
X-Google-Smtp-Source: ABdhPJyDa/xjUALxa1rvwS6unEKstiVIJF/hykpcKCeCxQVD+2aJpKco1a33yBn+3TYwlVNX+bGNlw==
X-Received: by 2002:a63:9d44:0:b0:374:a18a:17fa with SMTP id
 i65-20020a639d44000000b00374a18a17famr1383122pgd.293.1645655526475; 
 Wed, 23 Feb 2022 14:32:06 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:32:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/17] tests/avocado: Limit test_virt_tcg_gicv[23] to
 cortex-a72
Date: Wed, 23 Feb 2022 12:31:36 -1000
Message-Id: <20220223223137.114264-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests currently use Fedora Core 31, with a v5.3.7 kernel,
which is broken vs FEAT_LPA2.  Before we can re-enable these tests
for -cpu max, we need to advance to at least a v5.12 kernel.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Fedora Cloud 35 uses a v5.14 kernel, and does work with FEAT_LPA2.
However, I have no idea how to update the makefile/avocado combo
to get that to happen.

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>
---
 tests/avocado/boot_linux.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ab19146d1e..a79c1578a6 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -74,7 +74,7 @@ def add_common_args(self):
     def test_virt_tcg_gicv2(self):
         """
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:cortex-a72
         :avocado: tags=device:gicv2
         """
         self.require_accelerator("tcg")
@@ -86,7 +86,7 @@ def test_virt_tcg_gicv2(self):
     def test_virt_tcg_gicv3(self):
         """
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:cortex-a72
         :avocado: tags=device:gicv3
         """
         self.require_accelerator("tcg")
-- 
2.25.1


