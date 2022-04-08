Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB74F9B4A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:03:30 +0200 (CEST)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncs1B-0001Ou-9X
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrso-0008CL-5Y
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:54:50 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrsm-0003u2-L5
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:54:49 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bq8so18457775ejb.10
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RvB6WmUyabhe4EY+P1jACVM2phgaOzNjeVgtjqCztg=;
 b=YpXssetPCMJVAp5fK20w2bhQd4q7LP8J3hqTsHNiYj7E/PGrAAZMWvf7MnoOI3x3+w
 jnuNQzMprrqlYP0VCtAdVQfwm6bg1Sa7SZc+MyZvJFJXE+BMVQJw0T6esEnL3txH6of3
 huURKwVbMxDiqXK36jrsHHbpK+eqp06VDZ/eWWMldGgiLIdCFPSCFyNGv0ZgqrR0mKr+
 iLEKY5wFPlIvKXIoQr1VQtk3k68DFb4A8ddt6yJXrpiCgyFrDEMnmSSWgJUJuTU/dDla
 i4ppY8oJsb8iLYFMAHYjNxzE/kv2pgjdnDpZApOQsaamNOXRvWdf8xxBKaxadgC9xUw2
 LH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RvB6WmUyabhe4EY+P1jACVM2phgaOzNjeVgtjqCztg=;
 b=BEfw+vzQNM3Mly01RjWjU4jAuBNt9UITMFzMfjvzkVvZXaGu3+trUGceSqCWX/YNH1
 mXe3sDJrjamOA1379EgGsnZUBcEU3Q6W22z+pVf0QG+w7qt8sJth0b6Wq6BbvmixK8hJ
 vCF5HbVghuHQ2P4aqQ7bcvuTib8kBJG/dNvDXxoI7isXl6x0N/i7C/sZsSokg5arhXKE
 jJ2Ity4t/OFsOgQuYk0vjf8MBNAwukhFHl/d18WodzPoY4QaL+hAKh3o60MT1ZuMKOLF
 yyNAlJeuZ7n5D7ZusDbqZCvPcYriwLa7ZZKlLABgXEbkfca+AWtAqV5jWjNLvDsu/pzh
 1mkg==
X-Gm-Message-State: AOAM532RiEp/eeHILjAen1b+d2ngYbIy0qj5h77rKoyUE+cF1BgFRUSq
 H+Iep8BWCLnMivFMww3TB7Jt3g==
X-Google-Smtp-Source: ABdhPJwX/bHGn0WdDCL4jZRBF1FcEfPlWnNjGul8m02ic2NOd6LAqzfkQKfqKBZlvOSRGWxREs0L1w==
X-Received: by 2002:a17:907:8a13:b0:6e8:289d:c744 with SMTP id
 sc19-20020a1709078a1300b006e8289dc744mr12274489ejc.150.1649436887070; 
 Fri, 08 Apr 2022 09:54:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a1709066d8700b006d4b4d137fbsm8914280ejt.50.2022.04.08.09.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:54:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9F681FFC5;
 Fri,  8 Apr 2022 17:47:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/15] accel/tcg: add heuristic to invalidate al TBs in a
 page [hack!]
Date: Fri,  8 Apr 2022 17:47:42 +0100
Message-Id: <20220408164742.2844631-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a dumb attempt to reduce to the execution time of UEFI booted
kernels and almost certainly not what the final solution should be.

The problem is if we have generated JIT code from running firmware we
can spend a lot of time carefully invalidating every TB in a page when
the kernel that eventually boots and clears all the pages in RAM.

This fix simply assumes any write to the start of the page should
invalidate everything in the page. Once that is done following writes
to the page should all follow the fast path.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 625c46dd9b..67884260fa 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1830,6 +1830,16 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
                                   uintptr_t retaddr)
 {
     PageDesc *p = page_find(start >> TARGET_PAGE_BITS);
+    unsigned int nr = start & ~TARGET_PAGE_MASK;
+
+    /*
+     * Assume any write to the start of the page is start of clearing
+     * the whole page. To avoid coming back multiple times lets just
+     * invalidate everything first.
+     */
+    if (nr == 0) {
+        len = TARGET_PAGE_SIZE;
+    }
 
     if (trace_event_get_state_backends(TRACE_TB_INVALIDATE_PHYS_PAGE_FAST)) {
         TranslationBlock *tb = tcg_tb_lookup(retaddr);
@@ -1850,10 +1860,8 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
         build_page_bitmap(p);
     }
     if (p->code_bitmap) {
-        unsigned int nr;
         unsigned long b;
 
-        nr = start & ~TARGET_PAGE_MASK;
         b = p->code_bitmap[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG - 1));
         if (b & ((1 << len) - 1)) {
             goto do_invalidate;
-- 
2.30.2


