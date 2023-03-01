Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6026A696B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:04:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIM2-0004Ef-KS; Wed, 01 Mar 2023 04:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILs-0004BR-NC
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:23 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXILr-0002nN-8s
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:02:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id v11so9746400plz.8
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bR3FRdQWQGBH8ttmejZMVXzSfOR2rdp5N4y48mjA/eU=;
 b=PLJKHnMpll0rtX9ZGJ+4GFapGyN6tFlowy/jm24Rse53PCD1RjN28Ms3he0UzyUwrp
 P2QincGGFzmVeNKj7X1htAaenn+YIhw/PkGZSREaeqDDYHjq/P41zHyz5ro+ko+GAcn5
 AJXkbpafrLAESg6zh0mQ/KhvKOFVlzorateyvfYhI3iLMDa8K9w5QoJE1dJpkS/OogT2
 ZTk5mpmilTLctBBYt/4ZO2JJNOkzduXuXu8UQuyhMKrKvIueun4jLt+nmXg0iA7ojm2J
 8qH19ngrD8ZEokgbccTrfeOcQ0xR4pd/7/EWYS5H2SGhSFRLer5a77ktzgLdk1UBCNUg
 TTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bR3FRdQWQGBH8ttmejZMVXzSfOR2rdp5N4y48mjA/eU=;
 b=RezxqXcu+5dB1hHTIqvITQ2II6ILf1z5PKhLLtx+IFDtZD2HxS3CZRM3l8j5rsOsuB
 ijw0DiyobxuufiOCGk+0x+klIewq739Mn5x7mHPbu5zmWwg4ms+ZxPCdPQF5kLR64+QD
 HvWjmPOmM9W2I+VEFEWfd69O5BbKawDp20aaQqHGS81V8DzjELxxKq1G7jFqdCz2JmuE
 Tf5h4vPwyq00zT96kjGRpLCWQT6K1bAeYoGj4JjN5tQTD1mKZbvXL5CbaIUJiJQ4P4IS
 6P16RIwnDZx3Sf07B36Psf/kkXaBQr8yGQfYOtMnWkbU5Y28guUtVJrguRvXzKoWwie3
 ERzg==
X-Gm-Message-State: AO0yUKVtLiqfmgUGrNDAhsEf7eN1HCQLHsihro0VgYY0f5BVIj5npfvZ
 uIiHo74dHey9f5OpPgfCSQY=
X-Google-Smtp-Source: AK7set+GvU8FAXva4mEKXVfijtDysbl3WaKuMpR/5C5lpddUWDUJyOmxRyBwAk7FKuLgIky1gd4Ccg==
X-Received: by 2002:a17:90b:38c7:b0:237:8686:1b78 with SMTP id
 nn7-20020a17090b38c700b0023786861b78mr6803057pjb.12.1677661337897; 
 Wed, 01 Mar 2023 01:02:17 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a170903044600b0019aa8149cb3sm7878991plb.219.2023.03.01.01.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:02:17 -0800 (PST)
From: bmeng.cn@gmail.com
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v6 4/8] hw/net: ne2000: Remove the logic of padding short
 frames in the receive path
Date: Wed,  1 Mar 2023 17:01:59 +0800
Message-Id: <20230301090203.1601925-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301090203.1601925-1-bmeng.cn@gmail.com>
References: <20230301090203.1601925-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
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

 hw/net/ne2000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 3f31d04efb..d79c884d50 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -167,15 +167,12 @@ static int ne2000_buffer_full(NE2000State *s)
     return 0;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     NE2000State *s = qemu_get_nic_opaque(nc);
     size_t size = size_;
     uint8_t *p;
     unsigned int total_len, next, avail, len, index, mcast_idx;
-    uint8_t buf1[60];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -213,15 +210,6 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
         }
     }
 
-
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     index = s->curpag << 8;
     if (index >= NE2000_PMEM_END) {
         index = s->start;
-- 
2.34.1


