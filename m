Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC03AE187
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:46:47 +0200 (CEST)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv91S-0002Jp-3t
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qC-00041i-Eg
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8py-0005Eh-BK
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:08 -0400
Received: by mail-pf1-x433.google.com with SMTP id t32so1055567pfg.2
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/XHDjw4MYlw4TzcceGLn/7Fa6hqyEFYWUnUbqhZR8HE=;
 b=Dg8cqfzr9Up7ZP3euQObJVampYAhWqPdptpZqslA3J1WAQ2dPJzwuQE5f9yt2KDHux
 iQy8RWe6nr0wodpdSVVCB0FR7DeoxgUtQpHpZa2nPXSC8+41zEWxpw1hKcig+diCmVqt
 1jCw5pUk5BHajfO7W4J+R1N9cyjzgT4vI6HfDWJ8I/emJQhfALFWFMc9/BQXQGUC9Vyf
 2/uVCazf9ZDKCoW7VKanKIF+78iYwboPiI+CcS0pOdDeaKlJLUB00M19rjgjjGzLXFvL
 DKCw13iSQ/EzW6RR5PMPho4qo+iDQRYCNTyvaPubMUMvuYfFRZJM/tSbW1Dah5yhPEwu
 3YDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/XHDjw4MYlw4TzcceGLn/7Fa6hqyEFYWUnUbqhZR8HE=;
 b=QYbu++cNkHLKoQTEZgXCS8x46+ayht/RLIIWJahHT/Iekv+C8mfhnS8KMJ9pYK5yZg
 sCNTaawOtvR+Z6bI4cA7+c1AKrCanpGWTVdfX34K7G/IxKzBaHaQWeZATcYJLlSAahQZ
 7tETRbvC7TIFFq1WWsf1cmIhmHxTPbOke4xE/2Kn3WhYmC34MQ6poc7godN6evxmo6Pb
 QoxGjJ2nBBJxhLtL4qj/aD1jrCONT3IunVF3Gn4qUSkm4tTcjgKQ6DHV1x7ZvVM4wq4m
 tpPIW8K/3y63HQ2vOuVe+R++UapnkEvcJ/x++FkAiO/HeQGtCx8bSvkrVe/aIR2tYy2w
 C1bg==
X-Gm-Message-State: AOAM530AswPFmL4gsocHqnLDiUMRd3d4USB59ymHVZR3rSr0WrC8eppq
 DQFS7jSlRSKDgzVfegIdAhadz+joE1snlA==
X-Google-Smtp-Source: ABdhPJz2/BGhNURESYtcfCesVqV2vU07YwLDCjEuoHcos5ce5wvT6tDl4pyE5XqcSLLZwZwUW0gtyg==
X-Received: by 2002:a62:ce4b:0:b029:301:ec00:eed9 with SMTP id
 y72-20020a62ce4b0000b0290301ec00eed9mr7864906pfg.44.1624239292580; 
 Sun, 20 Jun 2021 18:34:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/26] target/s390x: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:33 -0700
Message-Id: <20210621013439.1791385-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index e243624d2a..4bb5d82a37 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -697,12 +697,7 @@ static bool use_goto_tb(DisasContext *s, uint64_t dest)
     if (unlikely(use_exit_tb(s))) {
         return false;
     }
-#ifndef CONFIG_USER_ONLY
-    return (dest & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) ||
-           (dest & TARGET_PAGE_MASK) == (s->base.pc_next & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&s->base, dest);
 }
 
 static void account_noninline_branch(DisasContext *s, int cc_op)
-- 
2.25.1


