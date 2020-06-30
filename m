Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C120F5FA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 15:43:22 +0200 (CEST)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqGXh-0006zM-4W
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 09:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqGTo-0000yb-H1; Tue, 30 Jun 2020 09:39:20 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqGTm-0006Hy-Ud; Tue, 30 Jun 2020 09:39:20 -0400
Received: by mail-ed1-x544.google.com with SMTP id z17so16244500edr.9;
 Tue, 30 Jun 2020 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NATlEi/FrWfP9Y28UrUe6cx6ZnLH5i2MWU0fBA6ejkY=;
 b=PeV/LkNILRZWOLaL4QBX3NRKvpFptIcRFjBN8rqlEdddDd6TRhJlX53Fo7Rl5oM8jp
 HXNAEaAorB6Rzhk+4IwBEktYT8wSbAhfScNKwyytav7dElHuuDlTReFHlJTCjLVN07//
 TH8G5IJGPWQ1/UVXdnzg2R+gckYYIBqChcb4orwBJavAsaqMiXcapOI73LY1J6hHTJWv
 m/DSntqkbEcdMyVBVH2rd/dGsj4fjet/cvVSfizDGfH6zL2a+4KFuk1B7bq4wI/1Xlgk
 in0R2fCv5j+7qneRLeCoTNgGClaAyQq/508fRtBqapWcMK7UuKrmtRSqG9bCSTFAgO23
 NU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NATlEi/FrWfP9Y28UrUe6cx6ZnLH5i2MWU0fBA6ejkY=;
 b=GspLcRDNwgtT03ygPAbvQrGek8e+2IxhMg24qInWy8GTmusf0BGIUdy2r7v/Ivm2uV
 2XKL19h5vC2xxbKnDm9UaqJZlWwPv/rCrv75aXnZnlXOymRwhV3lq/bCgLFIV5Okj1wz
 X8VMWFYA9rptCxez3BiiFIczsXJLGGTjHFgzzVkjIPasiaM3ErwtJacbjGUM03mrvUeH
 3e3kpszwhwDAMszh7LMqP1c22WUwQqYf9eQPuG4gObWoHh4rgiepzCKfZjIVuLqaiPTN
 d0zqwm5AIr4ChLsxc+TWO873JGZ1GdhBJZSxsTTdZz8paBhCSbCkBkQLBG1w1EjAxW7M
 odTw==
X-Gm-Message-State: AOAM5314YFCenZfoHKDX9TryUS7KcSuIHGdEL7XWMrnO55HdnxAMk+tL
 e7QrSl5jEV9i/FgNr2c9wOrfvDgS+DA=
X-Google-Smtp-Source: ABdhPJwU0JmxyaSl6Sbeinz9s7vJal6Pz1PBdRZdvfmS9BJNuXVE02tY/6o07mH/B+IfXm5afaCf/w==
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr3622995edb.154.1593524357181; 
 Tue, 30 Jun 2020 06:39:17 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id p18sm2099172ejm.55.2020.06.30.06.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 06:39:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/17] hw/sd/sdcard: Move some definitions to use them
 earlier
Date: Tue, 30 Jun 2020 15:38:57 +0200
Message-Id: <20200630133912.9428-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200630133912.9428-1-f4bug@amsat.org>
References: <20200630133912.9428-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move some definitions to use them earlier.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index cac8d7d828..4816b4a462 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -80,6 +80,12 @@ enum SDCardStates {
     sd_disconnect_state,
 };
 
+#define HWBLOCK_SHIFT   9                       /* 512 bytes */
+#define SECTOR_SHIFT    5                       /* 16 kilobytes */
+#define WPGROUP_SHIFT   7                       /* 2 megs */
+#define CMULT_SHIFT     9                       /* 512 times HWBLOCK_SIZE */
+#define WPGROUP_SIZE    (1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
+
 struct SDState {
     DeviceState parent_obj;
 
@@ -367,12 +373,6 @@ static void sd_set_cid(SDState *sd)
     sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
 }
 
-#define HWBLOCK_SHIFT	9			/* 512 bytes */
-#define SECTOR_SHIFT	5			/* 16 kilobytes */
-#define WPGROUP_SHIFT	7			/* 2 megs */
-#define CMULT_SHIFT	9			/* 512 times HWBLOCK_SIZE */
-#define WPGROUP_SIZE	(1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
-
 static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
-- 
2.21.3


