Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8E6A6961
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:03:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIM4-0004G2-4C; Wed, 01 Mar 2023 04:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILy-0004D5-T9
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:27 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILx-0002oN-B8
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:26 -0500
Received: by mail-pj1-x102b.google.com with SMTP id bo22so1089507pjb.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5E5DVE4eB+QRDYi6pDSGyhfGQbeGfFsis7Omg79ptfs=;
 b=PteInzrMzo3FCKypBT/HV9fh9VHUwZ5+7ghUgmVO3IyrXglIOLZIs1mrQgp2O894Yx
 1hmSZUiQ3UY+6TnjxfLGspy2PW60+CPxiOgCJ7WsmQMEI4WExG/sfOaPhdzu97kzxy1J
 Kfpxa2uKRu5Dh+3QbRqxzyszLhpfvgSXp7nBrSazFXJKGJB9ck8VvQ3qn+62DOauic5C
 cjh0WgDXFrG64RKeB4U4EBxsVPUvu1l8qKmglgSLoN32cD1fAQwP1/TYlnOnLy/bxAc8
 klMgL7NbInthXX1z9Zh71UZbakwfQr88eU/JNZ+uoB7e8mMwa1HO8v6M8QBjv7rIqvx6
 2ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5E5DVE4eB+QRDYi6pDSGyhfGQbeGfFsis7Omg79ptfs=;
 b=AzwdLllsLoTUcKfXk57THTThKZUDYAoFW5Yq5gu8gaq+6Saj1zCRzgqovddNFYss3z
 3Nj+abY/lN99a0VfT/n12lAnjdXd84aQJbnTarUrF3uX5MJsZ3798quBwVoQhJIg0cVE
 DkXQIDSu5WN0ZzTjlKq/9dsaHoWmbAYw9X0g4ocqC2sztC0BkO7FVAcE9hPJSlNErTk0
 Yy/Z9TVUYvHWy5zFvhgXlP02dqMkG9e1k4lgDhxgBJEgPyH+5/nGaFNzRxTrOQ7w97SM
 fP60o3TtZNeP6zJyEgqvn4s28K5BYlbUz9BgVaIyUjIyOu6QZwkoej45MN83aeWDTT76
 vH0w==
X-Gm-Message-State: AO0yUKVaeF3s8/yWS1KmLbCyw5ILdvAGnAPMwie8ZN03MD02iWQydEyB
 ED1CW6I0cMe8doBY85eFSPk=
X-Google-Smtp-Source: AK7set+SKsMStImEQ+nHc6IaxDIUM3+u3p18g1/wBIIlMBFyx8zwDwRanaZkRtIZzBGd0J27Q4aUrQ==
X-Received: by 2002:a17:903:244f:b0:19a:7217:32a9 with SMTP id
 l15-20020a170903244f00b0019a721732a9mr6851278pls.26.1677661344145; 
 Wed, 01 Mar 2023 01:02:24 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:23 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v6 7/8] hw/net: sungem: Remove the logic of padding short
 frames in the receive path
Date: Wed,  1 Mar 2023 17:02:02 +0800
Message-Id: <20230301090203.1601925-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bmeng.cn@gmail.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/net/sungem.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index eb01520790..103376c133 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -550,7 +550,6 @@ static ssize_t sungem_receive(NetClientState *nc, const uint8_t *buf,
     PCIDevice *d = PCI_DEVICE(s);
     uint32_t mac_crc, done, kick, max_fsize;
     uint32_t fcs_size, ints, rxdma_cfg, rxmac_cfg, csum, coff;
-    uint8_t smallbuf[60];
     struct gem_rxd desc;
     uint64_t dbase, baddr;
     unsigned int rx_cond;
@@ -584,19 +583,6 @@ static ssize_t sungem_receive(NetClientState *nc, const uint8_t *buf,
         return size;
     }
 
-    /* We don't drop too small frames since we get them in qemu, we pad
-     * them instead. We should probably use the min frame size register
-     * but I don't want to use a variable size staging buffer and I
-     * know both MacOS and Linux use the default 64 anyway. We use 60
-     * here to account for the non-existent FCS.
-     */
-    if (size < 60) {
-        memcpy(smallbuf, buf, size);
-        memset(&smallbuf[size], 0, 60 - size);
-        buf = smallbuf;
-        size = 60;
-    }
-
     /* Get MAC crc */
     mac_crc = net_crc32_le(buf, ETH_ALEN);
 
-- 
2.34.1


