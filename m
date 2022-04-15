Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A18502B23
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:41:14 +0200 (CEST)
Received: from localhost ([::1]:52470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMCF-0005wb-C2
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsC-0007G1-F2; Fri, 15 Apr 2022 09:20:31 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLs6-0008IM-NK; Fri, 15 Apr 2022 09:20:24 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l7so15389971ejn.2;
 Fri, 15 Apr 2022 06:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HeXge5WfJ8/fiVVZWO8ojQpT8h7eMYKWb2NNZzpR868=;
 b=PdajPXAs+iRZzPcQ072YAwyfcOEA1H1jky+uOtDC0/v5RSxW95FsVwOwbP6b2Hjd3e
 HPdDghgacceRtmlxfLn5pkfNPykaM8/Jssw0pY5LaTmPZAFrOqvKOduKHokQ4Qq3WvRW
 IxpYW4VgMxB4pVGUyFbm8xf2IDpRgmzwIZmhAX22tZUB0kwIT787iKEjgvm51fntj0Sc
 qeuTLiwyMZsLYnCfbCOTrhGldH6PVYxaFXDAYo0XrM3j+adprMuZoi6qOxHxii5AE9xP
 229LvV8wV05NM9HT7gdbP+dur2wNS8Z2s7MHll/O1tiIeDHvYNDlLIYZyJSMYudUUGQs
 TQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HeXge5WfJ8/fiVVZWO8ojQpT8h7eMYKWb2NNZzpR868=;
 b=KFXTiocicSL3P0E1IqlJGyTb279oEU8kwfjTTxJPZHNWtfpw40lTuKGeEdUxgVnPX5
 uGnkkVAPRtsDN4Kf8D3HOnKW55bkWwVadvAZzAi5l2vaoaMxfsE3nA/PEXcpJHO17AmJ
 GR0jjMI6YM4MtW00u++x/lf4zzdbQurIlaI87RpXW4LwL4MI+IXWzk1JpH47zgCiWFhW
 B1YzuNVNVMbsGct3waQlMDng2el4MyVzDPiJmzdEaWhPvNlxjUZo5gMIzaaiWONxXnJu
 CiOJcxZdqzC0QfdfeVjsImwuEuLPMRLFSa4I5TQir5Q0q5Elh95N2iBjciR+4DU8CrDZ
 5nEQ==
X-Gm-Message-State: AOAM532sx1nJNsX77Lt5l62pjh+48HmYlwBGFqRe20K9AYa3J9ifapUG
 zfH0QJUed6+Jk/8inVHobvpiS8/4yXclSA==
X-Google-Smtp-Source: ABdhPJwWYmt0QPpfVeCvWhsJjkuSCW5DMdTxz2Vq2/VQTTu3c6NEBrtykOxRfNuZCaNiLtvBxXtv7A==
X-Received: by 2002:a17:907:da6:b0:6ec:f599:b053 with SMTP id
 go38-20020a1709070da600b006ecf599b053mr4186330ejc.503.1650028819090; 
 Fri, 15 Apr 2022 06:20:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/26] copy-before-write: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:49 +0200
Message-Id: <20220415131900.793161-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
 block/copy-before-write.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a8a06fdc09..5ad9693b13 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -165,9 +165,9 @@ static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
  * It's guaranteed that guest writes will not interact in the region until
  * cbw_snapshot_read_unlock() called.
  */
-static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes,
-                                        int64_t *pnum, BdrvChild **file)
+static coroutine_fn BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
+                                                     int64_t offset, int64_t bytes,
+                                                     int64_t *pnum, BdrvChild **file)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BlockReq *req = g_new(BlockReq, 1);
@@ -197,7 +197,7 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
     return req;
 }
 
-static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+static coroutine_fn void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-- 
2.35.1



