Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91B551E545
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 09:37:28 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnF0G-0007cX-QS
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 03:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nnEtx-00021t-9G
 for qemu-devel@nongnu.org; Sat, 07 May 2022 03:30:53 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nnEtv-0001fs-Pn
 for qemu-devel@nongnu.org; Sat, 07 May 2022 03:30:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i24so8041724pfa.7
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P2oK6t9IGBfNJr96xxF0rzSZVXeS68xfEy7UOuVaQ0k=;
 b=OPqsqTqNAmqvU2JWWrU43wuWGuYJHtc7z+whpnERWuy55hhvOOgUbTKh8DspEe55Nl
 VDFWoRrlURPXq60rx3mPEHGjmRTdDKHKKvzKiy3cB80axNhBFNssA04ASrUXyaOkjJHJ
 B8GkUTZsNP/g3fnRMae4mbV+FhoJLxxYP03A7UX53hJGmHAsHRqB06Jli04fRM71W6lr
 UViS14BsyNeBoLuWqMFduRekcEyHZVEwKz3YK9vMPi/HSLJP6R4PiMw11fcJrz5J/ZZY
 yxDkwBPLJVgWYRSW7/DGemgiYVEgZasSqvYnM8gDV8hyJqRgYryDbnxXOrJcyHbqF9Ri
 sqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P2oK6t9IGBfNJr96xxF0rzSZVXeS68xfEy7UOuVaQ0k=;
 b=GsxYoYqIPkkU6WQNqFsn621CXwC8IWvf96iixK6G4EAX56jG6x6FJJpN6VUmEiZ+k8
 nm66/KJQ6uiluyRjySvAmiOK81C9HdoWwYLY1egpOHG1aAZWBS3mZbP4V7tI884Oz9s6
 DSjoiR40GpEB9D9jURmNKwlGbW1C5Ss2uJSVIdjhFCtLBP5zR/TSQYZ7Bac44pTp6K7c
 PJOQwy6ODm5ZFSgXA0KhiH6yAfspwyQ3oPfbh2h/iZVj31vJmKIJ9Agz5hdqV3AtgZpm
 Llr2BFcZK8x+QyvRUPvC7CG8aiRLflQ1noUQ+o4Cx6h5O+xFJCnhlyP4uZT0EnrTN9RX
 Ilxg==
X-Gm-Message-State: AOAM533q4+yfnxpKZETzpLsd95VmWsqvsuaZ/I2P/cktrXgUOQOfqreN
 PjqWIFvfGIYat/rch+E27gs1efKxAETS2w==
X-Google-Smtp-Source: ABdhPJznakD0/6057kEtIjLqMzNiNzdLVEkFVB/HAO8OJsrYYe4Dam7lLHiFyb18dVp/7brk5rN96Q==
X-Received: by 2002:a63:6fc4:0:b0:393:9567:16dc with SMTP id
 k187-20020a636fc4000000b00393956716dcmr5688184pgc.593.1651908647369; 
 Sat, 07 May 2022 00:30:47 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 z15-20020aa7990f000000b0050dc76281c8sm4595821pff.162.2022.05.07.00.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 00:30:46 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org,
	its@irrelevant.dk,
	k.jensen@samsung.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hch@lst.de,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH 2/2] hw/nvme: support smart AEN
Date: Sat,  7 May 2022 15:26:44 +0800
Message-Id: <20220507072644.263105-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507072644.263105-1-pizhenwei@bytedance.com>
References: <20220507072644.263105-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support smart AEN on controller side, if the guest side enables this
feature, after injecting smart critical warning, also raise AER.

This can be tested by:
virsh qemu-monitor-command vm '{ "execute": "qom-set", "arguments":
  { "path": "/machine/peripheral/nvme0",
  "property": "smart_critical_warning", "value":1 } }'

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/nvme/ctrl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae..8236a746c8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6707,6 +6707,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
+    uint32_t supported_oaes;
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -6716,7 +6717,13 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->cntlid = cpu_to_le16(n->cntlid);
 
-    id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR);
+    supported_oaes = NVME_OAES_SMART_SPARE | NVME_OAES_SMART_TEMPERATURE |
+                     NVME_OAES_SMART_RELIABILITY |
+                     NVME_OAES_SMART_MEDIA_READ_ONLY |
+                     NVME_OAES_SMART_FAILED_VOLATILE_MEDIA |
+                     NVME_OAES_SMART_PMR_UNRELIABLE |
+                     NVME_OAES_NS_ATTR;
+    id->oaes = cpu_to_le32(supported_oaes);
     id->ctratt |= cpu_to_le32(NVME_CTRATT_ELBAS);
 
     id->rab = 6;
-- 
2.20.1


