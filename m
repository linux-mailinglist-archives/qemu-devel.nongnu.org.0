Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD164A0440
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:34:18 +0100 (CET)
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaky-0003TS-P0
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:34:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf0-0008Ru-6j
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:06 -0500
Received: from [2607:f8b0:4864:20::d31] (port=39666
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaey-0001Vs-2m
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:05 -0500
Received: by mail-io1-xd31.google.com with SMTP id c188so9689652iof.6
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2wkolIh2lCmSomI63wI2LjQYXEA5OUzuuGqVAAxz7A=;
 b=eoHolp6VAsu4nrTykIcCClKiVglqXAB5LdS0OYymnoRNWrZ/2S1blPKkOk17YCFCOJ
 xLPvWzYVOW1yx9ue0BmJPOyj9QvftQghXs2G3YKr3KTK+BjFfmisL+zvq7qcUN/gK7uw
 3kT8x6gh2D9DK2PDR5XxOaD5W2/Rzk3vMk9u4+1CBti9PH1X2LUcT5PORTTs7owDfaCX
 abZ5rPxKJESshqpOUk6ffORQrua2K7263xBjvvNk2qG3iFkyBtANzX7mr9h3nsosFWft
 FfeJcOStfgFjJpUhUI8z1eziS2E1GeUlgby5pwgo+GHV42A3CTWNud4hD+u+1XculZe1
 Yr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2wkolIh2lCmSomI63wI2LjQYXEA5OUzuuGqVAAxz7A=;
 b=3CHdKyWmRelql6xMKhOxAUOCCRGS5pWfv+z+yzXMfMdsEF0HB48Dn1SYPKhTtpD7+B
 H/O6369ZQxNx0t2lggmjZliBVCJ58CLcwsZXnwtK8O4XX5mtKKFn3Ljps+/w66aISL9c
 Vcf6bLj2p1SN5D1Kg+8hclF0FDxeUzGigGIVeuotbHDg/Sf8YiHw3HGoCugSD+Q+hyAU
 U16kxlD0EkPFAUnh9Y4UF5nRkFOcbZVqS8iyf5ohhJjNMcTHURuZW786KNDmMdJZnbai
 vNNN3Y801JLQ85dol9hZfMJGvXwrLDsJW99DXrp8KFLULwhsZSCsPTPQ+v5FlN+LYrGf
 ttrg==
X-Gm-Message-State: AOAM531pxS8zsoAnwPmwP9dN4Wk0U9952ieGkvVfREQz1IqhAKHTHQKA
 M5n5Fjp84J80ABLh8cSPdA5ML91GRH8E1Q==
X-Google-Smtp-Source: ABdhPJxUgfLJvYhzhLRaQXS91tIl95CgzWUHkfhLqScUGKx15K6nuu1VvbeBYCSAdmtQFvWWnXsGgQ==
X-Received: by 2002:a5d:8341:: with SMTP id q1mr6387464ior.185.1643412481983; 
 Fri, 28 Jan 2022 15:28:01 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/40] bsd-user: Complete FreeBSD siginfo
Date: Fri, 28 Jan 2022 16:27:26 -0700
Message-Id: <20220128232805.86191-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill in the missing FreeBSD siginfo fields, and add some comments.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_siginfo.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/target_os_siginfo.h b/bsd-user/freebsd/target_os_siginfo.h
index 84944faa4d3..d50a3034a88 100644
--- a/bsd-user/freebsd/target_os_siginfo.h
+++ b/bsd-user/freebsd/target_os_siginfo.h
@@ -71,11 +71,24 @@ typedef struct target_siginfo {
             int32_t _mqd;
         } _mesgp;
 
-        /* SIGPOLL */
+        /* SIGPOLL -- Not really genreated in FreeBSD ??? */
         struct {
             int _band;  /* POLL_IN, POLL_OUT, POLL_MSG */
         } _poll;
 
+        struct {
+            int _mqd;
+        } _mesgq;
+
+        struct {
+            /*
+             * Syscall number for signals delivered as a result of system calls
+             * denied by Capsicum.
+             */
+            int _syscall;
+        } _capsicum;
+
+        /* Spare for future growth */
         struct {
             abi_long __spare1__;
             int32_t  __spare2_[7];
-- 
2.33.1


