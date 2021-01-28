Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E578306DBD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:42:47 +0100 (CET)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l510w-0008Pu-O6
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pg-0007R2-8K; Thu, 28 Jan 2021 01:31:09 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pd-0001Gu-Td; Thu, 28 Jan 2021 01:31:07 -0500
Received: by mail-pg1-x52f.google.com with SMTP id z21so3637843pgj.4;
 Wed, 27 Jan 2021 22:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGyDKJAkR7ifdI26KEGcd/+dgaU381zIyEl2Y2AJHQs=;
 b=HL4KoxwcxoLPvABqBgoTSDJ+jcYPnMhrBK6QFLpA+JNODnUX4UYQ7Fo934J3puzNKX
 h+6/C972WzvRjjGzELRNY478NSh3XQjcEk+dt5C6PT/Y5FUFIPX8GjQMZfqGF9gTFgTb
 Cvp4n5vlbX37rK+0t5xZVqmmIFdDM8Hg3d6hLxUx2d7j7TYWVA0C8B598UUYGr2x5AA0
 Ty0bFZu63BFew15yh4lBqNAFwtPHKXlc08K1ObQfyiuLRuJjyL3TEu5o+7qXeXlXf5sn
 wjxhxNGBHExHnL7aP11PI+DaoXV099EftMs0XQEh/dCu6JSmkwnDcEXeLsAKYWdOVlk5
 gk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGyDKJAkR7ifdI26KEGcd/+dgaU381zIyEl2Y2AJHQs=;
 b=R9NO9oRX12ptHXYQKxn3lgh8YBe6IF3zTi654Tww1dohXwJukpsWdyb7ZtxykjZk4N
 l5uXdLkrdw/meGXNRD6/+5/rAGlAC8VaxLjPc9ZeDZL1AZWKLxn4w9id5T8/VNtuQbjS
 1AAOOkgOIh9MbfCseJT+9pikAFs1pppEVPwoK6C9zTdvMs2kyLp2dQprTQgIbGERHwqm
 B5cYqOH5NjLYeiNiArW4Pza8+KWd0GDztPLpGSSrHZzW/Vs2IZzz2OsLasfyToT+svfz
 UTx/r2J19BNIEGqnHpGDP+lpuF8td63TXbWfneo61UlFmOskjntjvIwxNhuhA5XUhOPG
 FVPA==
X-Gm-Message-State: AOAM531a79svplkB8/D5RgP86NQtAivDF65lsVgSWbFJpsD9yROPLPIW
 KvQl2SAo5ycKS0jL6jdVHaA=
X-Google-Smtp-Source: ABdhPJzMPApM+DAM+O6OSidmTjSmzNd5wP6oHH6FK1gmL9OHnvjUq/DKXKlaxh5SkMmny80dHDZE5Q==
X-Received: by 2002:a63:e906:: with SMTP id i6mr15044016pgh.350.1611815463704; 
 Wed, 27 Jan 2021 22:31:03 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:31:03 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 9/9] hw/sd: ssi-sd: Handle the rest commands with R1b
 response type
Date: Thu, 28 Jan 2021 14:30:35 +0800
Message-Id: <20210128063035.15674-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
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

Besides CMD12, the following command's reponse type is R1b:

- SET_WRITE_PROT (CMD28)
- CLR_WRITE_PROT (CMD29)
- ERASE (CMD38)

Reuse the same s->stopping to indicate a R1b reponse is needed.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v4:
- new patch: handle the rest commands with R1b response type

 hw/sd/ssi-sd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 907d681d19..97ee58e20c 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -194,6 +194,12 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                 /* CMD13 returns a 2-byte statuse work. Other commands
                    only return the first byte.  */
                 s->arglen = (s->cmd == 13) ? 2 : 1;
+
+                /* handle R1b */
+                if (s->cmd == 28 || s->cmd == 29 || s->cmd == 38) {
+                    s->stopping = 1;
+                }
+
                 cardstatus = ldl_be_p(longresp);
                 status = 0;
                 if (((cardstatus >> 9) & 0xf) < 4)
-- 
2.25.1


