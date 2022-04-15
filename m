Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527A502AEF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:28:51 +0200 (CEST)
Received: from localhost ([::1]:56302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM0I-0005y5-Gi
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrU-0006Yt-SK; Fri, 15 Apr 2022 09:19:44 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrT-0007rU-9F; Fri, 15 Apr 2022 09:19:44 -0400
Received: by mail-ed1-x52b.google.com with SMTP id 11so4890026edw.0;
 Fri, 15 Apr 2022 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTccvXQfBFjZvIdZ5/aO1foOdW3bzyYb3HDSU/+9G78=;
 b=MHn6jvBKLCt7vPOsdV7CIATZnsRWX0BspX2leoq4WzlPEJhB0Zepfl7cd078iYtD1c
 KnEZgJWCqGnf4XsyC74ZUf0JxwDEhKscsPwUq+fDxb7wzSq7hkjmtaOExiO2kugvnLjI
 5fgWRaf0iNdMBNgmc1PY7UxkN8JEJdMJMUGrDPN/fJcP3EKl/jdxNGuN/iX5wWBgnWjq
 ukD/0+dJnsmF9fU2micOMSnu70dDpb8MDhcwkWhc5xPFcRhDI21GuW4xAV8RQslGreXO
 r6L3hjSZXzPPJK8JE/hf8S0hTGOblgg1z6r7bgb1cenCbQgpKlKnhaveTfC02z8kA6a3
 hgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WTccvXQfBFjZvIdZ5/aO1foOdW3bzyYb3HDSU/+9G78=;
 b=KSURYN/9E7b0eTW8Vr/NAnVTcgFKyD3JW0pzoSemDICsDiz2/VBjUI3uejCBrLbwTQ
 jrka8B+rttpY0DSsvuzpCYHTpk6DhrZ417xMAaoELuc+jIpKDvB/bt/U7qR1bYBjbTK0
 1KiEqJkmlXPTq5rxVi3LmA43MjMIlu9D5W+lBISz6qvY//toQSkIBP9yShne4297Pyjv
 5zduWk7VGowXKXZLFG0CcT9sNIA2/PPJgxl2Vq7s+UffSF/VMw3Yc41fCYNzCR6ROQIC
 NxXrzgJ2SRpUyAi1Xu6SbuTuJkhG45OeFPLuw3Bi2SFBHddncTXZw6Yd1xS5r57uM7St
 iW/Q==
X-Gm-Message-State: AOAM531GcbNdPfaS2Z1AyMadSr1rJs/qeWCMuTSd0eXRbaxDZaIZd4YA
 QSeZcZ3xruishLG2tRjvvi+f1P3mc9svgg==
X-Google-Smtp-Source: ABdhPJyQOYZafFPDc9usCVLlpV1d2yObpI3RjNBJubTfCTjrksZQqzqOtzMfSVfs4s/W02wT/rB7MQ==
X-Received: by 2002:aa7:d543:0:b0:416:13eb:6fec with SMTP id
 u3-20020aa7d543000000b0041613eb6fecmr8413935edr.348.1650028781296; 
 Fri, 15 Apr 2022 06:19:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/26] file-posix: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:42 +0200
Message-Id: <20220415131900.793161-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index bfd9b21111..cf7b5531c8 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2143,7 +2143,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
 #endif
 }
 
-static int raw_co_flush_to_disk(BlockDriverState *bs)
+static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
-- 
2.35.1



