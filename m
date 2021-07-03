Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A73BA921
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 17:04:49 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzhCK-0003Ux-B1
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 11:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhAJ-0000lF-0Y
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:02:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhAH-0002km-J5
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:02:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id t6so6307633wrm.9
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y6Aw6PBMKZRq1SU/fOrs7JqdxeS7L8PFTUoQh1plry8=;
 b=NrWII9E97pM4B44oJeeyyQgpfnpvK/30cdOHWiUFz7QYhq5NRvReCUxi09t+uD3VJX
 Zh9S/iqFSU9j/yVWUbiFgRB4F/hrTg4qCJdbZ5WUarxUos09d8a+5esCgUOy4Pzx9jXc
 8iapNP9m0HmS8fHQpXsLVNOOAq2Tv1ex5Fyo0on3ZblVpfpG7wE4LYogMhb7SG38Z3ce
 l1/12/xnynNpr1mkevJJlCIFXfH/aH91aKlRpDhDfjejw7+9NcN3YVDDFxxqcMZRU0S7
 0JhcVBKMhw2eS90GOC+safYmKaTk4TTEJwDx7BfuEm7pMpvZvvvK+jL08o7x9YyIt65D
 ASTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y6Aw6PBMKZRq1SU/fOrs7JqdxeS7L8PFTUoQh1plry8=;
 b=aGoNlj9dv+lcbpJ6gilpV41A5SmmSCAMev41J3FOtXiDY+jHUtS0s7LW0CrPVuztVE
 btpMWSLFVGocpayLuUVXJQonD3MDLxp3e0nRGVEFs//7I3tEG2mwGw2YgDWVZQFA/hkU
 0tBcQdkg9Yn0JGrxqK+ysA3aSsgbxP8Gzqlrd5Q1l2hsQ3DDWP2uKoWofXWJvM6DzJQr
 Ygt/MyydAVs11WrlkRdgA7P2TqOTeLR+wxyDf9ugWhNys98tvUDxHk3IgnUykZbLK0f1
 2FAIJmM/5gFoI1DiD0xRkwXFRL2Nxp0uRoWiVOQCHm4Jl7OCTV+cQteIbuXoRKikCMMQ
 SI+w==
X-Gm-Message-State: AOAM533yR0T2GvAE2E8RzfVbXRq7n/LxScHK2v08SEdJRSMj1+w+GtlL
 m9JYrjfk9GMJ8qf8c52zxJkomkyyIbNDFQ==
X-Google-Smtp-Source: ABdhPJwZWG8YOjZo0Cg5vSdiUqohqb1MM11nS6fIdhXrgInRbco9prro8pBtx2jQupDXxvzjwkejvw==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr5626309wrq.402.1625324560007; 
 Sat, 03 Jul 2021 08:02:40 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id h14sm7580629wro.32.2021.07.03.08.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 08:02:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] dp8393x: Store CRC using device configured endianess
Date: Sat,  3 Jul 2021 17:02:19 +0200
Message-Id: <20210703150219.364582-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703150219.364582-1-f4bug@amsat.org>
References: <20210703150219.364582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

Little-Endian CRC is dubious, and the datasheet does not specify
it being little-endian. Proceed similarly with the other memory
accesses, use the device endianess.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index dee8236400c..3a07f5c8ac9 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -817,8 +817,12 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         checksum = crc32(0, buf, pkt_size);
 
         /* Put frame checksum into RBA */
-        address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPECIFIED,
-                             NULL);
+        if (s->big_endian) {
+            address_space_stl_be(&s->as, address, checksum,
+                                 MEMTXATTRS_UNSPECIFIED, NULL);
+        } else {
+            address_space_stl_le(&s->as, address, checksum,
+                                 MEMTXATTRS_UNSPECIFIED, NULL);
         address += sizeof(checksum);
     }
 
-- 
2.31.1


