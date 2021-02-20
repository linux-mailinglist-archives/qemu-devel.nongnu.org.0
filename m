Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A276F320224
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:18:02 +0100 (CET)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFyD-0005yc-M3
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFts-0000VO-5K; Fri, 19 Feb 2021 19:13:32 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFtq-0005Py-Hk; Fri, 19 Feb 2021 19:13:31 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d2so12662091edq.10;
 Fri, 19 Feb 2021 16:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wxy4ChBCXEtXz3ITFAFuSDoWqkojBHWGX+ka1E7CZTU=;
 b=O7xF00rEGZRpqjhGbhxnbquEzc6aKNrUmJ52N1p6BOgPY+GyPmt4ihsKzXpLYs9ML9
 OB35uy0Z9LJirI7vI6JkC943ZDEYjfHe2CJpVNRHoltrh3HhINUvQH9fgWMRmN9Snup4
 bMiL+r2d6YS23QnTyfus6D34jjhmX7oj6+1sQUpqG7c+NHTFit5407TgXS7GPGYPgAWd
 bsm1JFy05iKhx+yvF9lPb+G9aP7T21BMeC13/ibMwXqwJfZUSp7fnrtCTM+xkRWCe/sc
 AGMEuzHGqsbo8T1vy0zAXOTHv8f+bE8I+JgphwIRWAbxATrqmb3M0C9LZOQ10cqhCiG+
 +qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wxy4ChBCXEtXz3ITFAFuSDoWqkojBHWGX+ka1E7CZTU=;
 b=Iz91lTk2ZH1RBny7b8pzU5TCKz4ONBIdk7PeS5dG2OMXX04c3TtOSEtWIvkMXE2gHk
 J9Ruh5Ytsul7rBbpDNqzQ1nN3MtLj3O9mdumexkuvT+73N5BggfADuNzhZ++RviyIvul
 Z2P6Q9Z+OSPcaFa3mxaTVEaYErVhxvJHWczr4QP59N8vbw46+k79Yzjy2xtsqYQd3j0g
 amB7O2ZRa0yh+rNkx/Zc3a4Ov+xmHh791D+XkupyY44ZTOpDgDPGJV1lQ4jv4FthRmkU
 vTFVWyqwKMZn648CeqEspxze7Vc/sBtYnciCdHIOJp+1M0CUHrvj46F1eIOtEblNpuC1
 BkIg==
X-Gm-Message-State: AOAM53041omfbjRZZs+bKPtDUf63OZcpUzqZq44mLrrQSeOWh7JMhxQ6
 k5C/IoUGZoGn0GXIHtycpI39MdqAYVs=
X-Google-Smtp-Source: ABdhPJyX8CLHV0LyShd8DbxPK8x4x4L4YzDv92RcgGmKsGWwQAKWYFWGuJskGKmeMyOxFAj5pYJpkA==
X-Received: by 2002:aa7:c58a:: with SMTP id g10mr8954483edq.243.1613780008042; 
 Fri, 19 Feb 2021 16:13:28 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b27sm2228192eja.64.2021.02.19.16.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:13:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/18] hw/sd: sd: Allow single/multiple block write for SPI mode
Date: Sat, 20 Feb 2021 01:12:54 +0100
Message-Id: <20210220001309.2225022-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the single/multiple block write in SPI mode is blocked
by sd_normal_command(). Remove the limitation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210128063035.15674-4-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a85a821abbe..5de9e0a6c20 100644
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


