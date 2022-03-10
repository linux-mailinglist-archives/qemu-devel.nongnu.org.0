Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C854D4793
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:02:25 +0100 (CET)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIQy-00029K-Mt
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:02:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9r-0006qd-0z; Thu, 10 Mar 2022 07:44:43 -0500
Received: from [2a00:1450:4864:20::435] (port=34502
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9n-0005Dq-Fa; Thu, 10 Mar 2022 07:44:42 -0500
Received: by mail-wr1-x435.google.com with SMTP id j26so7806453wrb.1;
 Thu, 10 Mar 2022 04:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=am/TeS80vxEOm9BXIFg633pgOE8+WRH4m0argteqkpg=;
 b=qHg6TlwwD5CdUOC6kYl6trqwS8tBU1xIh1C/qyoZl7iLHa+UyJQpzTL4aYCBn+Rvhe
 TIWJOFlODmCpiTcYjt/sAknS6pt5DcF0cLDfAf+3/h8mM9F3XAJ3PMCljzPZRC6l9NUK
 BaTo8zeWgzz8Ge/EpY8ncQh95KI8CKwQD0YjowXgdxNHKqVabInsnpy3/f4GSwQ88yf8
 CELM4K/6eKa2AUkFnuJJXqUf3haIgljP9e2YoSVQuS7Qaq7Nau2PsjJlWLUecyT2Qy8H
 cXGqCI7iA4zeVhObkJLVBRKflAFQ8z2sHj6HP3dsRWbu9aXvoaCMt0c+3U0gxZpi0116
 LyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=am/TeS80vxEOm9BXIFg633pgOE8+WRH4m0argteqkpg=;
 b=Ut3c9ZFz4nVWQaprfSCwDjWyUCN4z9zvba27vuqAplLTGI2FSNPAhivKWOzJXPnUlK
 UUvt0tb/fXltyvE60wd4oXv04HFH0BslMxVTsF5E9VLW8YnEYMeumPIjP0PUSMWptr3e
 Y+vAf/dGDmE0FmWgtLC8cTxssi+hcgtzlhpuo0e4BRDh78sSTLWVKNE6ind0Vk6Ox7Lz
 QAe+3gJ8xNwZ6et/cAPSj4sN8RGyG6M1SSwC9XNYwtxaHOm7uz/ZxEgw9vmOPhKlhrgg
 OhgwULzxTtUHqyrwdI2FKAOjSpBwjZmtEuz13u43/BG/VxFDpLjGn0BpaQGKYyEA9D/q
 Mvyw==
X-Gm-Message-State: AOAM530J+y72E47C19AYK7YSbPJVQuurYT0Om0/hO/sYwYgMnDrRiuIQ
 /GDeYNkJZub5bi3qX075hQdGtGsDQDw=
X-Google-Smtp-Source: ABdhPJzPreD3s7gt3+jS9Qf6fX7WuxMJHRd/eYZCwblo+b1yPzg/aXlJPr2eyNsd/Yocs1HheTWYVA==
X-Received: by 2002:a05:6000:1561:b0:203:7b90:1da0 with SMTP id
 1-20020a056000156100b002037b901da0mr3502884wrz.629.1646916276638; 
 Thu, 10 Mar 2022 04:44:36 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/35] /basic/in_coroutine
Date: Thu, 10 Mar 2022 13:43:55 +0100
Message-Id: <20220310124413.1102441-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
 tests/unit/test-coroutine.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index bc75050463..6ad653adda 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -16,14 +16,14 @@
 #include "qemu/coroutine_int.h"
 #include "qemu/lockable.h"
 
-#if 0
 /*
  * Check that qemu_in_coroutine() works
  */
 
-static void coroutine_fn verify_in_coroutine(void *opaque)
+static CoroutineAction verify_in_coroutine(void *opaque)
 {
     g_assert(qemu_in_coroutine());
+    return COROUTINE_CONTINUE;
 }
 
 static void test_in_coroutine(void)
@@ -36,7 +36,6 @@ static void test_in_coroutine(void)
     qemu_coroutine_enter(coroutine);
 }
 
-#endif
 /*
  * Check that qemu_coroutine_self() works
  */
@@ -700,8 +699,8 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/nesting", test_nesting);
     g_test_add_func("/basic/self", test_self);
     g_test_add_func("/basic/entered", test_entered);
-#if 0
     g_test_add_func("/basic/in_coroutine", test_in_coroutine);
+#if 0
     g_test_add_func("/basic/order", test_order);
     g_test_add_func("/locking/co-mutex", test_co_mutex);
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
-- 
2.35.1



