Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BB848825A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:30:04 +0100 (CET)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66xq-0001Ge-3R
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:20:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IU-0005I3-9z
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:57 -0500
Received: from [2607:f8b0:4864:20::d33] (port=46624
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IO-0003KM-Ip
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:50 -0500
Received: by mail-io1-xd33.google.com with SMTP id x6so10010656iol.13
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHR8E0XalFYH6WBW0i6lmI4bojXX/JfzdunUrlaEzCM=;
 b=zs6YvjhsYRmac1pPQEeIlTkGIBi6Ln/gKKeCMKE+fJenUQRc55n4hxwTON8AhIeg+e
 4szRuCKKMJY7MakX3+u7kWYxjbi7lBu/JFUfnvj4Ir52PsBySm+fY7Hchd4VYcChlv8C
 0HwzPbTFKbNAKMJEZOGlSIKFII06FpJvoONIWth+NImBf4wn5txxewaZrDKvWRpzFab4
 JvHv8wJfVRttyoOScReaeh8oygQ/Phv6bXrmr4P3q2D6SEIcktLy03nUOyzbgcc4m1o/
 +bWGEifnGsRwvMB8S9k7CfDQcYxuJG7Eeg021xdKxuVqbcCWaBRENW0tJYDB0nSlKKa0
 lwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHR8E0XalFYH6WBW0i6lmI4bojXX/JfzdunUrlaEzCM=;
 b=K8etbayzDqe31f/59zVaydOb3cCM7h2GdUxHfWJCdy9l3Rmcj/PFcX5QGs1nCcEY9h
 XaPvmYbtd37DvT1xnGxH86dG+Vp0QFgsTWUqL/D8M77ONPJbidxv2Gc/QvmEBI1ucacg
 b4g+WcXkO2eqSehiwaqN+D6WyjgkGgu2D6tzXNgJ+0TFkAw8zIvdB/llHM8sdiXx19xw
 8UcDRstmKGnJ8ss8zRH9WJoKPclbSgOUJJ4Dnau+EFuIufUmSsrepMfa5KS/N76wFW/T
 T0dZbCMT+cBw03260jUjcytv29OLHqotnQ6MvAAb0Hb0GR+LFlBh6Frwe6WSOs4aYRT+
 3m6A==
X-Gm-Message-State: AOAM531yIPXtMtF9Z73J5Bs3ACWqB9HysLPxRPRzfAUyZ2i3nMCR6/SV
 F/CR784UBV+SfLNdGxbqvF1AleziPQHNe7Mx
X-Google-Smtp-Source: ABdhPJz3VdQbiO+mlpA20EkP/JGgrvwcbD1CLP0+8cHwhiacQ/LxLEoEX21+Xk0vfRBwfntrirf55A==
X-Received: by 2002:a5d:8244:: with SMTP id n4mr31879224ioo.27.1641627466710; 
 Fri, 07 Jan 2022 23:37:46 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:46 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/37] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
Date: Sat,  8 Jan 2022 00:37:04 -0700
Message-Id: <20220108073737.5959-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, kevans@freebsd.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index a90750d602c..e262667bdab 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -27,10 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-struct target_sigcontext {
-    /* to be added */
-};
-
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-- 
2.33.1


