Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538744DAA83
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:15:36 +0100 (CET)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMwZ-0003EF-4j
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:15:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgW-0002qp-2q
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:59:00 -0400
Received: from [2607:f8b0:4864:20::42f] (port=34528
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgU-0006UW-L7
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:59 -0400
Received: by mail-pf1-x42f.google.com with SMTP id l8so2578182pfu.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9CNoFSrWjAjukly+g7lYy0zjZhRUxJXZZvZuVjkY44=;
 b=QavHItxKnGLg7l3wI+xP9mWbiHSOlXiCS4g0093ctY0djcbS+rQ010qN+Hc5qWYh4P
 OtYMmO44pEo9NSpBg6JaPNOmWh2wuXNMi2ucGgnI5aYQWCj1GcnJo2kL9F1V/VT5CXOb
 qe6tx7JJZynPMfiPc6OrhTp0bGSg0+fMvwJ2rWqBZTAIY/JLJUBhMP/Hp6ljq3uOuN6Y
 qntWAuZJNvVdcRNzkjdj0lFq7xuUEBiM5Mj3RAzUe0dZr9cHhiDAj0AHSLHYTRu2Yu9J
 f457fgEjlmYpll0LBlOtXTPVrs/yimr6zvb4L3a640R4oPXyS4GfN4X/sUCImLS4BawB
 Ygqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z9CNoFSrWjAjukly+g7lYy0zjZhRUxJXZZvZuVjkY44=;
 b=qfZs9wVjn/guBRY6pOrP/1yvBdwIYn34hPjRtd/b+RAv5g7tByyYuORnIa/bGoE6X0
 oOOxwbmicWZsOwcD8xrbVrK3IZHJ+AS13wlv4GNeNiaAOiOL3TdhXSy0gNw12KUWfG8r
 iPwxHrB51NWhIbpxNqQr3oN/7tSuqTzN9yTRsgdE9u4QkauUGiNy0cwP7N7g99DweMXP
 bnL0z2Tg6M9OSoTtDxKYkrfc0bsAsD7a3k2eVhBjE2xPImDuXCVgDoGKdHX3Xf6GKzqT
 wQFsZkA88tN6HvmhTL+ihseMD/Bjg9K1hnc5O8XuZ/I3aNis79TDfg4NrCavSF/zv1o7
 AUBA==
X-Gm-Message-State: AOAM532pHp0MlgTNrlooDWySyJWYmPtk7TODGzmyJyxmZqZ2xeonF5bA
 xD+gDfbpcud4TGMQABnq46Yjnegz2cyDLg==
X-Google-Smtp-Source: ABdhPJzGNYF8mfqNWmEcDZJBCoNnI4yv3iebPDIOQUMISwLIwRM51NR9V8kGYRP5d3NgmZgPnfiycg==
X-Received: by 2002:a05:6a02:182:b0:374:5a57:cbf9 with SMTP id
 bj2-20020a056a02018200b003745a57cbf9mr26613861pgb.616.1647410337302; 
 Tue, 15 Mar 2022 22:58:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/17] linux-user/strace: Adjust get_thread_area for m68k
Date: Tue, 15 Mar 2022 22:58:39 -0700
Message-Id: <20220316055840.727571-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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


