Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460993BC5FA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 07:14:41 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0dPr-00045p-TG
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 01:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1m0dOu-0003GN-My; Tue, 06 Jul 2021 01:13:40 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1m0dOp-0005Os-J3; Tue, 06 Jul 2021 01:13:40 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso1004092pjx.1; 
 Mon, 05 Jul 2021 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Fu3++mMjNV9I44zT406SHDo87putMPRAkZS5u6QnHQ=;
 b=nbEnheEpQrgntXDJhhtsftgILDtbvnmyHpIcyGNWDQvxkgT3+mGbLavoy+9mQJePHF
 uWHsGJ4ffQLGPDUHTgZX0lJoSaudYC6g+V0L/hxEVY4QtBwAxs86e0AKIkWQrBkZ8Vju
 pSWvJpZ2/iH03yk5q02TeaDzz61AL31/ClQHgnP7wpqAU4/n9j11wL7+uoxUpstRKpHb
 81GWQFu6z9C9cxDEglfKVmq4jS0Eak88+hBq+XvOKJekMass7MxFgPrJ+EUFxyhEWc6z
 5BP+NDQOUBa70Q/bOGJvVXtfMH40NJivaPXlxfd3L63YlJoX4s/8bhmIVQIHs0vU5Z/z
 oU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Fu3++mMjNV9I44zT406SHDo87putMPRAkZS5u6QnHQ=;
 b=LAPGg2WebuVIncrBDuCrYYxcvYIB2685NLOZR2IRk0O8NTVQzM4vj5B7RfAPecFzhJ
 JUBUYlV2OV9cH1i31HkA0s8zzdBYduRS1DIgipKFFMjMOlFRR6NsBFcOiUrYta/kF3QG
 XhjKN6bKjKqYVPbkmNIkAXLDpLVMbw3q+BCjQ88ekkr41dDBJNxSKOXV1isBE1jMjJk3
 ZxlCHoqGPoJg6paj0Di23kPrXRo4QK2SmZdKIiVkP0TcePGharbyUtbGFhf+32iDSL0e
 fJzZYFjHOJj3YhZePMkto1bRKUsQjpWGJil5I3EHixkUoVa17ethVwG8YWXAPlxYfp8a
 cWsQ==
X-Gm-Message-State: AOAM532/dy91gN2pYRq78DQaOvlEQERYK6kEzYXpkRUMUeulM6S3/T3R
 TGt7HwtMq5zfT3P+wfOHY0NALWEY9ogW6w==
X-Google-Smtp-Source: ABdhPJzx1ovIAtodvJokt7ph9BbtZnUg5x1SpqhxCFipwV4JwSvvLRsYLP+RIUsld57pOYQLASE28Q==
X-Received: by 2002:a17:902:c38c:b029:128:fd55:f54b with SMTP id
 g12-20020a170902c38cb0290128fd55f54bmr15365069plg.24.1625548408079; 
 Mon, 05 Jul 2021 22:13:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([202.168.10.200])
 by smtp.gmail.com with ESMTPSA id y7sm14068095pfi.204.2021.07.05.22.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 22:13:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: mtmsrd is an illegal instruction on BookE
Date: Tue,  6 Jul 2021 15:13:21 +1000
Message-Id: <20210706051321.609046-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102f.google.com
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
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSR is a 32-bit register in BookE and there is no mtmsrd instruction.

Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f65d1e81ea..d1f482b0f3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4940,6 +4940,11 @@ static void gen_mtcrf(DisasContext *ctx)
 #if defined(TARGET_PPC64)
 static void gen_mtmsrd(DisasContext *ctx)
 {
+    if (unlikely(!is_book3s_arch2x(ctx))) {
+        gen_invalid(ctx);
+        return;
+    }
+
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
-- 
2.23.0


