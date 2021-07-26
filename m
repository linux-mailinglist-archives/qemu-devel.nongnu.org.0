Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5A3D6905
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:52:50 +0200 (CEST)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Wn-0004YP-Pl
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rw-0002su-1w
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Ru-0006Cn-Km
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:47 -0400
Received: by mail-pl1-x631.google.com with SMTP id e5so11370505pld.6
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ly+uNiRWWBds9bI73JKaYiysd+Nki6elWV6GA/Pshqw=;
 b=r5cx1J3mp+jBYTIZvAiBsgVsw5G7L4whJs8K6m66OtXZKrSPE8DMuLRtVhJemgPBKT
 iPc81R55ilYBdwSWHTbFcDFqIfyg2iH7AVvhbxxcvyIK7Qpkg96hoWbf9sMK7VjAoWq/
 2TD/zhlV3pI8HrV2VIJ/U8UFzmtMiXOuomoMYES2N0YouqYkEqX5vXG/R9eKRLRWEwCv
 SvXddAskL/a4iktBCwq67GZtHwvhsgO09vpjBRI9ZkHzp9pGAvyfhpbGUZj2YjY4v/tT
 LTuah9aWB1E84V0hWaLrj8M6PnFF7BEz9piprBGf9CnBEaIpVlfhP9Dm/ZYI1ocSNG1P
 XXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ly+uNiRWWBds9bI73JKaYiysd+Nki6elWV6GA/Pshqw=;
 b=mGHy2VSX5NcgPHtl587Z4hZcXj6xawv0R38dG1QmqIJlypkhwZ0EsQrU5LeD37CDPh
 xoniVr5qkXLJPZ5ibBVc/X78KEHWW0Avy6aFJLaE/gBa/xl0Mk16ZSJloY44bQQsrIU1
 QtH9NiY1j791IQBHzO4+kmjpujjj0rUAfmikMKMYxdvzLGsYkKxXeRzB3WP43njF/GUM
 5dYhHiYbJsMNY8PsskmczPykfVlv3+cO5mXaIQTwg9upEfe+i0k1iu08Wpjx3J0ZkAkG
 G8qTLy68B81qE7Vh8xbe0oFk46XRWQuv4F540rfHi08141GjweP2Wwx96wkB47lIoB/W
 ykVw==
X-Gm-Message-State: AOAM532T6ByJGnxfDf/pnCjr929lNElGzMKzOliHT4Frxh7y0HlVl/GM
 3PoFGZRPi7CiwmspXA9aYuDiqcouF/eFCA==
X-Google-Smtp-Source: ABdhPJz1wCnNaQy3920I3MnMkCw4Zn0zz+o84AWShn8DX87BequA631MT9hcp65v1VX0uTckzaGPUA==
X-Received: by 2002:a17:902:a50f:b029:11a:b033:e158 with SMTP id
 s15-20020a170902a50fb029011ab033e158mr16321203plq.26.1627336065364; 
 Mon, 26 Jul 2021 14:47:45 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 09/12] hw/ppc/spapr_events: Remove unused variable from
 check_exception
Date: Mon, 26 Jul 2021 11:47:26 -1000
Message-Id: <20210726214729.2062862-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: peter.maydell@linaro.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
hw/ppc/spapr_events.c:937:14: error: variable 'xinfo' set but not used \
    [-Werror,-Wunused-but-set-variable]

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ppc/spapr_events.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0cfc19be19..23e2e2fff1 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -934,7 +934,6 @@ static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
                             uint32_t nret, target_ulong rets)
 {
     uint32_t mask, buf, len, event_len;
-    uint64_t xinfo;
     SpaprEventLogEntry *event;
     struct rtas_error_log header;
     int i;
@@ -944,13 +943,9 @@ static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
         return;
     }
 
-    xinfo = rtas_ld(args, 1);
     mask = rtas_ld(args, 2);
     buf = rtas_ld(args, 4);
     len = rtas_ld(args, 5);
-    if (nargs == 7) {
-        xinfo |= (uint64_t)rtas_ld(args, 6) << 32;
-    }
 
     event = rtas_event_log_dequeue(spapr, mask);
     if (!event) {
-- 
2.25.1


