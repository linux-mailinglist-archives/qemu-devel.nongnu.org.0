Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D560C65DC7E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 20:02:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD90f-0005lq-2s; Wed, 04 Jan 2023 14:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD90X-0005lF-Dl
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:01:01 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD90V-0003Q6-Lz
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 14:01:01 -0500
Received: by mail-pf1-x435.google.com with SMTP id b145so19441234pfb.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 11:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YvZMPcOUxmObQLWYm+QiH6r1q3TcpfTIRIDtyxjsal0=;
 b=R1BVcRgQu65KrZGiPHDWrroBQJANQWHEuyw5bXDKqImTnHuDPEPuwECLqh6UitFgJA
 BmTtk706nicPvwsqV9M9nzfcw+GvCuXAgg9Pgw+W31IGTC1JzGIQd+UdGwwizjvEkGfG
 abaxKSrqeGnKfBNU6eHw/C7T1yxYK1lUcc8aJhIYrETupUGxWA+K6oV3qpRIwPabS8DM
 bgG66lAqTIzilrTw0l0/5nK3gdBOXBn2eVEERu0zbhNPfKI36nEElo96c9GPcUWq5i0B
 xQA3svruFFjhKNZWKDtSBxBHXK4kbRy2EFtK6F4C2I722knoPoIW0n+B9u82BaOWRPIB
 +ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YvZMPcOUxmObQLWYm+QiH6r1q3TcpfTIRIDtyxjsal0=;
 b=qYMHESzAjIGjXlv7h4IBFB7CQW6fcYn1jxLRoYx6YmuwEas4KPYEVnH8Qg/aKvoP1h
 Qe069M9GSwyof1L2+rW8rxklANB92hu8409+C/BqJnG6/Ea6p/HJY0dN+Oe2mBT/oVTM
 01UJpbsKXtEPhXFCyyzFR1imVlHgf1bnpkwYgnekx/JBwK+PAs/EDxDUfDTUH8WHy/Lg
 oWMKNcv2OaV5R5Py9u9SYQSn9RJfBZkAKA+kf3F9xCXON1kS3zt4Yk4Cg+bjidbtevji
 JYNoGapdFzbzL62hID7OcAu1HlSxu9YXrZCGM6enSFvm5KKsojkdfTS2gGZkuv6dlMmb
 1xww==
X-Gm-Message-State: AFqh2koW4ZW3rRsmUPJ0UcYqkh1hEPxqk1Qq7YHiI0exV0SDMumwkeRL
 hdWULWhohjp9IE4I7n9/esetY11hsGifLPBK
X-Google-Smtp-Source: AMrXdXsB+NFHFqeWUaccd5YD4YWIasn3gcWbCUuBeO2K1Yj/I+YK0liIO6AIllZ0Gt5Kr3S2gLaVgw==
X-Received: by 2002:aa7:955d:0:b0:582:d5e3:12a7 with SMTP id
 w29-20020aa7955d000000b00582d5e312a7mr5340627pfq.6.1672858858153; 
 Wed, 04 Jan 2023 11:00:58 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 w10-20020aa7954a000000b00581e6a72abfsm11066472pfq.5.2023.01.04.11.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 11:00:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	idan.horowitz@gmail.com,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix sve_probe_page
Date: Wed,  4 Jan 2023 11:00:56 -0800
Message-Id: <20230104190056.305143-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Don't dereference CPUTLBEntryFull until we verify that
the page is valid.  Move the other user-only info field
updates after the valid check to match.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1412
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1afeadf9c8..521fc9b969 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5354,15 +5354,10 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
 #ifdef CONFIG_USER_ONLY
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
-    memset(&info->attrs, 0, sizeof(info->attrs));
-    /* Require both ANON and MTE; see allocation_tag_mem(). */
-    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
 #else
     CPUTLBEntryFull *full;
     flags = probe_access_full(env, addr, access_type, mmu_idx, nofault,
                               &info->host, &full, retaddr);
-    info->attrs = full->attrs;
-    info->tagged = full->pte_attrs == 0xf0;
 #endif
     info->flags = flags;
 
@@ -5371,6 +5366,15 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
         return false;
     }
 
+#ifdef CONFIG_USER_ONLY
+    memset(&info->attrs, 0, sizeof(info->attrs));
+    /* Require both ANON and MTE; see allocation_tag_mem(). */
+    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
+#else
+    info->attrs = full->attrs;
+    info->tagged = full->pte_attrs == 0xf0;
+#endif
+
     /* Ensure that info->host[] is relative to addr, not addr + mem_off. */
     info->host -= mem_off;
     return true;
-- 
2.34.1


