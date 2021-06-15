Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6B63A816D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:52:52 +0200 (CEST)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Up-0006II-Nf
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hc-0005iQ-SI
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:12 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Ha-0002iU-Rt
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:12 -0400
Received: by mail-ej1-x635.google.com with SMTP id k25so22660138eja.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s80JSWWhXUaW8VPewNLASzQ/RLf7bfO/1fOwopy2TkA=;
 b=AT4IJEwq2pBvMu3BDB/7nTesnDnGgnZ/ZVIu07NoSDvf3jHPsFijrEG/0lJSV8zvmy
 lAQ002Sdvv3X9Jubznet01Eopqr0Mdx41OY6jukloCj7i0/V+kZQlrokwmLm1H7ScUr8
 Rbam2W2TZ+O5IxYrf7YbmwQtO0u3BPo3IUtaFEpa7OuG2X4gsFSEhnzeHkUyNkkdMKKF
 ltGOFuwwq3O2K8ni1YanfVMDJfz6j77eMQPhyOZv52zHMkbVxqapqQUyvj0eEVFT8lyy
 Do8CzpfqWvnHpI+0i4NXH6ML9s6w3nDrtM5R3CDq7cIxvr5wV/nGx+NT+Ex2MzKc0/7C
 PPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s80JSWWhXUaW8VPewNLASzQ/RLf7bfO/1fOwopy2TkA=;
 b=f3rFUQX7tM8ggg4gD2apdcgJvZ6wy0W5S2UHoFP9NwLBfoy1UVmJhvjDRnRCrpP/hG
 lay2jfOpzdmlaZ6xbBcvzI+Moa8XoVkA4eiZL5WsX86gXfjBvLk6lkDT0LUt8klmqlCk
 t4bgmqt1E3mcHcjk1jxk/tfZy4y+TzIW3+D+tlKM+wTih0RbJCBcnqIOvQFm5mZAgNP5
 2Cy4oEB2iFSbSADDjtRRN3J065U19UTe+w1/Altld4lMt4vSESkqJY8vMW8CkyF0mEOT
 7AiykanUrLLR+GCAkIOjYuf5YYEF/doplgyQnUBoWKZTQAaaL5D5zygALEpsMOIDsol4
 1Gbw==
X-Gm-Message-State: AOAM532/vb1P+kIWe09ILWjbTZLdBEO+jQXLZIOzRu6UXDRWbtYkW1tN
 V700pRORz1qSZBdDgoPaEGWw1iVxCh4=
X-Google-Smtp-Source: ABdhPJzG9uy64aee2FmKytG925AdWVCxXRDPP4bTXEQd//g3cwMUDdVSQA8/zvOOXOjkV7rCsgr2GQ==
X-Received: by 2002:a17:906:26db:: with SMTP id
 u27mr21028839ejc.532.1623764349334; 
 Tue, 15 Jun 2021 06:39:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/33] esp: revert 75ef849696 "esp: correctly fill bus id with
 requested lun"
Date: Tue, 15 Jun 2021 15:38:33 +0200
Message-Id: <20210615133855.775687-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This commit from nearly 10 years ago is now broken due to the improvements
in esp emulation (or perhaps was never correct).  It shows up as a bug
in detecting the CDROM drive under MacOS. The error is caused by the
MacOS CDROM driver sending this CDB with an "S without ATN" command and
without DMA:

    0x12 0x00 0x00 0x00 0x05 0x00 (INQUIRY)

This is a valid INQUIRY command, however with this logic present the 3rd
byte (0x0) is copied over the 1st byte (0x12) which silently converts the
INQUIRY command to a TEST UNIT READY command before passing it to the
QEMU SCSI layer.  Since the TEST UNIT READY command has a zero length
response the MacOS CDROM driver never receives a response and assumes
the CDROM is not present.

The logic was to ignore the IDENTIFY byte and copy the LUN over from
the CDB, which did store the LUN in bits 5-7 of the second byte in
olden times.  This however is all obsolete, so just drop the code.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210519100803.10293-5-mark.cave-ayland@ilande.co.uk>
[Tweaked commit message. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 8e314ef156..16e4b7ead6 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -260,9 +260,6 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
             return 0;
         }
         n = esp_fifo_pop_buf(&s->fifo, buf, dmalen);
-        if (n >= 3) {
-            buf[0] = buf[2] >> 5;
-        }
         n = MIN(fifo8_num_free(&s->cmdfifo), n);
         fifo8_push_all(&s->cmdfifo, buf, n);
     }
-- 
2.31.1



