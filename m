Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA160D943
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:27:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVu7-0004yq-ID; Tue, 25 Oct 2022 22:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVu5-0004yf-QN
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:25 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVu4-0001Ed-A3
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:25 -0400
Received: by mail-pg1-x530.google.com with SMTP id 128so13467707pga.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mIARIOtcJM7HMvAJdfElLQQ8Hp1LdQ57Vsk2P28m+M=;
 b=H6cAnz/rCHSbUukd9WRoUT31/7U9ER9wZTlvIPRxnPOr5vYfb/ItoEit3Vrf31aTdV
 AIijV28CcbDl+7W14qU1v26+tFlRH7hXEutBqNjMIHrmIP44hS/G8lDk5Z2N60LV+k9m
 FsKJwpEX5JmoMv7yo4ipqwY4dd9odkd8/M3N0dKXxut9yDGZZ6QiRG8t3Sb3cbiqUh45
 2nieP5JmXxXUclnEtypO0iFvCuMCbMxXe/ZzmDJxSD21QVixIa4FrhzaTS/wVEwwykfo
 yReHTDKYbk+0b+jYmN4aX5oO7FsvciAuLOe4B6xIf42jqBqzY6oJCEUnFcDVD+f0sYGk
 Tm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mIARIOtcJM7HMvAJdfElLQQ8Hp1LdQ57Vsk2P28m+M=;
 b=KN9gyHhq62tnCVAXC2ixgJBz5N704qSNMp/iN27e8vYiJ8Dm56L7MldA4ppKBJrRZ/
 JiCc1cTcdo4UNsUTk7+Hzcqb5596h4z5c4NOxbRHAVqMj2Wra4WMxe43gwoQEssM66lp
 NrLPLb2XNADcwHheHVFlZY8UkisGaZNm7L2h+IImAXMLjyX++SFndku6BmVD+331nI9S
 6ctrfQ4kfpjmpz16I9AJW1w3XgWJk8sXrCGWY0k04z3GrgHhrljRdhNPVBg1spUl8fb9
 pUe6VBgIvpnE4lBSmRObJixIr/B8tO9DrQ4qdZ8r1+HpHF4GDG1esGviEI5/e6TUQs3o
 Wixw==
X-Gm-Message-State: ACrzQf2KlJfNgNa+a2XfUE4wt0nv2TcIde4pg+8h9tGhNjlsNqw1MlYf
 jp0xLvOFDVRg/vdqKGCK9w/h/Nd5PIeJdB4R
X-Google-Smtp-Source: AMsMyM57uNBM006b137+D4vyMJgBgZ1Wk3b0O64plBiglHXcOF1qwuoJK8KjAfPN7L+50WIBLusbQg==
X-Received: by 2002:a05:6a00:2485:b0:561:c0a5:88aa with SMTP id
 c5-20020a056a00248500b00561c0a588aamr41671510pfv.51.1666750342896; 
 Tue, 25 Oct 2022 19:12:22 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 21/47] accel/tcg: Use page_reset_target_data in page_set_flags
Date: Wed, 26 Oct 2022 12:10:50 +1000
Message-Id: <20221026021116.1988449-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Use the existing function for clearing target data.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 478301f227..41b6d5fe26 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1370,6 +1370,9 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
         flags |= PAGE_WRITE_ORG;
     }
     reset = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    if (reset) {
+        page_reset_target_data(start, end);
+    }
     flags &= ~PAGE_RESET;
 
     for (addr = start, len = end - start;
@@ -1387,14 +1390,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
                 (flags & ~p->flags & PAGE_WRITE))) {
             tb_invalidate_phys_page(addr);
         }
-        if (reset) {
-            g_free(p->target_data);
-            p->target_data = NULL;
-            p->flags = flags;
-        } else {
-            /* Using mprotect on a page does not change sticky bits. */
-            p->flags = (p->flags & PAGE_STICKY) | flags;
-        }
+        /* Using mprotect on a page does not change sticky bits. */
+        p->flags = (reset ? 0 : p->flags & PAGE_STICKY) | flags;
     }
 }
 
-- 
2.34.1


