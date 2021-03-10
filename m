Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C53339DA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:21:52 +0100 (CET)
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvyR-0000It-T3
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpQ-000179-93
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:32 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpO-0006xe-Nl
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:32 -0500
Received: by mail-ed1-x533.google.com with SMTP id w9so27082626edt.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=w85G2CUiwE1GHjdDwyuM2cqZc0OcAHDLs6RNahlZj9g=;
 b=XpyDhRpIe4hKWdzxTZ2v5bRa6qJxtQ7NziXXPwGzBA5oUOVl4ht6VOy3zRebfcGurb
 xQo4lyZgRYqWStZv0eaYxr7qataBsBxgeU+35mm9y6Uef0MAoR1p1ZV2/mqdUJoN4weX
 UmpdzE4HTJtRw8p6XTHHzm86MRwCi9ZYWDHii8hczji4dMzbyIUdZOhrgd5Ky4ynhATB
 cJ18YO0MvkInwPsEwTQCUm69r4/rSxvt2bhuezHljx3Zyh+9Oq2FboCQ6c0sN2Q8PQng
 w8cam0X2Yy/TQ4QEswLlj0Rsa4EzsLMRYDb0DQd1DERRdY2+DHz8//EotZS0Nz2sGZxl
 hWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=w85G2CUiwE1GHjdDwyuM2cqZc0OcAHDLs6RNahlZj9g=;
 b=pPBptZOAkT1FcoWucs/Jz62AbJEKNNLmjXuDf4DiuBBYmLN/COy/0em4XWOa32dieg
 qT2GWplgPohdI2s8x+wIX8cSKjiy+GlGdgoCequJI3Twk/hvI0HXyI/uYlY8wQoQQTFc
 nR8+1+db1xwpb49qB58GKmV9GinNn1tF/yeeLa+S1GFl2Cqe+vF5uPVsycSuglqMOJoQ
 8Nlrt/okBsFId9+dtKWr+kdDbDWZh0mcT2N64JWaVdfCLNJEMWVCvAoUAYrJ7C/NpNmA
 54D9UvJhe1oO3fVAA84iTs7pJQWrOQrRNdME/BRvt+QeGLT1j6nkFS7+k1P3RsQpJA+U
 jV5Q==
X-Gm-Message-State: AOAM530gis/if2OGezYTCJA8lwC4oF4Y1/SLmuskIo3oosB6lVEO36Sa
 GmAJ9VYlJ55i1DjoGZzSDY4=
X-Google-Smtp-Source: ABdhPJyBMil+FfABXktP+nNQL6S9MXQOG19IjpC4I9u7TrpbtaTV8/AaKW1iiJybgcDZ/6jLquJ1Rw==
X-Received: by 2002:a50:ec0e:: with SMTP id g14mr2437318edr.264.1615371149481; 
 Wed, 10 Mar 2021 02:12:29 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:29 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 06/10] hw/net: ne2000: Remove the logic of padding short
 frames in the receive path
Date: Wed, 10 Mar 2021 18:11:53 +0800
Message-Id: <20210310101157.15136-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/ne2000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 6c17ee1ae2..b0a120ece6 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -167,15 +167,12 @@ static int ne2000_buffer_full(NE2000State *s)
     return 0;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     NE2000State *s = qemu_get_nic_opaque(nc);
     size_t size = size_;
     uint8_t *p;
     unsigned int total_len, next, avail, len, index, mcast_idx;
-    uint8_t buf1[60];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -213,15 +210,6 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
         }
     }
 
-
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     index = s->curpag << 8;
     if (index >= NE2000_PMEM_END) {
         index = s->start;
-- 
2.17.1


