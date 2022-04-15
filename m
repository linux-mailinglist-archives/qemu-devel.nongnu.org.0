Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E249E502AE2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:23:11 +0200 (CEST)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLuo-00011S-MU
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrN-0006UP-LR; Fri, 15 Apr 2022 09:19:37 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLr0-0007pe-Eg; Fri, 15 Apr 2022 09:19:15 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ks6so15386961ejb.1;
 Fri, 15 Apr 2022 06:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=torG0IiupQqEy7N4LbEac791zMCYlrYAUT0C7dVk8wI=;
 b=gvNgq2YmpQlxhujrEg9SrpQJWf6jp7vGM1opdOIvKztc8V3FR6PnpAG4Yt6iDB3Zbz
 DGPP2HTTySwNOfR/hSq5JLftP3o+UQO5V3PXSInulnGY09p0rwaadUcXtTpNB0UNDMQ0
 MQgp8W2a1dmxdkFnMVN4TVHIWFOstpRPVzgceMyuYPfuvxj71JO7g8qgogBqOdmeHRo2
 fJvGQYE30pUejIJFqYScfifRj4W/HqJSx+1ZRsf2cKG25ysLJ7pMyGwqtqC4Io9Q3Oj/
 jJlxow8S60oJ2+Wi5s8oLbukP04D7Spfj48sNdMcNxdDmQ580NdzdQxGcqJCcquDQpKm
 pwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=torG0IiupQqEy7N4LbEac791zMCYlrYAUT0C7dVk8wI=;
 b=kjT1Dql8Ga5lfgVTauf1cmLRX/IiTgiRjhiFKhXbgVR7dPlD+x6jeB0MvIjSMoDBLV
 IFBv9abJg2B/SO3aOofYtmAiwXYZ/F6UHWScX6Dv0oz8kU9UIeuAempfKfTYmxnp134Z
 q7ASE71ZBo9uLFDwrdHRbBOFm7hw2AyD7rgDHSmHqUlaMsXlFYLorWycAzN8Q1yvZkxX
 D42aFlyp7GKW1R/d6eQgT5RBCHsAKGLRYjXaShShIqB614iRRp6rb35cO15psvcz4uPe
 EEYO8CQngwz47o4juLaRmC3ocEOdcxq3nycyPi7HSD15iH/v/XwG4Ruj70IfKKhIp7pF
 pKhw==
X-Gm-Message-State: AOAM532NYEHJ+UWmxxXKCF61BNQXt6ApC0eFTKKvWzH0+MrgoaK8NC9w
 XFDj37+RhG4yRMWZtkHOeoZxao58bcTJHA==
X-Google-Smtp-Source: ABdhPJxzulSrTt6TtVPSVwxIlOrvwmKXukmsli4dyHxcZIuiyhOWZetZnmdgvc+PQiaijFGlwWFMCg==
X-Received: by 2002:a17:907:3e16:b0:6df:b4f0:5cc2 with SMTP id
 hp22-20020a1709073e1600b006dfb4f05cc2mr6298178ejc.285.1650028752625; 
 Fri, 15 Apr 2022 06:19:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/26] block: remove incorrect coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:35 +0200
Message-Id: <20220415131900.793161-2-pbonzini@redhat.com>
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
 block/block-backend.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..fedf2eca83 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1391,10 +1391,10 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
 }
 
-static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
-                                         int64_t bytes,
-                                         QEMUIOVector *qiov, size_t qiov_offset,
-                                         BdrvRequestFlags flags)
+static int blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                            int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            BdrvRequestFlags flags)
 {
     int ret;
 
-- 
2.35.1



