Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245806E55D1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 02:27:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poZBC-0005QY-TK; Mon, 17 Apr 2023 20:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZB9-0005PV-6K; Mon, 17 Apr 2023 20:26:39 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZB7-0005qR-O2; Mon, 17 Apr 2023 20:26:38 -0400
Received: by mail-pj1-x1033.google.com with SMTP id v9so32889258pjk.0;
 Mon, 17 Apr 2023 17:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681777595; x=1684369595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ApHWDnln+rC1oZ9Ru+DP86rOdbSBetB5KFuIbKmKTFc=;
 b=SXEt2H6XwwNtOJDv42z87YjDts/qwSrzw7a9ZNaXRBdMOLtLiA7ULmVi60tqKXb1xN
 C9C8oyU5gdMZVPRN/VwzVSAtnBcU3ZSIK8bzP1c+R4tPnZVHfWn4HmVVX7D1fGQti5RX
 Xv7PspJxhtSVBq6xOldZ6BkDbZbf8MLCic3VKLS6krSmz2OL8CexcrtzFBbND1ZzeCJO
 mKW3cWlNggeGM6RW8zf6dnEXVZi8CRQy7CPjSovPxzQ8S6Uk8yqECG0MgthxWm4dGa6w
 kiLgYodV15JCwbN/yNhu7oEnr0XjR2VpJz5Ad6jr7fD/q3+oo8qklfWbNxnw7+NR/n2v
 qZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681777595; x=1684369595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ApHWDnln+rC1oZ9Ru+DP86rOdbSBetB5KFuIbKmKTFc=;
 b=UKdvCQwijxsl5LT5nzPX9+jLTfSvQMniP0DtJvlMS56tr2D3a57rSQUGz6N7Ta4eai
 wO6CQ7UxEyI9vTrI+DP8lkCRrV5WF6rKSi5axRoCDWrJyo0s2Q9VhN2ELmRTrysd84uy
 1LSrkN3s88Ly9qTWcHNpvIiirN5Ji6PlycNJeMsFDZdY9oTakHwlSm7XVTuZzinLGAQg
 ZQcwV5fh6Sq2L9AgmyaXr2JJLsRFlw2sPbI23T7aTQgdU9lBjn1U59wqA2ErIFoDFoAo
 /eKIGlMsGHR92RVnUfR2yh6mUHbnZIvdikHv5Rjkif0aA5O5G6oS76qqKfHglz/BA5Z2
 7ONA==
X-Gm-Message-State: AAQBX9f5TrAz1mw+wKPLT6TFEbryps5+mQm9GRYfL/tOm1g1ZVaJ4I/n
 rQfDxjCfnrFRFCVgZYycsW+4K+/outM=
X-Google-Smtp-Source: AKy350a+wFPUf8J3b1dR6+2t/62i1FVUYNC4piQ2QOVagmil1ajSksvWzZ1CcOGU4iUpAdO4ZYIHHA==
X-Received: by 2002:a05:6a20:7d94:b0:f0:69db:ebea with SMTP id
 v20-20020a056a207d9400b000f069dbebeamr2433166pzj.30.1681777595637; 
 Mon, 17 Apr 2023 17:26:35 -0700 (PDT)
Received: from localhost ([1.230.133.98]) by smtp.gmail.com with ESMTPSA id
 k5-20020a63d105000000b005033e653a17sm7606829pgg.85.2023.04.17.17.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 17:26:35 -0700 (PDT)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH RESEND 1/2] hw/nvme: consider COPY command in nvme_aio_err
Date: Tue, 18 Apr 2023 09:26:21 +0900
Message-Id: <20230418002622.29819-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418002622.29819-1-minwoo.im.dev@gmail.com>
References: <20230418002622.29819-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1033.google.com
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

If we don't have NVME_CMD_COPY consideration in the switch statement in
nvme_aio_err(), it will go to have NVME_INTERNAL_DEV_ERROR and
`req->status` will be ovewritten to it.  During the aio context, it
might set the NVMe status field like NVME_CMD_SIZE_LIMIT, but it's
overwritten in the nvme_aio_err().

Add consideration for the NVME_CMD_COPY not to overwrite the status at
the end of the function.

Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8b7be14209..754f91e220 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1748,6 +1748,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
     case NVME_CMD_WRITE:
     case NVME_CMD_WRITE_ZEROES:
     case NVME_CMD_ZONE_APPEND:
+    case NVME_CMD_COPY:
         status = NVME_WRITE_FAULT;
         break;
     default:
-- 
2.34.1


