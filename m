Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEF153B15C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:58:21 +0200 (CEST)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwa6O-0003m4-7R
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjM-0002jT-Sr
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:32 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjJ-0005IK-SJ
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:32 -0400
Received: by mail-pl1-x633.google.com with SMTP id u18so3292631plb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=frtjY4kXdf+btOwpubtlaBEs6SblJPqCp8QSyGl5a7Y=;
 b=VTmk8IiNt9HkLNsIVTJc4F6AqqSh+hPO3FTrAKuPK6uUjBie/aqkuMVeFjPeC0xtO9
 mX7emgRH8rYHzRquWS65XPN3r0ZUUDdS4fK68WqlsZW/KJKltIqYRzg82VWg0QSXuSIK
 czgZAeVBuiwSqoJexlHnKSpoU2J645y7ZQ5J2QNw/TMtcAXoLHMu81x6K3lpGPvdtoBI
 n9YiRTuczfb8lXTtUQjUejSo1ie2Uj5esc3v/tG1VMtweBykl7eCRZKdjTYGImCuWgTE
 Uv63XfjErdbCeE+KhYbxPp3C9Dzf0QVmT0GgjYx08io3nOkL8HnFzI2YtRE1/flZ3drh
 RHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=frtjY4kXdf+btOwpubtlaBEs6SblJPqCp8QSyGl5a7Y=;
 b=gERGSCPX2CezaSGtacKdZVyZXKlzt0eecalwpx7Lg2xmWH2qckWAemeGSXM1ZxwbO9
 3pzjlpiZbCu0jgmL3nLF3KxnMabtcEqnRY4kFgoW4MdF5tnJ1NRm3n9ToiVN7B2HK9PK
 DuqaLwhu72QPg3RLhjsW9wb7/BG3QbCmf82jHvgBLHzid7RIg39d5fLPivsbvCtyORJM
 ZPJP+h3bIpR8Fx/SvhXEweDbhN6536DHe9gI3aYnJ8pnt5cI5nlUX2UpJXS1qeXejp4V
 F11znckiWkzWfQY9wnBndwYUdrOBAkC+2gviMReERzRl0Ze6jW+uJrkaXe360/6wUn39
 o6kQ==
X-Gm-Message-State: AOAM532mrRpnQ4ttFvXb4PoyChn7JUK+0YftZs2hYed3Xxm3CJq3Okbw
 AZnjqIElWa6VHUnea68Sw6FYZA3zk03KsA==
X-Google-Smtp-Source: ABdhPJzNdbDNKx/hcu3hOtttrq433I38wcxMukQWewvClidfCj6GAuELzXvpWGI1UEPshlbbQj8U7Q==
X-Received: by 2002:a17:902:f647:b0:161:67af:6bf0 with SMTP id
 m7-20020a170902f64700b0016167af6bf0mr2232147plg.100.1654133663260; 
 Wed, 01 Jun 2022 18:34:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 16/17] linux-user/strace: Adjust get_thread_area for m68k
Date: Wed,  1 Jun 2022 18:34:00 -0700
Message-Id: <20220602013401.303699-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Unlike i386, m68k get_thread_area has no arguments.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
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
2.34.1


