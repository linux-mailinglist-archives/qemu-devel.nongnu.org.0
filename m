Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE23E502AFA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:33:49 +0200 (CEST)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM57-0003Pu-2N
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrb-0006n1-AV; Fri, 15 Apr 2022 09:19:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrZ-0007uw-UF; Fri, 15 Apr 2022 09:19:51 -0400
Received: by mail-ej1-x62e.google.com with SMTP id p15so15343753ejc.7;
 Fri, 15 Apr 2022 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bt/lCu7Al/ofhqAsL2EZtmQPYAWx6O0kFoKyJZvt56k=;
 b=PjONtCzGVvJ5emVFu5cZHgiu9rU5KQA70jFQTrjny69pcRx9OwfYN0FseIvhoKnD0t
 oQ99PK0RSuDD/ZnjLF0io844x8QV82jlNq4JeGNiWCxTrazSNmQdPlDnu/LhGcq4R6uE
 VdxFSPD7BqmRzWw07DWY1jg6Nz1aUY7N7NAw/MV+igIGHCwZmNMhRUPAEhObhCe8BGnn
 WxUt4n94fRUfkUs8vqhFiQaeoLDtj20i39ZUal6E4wVYzWKsX3Yu+8UulSRUUM7a3YOU
 r5Jtc0qjr7DXa7qa+9TLQy7wokca4dGOddcYx5pBIxOT2HSyJ5VDZQilWrHnHvILaYN+
 CagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bt/lCu7Al/ofhqAsL2EZtmQPYAWx6O0kFoKyJZvt56k=;
 b=q18++tpBl9BAOk1if4xKEl+IyHQ2yxr2Id5Hm6RyJBlLKAblj087LZGGmY8krx2Xls
 5JmoK+XVf3yd1uscPUEmZA1RcVtvn0AN2iIHmFgkXHmV/fTEFXsykmv2rMTnlyPzYFOf
 sqJTGS7UcF5FOg+tvGY/0JV6Ri7dmNv8+nE/xqTMACDWCrX97ru3DcTzR1V5LMqRbcl9
 qmEXeQpvLk3nAZ+HTmEypaUQKvxKcEqdvoG7b1uQUK/lgamAWEEI2slmIXuaXIwrTY7o
 zAAD8Ozz+lPWP3HE3P4nGwUrptHQtZjMvTS5A79LiNvcBHe7szSBInRQzThuQS3Fi0ut
 Uk7g==
X-Gm-Message-State: AOAM530LUjz+V5wAZJkD4zIsSA5K3RTT4wcsE+YFjmmoZ+GpQmPn4/cm
 rX4AMdzJgiCt0Muy34dgfIHCpiPISK08FA==
X-Google-Smtp-Source: ABdhPJxRfiQZBZq8/tt++AiUfL8c6oCXQObYxxqpdAeld8yMCYGNx7NEBArOtnzWKHjMovLQi31kxQ==
X-Received: by 2002:a17:907:a427:b0:6e8:d248:f877 with SMTP id
 sg39-20020a170907a42700b006e8d248f877mr6049144ejc.249.1650028788220; 
 Fri, 15 Apr 2022 06:19:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/26] iscsi: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:43 +0200
Message-Id: <20220415131900.793161-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index d707d0b354..b33eeec794 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -290,7 +290,7 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
     }
 }
 
-static void iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
+static void coroutine_fn iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
 {
     *iTask = (struct IscsiTask) {
         .co         = qemu_coroutine_self(),
-- 
2.35.1



