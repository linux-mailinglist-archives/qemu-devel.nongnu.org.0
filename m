Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B54D531C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:32:11 +0100 (CET)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPSE-0005j2-8i
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:32:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSPO9-00089E-G3
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:57 -0500
Received: from [2607:f8b0:4864:20::102e] (port=41639
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSPO7-0008Em-UO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:57 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 fs4-20020a17090af28400b001bf5624c0aaso6310287pjb.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 12:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B3xcTA+wkvrIgpyo95I1q6jiSwwgZ6r49IcgTrclRMY=;
 b=I5Th7J3RW8Ztk1SpZaMiJ43ac0JIXrLjDTgASYIvs5LWTlVr+zWW/D1N2lTYJoegmm
 77RpTsW+WH2H4kVffcwgLWcwTpePvU/Bq1SPTIKYQuFaC0L2hNmGcGu5NWX8vPCl5UoY
 WE5U6oinZOHoGPZRKfLmgAtvsQ6ncTzoFzbjBhVMcK/93HOd/9NtTkHgSgohOMqCmMWD
 8RWluwXa9/brkFaEmGBAlTCxLaEJamMS+Y0r/nZl9DT+jUyG5uLt8LBD/cwgGxuHcvel
 +0cvmci57vhveivocFtiq7XpGj0XMjpUXbP8kiNx8HafERUvf69p9fXGdmib//SLngkP
 Hfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3xcTA+wkvrIgpyo95I1q6jiSwwgZ6r49IcgTrclRMY=;
 b=f7fgQxthbQGd/DiTE/2QSjqfDtjuq0yJvaqjeh7lUk7Ay7V+2e0ysX0SuHjEY4FswG
 zRN9Oy5krCSfKjXTxdt/vX6ZVa5Wdt/O30Og6tqf9CRgWwzFO8REzx/b3ESyL/Ok/t6C
 nMn8BlE+gBSpHO3VuiBH/N2i9jEjyiIcXLNRxHoFE/GxzK3a30u28NAq4T1uOhlcoVYa
 inYePy66SJndgdEG5nENOIcD6qLvzm3u0hakiS3Br1/U+fsif5YrDSSU3/MHK2apxFmB
 SlxNMOx4XwyuUcetztXF8BwAn3lFym1HmT1SgqtyTy3kgJSo++vk1MYuS8nhKG9bWRo7
 vwJA==
X-Gm-Message-State: AOAM530e7ceu0L20UIEDYPmXhmfc6IjQ1coCm4oVKQSSK/w3V9wVF1yh
 qZ1gWMOqiS7hs8bxWILaqgOA8iMb22EvZQ==
X-Google-Smtp-Source: ABdhPJwejvbBn8poiHxbtJFRDmhOTw37bcTkZtXYvp8/irAdGYkpj9ugAKHV2d8EcFLjwcidJTGbjQ==
X-Received: by 2002:a17:902:c9d5:b0:153:2161:dff6 with SMTP id
 q21-20020a170902c9d500b001532161dff6mr4309817pld.95.1646944074698; 
 Thu, 10 Mar 2022 12:27:54 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l9-20020a655609000000b0037589f4337dsm6399938pgs.78.2022.03.10.12.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:27:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] tcg/s390x: Fix INDEX_op_bitsel_vec vs VSEL
Date: Thu, 10 Mar 2022 12:27:50 -0800
Message-Id: <20220310202751.594961-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310202751.594961-1-richard.henderson@linaro.org>
References: <20220310202751.594961-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The operands are output in the wrong order: the tcg selector
argument is first, whereas the s390x selector argument is last.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/898
Fixes: 9bca986df88 ("tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 508f1bccc7..3b185b3c96 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2868,7 +2868,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_bitsel_vec:
-        tcg_out_insn(s, VRRe, VSEL, a0, a1, a2, args[3]);
+        tcg_out_insn(s, VRRe, VSEL, a0, a2, args[3], a1);
         break;
 
     case INDEX_op_cmp_vec:
-- 
2.25.1


