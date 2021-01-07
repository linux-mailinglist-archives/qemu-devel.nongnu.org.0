Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F72EE6A8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:21:32 +0100 (CET)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbml-00068V-GW
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgW-0000jF-H5
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:04 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgU-0001Qi-UO
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:04 -0500
Received: by mail-pj1-x1031.google.com with SMTP id m5so4467984pjv.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xH5M81fqmCpdca/RUuW2bG6ZjrHw1rwqh2ryuVvV5yk=;
 b=nxaC4v5mmXyq6tRE8d5NwGy98JWw2mJ5gXYnsl6aw8PfFfJ9sTnDCkagqayhlrahWd
 tr9E5PC0HezJzGSlLNci45zpIDS85kkJqJ9pydYa+5Vj/HCn718NiP5Y8JLWlUqbZP2P
 i619tocgrpbqb3HcaUN3r+AoUwFHGM9Q0ae1JWFjiw3hzFs9xZ1SUcYFVOS1//ubc5Wq
 /6nSrTGSIrwAgKPOUQ66E6ess//xuZaRWL7BgxyfvUxXYCv1poNjW6AxECtH9vcgNsEh
 MI3NxEYzBrPOhZguE38J+IakWaxK1Hg+7SNrWqArvgkONABgW9QRR/nMP6fIF06qVrsE
 unJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xH5M81fqmCpdca/RUuW2bG6ZjrHw1rwqh2ryuVvV5yk=;
 b=a0KqTUkDqMkFZYoSsiD74jvz2I4ywVnXEUS2q3DXArCjP0XsfpaBVeKWf6NTfhJwHK
 Q3ffHw/YaRxXbiLGV+GB86CkHVJcVV0uTvi+9Q3qjhOUTWNGFXaG4bGItq0Mkbbw9Mz0
 Ba0mFzzeX6SE+cvIaS7Wep1NUXSM5F++l1vhBp+EWrBFArIgeDMz2OC+eEhK3YmhD+za
 N6T8nGyZ/JfHYTW5YNIPm5EkDLYSbMmdlo/ka8XupKHkKgBgsXdvpMRHWqX92DOBwJ/f
 PPfy98blMAas6ihRkqS5daEmND8Ub7tEVw5wbV6wUe52DqbjK9/g1pmZ7GJVTOJ159Lr
 Pypg==
X-Gm-Message-State: AOAM533m74tNyI7v2nChxzyFDv7a0hUgryZ9Ok3bmpeZ8RsMY4uqk+T2
 aw9eGSf0duezD3qHOwIfN7z9tdqUctbiWw==
X-Google-Smtp-Source: ABdhPJzckuSVnICGxXx+fZfW96mY5g9WXqy3eYmNX+JXoGJjUQRNV7s9bMBXKaOqhexfiDHiXwH1xw==
X-Received: by 2002:a17:90a:b296:: with SMTP id
 c22mr195827pjr.142.1610050501369; 
 Thu, 07 Jan 2021 12:15:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/47] util/oslib: Assert qemu_try_memalign() alignment is a
 power of 2
Date: Thu,  7 Jan 2021 10:14:06 -1000
Message-Id: <20210107201448.1152301-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

qemu_try_memalign() expects a power of 2 alignment:

- posix_memalign(3):

  The address of the allocated memory will be a multiple of alignment,
  which must be a power of two and a multiple of sizeof(void *).

- _aligned_malloc()

  The alignment value, which must be an integer power of 2.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201021173803.2619054-3-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/oslib-posix.c | 2 ++
 util/oslib-win32.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f1e2801b11..359c52df12 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -201,6 +201,8 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 
     if (alignment < sizeof(void*)) {
         alignment = sizeof(void*);
+    } else {
+        g_assert(is_power_of_2(alignment));
     }
 
 #if defined(CONFIG_POSIX_MEMALIGN)
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 8adc651259..e6f83e10ed 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -58,6 +58,7 @@ void *qemu_try_memalign(size_t alignment, size_t size)
     void *ptr;
 
     g_assert(size != 0);
+    g_assert(is_power_of_2(alignment));
     ptr = _aligned_malloc(alignment, size);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
-- 
2.25.1


