Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC0B3BA91F
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 17:04:38 +0200 (CEST)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzhC9-0002sW-Pv
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 11:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhA8-0000PF-KS
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:02:32 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhA7-0002dz-2I
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:02:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id l8so16164292wry.13
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GQ4gWC/7+gJn1oGuHn1HbyTnBxetQ7Db9hH6DyIPNbY=;
 b=G5mt2ZERc5lfg3ZwlmeZIRGwMg5T7/BY2g8yHNN1UP9A6lVOFXwQdWrV01cCNPjZpy
 Ky4xU8fXD+8pZB7HV8gncd6ME/YWctUgnvPSyInm+cdGw5OnRc1uG8Ym3nxJMqh3YuRC
 ITTrw92VkJAASXKuOASdI1sWayvrfTpW92yTIJrt3f/yZ/IUdcMKt+dW12RzLA+gAiD5
 VWIX0CV5CMu/SA2JqTefz+8WR/OQ1uHWHyiIUh2b1HAQk65hDFap1zMJEXWMNJes54YX
 IvFO+K8+KWrepjlE1X7w6Ew/UJK6IFVjKgKxkysRfPugbNFTS2iAUqpd4KAlL0rnVAoB
 Daeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GQ4gWC/7+gJn1oGuHn1HbyTnBxetQ7Db9hH6DyIPNbY=;
 b=umPhS9K0SWjUyKmDH8EJTuu9Rqtg2KnDnMPRPwVWzJVv4sc7MrByFNYtq0QHundLiH
 WgWdMO4lMSLEF6VswL4dgQIUU/SOehlI4b5Mlj6B7XTwcni64PCZAlmSUMUL7Vhr6/SR
 v8fgoL//12NmBptEhVoEsN1eb04G7dU5t4L1sTlGOXYaAWhoJt3CzncZPAGq7hJ2Fe47
 a+GVJlFIVqjBtdS1tUSRb0t0vQo/MGJKceO0094iG8r52N9UTJaDm4JYDE7v68e4csGP
 ceNdcOfGz8+xbJrbWS2Q+vEOcJxuUyxafphJdZhjZK2vBDtJLaBxm075iRF8pfo0dxqL
 mzlw==
X-Gm-Message-State: AOAM532mBWVp2zP6sWyzvWQNleYYWzmyI9A2PgGlFnWirjbfpPDCxUFY
 bsGmfpyqC60AGFCHEHrHeMiRdLTpctKPwA==
X-Google-Smtp-Source: ABdhPJy8z44Mh2CHsRD1QvUJ+JvvuxBe1pa4m49122ExX4W0aP8kNhMzGpX6obQwb4OxTi0eX92dDw==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr5636636wrs.384.1625324548789; 
 Sat, 03 Jul 2021 08:02:28 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id k15sm15798378wms.21.2021.07.03.08.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 08:02:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] dp8393x: Store CRC using address_space_stl_le()
Date: Sat,  3 Jul 2021 17:02:17 +0200
Message-Id: <20210703150219.364582-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703150219.364582-1-f4bug@amsat.org>
References: <20210703150219.364582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The address_space API can handle endianess conversion.
Replace cpu_to_le32() + address_space_write() by a
single address_space_stl_le() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index db9cfd786f5..99e179a5e86 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -802,7 +802,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     s->regs[SONIC_TRBA0] = s->regs[SONIC_CRBA0];
 
     /* Calculate the ethernet checksum */
-    checksum = cpu_to_le32(crc32(0, buf, pkt_size));
+    checksum = crc32(0, buf, pkt_size);
 
     /* Put packet into RBA */
     trace_dp8393x_receive_packet(dp8393x_crba(s));
@@ -812,8 +812,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     address += pkt_size;
 
     /* Put frame checksum into RBA */
-    address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                        &checksum, sizeof(checksum));
+    address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPECIFIED,
+                         NULL);
     address += sizeof(checksum);
 
     /* Pad short packets to keep pointers aligned */
-- 
2.31.1


