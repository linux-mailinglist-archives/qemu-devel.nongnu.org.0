Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37600502AE9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:26:37 +0200 (CEST)
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLy8-0000X9-8k
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrq-0007FM-HD; Fri, 15 Apr 2022 09:20:25 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrp-0008BI-3s; Fri, 15 Apr 2022 09:20:06 -0400
Received: by mail-ej1-x636.google.com with SMTP id s18so15439190ejr.0;
 Fri, 15 Apr 2022 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YqP5juE8so3NQtrdckWYrtnqcc5LeThHKJxEEA5BQq0=;
 b=cuk3B0GaxoSM1SM9vO5BvzYFHZTTX0d+VGLVDs4w0mPsjzG6vhGVqirkZC4y6fI8Vm
 eoCj819w3Sv353peJiD+kp9XrIpj6cQZtm9Pp0D6NtZqv8EW07PRv/0x8Ym56udOfd4N
 wL1q0euzZ+1hxHbnxcvw0KprS7bbqwrYfy+k3rvLJfLYTOV1oU02W5wO83QW7J+jGaqd
 tg+PabhnXa2m7O4gVxRnngK9S7jMNSbjPrrMEjPsUvS6UvAs0vt3xWmX1RBFaK4TsezV
 6ZG6gbNaeHb+c5dWql1b7QWS+IpIqU1zpYF2J1hvtx7TRxYvFFMHFmb/hLkyXE4d3jxa
 Sz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YqP5juE8so3NQtrdckWYrtnqcc5LeThHKJxEEA5BQq0=;
 b=ejpppJX5oIHJ4QEoAdITnceP+NiqnZb6qDr4S0NUYoZmRDCQIstuYAgfqkV7FxOz7i
 ELpFSNWnvORN4ugAPSdSjX48zlvGJfhNraPzzj4GfH4wv1OngiN/FRjHMVGSdShvimd7
 DYxlRDS5uJKIwVXg3hOnTZmM5lbStE0p4LMKbdpKamT7MXVAlm+eFnUPpbZaW2uEOBG6
 LoqrUHwPIh8mf7IQmZpAEVWdWyPtlrX8MFILgHge58LgcCUI/buRP/tnvOzqaYcyVTEJ
 y/HpVcrfEFLx1nLwAvAGizgXtXb28LL07qX8xKo3Z81lX0mo286B/bfVlotU3C1HfM0M
 AsKw==
X-Gm-Message-State: AOAM5310wixpenvzodRwz5qeruifmAAgNfbLXluA/aH1BSWJreCxtupO
 kzCktx7+wuI8M5QITNiDlGNFsHKAkwuBiQ==
X-Google-Smtp-Source: ABdhPJwHECUxruE+OKB0o6WQ4efdPJk3/tXismSRFzzu/kC1NOUF98ToqS0nueIy1dMnrJt0fPDtvg==
X-Received: by 2002:a17:906:1615:b0:6bb:150f:adf8 with SMTP id
 m21-20020a170906161500b006bb150fadf8mr6210533ejd.272.1650028803367; 
 Fri, 15 Apr 2022 06:20:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/26] parallels: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:47 +0200
Message-Id: <20220415131900.793161-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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
 block/parallels.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8879b7027a..bee2ff023d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,8 +165,9 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
-static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
-                                 int nb_sectors, int *pnum)
+static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
+					      int64_t sector_num,
+					      int nb_sectors, int *pnum)
 {
     int ret = 0;
     BDRVParallelsState *s = bs->opaque;
-- 
2.35.1



