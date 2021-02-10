Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66400316513
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:23:57 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nbA-0006HX-FK
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9nZs-0005Fa-1P; Wed, 10 Feb 2021 06:22:36 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9nZp-0007zv-6m; Wed, 10 Feb 2021 06:22:35 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s3so2485961edi.7;
 Wed, 10 Feb 2021 03:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbrqWpNXp2UMKPyPZO/VSYp8U9tk+cVDlJ/MOxm6Px8=;
 b=G/fgPYiLn6so3TABegHAC2r8wDHImX0oAxYEr8hAzk0dv6/FCI0RRO9uq6oix/nyiA
 Ean9xsuW9W5mio/ev8BhTsiCS4vkQWheEcNz+Ve0WyJv2iorftjJ8hgOcgRV+/KhzBQh
 CZyl/YEkVqepNHHqbiSQsZnkwZ++YzSnRsMnPeoh2jtTXK/Pn7NBDT8nT22qdUvN22Fx
 GfGEUGxnXeBja9Tdm9pJnDx3+D8oa6OtH8tdhmMYtYknMB9cGb+hs7Y7BmPofJ9FiX3A
 f+1DHWwAZ6f8V94MsP0qfyX/swOwjGfNC5LMDBTBPNRyYnYL72PjBIuBnNXuN4qz2gj8
 gbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbrqWpNXp2UMKPyPZO/VSYp8U9tk+cVDlJ/MOxm6Px8=;
 b=q91rOt+hcZKVMbuktOlT3H1NDRNVkBNBWMJRL9sT6eE8Wq7flB6dKRBvNyOElKqkXf
 vgX1+ulTzBB56ehl/9xxXdYwDYZRQXOa00xHdWw1+JoQitQX0Aug3F1gRVLcpaXhHLIa
 0NtcDDgVezpbHum6EUY8a6qUs1Br/rz1oUGQFFbCv0jBGMtrFjNj/hzhaHSnkfidkoTq
 7cZagaCjNlM736Gt0O5VN+Az0t9c/WZMiw0R4jaIPKxWtjfKLzA6gU2i8y1vE8/ejCkT
 AM7bY5DDhtsL6sLuLimxgcwWrckTJTQRdJVhH778QMs5EtRQJ1BUiw03fGRanogQL+df
 CZqA==
X-Gm-Message-State: AOAM53154JGAh+JkKo8CN9Q9emc8KZeNhAmzst3gyzVFUmMJQkUCqmS2
 he7YGe9m8wrq3ugcshejDLs=
X-Google-Smtp-Source: ABdhPJxjuiQ+K6KavurfQc82JV5SAwmTHap3vA9GXQm7ErLEQtzGkRdm6/ss+RE6kwugUffI/AvHRg==
X-Received: by 2002:a05:6402:501:: with SMTP id
 m1mr2675403edv.58.1612956151092; 
 Wed, 10 Feb 2021 03:22:31 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id q1sm899096eji.101.2021.02.10.03.22.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 03:22:30 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3] hw/block: nvme: Fix a build error in nvme_get_feature()
Date: Wed, 10 Feb 2021 19:22:21 +0800
Message-Id: <1612956141-63712-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Current QEMU HEAD nvme.c does not compile with the default GCC 5.4
on a Ubuntu 16.04 host:

  hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
         ^
  hw/block/nvme.c:3150:14: note: ‘result’ was declared here
     uint32_t result;
              ^

Explicitly initialize the result to fix it.

Cc: qemu-trivial@nongnu.org
Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- mention compiler and host information in the commit message

Changes in v2:
- update function name in the commit message

 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5ce21b7..c122ac0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3228,6 +3228,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = ns->features.err_rec;
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
+        result = 0;
         for (i = 1; i <= n->num_namespaces; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
-- 
2.7.4


