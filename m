Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD634502AEB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:27:10 +0200 (CEST)
Received: from localhost ([::1]:51340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLyf-0002hB-Ou
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrP-0006Ve-GT; Fri, 15 Apr 2022 09:19:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrK-0007q0-7X; Fri, 15 Apr 2022 09:19:38 -0400
Received: by mail-ed1-x530.google.com with SMTP id v15so9872053edb.12;
 Fri, 15 Apr 2022 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ib6o6UHLWxb5ux1+EZCHcprngTMPkaRjB18C9Z4T9yw=;
 b=cWRvcAfTyWTjPdWRn1QWLL7QhIKQPDLTrIWD42tJE9lRUHV/KlzUn62Rd4p+BX+eB9
 wOMltAQ7urLqw9OA3aKvYFjUtteyxsJrhaovvdO6HNNcbq5iftXa01AT5WExblihzGNv
 /kK9mNpBsjz5QlAa7jPvwbd+P+FREiyem+SGEQAPHDbQz5ln7x7Hhj51N1DVnxK5dl47
 fGD8SPI/RuQlJMLQcNs6eJYucXF2s3H7MseVih16Vkn0yIxZYauqT81KadfB5MPJa0bk
 tkFYDbvd0qaKw/3H3jmGKNh9WFZqL+p5K4zi0kKqhlbR7sTcVr7p7gxtBe0xVF9Tx62k
 inBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ib6o6UHLWxb5ux1+EZCHcprngTMPkaRjB18C9Z4T9yw=;
 b=1UHvOE5A5FhCXCSkZwzDurntuxflIOjSU4Ve0vj40jRRat/qKR3Tr0KDL99bp/lDTF
 clDoiVBK0yC/RTmoGo6zx/pk0bwIWfc9ArX8yxEqmz6s50xO/An2vV0002jv/aPVI95u
 boxKnmdIEiVJ+BCNUHISuYtOD9ix7KApoIWc6KkPQ/x+5X9SZKjVoopF0mi0xhM0+Q7I
 SFCrfIxNYLjR90uSJ9IWTXDlza8x5ctx74O/NuIrIWLfxpaKz6XFp4yBBjnjyBf92/Lj
 TVnU9Pw/N4n/1s9MPbDtjmLAh3DHTfnFbueFkEAPuybU4HGTl4//yWx+RonH+aMgN6h8
 CiMQ==
X-Gm-Message-State: AOAM533DCVlpgpUOv1Vv4ycojz+9dO+PHn8FA2bXf8bjhIVMPy0S/1a7
 OZFuNe1jOPORPLc8zKOklnzr4v8vRYerpw==
X-Google-Smtp-Source: ABdhPJzHgsqAX9vGmU8iqwX966/45EtXYixesbSFZn+Xnt0UtpGiuvlErcwpf32buCen/ol0Ws3p9w==
X-Received: by 2002:a05:6402:1e8a:b0:41d:af82:613e with SMTP id
 f10-20020a0564021e8a00b0041daf82613emr8211933edf.18.1650028764460; 
 Fri, 15 Apr 2022 06:19:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/26] coroutine: remove incorrect coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:38 +0200
Message-Id: <20220415131900.793161-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 2 +-
 util/qemu-coroutine.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 284571badb..2d9211faff 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -92,7 +92,7 @@ void coroutine_fn qemu_coroutine_yield(void);
 /**
  * Get the AioContext of the given coroutine
  */
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co);
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co);
 
 /**
  * Get the currently executing coroutine
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index c03b2422ff..9f2bd96fa0 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -200,7 +200,7 @@ bool qemu_coroutine_entered(Coroutine *co)
     return co->caller;
 }
 
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co)
 {
     return co->ctx;
 }
-- 
2.35.1



