Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8AE502AF4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:31:23 +0200 (CEST)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM2k-00013A-H6
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrh-00078C-0d; Fri, 15 Apr 2022 09:19:57 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrf-0007wJ-HR; Fri, 15 Apr 2022 09:19:56 -0400
Received: by mail-ej1-x634.google.com with SMTP id t11so15301957eju.13;
 Fri, 15 Apr 2022 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4PvFr4zAg2gcZWEKCQhyWR6VZ3/7rqXVGgtUQ04S3mk=;
 b=ooF/DEXkItBC5lQONrK91Va2mKh8mqAxlyZEssRuhKdMafnFjKz0DgwBP8H1S00Y3q
 NQphNc6yxcUefZ/hEFTxn3mO6aDYaj5wD8xw3/W9RYfvH/5LTfv1uryJENjqRuBhW/a1
 fwPDoQdxm4e+pEniSTMyJahU0d89QgNbAaVs2tQHwiy93wvMDz9Qds640wWzFCaDTxa3
 Ohd9y9H/KQ2WVSjq0HxK5J4kuhOIcllUgN4P0CK0ssYsyyt8wO1pLHqkNKaX3dvGwPKa
 UHzYvVLVaIGR8iJgaR5Wso4luhX95zfjAQdK3ZcOZ5G1mXc5FgrG1zEpfAgVpZkPhirP
 THwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4PvFr4zAg2gcZWEKCQhyWR6VZ3/7rqXVGgtUQ04S3mk=;
 b=ebzab9B95sYv1tmJdnhldos8zUnb8idhm0dfQxVOcqb8bfvoTume6ac6QfOKy3UqPf
 FqvTFwtpn9P1ZiASDK2mqHPk1DHGc78B5qgAjntgpc4lbgk5wINgfAKMLcuCzioaBI/P
 Waf8u+W2Jn4Mv45ljR98ga0t3V0cYW6jVA6g3cQaLJ6H57dc9DbZZ31od7/Eh7tINeSM
 n1EhduZkfp0eTs3n0tPKg5/5JZM3jTjwoljougAwMlWIhLIDPjTYQZObt5Z/plSnwsHU
 OrfdYoQzr9Iy6N/Eeip4KjX/3MS6yWCQ9Q71UlP1aPm69IZD+/ycF7dtVxD9InvfE+qg
 K2Zg==
X-Gm-Message-State: AOAM5308ZQzrtjjCn36Orj5kvMTtKBMTkN0tbVhYSYA4rCfArNNK9AkH
 a9Rl1giFddL522GCF8+LHQZqOClxi23UcQ==
X-Google-Smtp-Source: ABdhPJxW5nyWWf8mkKn9L5EkjQKNTHPT3+4L9Dugo4YcX0rFlISYDnD/m+sTFCLHGBeO2HBH9Mb/CA==
X-Received: by 2002:a17:906:e18:b0:6e8:69c2:528c with SMTP id
 l24-20020a1709060e1800b006e869c2528cmr6064766eji.439.1650028793751; 
 Fri, 15 Apr 2022 06:19:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/26] nfs: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:45 +0200
Message-Id: <20220415131900.793161-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
 block/nfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nfs.c b/block/nfs.c
index 444c40b458..596ebe98cb 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -223,7 +223,7 @@ static void nfs_process_write(void *arg)
     qemu_mutex_unlock(&client->mutex);
 }
 
-static void nfs_co_init_task(BlockDriverState *bs, NFSRPC *task)
+static void coroutine_fn nfs_co_init_task(BlockDriverState *bs, NFSRPC *task)
 {
     *task = (NFSRPC) {
         .co             = qemu_coroutine_self(),
-- 
2.35.1



