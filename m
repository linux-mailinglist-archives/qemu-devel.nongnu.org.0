Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26613466B35
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:53:29 +0100 (CET)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst56-0008By-7u
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst10-00009j-CO
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:14 -0500
Received: from [2607:f8b0:4864:20::1036] (port=33584
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0z-0005WJ-4y
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:14 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so3817973pjj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9CNoFSrWjAjukly+g7lYy0zjZhRUxJXZZvZuVjkY44=;
 b=IppJY0cFQhtprV+hVi3zZSq6ohWp70dtHV0hvF81kuzy7RhM0e2LkbQ9BxT24q25yi
 aTuUs8UMuoRHDVuzPFUGGsvJGfh36Vj6csvHq+5YEBrIcTqRDhlF/U5BZHUL5wf7jmlg
 qvwVAhFV4EOnZzsC0wcAceZgqUnxxZ74O8ogTFhcK/ieoyFnEtEgX1JPc7vYHYTOHPB+
 lX9L2pxGM9PcnUzZhfL2LfShiiOZlcVYy4L8fHNp35h0/LIDr3Ce7sr6+8H3Y4BbDmMU
 IaXyQFVhjaNPHzfsGpJ7Jkm7AVd68KUsp49GKpfTWmSRzb9ioNif6dygQv+E/OiDf1yq
 Lwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z9CNoFSrWjAjukly+g7lYy0zjZhRUxJXZZvZuVjkY44=;
 b=0IlpIW7/6ZgHIWFqgzG0RtdyuSvjkgAHYw0EV2wv9UkrkdAP/wcubx9rlAUGhsH1RJ
 srPN0MfZmTM/HkbQhZvJq6JB3UD4AA9d4qMWYl/FUkOO94lLWpZzU6wWwkoYXqipcnSI
 FQXN/BS4GbxUjmD/s59pFU2bJAst9RGu/kl6oEq+zc6ESYoZd/JCXztbbvmoJuABrX3b
 clklsPw6lgiHDH3gxq9JQEeb3CR6trsPCQMqYYfms9BtYN+8ixqIw4StREmjU0Rag7DI
 86SYXWLiGhLbj0+rAX/BNFUxe//cZAZ8hkpam61MuxncMGH5MvtUCy/ITLNCGPi2tQSF
 YC+Q==
X-Gm-Message-State: AOAM531Et6krQjGVoDhyZMerOUP69GXO5y0zkXmz42RgQww0LYB7lVOx
 9vDfpuLTk8nTuZhS4ZD+euUWoDZNr6qBPg==
X-Google-Smtp-Source: ABdhPJz0LDIG09dN/m3XoDD68Rfx6wNQFkd8fhtZpedihfQkmO6doeDCey2UvhlJkG+Rx+cQYQMGvw==
X-Received: by 2002:a17:90b:f81:: with SMTP id
 ft1mr8716036pjb.136.1638478152052; 
 Thu, 02 Dec 2021 12:49:12 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/15] linux-user/strace: Adjust get_thread_area for m68k
Date: Thu,  2 Dec 2021 12:49:00 -0800
Message-Id: <20211202204900.50973-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unlike i386, m68k get_thread_area has no arguments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.list | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 278596acd1..72e17b1acf 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -384,8 +384,13 @@
 { TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_get_thread_area
+#if defined(TARGET_I386) && defined(TARGET_ABI32)
 { TARGET_NR_get_thread_area, "get_thread_area", "%s(0x"TARGET_ABI_FMT_lx")",
   NULL, NULL },
+#elif defined(TARGET_M68K)
+{ TARGET_NR_get_thread_area, "get_thread_area" , "%s()",
+  NULL, print_syscall_ret_addr },
+#endif
 #endif
 #ifdef TARGET_NR_gettid
 { TARGET_NR_gettid, "gettid" , "%s()", NULL, NULL },
-- 
2.25.1


