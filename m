Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B9442C55
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:16:58 +0100 (CET)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrmj-0002Dj-JP
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0003pB-HC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:10 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:36414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0000v6-Hz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: by mail-qt1-x836.google.com with SMTP id h14so17662662qtb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fofFGJJJzbXM7L3Ibz3JhPAmpo8LElJ1YWB6iIwHWsU=;
 b=T1aQLka/Z4qsgfQcDhmJWZA+a8r2wa48hUR3iOXD0iCkVcKOk5xMMcqP4nYC+rRBV+
 sLTYZgv//gkfwYndZ07hqTdlxt5Q/75C+R3HUzhy4L2zFVx3bKWkTVU5liJVYp7EhAo3
 d4rkf5gv0DTL3QnBymRCyYbjsDs4TtmFYf9Q8uHSCGovNHx5OjTXNfCW0K40gsDmtkXd
 lD8qYkOwRalBxJsA9W7JFcP0v7AAZGqDkO+ukULfnrezPJEwgJDs0gh+yNX1bvjkNIKH
 WZhuYwzEtNqchTM9p0HYHK/ySBU6W/cKD6QSVCyUthHuHaGdU0CmlOxeBuunkvRWpj7L
 Tbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fofFGJJJzbXM7L3Ibz3JhPAmpo8LElJ1YWB6iIwHWsU=;
 b=oivBjY/GHLFcMDPP++5XG2SyF0bYOpVHs5CuZ6PQgNH/bSRruC3n+QjqlXqqRJoPET
 teqAaKkqMNCLZnu95BhlqiKc9W7vxmHUBD1huMaju/gFGXJFw2DAJmJbq+5D6X+pe4Ye
 ++f/V0rr0c1eHhlVEC1x8XGHWtcloBSYHs1Ha6cuakjJICkzhY5BcTo28MHxtKmWQEoJ
 1CocHsWZixTxtfyGL26vvqoa+yQhDi+ROUE5wqyY2/rzgjCK+VLqBmGMnwEZOcsqEEmJ
 y2QMXseZ3/YaQzYaQeUU6+gy30KpuFJXFSEOZ7uH8SntEguo5cEm9cyoWZNzlP+CClpr
 Uulw==
X-Gm-Message-State: AOAM531XGbk3SrucDgDtCOncngQQ9Ucxvpndk0XdNVJAnPlcj3SsjeC/
 QMS8LaoA42Rsh27wMGKs0DOM+D33/4onMw==
X-Google-Smtp-Source: ABdhPJy8NqDKgcOZ+8T9lJrxQJYLRYBlsLbw8lVtjP5IkRvw4c2zgRVqmvqEjoB1KqMnb2xvTfJrfg==
X-Received: by 2002:ac8:7d92:: with SMTP id c18mr7686746qtd.324.1635851274479; 
 Tue, 02 Nov 2021 04:07:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/60] target/arm: Use cpu_loop_exit_sigsegv for mte tag lookup
Date: Tue,  2 Nov 2021 07:07:02 -0400
Message-Id: <20211102110740.215699-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new os interface for raising the exception,
rather than calling arm_cpu_tlb_fill directly.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 724175210b..e09b7e46a2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -84,10 +84,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uintptr_t index;
 
     if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
-        /* SIGSEGV */
-        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
-                         ptr_mmu_idx, false, ra);
-        g_assert_not_reached();
+        cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
+                              !(flags & PAGE_VALID), ra);
     }
 
     /* Require both MAP_ANON and PROT_MTE for the page. */
-- 
2.25.1


