Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED46C4F05
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04G-0002nK-U9; Wed, 22 Mar 2023 11:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf049-0002hJ-8q
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:53 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf047-0007GP-50
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:52 -0400
Received: by mail-pj1-x1029.google.com with SMTP id j13so18782030pjd.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+avOkff6EBvJ8K9x1TsSkw5p9567zBA1o+YX6GdDwE=;
 b=RIZOgz7M6JeOVcnlBJHQ2Js8KewnfOHsGUanHxxJBrTWlfKPQEOd60UxU0+L7vrogk
 W5A7UJybTQNmD6f+XWo0+UjZHu1cv97g1l3IbWuBLS3Wcd1vTtI8vIoQhrrNMibp8bVZ
 9eVZqszFEKl2alhEPHnFZDALER/Eb22Q+v5FLKPliVArDW0yiVAcwkjiI6eKStUBfw4H
 5n9w7i3AyU52HjcqV9jWNbrDaGiCGheSvPt6fNJbwIZsFkH0xF90axPbKaOT/fbM1u+/
 fL2ORZMgHGIdXDCID559SPMdmPNwGkv+7MsSQD5EjGEVGlxHuD7liqPeRuZsi8IcjzVg
 XYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+avOkff6EBvJ8K9x1TsSkw5p9567zBA1o+YX6GdDwE=;
 b=dQDiJklKi723M1dTuhAY8CiMfeKRpsMSky6Cxuo40qWwAgA7GemcN1IO43nbRT8TwQ
 WKp8UO63EDxLAT7LXYiwiL5NdQaDnudqACnqcbxQpm9MmMk/31Ayg2Dn+jQsG5JQHG9K
 V+/1boHBu95rox2vmRqE98lmkuRWDMB8DSW5OqhourspJTs4e6X0+AxvopwhuW6lvNjB
 MtSfQwF17jJU/AJn/bFogrfMsyKVhckcMChu3tCzHYsMWqAe6nJyrWkHcqSQMMorUlnR
 Wry2bKgDLaTRxiSXQOIT+kPB5Heuuh8eaGVAB/Nzgd6w+y+KzMCsLXQ5TvkjGZVZu4rU
 pNRA==
X-Gm-Message-State: AO0yUKWp5ccJ+e2ykLLk8kC/xscK6ZnNLu6Ep10c6o94XAzol+QntWQ0
 TvIqbSKzsHvbHEauDY0k7F227CjMPnJSsrEXQJI=
X-Google-Smtp-Source: AK7set/QwvqrH+tgCm52PXOpP9XLn0iXL8hIabcfzafFUNce7Gm1Zfx774dYoi4xot1oWzhZAmRxvA==
X-Received: by 2002:a17:903:183:b0:19c:cf89:b7ee with SMTP id
 z3-20020a170903018300b0019ccf89b7eemr2632109plg.69.1679497669899; 
 Wed, 22 Mar 2023 08:07:49 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 03/11] linux-user: Diagnose misaligned -R size
Date: Wed, 22 Mar 2023 08:07:36 -0700
Message-Id: <20230322150744.175010-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

We have been enforcing host page alignment for the non-R
fallback of MAX_RESERVED_VA, but failing to enforce for -R.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4b18461969..39d9bd4d7a 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -793,6 +793,12 @@ int main(int argc, char **argv, char **envp)
      */
     max_reserved_va = MAX_RESERVED_VA(cpu);
     if (reserved_va != 0) {
+        if (reserved_va % qemu_host_page_size) {
+            char *s = size_to_str(qemu_host_page_size);
+            fprintf(stderr, "Reserved virtual address not aligned mod %s\n", s);
+            g_free(s);
+            exit(EXIT_FAILURE);
+        }
         if (max_reserved_va && reserved_va > max_reserved_va) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
-- 
2.34.1


