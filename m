Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4010D6E55D3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 02:27:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poZBG-0005Qp-CP; Mon, 17 Apr 2023 20:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZBE-0005Qa-0S; Mon, 17 Apr 2023 20:26:44 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZBB-0005r7-Ty; Mon, 17 Apr 2023 20:26:43 -0400
Received: by mail-pl1-x62a.google.com with SMTP id lh8so14710415plb.1;
 Mon, 17 Apr 2023 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681777599; x=1684369599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bwX9HEb8y/pY2MCYdO96SzQW5Y07irRMvwHWWD5wPqA=;
 b=GadgPMKhB4SMiKGONzE+IZGSDiWL97aCM6ddmDgP17PfwUobsKvbVqmgMplgjzu2IF
 Ono5ENjpZ1e9uukH9R32tSRHTNmlEUhHXjdJ8dkekbpt+NLAMaqZJpefhqwGbqS8/Odv
 6qK3d9orZbCsNAs24f/2eErxV9PU1bZE7WHhH8jZp84YCe3Xvo87voduI102hW7fTRnc
 c89x6QoTSYIgqakS+BIzBSkAmOeSsAbnBBULARR51ArNGsKO5z0mZ4Scs21b394tNeFl
 xmKIBm9FOcBTnkbOsfWlFwKXpGjqKJm/OCLGQpNjZ6Pi/U4zn7Jw72bCiyfALXeTUi3a
 l2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681777599; x=1684369599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwX9HEb8y/pY2MCYdO96SzQW5Y07irRMvwHWWD5wPqA=;
 b=QmYIXlU7RxWxWHwRpUyrDcc/ta9iU+THnF/ZIJ6/1kuboqi7jCQjQzSIJrTFzzxBZx
 L3vdmieMUwq9l40bn0GdywKU32U5YC/Gd8CalLClApNTYSAZTrJFsvFsIrbZ254sgWGg
 n9hBxlWS+/ndOu/AJlOBlzlUWT7cOVgToLFBj+NzHfbTS/0/fMLqhRmbRh+Uuu5H1xUt
 AVW/kiuVUVCr3ijlDcDNu0Wi+S9UsiJHqXJkH9sFWyUb9FfB8zO3BAr++COpPE11dDlB
 FCnkQSlfSKi+RNw+0PHdVAzAvKi8w15dwzlsfScmffcISEyfSqe6doxAoQbWEDmwOOWw
 C7BA==
X-Gm-Message-State: AAQBX9dA8Gpg8UKM3z7lnjTL9xaJhr5XJ+3SWfhk1AAdlC4UXBZvoECR
 gdWBBbb94Pej8r6rTnFc6y4APAIsUFk=
X-Google-Smtp-Source: AKy350b7QXQIwzEt8MkOE9fsdHw+4KiC4hu0v3w/SLpBlBoBqmqx9rkNx07HSOIIZimv4pDVWNcMyQ==
X-Received: by 2002:a05:6a20:748f:b0:ef:a7aa:6118 with SMTP id
 p15-20020a056a20748f00b000efa7aa6118mr7082335pzd.43.1681777599570; 
 Mon, 17 Apr 2023 17:26:39 -0700 (PDT)
Received: from localhost ([1.230.133.98]) by smtp.gmail.com with ESMTPSA id
 n6-20020a63f806000000b0051b70c8d446sm5772130pgh.73.2023.04.17.17.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 17:26:39 -0700 (PDT)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH RESEND 2/2] hw/nvme: check maximum copy length (MCL) for COPY
Date: Tue, 18 Apr 2023 09:26:22 +0900
Message-Id: <20230418002622.29819-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418002622.29819-1-minwoo.im.dev@gmail.com>
References: <20230418002622.29819-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62a.google.com
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

MCL(Maximum Copy Length) in the Identify Namespace data structure limits
the number of LBAs to be copied inside of the controller.  We've not
checked it at all, so added the check with returning the proper error
status.

Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 754f91e220..9a363ec219 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2845,6 +2845,25 @@ static void nvme_copy_source_range_parse(void *ranges, int idx, uint8_t format,
     }
 }
 
+static inline uint16_t nvme_check_copy_mcl(NvmeNamespace *ns,
+                                           NvmeCopyAIOCB *iocb, uint16_t nr)
+{
+    uint32_t copy_len = 0;
+
+    for (int idx = 0; idx < nr; idx++) {
+        uint32_t nlb;
+        nvme_copy_source_range_parse(iocb->ranges, idx, iocb->format, NULL,
+                                     &nlb, NULL, NULL, NULL);
+        copy_len += nlb + 1;
+    }
+
+    if (copy_len > ns->id_ns.mcl) {
+        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_copy_out_completed_cb(void *opaque, int ret)
 {
     NvmeCopyAIOCB *iocb = opaque;
@@ -3157,6 +3176,11 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
+    status = nvme_check_copy_mcl(ns, iocb, nr);
+    if (status) {
+        goto invalid;
+    }
+
     iocb->req = req;
     iocb->ret = 0;
     iocb->nr = nr;
-- 
2.34.1


