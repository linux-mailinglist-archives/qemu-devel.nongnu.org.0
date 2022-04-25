Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F750E3BB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:54:16 +0200 (CEST)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj06R-0001Q0-1k
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgf-0006XW-Da
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgd-0004kH-Tw
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:37 -0400
Received: by mail-pl1-x634.google.com with SMTP id k4so15742289plk.7
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ommSiCLRSnB1NKyyuvvOu0Qu05aukfUm25ZKPYRc2Gg=;
 b=PeaDwyi/AhWIzDpwt/QP61meXyFpNbdMwK0znwV2OSKrYgx0OEV1v2E4V1XyOpLMxp
 YwX54udaP6TEKMp+9pp40KipLuchsaWu4wT3aSR9Ln5CqX54WebXETrMQp5ClVGs1L67
 7T1/zp8xkM20vBdHfXBx7qcKy+9t35tZA4OuLmCbn1C7248ugLtUSP3WxzXJEcyUF8Xs
 qmeF2JM121EwNiU1qR+fpsR9vFNRr5o6gOOCciLeVwNXPBqsgcGUqhWcTmkI4F5LjmAK
 RrqQ5P1F+CsLXYkRWwWvTJ/TUQR4UOl/7s4yosvSkGLCMGdaWWQ8OeVEPBEBgQPSD4Vc
 O2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ommSiCLRSnB1NKyyuvvOu0Qu05aukfUm25ZKPYRc2Gg=;
 b=ywnE1tBv0N/nL4MI0+GVKXiIK2Co+RELvLCNY/TtoiGaYzMVfzuk54hUZierB8NxNU
 sebZ5drSnqgesH2ZLep8pObNNRbOwzPxdvETVBmo0OKPrTh4wFucd9Xb+Zal+IanTHCY
 SknfJE0EFUIYiFr+7EqOjfR/yGkqGjFiCc1YAm66yCv4ve3YTsvLHDrg8r2ngfE/2AR6
 9cXii3VIqlwKxWJ0B6Bh2E3bTVZbZfAkmvSkEcY3ixMaa/hYFrsiKgTeEB8QUZFhS6YR
 lvLQiPijkyGSOzefGIWBDX2GeUxj7qlfnn1C5wHw0yMydOU8EVRUn0kfqoPV9xMfgEny
 xRvg==
X-Gm-Message-State: AOAM532LLrvcJN0U9jdOqO5OmtJwbbfcZIzOjrXw8+J95GGPADYlpaos
 dKjZ95IMxLmL7i5Kb45SX3s=
X-Google-Smtp-Source: ABdhPJzfmkLyZnRRCDNdDL3qIfAIm7Bj/deERGLRha97WnesAN0B4W545CkH0zxTI++iRN7guwG0KQ==
X-Received: by 2002:a17:90b:38cb:b0:1d5:3ca0:cf8 with SMTP id
 nn11-20020a17090b38cb00b001d53ca00cf8mr27252495pjb.51.1650896854725; 
 Mon, 25 Apr 2022 07:27:34 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/9pfs: Update 9p-synth.c for Windows build
Date: Mon, 25 Apr 2022 22:27:02 +0800
Message-Id: <20220425142705.2099270-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

This updates 9p synth backend driver for Windows build.
Funtionalities are not tested as test cases do not run on
Windows at present.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-synth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index d99d263985..ce28943b2d 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -152,8 +152,10 @@ static void synth_fill_statbuf(V9fsSynthNode *node, struct stat *stbuf)
     stbuf->st_gid = 0;
     stbuf->st_rdev = 0;
     stbuf->st_size = 0;
+#ifndef CONFIG_WIN32
     stbuf->st_blksize = 0;
     stbuf->st_blocks = 0;
+#endif
     stbuf->st_atime = 0;
     stbuf->st_mtime = 0;
     stbuf->st_ctime = 0;
@@ -236,7 +238,8 @@ static void synth_direntry(V9fsSynthNode *node,
     entry->d_ino = node->attr->inode;
 #ifdef CONFIG_DARWIN
     entry->d_seekoff = off + 1;
-#else
+#endif
+#ifdef CONFIG_LINUX
     entry->d_off = off + 1;
 #endif
 }
-- 
2.25.1


