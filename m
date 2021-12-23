Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E729047E305
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:13:02 +0100 (CET)
Received: from localhost ([::1]:55148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mxy-0003TB-1g
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:13:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MjN-00005S-Nd
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MjL-0000oc-A9
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqGVMoeSLIS0R7ecXiNgtt0tJfscA56QNYUlD07YLQc=;
 b=iBoaIZM1xH9aS0lmLku49FOpdDkQ76WOt88s7M4n2vyDTVZ1L6ixXlfU8A2YjzNtfc6lFn
 WL9GuRO557pkpOxjumPfGrrbZxrPgotKbKBFyD5GSQvn+W1HU9DsXqrhvjwoZ+agUng5Hj
 ZCtsLQXu6dybniworpCQTjkidsER9hs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-6R1Mrua0ONmmwOmRjRKODQ-1; Thu, 23 Dec 2021 06:57:54 -0500
X-MC-Unique: 6R1Mrua0ONmmwOmRjRKODQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 d4-20020a05600c34c400b00345d5d47d54so635875wmq.6
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kqGVMoeSLIS0R7ecXiNgtt0tJfscA56QNYUlD07YLQc=;
 b=eYIozL7xI08AzpqKSw0cK+mUTvh00W7SgBrNED04NfMcdOSmSuBep0E72sxLlASp8u
 3NFE887wM33Sp4ujQ0phjr1z9iOg/4uTspZj3WKgfl4R90rTeFTAQkBQNWuQ38eeMqf5
 WX9M5AwDfRWg6D5vH1KATz2e3Dym6Mw6/hbd3nOEpCfAxiFLEMFjbeWfHB1iyOC12lmb
 luoluS5sFjiYQDjD7GBE0egjD4/b888bHpnQv2ikYONIMV1034EByrOL2tL2HUTlIkzv
 WAKHZTlIhMHthtHhLF2xG4hhM/DYMb/Y8EetP435AVaGzhAPaftlQbrBwo7S/rOPZJFG
 w9/w==
X-Gm-Message-State: AOAM5300RIoL9fFSax5SJ+tICo1PH6katHVNSQT7wk18dtqlJTDSamMq
 9U8rhLLR21a7wHEXh9vEMjYCcEuCMP8ZaEmirBrtKkAcNhwsdRDFJ6Xzs2/r2k/UFRC0AP4yMIg
 g+EaQBnXmJPNY8t3zg0i+LYseyjJMnV7kGi8zqhmeDHuIt2HekqVrE8XSE8fG/d+x
X-Received: by 2002:a5d:59af:: with SMTP id p15mr1567071wrr.422.1640260672476; 
 Thu, 23 Dec 2021 03:57:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkSWpPuScdr/sDyE1pWGinW5+okcN0PSBP+85J0cs057/gOU1XT2/F6hUrVg/EjjW0bVzoHA==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr1567016wrr.422.1640260672201; 
 Thu, 23 Dec 2021 03:57:52 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id az15sm4220456wmb.47.2021.12.23.03.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:57:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/23] dma: Have dma_buf_rw() take a void pointer
Date: Thu, 23 Dec 2021 12:55:38 +0100
Message-Id: <20211223115554.3155328-8-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DMA operations are run on any kind of buffer, not arrays of
uint8_t. Convert dma_buf_rw() to take a void pointer argument
to save us pointless casts to uint8_t *.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/dma-helpers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 3c06a2feddd..09e29997ee5 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -294,9 +294,10 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
+static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
                            DMADirection dir)
 {
+    uint8_t *ptr = buf;
     uint64_t resid;
     int sg_cur_index;
 
-- 
2.33.1


