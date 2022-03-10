Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE54D4D4844
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:42:21 +0100 (CET)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJ3c-0001Sr-W0
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:42:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9d-0006dX-Hv; Thu, 10 Mar 2022 07:44:30 -0500
Received: from [2a00:1450:4864:20::436] (port=41656
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9c-0005BR-1R; Thu, 10 Mar 2022 07:44:29 -0500
Received: by mail-wr1-x436.google.com with SMTP id i8so7760122wrr.8;
 Thu, 10 Mar 2022 04:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svq297zy+T3gF7Thq7aDCBc0NI2G3Ftc2FuvIDZJFWk=;
 b=OeHeRQtTghGlgUYBd3wFNSlLZPWFE3BcD/H4+n2/v4fYQ/MC0QNaj337jCZxiTwTUR
 e3hEveWClkIbk/FRQ/AMA5hrpRu/CPqp6qXu147tErvwDiIrsgQl6yBdFBNb9PR9DPO8
 PBwd0AP4N1xYKEJQXg5TKHa5G7HJ1/D3X9Xr15Sr2/zES8Vgmai3NG2BALJUhwb5Gpvi
 TelJrLpZNJ0F0vPEttXNhuoApoEx3wbN+jMv5oobCrAA1KQ8Pbco5GCWlORGEyFyXUtv
 BeNO/o884YWm7718wEwKOkIhZzVx9V3BkVGK++yZgUSDFjFPu6ieUm0QIi5tBBSZxWkk
 bfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=svq297zy+T3gF7Thq7aDCBc0NI2G3Ftc2FuvIDZJFWk=;
 b=WNvHFJIbBzsyJzhnq6q56jDIC7HUeP58IUQSAHlKYrD1YhNgui/Myub5+popBmwB1Q
 E/kGuHBwwkH1bKGF59/q/qMIc53Z9IDgaoam3cQvPlp2Q7qWtzPCPvwlFaXLQClbQbYS
 OldyJyJhecf/wgczxDAFDNy68IYv3HoVPiCFVndffZInxBD5+UlWzB87watKbsKThH8m
 Us2WBcckaIzulQRWh3oD5m2GL7fbcrz8o21wFuGh17zMChYd8/yJHobl4083Vxy0RAVa
 Zsj7zq1wqtQmNrmwScIb26Pla2eIb1QhnA55mri2FwseTscfQK7fwJsB4NZaIiPiwqs8
 JRKQ==
X-Gm-Message-State: AOAM532M8lD0OOnY3ZU22Ei0E2XIwSsBFjsAU4ZMksXD8O1S4CYNwtHF
 oONn4Sj9zZyY1C6ELGsSCtzP+8Z5WIE=
X-Google-Smtp-Source: ABdhPJyZFgjJxqzRugrp56q/3Gi+tH//9tarwQj0fDDUwPdJCjPGhC5Cn2BKMPiOxzYmsZQCy9aZCw==
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id
 bk9-20020a0560001d8900b001edb6d5cbdamr3377458wrb.514.1646916266518; 
 Thu, 10 Mar 2022 04:44:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/35] /basic/lifecycle
Date: Thu, 10 Mar 2022 13:43:46 +0100
Message-Id: <20220310124413.1102441-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index c230c2fa6e..3670750c5b 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -423,16 +423,18 @@ static void test_co_rwlock_downgrade(void)
 
     g_assert(c1_done);
 }
+#endif
 
 /*
  * Check that creation, enter, and return work
  */
 
-static void coroutine_fn set_and_exit(void *opaque)
+static CoroutineAction set_and_exit(void *opaque)
 {
     bool *done = opaque;
 
     *done = true;
+    return COROUTINE_CONTINUE;
 }
 
 static void test_lifecycle(void)
@@ -452,6 +454,7 @@ static void test_lifecycle(void)
     g_assert(done); /* expect done to be true (second time) */
 }
 
+#if 0
 
 #define RECORD_SIZE 10 /* Leave some room for expansion */
 struct coroutine_position {
@@ -655,8 +658,8 @@ int main(int argc, char **argv)
     }
 #endif
 
-#if 0
     g_test_add_func("/basic/lifecycle", test_lifecycle);
+#if 0
     g_test_add_func("/basic/yield", test_yield);
     g_test_add_func("/basic/nesting", test_nesting);
     g_test_add_func("/basic/self", test_self);
-- 
2.35.1



