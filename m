Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD8362190
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 15:58:51 +0200 (CEST)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXOzi-0002KC-AE
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 09:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwo-0007HU-1n
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwm-0004xz-E0
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:49 -0400
Received: by mail-wr1-x431.google.com with SMTP id c15so17848138wro.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 06:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cZehfILUJtGk9HUzuIGzJjH/JKzgTkA2dSQh0622GUc=;
 b=dNXtTYHnny80kgrQ7dz46aEA/bgDs0WX+Vq0PbbQ4bHZkpnaWiLPy+XTPNL+yo2RfB
 PpfxPfTelVY/1jz7lOhLGHNhy2YaaRJ22vg0CuuwKN4e2lGYgdSR6w2lKQPusgITj+4X
 mi415NcY3n3ZzJK4a4nXqjkQrLM8KftGlj9fs4oOdMtBT4ik27YgE5VY4ED5rrSSruJu
 XuBwWtnqo1zMYbX/DuLEtkAs8XEPWZrv2mhhHaBMWPYojtxPzzzFVq01tiQYkVyL3V5G
 6m818YdvVj03wm0ZlcKIX4hMzEgXrQX+rRYrcvxLvVfOyB88YhG7ecVy8kUOYIBT+t+U
 k9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cZehfILUJtGk9HUzuIGzJjH/JKzgTkA2dSQh0622GUc=;
 b=gJfj1VSxvGoRBScilDn0wyyxs2wWAW7qybxFW40P777IuuAzG9qhHoxLHy5r2mbXRS
 xSvaB5wq7mL8B69KSqjA9xA31zq6wLCl6HwxJmzdc9R3lst1N0CV+3nffjDRNyh559QZ
 cChDppyfTa/9mxcfK/Stg6GUPtz+EfQS9AUa2IoCSRJz91egj40qh1QNRJR0Kl3EuTL/
 j3nAXsGP1kI1+tXKZix4J/UqXzlSWGfOHRPNk1QfQYmnWMhkDc3QcjSUDyosBXxdhJ5V
 r7NYaBfOkAux3FXGOzpTx4H8bbQ3LSYvZ9AUbenFjtA63/bvDzU4kfFV9nkgqr2uYEu8
 Eczw==
X-Gm-Message-State: AOAM530VUxD8ewV/wxR2snd2XsmiY8Q3EoFaaDT0L+hqslIVy+zlt5vU
 X8kS82FyTXTq+/eppR7KQGQIG2mvWjPqWgmY
X-Google-Smtp-Source: ABdhPJw07lkIYGLxJkaLJZHEvfZ+qQGobzUmmTYasx7wG65PjE2GGnneUrncBXpsq5nTFBWDK4t4hA==
X-Received: by 2002:a05:6000:178c:: with SMTP id
 e12mr9318241wrg.42.1618581347192; 
 Fri, 16 Apr 2021 06:55:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm10686528wrn.49.2021.04.16.06.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 06:55:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0? 3/6] include/qemu/osdep.h: Move system includes to top
Date: Fri, 16 Apr 2021 14:55:40 +0100
Message-Id: <20210416135543.20382-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
References: <20210416135543.20382-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mostly osdep.h puts the system includes at the top of the file; but
there are a couple of exceptions where we include a system header
halfway through the file.  Move these up to the top with the rest
so that all the system headers we include are included before
we include os-win32.h or os-posix.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210414184343.26235-1-peter.maydell@linaro.org
---
 include/qemu/osdep.h | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 6d8562eaf40..cb2a07e472e 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -104,6 +104,15 @@ QEMU_EXTERN_C int daemon(int, int);
 #include <setjmp.h>
 #include <signal.h>
 
+#ifdef CONFIG_IOVEC
+#include <sys/uio.h>
+#endif
+
+#if defined(__linux__) && defined(__sparc__)
+/* The SPARC definition of QEMU_VMALLOC_ALIGN needs SHMLBA */
+#include <sys/shm.h>
+#endif
+
 #ifndef _WIN32
 #include <sys/wait.h>
 #else
@@ -111,6 +120,10 @@ QEMU_EXTERN_C int daemon(int, int);
 #define WEXITSTATUS(x) (x)
 #endif
 
+#ifdef __APPLE__
+#include <AvailabilityMacros.h>
+#endif
+
 /*
  * This is somewhat like a system header; it must be outside any extern "C"
  * block because it includes system headers itself, including glib.h,
@@ -130,10 +143,6 @@ extern "C" {
 #include "sysemu/os-posix.h"
 #endif
 
-#ifdef __APPLE__
-#include <AvailabilityMacros.h>
-#endif
-
 #include "qemu/typedefs.h"
 
 /*
@@ -469,7 +478,6 @@ void qemu_anon_ram_free(void *ptr, size_t size);
    /* Use 1 MiB (segment size) alignment so gmap can be used by KVM. */
 #  define QEMU_VMALLOC_ALIGN (256 * 4096)
 #elif defined(__linux__) && defined(__sparc__)
-#include <sys/shm.h>
 #  define QEMU_VMALLOC_ALIGN MAX(qemu_real_host_page_size, SHMLBA)
 #else
 #  define QEMU_VMALLOC_ALIGN qemu_real_host_page_size
@@ -549,8 +557,6 @@ struct iovec {
 
 ssize_t readv(int fd, const struct iovec *iov, int iov_cnt);
 ssize_t writev(int fd, const struct iovec *iov, int iov_cnt);
-#else
-#include <sys/uio.h>
 #endif
 
 #ifdef _WIN32
-- 
2.20.1


