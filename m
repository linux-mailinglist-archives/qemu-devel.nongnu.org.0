Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A00502B0E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:38:04 +0200 (CEST)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM9E-0000tf-23
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrh-00078G-1M; Fri, 15 Apr 2022 09:19:57 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrd-0007vk-IA; Fri, 15 Apr 2022 09:19:56 -0400
Received: by mail-ej1-x629.google.com with SMTP id g18so15314061ejc.10;
 Fri, 15 Apr 2022 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8phT8uSP5urYracjPftwmXBdQ0AaFj1Ryv0L5uPnOpA=;
 b=ZGafIZYrqKZSgx/HJ032uuhi8fXOpBt7QSDfO0LiL5jVUSVji0iDhVydjJwyabqAx0
 rCr21PqiM/btFnbTSJsm4EH65VepXoXlR0db3bChenRqWx1/oR8wJbFzBQjOSYrdTrtw
 uIkevVVkSR5ews45qzLI2kV/jbMp8UVzD8bZRUj7rP62fCb1kOTiarae5Tbr+y+xAaIV
 sfSmdEWtrTcm9n8ArQFKiI29Cnc3lf9FSKvxyMHKI5pVMrZ3vWAfSocQ7UFYlEAqI8Lt
 RdKrtRPKmDpsiAvcApSuzC6nkIZkA2Mb1qSGF1zWLdHWzD8UUOJFStdWjPcx7z7JRCok
 Vybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8phT8uSP5urYracjPftwmXBdQ0AaFj1Ryv0L5uPnOpA=;
 b=6gBU4Vxcg68kgvn1u2bsk1cQipJw3XiDbBMeuW4/TRAsN+d7Z858vM04wWWdq46lG1
 IALuEIG8JWOPmXqkJ90WUI1PxHJsObGC4z3ayPbLTCT6m1soTaKu730DN7UTtlIgltXL
 +mkWEWlop8i3wGYOQs4PRigmdQ/o6XA5BfgxtKgwBIqIry5xzHQo8aarFTy+xkMuAfRh
 IvEyjrr3kZhxZ5NjEqDmrnS1PO5YHJXZEWhbrHA4CzqpBwG81GHVYMLbYdLe9/peSfo5
 GfIgGaOKvJzFtW3dLbux2BfGzBZrkCD2cqdW6uxduRAQgupM0LoXSWQbjl5qWgsHuT9n
 kQuQ==
X-Gm-Message-State: AOAM530dGouDv/CV5dkYXAeOJjv3mbSFX+8LM+kumLQ87/wfLEd3VKAG
 I4nCn83dhTTlu/6A/jvUwE7hhzv2XiMKhg==
X-Google-Smtp-Source: ABdhPJxYyRt720lzU8uypKad3E6gNCLnXhYR/N1iwFBn9GTzRI5ncsW3DYbn97Jz2iQ0g0cGKBHy8A==
X-Received: by 2002:a17:907:da0:b0:6df:d4a4:9d0f with SMTP id
 go32-20020a1709070da000b006dfd4a49d0fmr6349207ejc.407.1650028791808; 
 Fri, 15 Apr 2022 06:19:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/26] nbd: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:44 +0200
Message-Id: <20220415131900.793161-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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
 block/nbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5af4deac3f..a4c8d661ad 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -974,11 +974,11 @@ static void nbd_iter_request_error(NBDReplyChunkIter *iter, int ret)
  * nbd_reply_chunk_iter_receive
  * The pointer stored in @payload requires g_free() to free it.
  */
-static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
-                                         NBDReplyChunkIter *iter,
-                                         uint64_t handle,
-                                         QEMUIOVector *qiov, NBDReply *reply,
-                                         void **payload)
+static bool coroutine_fn nbd_reply_chunk_iter_receive(BDRVNBDState *s,
+                                                      NBDReplyChunkIter *iter,
+                                                      uint64_t handle,
+                                                      QEMUIOVector *qiov, NBDReply *reply,
+                                                      void **payload)
 {
     int ret, request_ret;
     NBDReply local_reply;
-- 
2.35.1



