Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B4306DA3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:34:03 +0100 (CET)
Received: from localhost ([::1]:42494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50sU-0000Tb-AF
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pS-0007Ag-64; Thu, 28 Jan 2021 01:30:54 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pQ-0001C6-Jw; Thu, 28 Jan 2021 01:30:53 -0500
Received: by mail-pj1-x1030.google.com with SMTP id e9so3689067pjj.0;
 Wed, 27 Jan 2021 22:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kMsOFaYrDqrM3oafqHcNkqRMKkyVjGhWzktlMuJ5kRI=;
 b=m0BTxM/uT4TxXij/uSOFrfVXjFFciC/91YUgQJSxtDhYMTQLqeVlNBaPoCo280rd9l
 LIH3SADKFeKf7yt2sNutnBj9PDKKRSmJbPRJx/mGiejs0cdD1lu3bZ/ODUu0hXzyetaj
 oZEieFIuCl50Z0flc6EuRKhjqa8SDTirIQ2FXSh6n7yDQoTZp6K5eSE5hyjvmrMPyl7O
 w+pPvrTmqzUpYpDdxi5CqnqtCWgZrpEyB8MhR7kMY/rDvI043qlvzbSQUEU6oxJJDPn1
 X/qysoYF6pTUTFeMOvd4F8TxkIO+Ct/6LYaISGiEX9zf78FZdbbmA+SBPk0x1xSKw1U3
 WDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kMsOFaYrDqrM3oafqHcNkqRMKkyVjGhWzktlMuJ5kRI=;
 b=oUIwcn3gR6uDyeaNlzFBxNJS0DayMgWuUQa6y8pDf4XMb0VneRd8+jxLfb9HiFKMqR
 OhFjtvjjzq4e2dJ+zIgt4HlcWytj2POb6zOE5B+w41TmJ1fcz8W4FjFkX7hObGcTpvQ5
 WZblGpljdkcVFwuaZ1fXdlca4QuVc1G/C5GhVEfCThbBwEPTMnTVo30r6cZy8PqkYYKP
 S6iXUKETpTo5ZfAEJy3xE92Ws1tqPOGx9mRCxQ3ojjWadVYQct7BBV23oLE/rWKfbmML
 bkFOGM9FFoChd2t0/nXcOVTWdTSOTNuIf9zANSgu3X6D0RZBn+oT27s1Ag20/k+BzKA2
 +UUQ==
X-Gm-Message-State: AOAM532Tqy1Lf1KNqbKiDW7WODsJpbH5YG0BCTl+EKISe0e7YKYLP0hh
 Zu5bXlAnQi5YuWuBaKVXalN6YqVMe4Lx+w==
X-Google-Smtp-Source: ABdhPJwtyINsq8Z2W+7twtCWQ+nReJAJYlifneM/GzwS5wBRaPXhYvXvAyPHj9JjcdAUCUTi0mBPAA==
X-Received: by 2002:a17:90a:5208:: with SMTP id
 v8mr9529046pjh.224.1611815450943; 
 Wed, 27 Jan 2021 22:30:50 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:30:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 3/9] hw/sd: sd: Allow single/multiple block write for SPI
 mode
Date: Thu, 28 Jan 2021 14:30:29 +0800
Message-Id: <20210128063035.15674-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the single/multiple block write in SPI mode is blocked
by sd_normal_command(). Remove the limitation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

 hw/sd/sd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 09753359bb..946036d87c 100644
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
2.25.1


