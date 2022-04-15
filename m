Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7181502B52
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:53:31 +0200 (CEST)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMOA-0001x3-NV
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsb-0007oQ-65; Fri, 15 Apr 2022 09:20:53 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsZ-000051-Kt; Fri, 15 Apr 2022 09:20:52 -0400
Received: by mail-ej1-x62b.google.com with SMTP id r13so15358891ejd.5;
 Fri, 15 Apr 2022 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hS2bdLYJd1/LDmXPmGLqhJIOHD/m7LY1SJSJcfAc9/o=;
 b=I40HwVlBeIKyZMUTb2Gk7afIhmwmpLupAZzZi4Y897ChSZQVaOTihGKcnsxP+oQ/Pr
 CBm45J6uSgSl5gwSpVjmz+iYr2oFW4BQr3b5AexGRbf9Q1tbcnaKwGxPJKFm415BYrs+
 988XWVVlKgkCVjvLD5HNYf6I44xw/efygirK+PUKA4HTx9j3xXOE+c+YXIGhO6TK/UkR
 UagKQJZKx2koA3tem70QnbqITmvrn6I4LGCUQCuisYH/ccSqW39AuXkHhHGVB/186XXj
 C4edhSHkw6oPEOhMxDPWustfCzdl1cZpuW58TN3TRJtIidn5JXsZhC9Nnn3HWjTuqYJ9
 58dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hS2bdLYJd1/LDmXPmGLqhJIOHD/m7LY1SJSJcfAc9/o=;
 b=nrecWJcNQr48ClKPBfgZKPBpPwtIOp+w207WqSzAXECtfX5eUdnY1db8qS8SaKqy39
 HnWkEiqRnVKa+4BdKbw0a5uQWSWw390MHMnStEvF/R+XBhgDRrbSXgtPnR/K68oxu6g5
 qtOjPg8j11+v3vUcj6ymhxdnyFKtSXXeiy4yPihU3CzsQk94PgtHrQpJpCoMxfRm4sOv
 9iSxCOXmW4xzmCclKOylvJUK+K4/3r4Bx5ZWoU/hvQ5HSPraTskH1dKqruycXJnLWGmv
 pcL/Zkcea52B2L9nwa3g0e74RethRGFKQ9larYRPrPOIevT5zgkx9OVzcZ6u0GIn4VGC
 zp0g==
X-Gm-Message-State: AOAM532ai9vlLtOUfsdGZwlyrNp7cKZ2cMvyi2PJwsC0vPnaBchxJAOD
 Im7e0NwOjE9FQS+QmZxdRxK8G7hHG3WzKw==
X-Google-Smtp-Source: ABdhPJzCIYE1XerwZTlEYS49V2ELikck6ud62l9P/jr5EF4hiv4EDQCjR31nc4aYBG9c78vLMFj+oQ==
X-Received: by 2002:a17:907:2cc4:b0:6df:a036:a025 with SMTP id
 hg4-20020a1709072cc400b006dfa036a025mr6645721ejc.554.1650028849949; 
 Fri, 15 Apr 2022 06:20:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/26] raw-format: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:57 +0200
Message-Id: <20220415131900.793161-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
 block/raw-format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..45440345b6 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -411,7 +411,7 @@ static void raw_lock_medium(BlockDriverState *bs, bool locked)
     bdrv_lock_medium(bs->file->bs, locked);
 }
 
-static int raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
+static int coroutine_fn raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 {
     BDRVRawState *s = bs->opaque;
     if (s->offset || s->has_size) {
-- 
2.35.1



