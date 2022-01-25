Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D85249A210
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:35:00 +0100 (CET)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAja-0004fg-N4
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:34:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAej-0001fS-C0
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:57 -0500
Received: from [2607:f8b0:4864:20::131] (port=37452
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAeh-0001KP-Np
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:57 -0500
Received: by mail-il1-x131.google.com with SMTP id z4so363277ilz.4
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJ0ggAZ5G2KuobyUQ2EAEWVzlqR8jmiWD0n6bcTFpIM=;
 b=KYcKjJkcc1KpDIpU4C2f2H7XhRb0+UEs4BoYDnned9xSJMAyDlanZhUHydkDtDAU4O
 J7rVFYUzC3iMFzlAzqaSgNHShwybmQBvhujj+4FgTJLFto0/TnJlSnzk6dNz2XNBzGtU
 p8DilNs5EDet0/KjKMQd+QyTkpv16U0+FmJgmLjLhggzK/KiEXy6GLcbNaMIqvUgbFYb
 EdRezLR9dyeM/IWTh7iC5HPh4lEQ157csyBvDXPlERu3F7JBjBn6Tat7nHVwBECks3/C
 0AoAdkW8YCIJ0q3L/sCIHf3JbFqWAXPynquXe7YOCz2DKJNLbKJHZ6euho97iD9yaj+r
 +3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJ0ggAZ5G2KuobyUQ2EAEWVzlqR8jmiWD0n6bcTFpIM=;
 b=Z/Td/OsDS2ur3XcafNO/nGcAtaR5Hnd2tPYCK2gjPd95LjQJZFGdQ4VuVqxienF+uo
 QlIQHqqudW4NtYVyF5xP59+x/8QhabZOMvZz0QKurJg5SpCW+tHIIku5RZ8ogKjqQfjH
 I/LLjGvij/RrnbmErk5pOFgyDfrlEFZ7/whCKPvor6vKhZsZzY9PfenGnnXlYi7LXr2N
 MilJ7s2VaW0XeXwFTamfhsYHi11C2umyuCNQXX+nFUNWg9VAJUQbuRr6AagtmhEeR12y
 Uuw7fPoasHnYVKV5vi2Vu4ajnMWLRdMYKzLEMuxrIBMMHzO5pGJEwngHQhlmjN0AXX4y
 MFFA==
X-Gm-Message-State: AOAM531MsN1nMT6D6i02iDRkOrgzdkerCT8RnOoIW75spNubBs6t/GBb
 z5llmXXmZaeZU2U8rgNexqOvcJJKlSKYgw==
X-Google-Smtp-Source: ABdhPJxxG6rqek7ddhvF2sLFYf7eQWqnbByrATwjbYDu8oJOa3Nb3nlhmjf/rLivGN/9E52qQYf2jA==
X-Received: by 2002:a92:d74a:: with SMTP id e10mr10114209ilq.268.1643074194091; 
 Mon, 24 Jan 2022 17:29:54 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:29:53 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/40] bsd-user: Complete FreeBSD siginfo
Date: Mon, 24 Jan 2022 18:29:08 -0700
Message-Id: <20220125012947.14974-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


