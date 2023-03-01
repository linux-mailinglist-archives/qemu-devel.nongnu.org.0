Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510386A6959
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:03:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIM2-0004ER-7L; Wed, 01 Mar 2023 04:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILy-0004Ct-Aj
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:27 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILw-0002o2-R2
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:26 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so16506737pjb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4REMxXLq5nMhxUujFS74vlm3meLGVHAvBOdhv4pig1E=;
 b=b5GBVzAXMIGFgSaCzUIm1hv7bxuHxM/b/4QC8+C1/Np1V1HAu2fIgsIONIzymiq2L5
 dxPvlRmieYa+knt6wbrPqHXlKsJkn/xCvl2QAH5VVcnq/1UbAmC+zOWYhrpuenM9h7ft
 pbcZSj4Q5G8i/IiUJF4o+hZiqHTiD6Bm4tFv8JpCHV080Wkm83omEV3wM9MDdtS7yJQA
 pbIC974i+lCUqe2478lIDx6ChkcgKuPLv6Luddb9p/GtVAAkHLt3E/xMsX5OuDb161Jd
 Ud2oZCNIWMXcYYGFw/o2k1Roa8XEWJIXCr8ASABsLweoaTgeCH2/LuycSVCYuvZdg1+7
 k67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4REMxXLq5nMhxUujFS74vlm3meLGVHAvBOdhv4pig1E=;
 b=VDPctSjF/YCGaDv1hxvB89zE6EC3d3qgNtwscVOGKiP2koarvQavMvo17TDFq1p89A
 eE3p/E/5LBaN2C2+1c23aTaLzJAbtG4cw+edjR7pYqu9OMcGhxHZzZI9U7h54yQqOdwS
 9GqrlXexy26QuVFHK9U0RkzH7h8OuYVYcxmHEQm/RGaOz+DUR4zY2TzCUiAXCvt6+yT9
 eJ2zbGhbQ4Iwqno/hkQXeC2dSOEh/rjciohc2Q3cQHJVZlJdc8jA2hszdzSJn5NzzHEX
 Hk+bIYwWCv8oI+VKCz5XpGsk+XiUQi1OCAbC3TZAetKkQzEQo5+HgR1k6paUCFZuYy71
 L0Og==
X-Gm-Message-State: AO0yUKUtsorCi5QF9TFLfKcgTVkyL3CWoEaRSwWJo8gxjC9eSVzjbdln
 b14gW8gRWLXfpsKJpFvsCa6qGARypmQ=
X-Google-Smtp-Source: AK7set/3SZeFakrh7RHMv/DTYL3b22fdAH7ltifODiVW62GZYaPPE1GqBUdBJQNPaeRRQyzc6pSX/g==
X-Received: by 2002:a17:902:a606:b0:19c:fa22:e984 with SMTP id
 u6-20020a170902a60600b0019cfa22e984mr4730997plq.48.1677661342027; 
 Wed, 01 Mar 2023 01:02:22 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:21 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v6 6/8] hw/net: rtl8139: Remove the logic of padding short
 frames in the receive path
Date: Wed,  1 Mar 2023 17:02:01 +0800
Message-Id: <20230301090203.1601925-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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

 hw/net/rtl8139.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 5a5aaf868d..a52b961bda 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -826,7 +826,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
 
     uint32_t packet_header = 0;
 
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -938,17 +937,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
         }
     }
 
-    /* if too small buffer, then expand it
-     * Include some tailroom in case a vlan tag is later removed. */
-    if (size < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE + VLAN_HLEN - size);
-        buf = buf1;
-        if (size < MIN_BUF_SIZE) {
-            size = MIN_BUF_SIZE;
-        }
-    }
-
     if (rtl8139_cp_receiver_enabled(s))
     {
         if (!rtl8139_cp_rx_valid(s)) {
-- 
2.34.1


