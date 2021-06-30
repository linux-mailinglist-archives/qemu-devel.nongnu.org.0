Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD043B8177
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 13:48:07 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyYhK-0007U8-8t
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 07:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lyYg0-0006iD-VI
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:46:44 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lyYfy-0003nU-0P
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:46:44 -0400
Received: by mail-ej1-x635.google.com with SMTP id v20so3690063eji.10
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 04:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o9s15Sp/avSifFWBudAQn5Q2t497YtmeoqNqiTPbAIg=;
 b=nXsP4LWhwn/sSWnpgKICZ3xGmtKti0d3aa985gUmXIR+kVwkxLCKBA5MexejUPudJt
 QsV+dDT3rqaeU80v8YIyRU0ULia9y/pF3eLN1yCjS80QSoEiV/izcjkIU9lljTkSb5xA
 UampTW9B4ZozSr6Cs2g+BgGD3i7Qbi/sLbvr2VijpJLyN5OiQjAI1cKU468B+v3O4y4G
 J6k31Mma4ZTUlLNbDyNDsgx/wgbSJ1b2fUamp8PqZYJGjq9Y81nUhpIq5crcXOWK+Ilv
 M3yF3fr5TC0mD0xT11dJg5CTjKZ4CtZ55H1EX6AXhpkBbI0hbOKoBLRtLtvjcadx8P1j
 o8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o9s15Sp/avSifFWBudAQn5Q2t497YtmeoqNqiTPbAIg=;
 b=cG0A10x3N3P7WJ5iaOBTNd7ZvdezHvkqPcuH+cB+bBVCvv69vr4kYbDGIR6mY15plr
 E/3BuOK8fdvnIJOAOn1NnQ19Xvy3h+yGIBsSzC8EucPqgg6p7idrt6o5gUOdLvOAfhel
 eRZh5SptGuwwVqh044tAZHoDNnGdDemQ/pHogmKHQA/OmVp2DtuwtvzmEhejBCuutHcT
 2lcsB+f4ooYp4V2u6UJVwIUJgTmdrvUcSFZLo67EPGz0eD5DAmrnGYo/TedQlOXryWLU
 QxwUrFMeJR/enqNh7h1iB8/NwoNZX5SuY9NbzjgvUe58KStoAQ2rmdWNg9a+YzQc2yWy
 o8SQ==
X-Gm-Message-State: AOAM533bCGzpWQ3ypOUeW82sxT5ggJmR8o6DhTDJ7ZmpRV8c9uGz9ikW
 LZV0AN9iNhP6n1tDXN6n4GcIwLTOZck=
X-Google-Smtp-Source: ABdhPJwD90vAL6fZzFPuoHd6hpfTnC2mqCSkYpiaFiLNhR4BTAXCtUBVQz8jJ5+aPD0pvn5zO72qKg==
X-Received: by 2002:a17:906:842:: with SMTP id
 f2mr9067671ejd.460.1625053599817; 
 Wed, 30 Jun 2021 04:46:39 -0700 (PDT)
Received: from mapfelba.users.ipa.me ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id i11sm5790268edu.97.2021.06.30.04.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 04:46:39 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
X-Google-Original-From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pvrdma: Ensure correct input on ring init (CVE-2021-3607)
Date: Wed, 30 Jun 2021 14:46:34 +0300
Message-Id: <20210630114634.2168872-1-marcel@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: marcel@redhat.com, vv474172261@gmail.com, mcascell@redhat.com,
 pj.pandit@yahoo.co.in, yuval.shaia.ml@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check the guest passed a non zero page count
for pvrdma device ring buffers.

Fixes: CVE-2021-3607
Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/rdma/vmw/pvrdma_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 84ae8024fc..7c0c3551a8 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -92,6 +92,11 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
     uint64_t *dir, *tbl;
     int rc = 0;
 
+    if (!num_pages) {
+        rdma_error_report("Ring pages count must be strictly positive");
+        return -EINVAL;
+    }
+
     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory (ring %s)", name);
-- 
2.31.1


