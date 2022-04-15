Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D8502AE7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:25:01 +0200 (CEST)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLwb-0006zb-0s
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrQ-0006We-Jr; Fri, 15 Apr 2022 09:19:41 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrN-0007qT-QG; Fri, 15 Apr 2022 09:19:40 -0400
Received: by mail-ej1-x62d.google.com with SMTP id t11so15300697eju.13;
 Fri, 15 Apr 2022 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4T8GsUtcx8uBNvR21n6Vfvw1RaJjYiS0GAlgoMt4AQA=;
 b=P/A9Czoz6xVVqMHAUSKhBpObf5mBFKp19xfVE2c/nkwVRc/rRX/Wrul1gmW+kx0rQf
 iGA8OUwnKUEASpaoBFn5pc0U2pT4+GzsradSotX3cF6CnCWaD3Jv95VcitwY/5rI5rQ5
 C0jXqTuWmwtpFYFjybvhdQ5AoXuoeVhPuMluidtsYldIyUrK8GYv7G5e+32fraaw1YJx
 AHN48eK7jsvaDi+t2XhCrZDk+Iqv8xQuy9xAydQgSjipOnkM/RpnFT7FV9g2s1hL4uPv
 kH/xacI2UvpdG3wdOBx1xfJ2gaACycueucdTNi8G0Uuak3hsuH1mXi5hU8IUH/Jx4qii
 TqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4T8GsUtcx8uBNvR21n6Vfvw1RaJjYiS0GAlgoMt4AQA=;
 b=6zxDMelQZBwJiz9ccb3nCKB1pIOm2kiPRjv7dNAyefQkG0zIX7JlLHCtP9DatDaPqF
 yktazfGu+Z++AvUVZn6+k6zoxBBKkO/j0//LAE5KdB9h0IQIsei8YzeYcQMBWgjJnPg3
 f3D4Ivmfcm7tgqvkeSaDEdtC1PMG9wh5qk8OneikHW7L5cISCKigtmmLlE6j5uRFUmIH
 WcILJWsJsjnpseuBZh2swNqPxsAUzcJUBeOSy/YXHKk5ZiXSOdLGSnX9KuucEz2GArLL
 YNAqKrplPEA7JFi/QWEN/KWaCnWX3cFQYAc0ITTWedxjBWRJyomnITZdJV6vrOVbRwaH
 KSZQ==
X-Gm-Message-State: AOAM533VJ4BcW+hSamggMj4vCMOeNyjCrKISTUU5O4JAnfdAP6G8aJfS
 q8VR92EdU2jzAZsoH2jsxUSUunS4ShVFtw==
X-Google-Smtp-Source: ABdhPJz1bEn3aiX4E4I1h1GtxOUyvYdH6prHtR1RdPu61d2HgFxX13HV8ERKH5MuutC/XcpuYUOAnQ==
X-Received: by 2002:a17:907:9493:b0:6ef:6ade:92da with SMTP id
 dm19-20020a170907949300b006ef6ade92damr614693ejc.630.1650028774300; 
 Fri, 15 Apr 2022 06:19:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/26] blkverify: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:40 +0200
Message-Id: <20220415131900.793161-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
 block/blkverify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blkverify.c b/block/blkverify.c
index e4a37af3b2..020b1ae7b6 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -258,7 +258,7 @@ blkverify_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return blkverify_co_prwv(bs, &r, offset, bytes, qiov, qiov, flags, true);
 }
 
-static int blkverify_co_flush(BlockDriverState *bs)
+static int coroutine_fn blkverify_co_flush(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
-- 
2.35.1



