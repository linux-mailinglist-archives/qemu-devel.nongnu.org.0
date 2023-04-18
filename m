Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE26E55BA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 02:23:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poZ5n-0003dW-O0; Mon, 17 Apr 2023 20:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZ5g-0003cz-AO; Mon, 17 Apr 2023 20:21:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZ5e-0004By-LR; Mon, 17 Apr 2023 20:20:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2472dc49239so981442a91.1; 
 Mon, 17 Apr 2023 17:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681777255; x=1684369255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dWJVIgmyRObvaq/Ar8iTO2Oc9PM9c02tbdxo8EqiCjU=;
 b=srNzET7KD2PMX9UZUfG1FlnX5AYNzMc+lPIRVp9pZNTUR+9xk1uamqdQYRlsRrPK7z
 O6VMepvuko+ZMcPeIM73vey6Hy53Ta198+0kV29C+S5ebEtGyLxrMgbK9vXOCAb6r5g1
 zM8BZFr/H+5uXCIkukDYforyb37dHLcJLBphhmk64E+eaqEjsLO8vm/ue7SppYeaLRMv
 gtFbUYLQIAtfq2dHi5xKrRKVypLZ2mSPCDzzfirA6A/4iskXPev/ARPqLWtsBHnMSOfl
 3g9eY+xTBkiUNMfg+JWgUZ2Ixi2ND8qsQRQG3NZkRqqE+jpjYz3dALVwStXnPwa187ha
 X2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681777255; x=1684369255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dWJVIgmyRObvaq/Ar8iTO2Oc9PM9c02tbdxo8EqiCjU=;
 b=GpGotnvfgjvWfDkMS6TJMlobborpDxoz3TH4m7012JoU0ygWVqp/cLNfmp3GdJAbVV
 RGlB4bK/Oi3hAR1r0+2RsrYLtUSSgb0M6lwkzdR3oIHw3+pAKO7LNikLNmjLLwD125xK
 6MzFwOD400LwiDzgmeZiP0Z/cnmyVEGhCzZVfw3qzuYTZkM8WnSVfwcCWWX58+2uMzpu
 UGmiYCWxjUTkRPsew/o0i2MitWMlFBpfXZj1sRzp74Xbd9PQ+DIcDTM57fXwtUHmpF3h
 ZP9lXgdI+PInjpgqViRApa7/WO0l4FwsMRdvbNTEcZsBGp640XMgXpBCnqsFKV95hzTh
 +saA==
X-Gm-Message-State: AAQBX9fW2BMSqsg4CnlMEm/LipEBPAJtHP2aOcRrJ6kqsUJjK4YYemzc
 cgfnSli9+wggXooquUwIS6JANxJIU0g=
X-Google-Smtp-Source: AKy350YZhOlnlg6Knj8Mr6XoKqh32kE00MnuKhS4CnMK9mbOk/tezYObDH50s9vzs2EZ8eNTazWvYw==
X-Received: by 2002:a17:90b:1e43:b0:23d:376a:c2bc with SMTP id
 pi3-20020a17090b1e4300b0023d376ac2bcmr308216pjb.5.1681777254646; 
 Mon, 17 Apr 2023 17:20:54 -0700 (PDT)
Received: from localhost ([1.230.133.98]) by smtp.gmail.com with ESMTPSA id
 ck1-20020a17090afe0100b002466e601ab8sm9478530pjb.3.2023.04.17.17.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 17:20:54 -0700 (PDT)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: add comment for nvme-ns properties
Date: Tue, 18 Apr 2023 09:20:25 +0900
Message-Id: <20230418002025.29232-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Minwoo Im <minwoo.im@samsung.com>

Add more comments of existing properties for nvme-ns device.

Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8b7be14209..87c07f5dbb 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -43,7 +43,14 @@
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
- *              subsys=<subsys_id>,detached=<true|false[optional]>
+ *              subsys=<subsys_id>,shared=<true|false[optional]>, \
+ *              detached=<true|false[optional]>, \
+ *              zoned.zone_size=<N[optional]>, \
+ *              zoned.zone_capacity=<N[optional]>, \
+ *              zoned.descr_ext_size=<N[optional]>, \
+ *              zoned.max_active=<N[optional]>, \
+ *              zoned.max_open=<N[optional]>, \
+ *              zoned.cross_read=<true|false[optional]>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now. By default, the
-- 
2.34.1


