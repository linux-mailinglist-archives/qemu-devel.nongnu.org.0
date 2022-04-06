Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416354F57BB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:19:05 +0200 (CEST)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc0sa-0000Xo-7M
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nc0ZU-00035C-Qz
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:59:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nc0ZS-0002iN-MS
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:59:19 -0400
Received: by mail-pl1-x62d.google.com with SMTP id s11so1281276pla.8
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 00:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FI0rEWO2Hrb8q+RXCZbtt8y5SbloA1chKG+gNH/8y4Y=;
 b=QchEAlmv7PpP+aGOGOkPBfMLZ3m7r7+Xi3+f2OkffErvtNeZh6QIhECaBZZ+RI0koO
 I5WPVvyj4RDEjtiU3znjuIgx99A82zoSOv9U225qhBm88aQc0Yj+1fVb7PpuHc/Dc9d2
 leXuDutzGOfPLJTvvMfRy7Wo1zJdhEjpxEPA6L7CuMddQt6znDbDgwjkKsJP2Gk/aSVJ
 qsRdvIJ7OImQtpPfBEJleQRpjjs3fAx1QD4+AKCY3F0F3cLMQtj95xOVZLz8ZSywmmfu
 DdDzfbc3BDzX8fJ+gExEHut0CgEb4tD0uLfkygKBWMVp0+Te2n/vtKlELORovuuDiJl4
 kjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FI0rEWO2Hrb8q+RXCZbtt8y5SbloA1chKG+gNH/8y4Y=;
 b=o9DQo+LywbGLugC0ho9y1Rn9VR4isWMu3o8f2yQTz+zHrZ0//Svqm0GJx9KAtoHEv2
 MMYeUgVSmv0Jp37ybyaIa+n8idguFgGcc8amzQI41fPQgMP1lTUAoE2qkogWaaFssMMC
 vbN1hQzpOG+ncOA95XAS4Js69zjYa6jIHKABlgJF0EohspJIrfN9+YPpN7qETtoucNMH
 R74n6d5xkDA6MpFo3rwRsezhYV7NZX5VpWU9MSyyBGpgFmcEKfbcOLsplubaI/luPO5N
 qlsOHPQpjD1trr1bU2jg0DvZ/otgCDGOuaDAyZHy8mir1pPgDS57tYaDVbK63oii+Wh5
 HG5g==
X-Gm-Message-State: AOAM533fY4UuVkq5JdbTiLzbgaX8hxgzBvHr8nThtUgfmjVxNIhGGQUw
 Sh5AiYs7DoK7fLSqeVhicpdy
X-Google-Smtp-Source: ABdhPJwZgFCaL/+cmb47xphTVoEKXsxlB+mvxdB0R28ZfmOSv4KMVEOs5/8Ka9i1hi/nYJM1/V0UPQ==
X-Received: by 2002:a17:90a:5407:b0:1bf:43ce:f11b with SMTP id
 z7-20020a17090a540700b001bf43cef11bmr8649494pjh.31.1649231957400; 
 Wed, 06 Apr 2022 00:59:17 -0700 (PDT)
Received: from localhost ([139.177.225.247]) by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b00398677b6f25sm15570456pgn.70.2022.04.06.00.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:59:16 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com
Subject: [PATCH v4 1/6] block: Support passing NULL ops to blk_set_dev_ops()
Date: Wed,  6 Apr 2022 15:59:16 +0800
Message-Id: <20220406075921.105-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075921.105-1-xieyongji@bytedance.com>
References: <20220406075921.105-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This supports passing NULL ops to blk_set_dev_ops()
so that we can remove stale ops in some cases.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..35457a6a1d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1062,7 +1062,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
     blk->dev_opaque = opaque;
 
     /* Are we currently quiesced? Should we enforce this right now? */
-    if (blk->quiesce_counter && ops->drained_begin) {
+    if (blk->quiesce_counter && ops && ops->drained_begin) {
         ops->drained_begin(opaque);
     }
 }
-- 
2.20.1


