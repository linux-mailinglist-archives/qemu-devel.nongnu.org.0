Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3B6301EB9
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:33:40 +0100 (CET)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3m4p-0004mw-UP
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lzy-0000ex-ML; Sun, 24 Jan 2021 15:28:38 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3lzx-0005Qf-9M; Sun, 24 Jan 2021 15:28:38 -0500
Received: by mail-wr1-x430.google.com with SMTP id v15so10245743wrx.4;
 Sun, 24 Jan 2021 12:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tfh6ZX6HuhyRZJV4+yZY7Muv5Hss9JwmwPOFvwdUOwo=;
 b=IsMnx0mhqo1o3sUrK5hX+CNtFURyVhNMOtL+ZsWgyCdXx6ROK5/nJ6AMceQYWc3OKd
 jKzt1PagCji85LRordIHcMNs7UPPxU6+rYbg6Rp7r9v+FZCiLBmzFjJ5XzEVCbowbiPy
 IjY+6i+oJl1BYHRVo7oJRxqmLMpJ55bPJEXuVGOE3qTHgJ130NG2Ic3UJU4kCYY0D3T2
 LO+6Hiree2kOXAOHabSHE1aSR+mp+eFkarNUKJbezOYyHXf/bBmjIo5Ha5jtDv+PcJZO
 QqIiSSwIPW62yH/HzFiFwf62P4jUE8zuYIAsGdgmehsvWUUdEHLZaLPWjzoR3ilTnDPX
 veDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tfh6ZX6HuhyRZJV4+yZY7Muv5Hss9JwmwPOFvwdUOwo=;
 b=O9bS+31gNglk9nzWQgysh47BJxosYjUoiXqU9CBYXAy8vRA2F+JVHpQj8aea13H5qI
 wK4h5vlHksobyHntsYeFelzNo50pWBcMG53PbIAhoU6Hiz3qL2fLjfOYN0CVV71bYt8X
 P7vMMfycseR6E0Ex/8bDfwGftyTAk1iEyoC0bpy49Q2WgosNe57y3LPWwpd+DLKnkwKS
 n/bpUxDFP7bCriMONB6yojXqEzE/6DzRWdlNy3/H2aJTVl92muIu4Lzv1O/kXNuE6Yvr
 ywHcKy+Tx5OsEemN/+t8VFvmffHWicjyhH2/Xm9dR/L90hVVlOElg1KIJE/ykvR3xTGQ
 b+jg==
X-Gm-Message-State: AOAM532WFOC9IXPlx1oxqS4LxGiADZHufHcPm/uvPaXSRQRgLZdXNgW6
 cqV2KpACJSeUAvRnCM9bKHcoCMm1Jb0=
X-Google-Smtp-Source: ABdhPJzHTqQlOKRFWiHufjaXujFPeCeO7zXFdSOLNhw+DhlfUkTITuuQt8nqN7cStwDONvRTJ6JkyA==
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr3606362wry.356.1611520115545; 
 Sun, 24 Jan 2021 12:28:35 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k15sm8138582wmj.6.2021.01.24.12.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:28:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 3/6] hw/sd: sd: Allow single/multiple block write for SPI
 mode
Date: Sun, 24 Jan 2021 21:28:14 +0100
Message-Id: <20210124202817.2624557-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124202817.2624557-1-f4bug@amsat.org>
References: <20210124202817.2624557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the single/multiple block write in SPI mode is blocked
by sd_normal_command(). Remove the limitation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210123104016.17485-14-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 09753359bb2..946036d87cb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1230,9 +1230,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
-            /* Writing in SPI mode not implemented.  */
-            if (sd->spi)
-                break;
 
             if (addr + sd->blk_len > sd->size) {
                 sd->card_status |= ADDRESS_ERROR;
-- 
2.26.2


