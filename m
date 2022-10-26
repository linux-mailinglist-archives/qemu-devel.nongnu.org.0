Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0960D933
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:21:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVto-0004vp-Pp; Tue, 25 Oct 2022 22:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtm-0004vh-Sz
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:06 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtl-0001B8-Ct
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:06 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso833876pjc.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gb/nMW+mdaB1UoEyVrxFQHTy4I+gWCCARfJVMhyCqRE=;
 b=xfgq9ufMu9sH3CHQP1lLVsA1BtcE9DKpQwSnZHyHvAS3LHSPem1Jr3RAAKMyjXaRov
 HmucgTTv1hWmN7SAEJnQPXONB053IeUmvFrzbw4p/jrsGlw8UXIQej1e8jkVEEcEvupk
 VS6jAep9wWV6MsTxK/oIXGALN/WtIilkJvXhTetQEwaSm/a5lK7u2JSiX11rqUVGt0Wq
 AQ0bkGmEtM8Tl5zpUbX7ueBbU5/eKX5zrJ9Pkt72VYXLUD9usCuv7jNfgxLlPX47cmwd
 tkSN/QZqWeES3/xR0Mfg+SInXbnkZiH6CBd1mAAlmNWteIG/S1PDE4xLf3x02hoMdUZe
 mxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gb/nMW+mdaB1UoEyVrxFQHTy4I+gWCCARfJVMhyCqRE=;
 b=Be4CB4APpchWc8fKSbYs+GrNqsfZCx3QsXSZ05kKPzU4RuGtd4LO9WAA56GgEFTsGV
 08TCIwwIGManIWkw1jgZmFhr/ClQKDQfFkHN04zwdQdM7GquzbkZ/QvxwsQvsM2Wr9lC
 UhhdJQ76lI+GXSnlUzIDvkWIJ8x37EuWVpgfn4SHAUPG1RpHdaHnjrBLlzVyABVg0qQA
 Hd61bT5ulzeMT0/eVtSf5GQB7fB6esvx6UJ1XDTd4g2pyZHEcVW6DukVok+dhHHbjXJN
 laLiA7XH95mdtd7I5DE6qbAtMJtjQKCetcpFULs44QYuktMYVW+Gq7Gipbn6rNNZoHU7
 8p4g==
X-Gm-Message-State: ACrzQf3OmeQ0wnx8yEw9cZZNl6un6X2l6ebJVcU5H/mBAQpCzQ1kPhD3
 4dcr+fifnaSkUuBaq/ekKFkWZiyvhpxOqGno
X-Google-Smtp-Source: AMsMyM7aJBWuMbHqDbXfnXGd0kzbD36n8a965qGLJxiV0B0mqGKUjdNZ7WZfShf0hhO6d4DEg4Frhg==
X-Received: by 2002:a17:903:40cb:b0:17f:6e08:6eac with SMTP id
 t11-20020a17090340cb00b0017f6e086eacmr41735848pld.80.1666750324097; 
 Tue, 25 Oct 2022 19:12:04 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 14/47] accel/tcg: Remove duplicate store to tb->page_addr[]
Date: Wed, 26 Oct 2022 12:10:43 +1000
Message-Id: <20221026021116.1988449-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we added the fast path, we initialized page_addr[] early.
These stores in and around tb_page_add() are redundant; remove them.

Fixes: 50627f1b7b1 ("accel/tcg: Add fast path for translator_ld*")
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 9af5cb49e0..7f4e1e1299 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -405,7 +405,6 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
 
     assert_page_locked(p);
 
-    tb->page_addr[n] = page_addr;
     tb->page_next[n] = p->first_tb;
 #ifndef CONFIG_USER_ONLY
     page_already_protected = p->first_tb != (uintptr_t)NULL;
@@ -461,8 +460,6 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     tb_page_add(p, tb, 0, phys_pc);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
-    } else {
-        tb->page_addr[1] = -1;
     }
 
     /* add in the hash table */
-- 
2.34.1


