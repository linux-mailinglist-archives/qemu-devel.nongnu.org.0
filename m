Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C4502B03
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:36:50 +0200 (CEST)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfM81-0006vC-9W
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrl-0007Dh-GV; Fri, 15 Apr 2022 09:20:06 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLrj-0007zz-Rd; Fri, 15 Apr 2022 09:20:01 -0400
Received: by mail-ed1-x532.google.com with SMTP id z99so9911934ede.5;
 Fri, 15 Apr 2022 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PTpiMctGFRNCeUD0zfF0QDxVsAAFlrqIKcCLw448UvM=;
 b=nO7DdlG/3A3dwFh6W9ya2RJV1gsfJw193C12d7XZWPVPdU+hnbxrF/lFy1bPYMXw99
 nFA8c6tnCdzuOLlu1GD8HryxMhS77LM9hlrIi3gaGV5d+DcRyDecmEA1fMzqBUPoUOo8
 KTiobYT0tbFTmujUk5m9fsZkRQ9j/bDl5VD6oIYTqV2ByhoDTrvBUQ7XDiffpvJlqQwV
 1gxBNAa3g3JPd2gjQfoKOYX1sO0BiTUVbAauJn5J3Aceqq+K7tqEvq8evDOWfC/RIxwU
 RFBrBbXMkyBgTFAnpvBjskIeHOakrTSPJeGZSjxEvtCEuL4fjS9YYnr81SrL61jd+nLz
 L3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PTpiMctGFRNCeUD0zfF0QDxVsAAFlrqIKcCLw448UvM=;
 b=4xjA4CC0F1osW9UkDag2QWn22zB+MxATMojBkrJ8Hq82wNYA0xlxKBikI71VVemWGI
 QjgOMmu8VEVobot0LwJtRQRr7iJhK/e4WGvwzeCBEhED+SgWdMunhgBuL8DhlsMKdkXN
 ej+rrAMqTEC22rJiTcF6fpZg+nFX4PhjHKbkF+h0rsCmIzB77qr3OiB3g9UJGxX0briB
 TzRG5NOZiuRJTJboMNPxKgd6cF81W/lXwFAni6dwhW7HQ3jZlIPSLi8kdFyqhthzhRQa
 NWuczjJ6SDzgUjG14E8T1SrEwRmV8Nz3neD5jFeAuX46Aidvda+oiW8FWsrZ7D8SKBsS
 3rUA==
X-Gm-Message-State: AOAM532pw1imLvfMR7AfThLB53DwndLlkUwUz6EZ9S71FUPCcIlPytNp
 Vbo9oZneNGQpX3PdoiMGe86Dtjqtic9V7Q==
X-Google-Smtp-Source: ABdhPJxtJ0Z5OdsdBr495uFtAwj0ZLgGmGY1NOnHjLALcRww//5b2LSqDbhLJvORhByDAzk83K3Wtg==
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr8255859edb.364.1650028798277; 
 Fri, 15 Apr 2022 06:19:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/26] nvme: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:46 +0200
Message-Id: <20220415131900.793161-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
 block/nvme.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 01fb28aa63..6519697e40 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1234,8 +1234,9 @@ static inline bool nvme_qiov_aligned(BlockDriverState *bs,
     return true;
 }
 
-static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                       QEMUIOVector *qiov, bool is_write, int flags)
+static coroutine_fn int nvme_co_prw(BlockDriverState *bs,
+				    uint64_t offset, uint64_t bytes,
+				    QEMUIOVector *qiov, bool is_write, int flags)
 {
     BDRVNVMeState *s = bs->opaque;
     int r;
-- 
2.35.1



