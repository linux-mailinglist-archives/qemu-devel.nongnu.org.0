Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EF233D3BC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:22:34 +0100 (CET)
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8iX-0007oH-Km
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RT-00031i-7v
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:55 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RR-0003tY-Gz
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:54 -0400
Received: by mail-pg1-x534.google.com with SMTP id x29so22448504pgk.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+R5IJqe5IDW0hjNBWmorKuSmHDcQ7ADX024vNepPJw=;
 b=sONk49lxQm405fRAInIuax4SptbCegNCsXSt39ltg3687iOrJnyBlcGuEdmgMUaoQ5
 2DYdc4OiM9+1T2h5souKq+NtWCGidmoK3Gz9fcx/oNfDk3rfoTTqgK+4RXW00hcnLTYf
 tdkKibF8M0hqhb/LQq/YfQJL+o6mPoa0ANeCKWcXJCvP2KOhgyvMQnS/OsJiz+jLKczL
 Ck1V4C11WFtczNuhAsmLV49gx42GzuwnDqpn2EA3z+ZRFKoxFLVuu5AX1/9DRuLGeeec
 EokzORvrPsFy20/yKPTH53r0vW3eS2BQWfAG2dnnDTcmMGz8yavwGi3Qnonbj4yg6QYn
 QqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+R5IJqe5IDW0hjNBWmorKuSmHDcQ7ADX024vNepPJw=;
 b=d0y3HqATGK+VRK9VAxKZbIp/f/OxP+RANkuqoH5lxj//i/Z2YmvT/PYZ/kj6jOFGlB
 tbk8nryVP7HhqzP0mGSd6prp+/WdAb/UVwd2uV7DkOrPRzxikiQf6DOylWb2hi334fwT
 9AR10VznDGnOD3m5Bgb76hz6YMPyQRDuJahdtQ/RlRyjrO69Vuc98KlpxQOXRHO+/hxQ
 EsEWJdUbIG15No/h+GSHyUfXlpLWBX40UPhq85vsupFR1xn4sfa5jctg6/30LluVR15v
 A3fgM/pSxJzPEzeEFtCe9Q6CpRTxfgiRbSk8md9HIQsmX6yTeLO+QZ+nxrQUfZj1WrQQ
 pnEw==
X-Gm-Message-State: AOAM531JKy+IAB2hHxyrlwTtAG3eU68RiQLgWdRy6weIDO2VDXDys/Ge
 egA6++068cP4N/xM6oo1t1M=
X-Google-Smtp-Source: ABdhPJxruAJyoJNMLAWrW/SqXD/Gsgaoq5npfij9fOBitWWa/zp5B2eu0kqi4XRUS4/O3t8/FBxVqw==
X-Received: by 2002:a63:1350:: with SMTP id 16mr3658538pgt.85.1615896292226;
 Tue, 16 Mar 2021 05:04:52 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 09/12] hw/net: pcnet: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 20:04:17 +0800
Message-Id: <20210316120420.19658-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/pcnet.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index f3f18d8598..16330335cd 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -987,7 +987,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     PCNetState *s = qemu_get_nic_opaque(nc);
     int is_padr = 0, is_bcast = 0, is_ladr = 0;
-    uint8_t buf1[60];
     int remaining;
     int crc_err = 0;
     size_t size = size_;
@@ -1000,14 +999,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
     printf("pcnet_receive size=%zu\n", size);
 #endif
 
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     if (CSR_PROM(s)
         || (is_padr=padr_match(s, buf, size))
         || (is_bcast=padr_bcast(s, buf, size))
-- 
2.25.1


