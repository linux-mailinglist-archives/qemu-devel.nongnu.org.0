Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D379F32B620
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:24:04 +0100 (CET)
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNjf-0007A2-Tj
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNiB-0005U8-QY
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:31 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNiA-0001JT-AF
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:31 -0500
Received: by mail-ej1-x634.google.com with SMTP id dx17so13213772ejb.2
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4P+95OIQONEnAIsxo8Qi33XehTlY7Zdbpw889iDd7IA=;
 b=gj3EfG92bCsx1KdBXZkq11vPwoAAp70hUfPlxGYAFRbCUYlxH7zDtQzY2iDdB5XZj/
 GLLRtbaND8hN1C4/plxEMj09a60ZS9TDA46yHGs/Q2myHyXld0J9NfrmNfYeHjVzKeFd
 VdLwfBc8ojahWG4VbgW2xJ37RPHr61/7Exv6mwVTrqhO5bTvGYfUevbc3Qe9Ox2vYNKE
 98hL2c3cFCJO5ae0hIIZkPF4hJlG79j9GIdv/o2U0Fm+TZ06MoP1JYyei8iCXLWtzIcm
 v/uw1B4k7NzxPSICbVGdK0wv2nsSht51oHTod6ApEdnZXjk0aN6RbZVAzgXuXCuxczmX
 M5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4P+95OIQONEnAIsxo8Qi33XehTlY7Zdbpw889iDd7IA=;
 b=hgM1MqLn1qJXU167fWam/tU+Rgx4UBrDt7T9dWgt0gcexxtLxFA8qn9fHePjTrIaQj
 qbzFfPC4JRL1gHBVla4gomRB3FTKu2qq2EnCY2qhrAt6tMtMqQ+g/b8Mn51I3vu7VOsQ
 q22vy+AKHZyqTtL2DSgE0JalqaWOv67aE/PPyYDcfMIjz9x5Bw2tMkb9krOF7kTmrV75
 mQAlj74Ar9HqRyUhk8jMEuNRc6V1OJ7iMrzAmHS+xfzzfO750c8mnfUsaEKdekV5/Vef
 v3K212MieLj+hzPrV0cuXgVvQ7T5aiWbVw7RYFZG4UdPhhMaucdpjp37xrk2shUNM/aS
 6vow==
X-Gm-Message-State: AOAM5303pmW4z3nGwUyxVF04U1MFLvNuK4S6gUF1siq6uYu4jVisXYTU
 q7e7M9fcxtp+m0AEAdR9Yh8=
X-Google-Smtp-Source: ABdhPJzmiNm3p05BCaE7+KywbYwpYWIwi5RQvFqoMbDQEPAv4Kk3IyWzAVBKHf8Lwyhy0aVNpFAlcA==
X-Received: by 2002:a17:906:23e9:: with SMTP id
 j9mr15744794ejg.78.1614763349011; 
 Wed, 03 Mar 2021 01:22:29 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.22.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:28 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 8/9] hw/net: sungem: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 17:21:45 +0800
Message-Id: <1614763306-18026-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/net/sungem.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 33c3722..3fa8316 100644
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
2.7.4


