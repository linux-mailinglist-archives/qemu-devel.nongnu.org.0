Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7BA33CF90
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:18:48 +0100 (CET)
Received: from localhost ([::1]:57450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4ud-0002Ak-A9
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pW-0002NH-EH
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:30 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pT-0007qZ-If
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:30 -0400
Received: by mail-ej1-x636.google.com with SMTP id ci14so70454805ejc.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=1LO77muo6uGLWBQ/Q1tDDogiUiNfdS9t/fgLwmMmfXA=;
 b=bDdORKXo13XUbF+z//V7tp0ep5qiMpooFaIhljlbb1LCJJICEJYSiHddR8xQID5uc4
 TFAl3SSsJLtvVBRyPQC6AaMFAcFpkgGUzTkaiMZKqKeDsvoVnY9PdTTQNoP8j4qS5qEx
 N0X2AsG7Hh/ieaM/veepI03TLi+AWEDwO6TJFgcaKI8eNjMEJ2rG0YFqj1XixNx1Wt/C
 XmYLUOtQJ/P+gT//Jr55HxWC7aWV2MArYgacWjvKmykTWI1cJ0spQdiNXTsurGGliV3T
 eXgoq9pNH+ZqJgPEoQajhKM1XHBEhYjau80ZvbMq6UARnrz6D82tppYo5byTN5smTyZG
 oaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=1LO77muo6uGLWBQ/Q1tDDogiUiNfdS9t/fgLwmMmfXA=;
 b=D9C3IA5L8MeoTYXAaniqLygF7EWY+zKKShqwoId+XrMJPHnjHSAz9LBotuQ9prMIlg
 NcuOZD6Mce7heL+d7P82wKuOlYJ+YXAU3uv+Uv028uacluN8K1ohbBg2FugBhDepuceU
 TMsMbocVMI9sK0lupK7k0hR+9RXbex2S9Z2/LazuSIk26NM9z3nirkdYBN0aJcUUJeyM
 RoG3aml/8nwjGPcstWV59XyotiPr6W/n12qqkOwyZg3BQKb/Pv31VLxswSEk3jBWzNbg
 t5DW/pV4JJgvfg8cWVzZSe7iOpBY8Od+irlxdkJzxPoVQuFxwdd/5UffBpYw/caAKIy4
 FDkQ==
X-Gm-Message-State: AOAM533HMT3wh+RPCBx95XEP2mG8cUqOPb69ieNZOQbPiOvTE84hImai
 oeH5+lygqb57YCDY4QL0bBw=
X-Google-Smtp-Source: ABdhPJyOVGYZNZNr5nOuPCqmuVNDC46BS9+QFEzk5W1+84YKG03vz525PZto3BJzUIXYCxtMm5lctQ==
X-Received: by 2002:a17:907:76bb:: with SMTP id
 jw27mr28079290ejc.366.1615882406305; 
 Tue, 16 Mar 2021 01:13:26 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] hw/net: e1000: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 16:12:47 +0800
Message-Id: <20210316081254.72684-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 78aeb23eded2d0b765bf9145c71f80025b568acd.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/e1000.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6528..a53ba9052b 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -882,7 +882,6 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
     uint8_t min_buf[MIN_BUF_SIZE];
-    struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
     size_t iov_ofs = 0;
@@ -898,15 +897,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         return 0;
     }
 
-    /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        iov_to_buf(iov, iovcnt, 0, min_buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
-        min_iov.iov_base = filter_buf = min_buf;
-        min_iov.iov_len = size = sizeof(min_buf);
-        iovcnt = 1;
-        iov = &min_iov;
-    } else if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
+    if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
         /* This is very unlikely, but may happen. */
         iov_to_buf(iov, iovcnt, 0, min_buf, MAXIMUM_ETHERNET_HDR_LEN);
         filter_buf = min_buf;
-- 
2.17.1


