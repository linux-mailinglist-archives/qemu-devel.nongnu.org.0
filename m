Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FC476355
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:31:24 +0100 (CET)
Received: from localhost ([::1]:40340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxavs-0004Cs-11
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:31:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq1-0003rf-R1; Wed, 15 Dec 2021 15:25:21 -0500
Received: from [2a00:1450:4864:20::336] (port=41720
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxapz-0004Cf-Dx; Wed, 15 Dec 2021 15:25:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so16801223wmb.0; 
 Wed, 15 Dec 2021 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGUki+PXShNUqdRPSNDqgDsKleTogi1rqiMLBCxCdLs=;
 b=fuOSj9F0OddN1trp3VyeAVsh2icwh+Kr6+1dqqgifHXZxI4HKzvcZxx8A8vb+U5ArQ
 3jBs17aK7q9lOjv/PVqgiFcrvHk0WlxLV3ascEQ8IhdUvy/ud6qUjvbUdgZg+5BYYJ9P
 NDidcEKVJOEdyxuJ4F4+YWDpGtpnp2NFPHxuI5Wkp1lXV1Ri8Mq4XpJl87xzkIw/Dbff
 LIMmCKZ/5IwrvD2MrkuB3AiCQhA4mkXG/e01FVapyldzq3rX4Q5kO70lOUzRls1V1R7Q
 wleZ67lJqAAOHk4birzVwD/F+vHett/ofVDFFm+47tnbS8r00qtn08VKCSmHTQoZonb0
 yBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rGUki+PXShNUqdRPSNDqgDsKleTogi1rqiMLBCxCdLs=;
 b=pCkB2ZQgDX5hmPgJfRVoYLsg/4bluFVVuz+pPWJKbKdW7Bgjfm1BKzqiylOCu6+rLk
 BePpfjKXStGQt7nVqRsiBLFfv4S6EeRAeuslcCkcmMy0SbQxix2Lavk/ZeHlmx0gPXRm
 WSX3rNTBg5E617YGUOjO+nV9DyrF1q9OSou9iajdb4NTXJDez6GNE3ywWrdoJW3ULHxH
 Tpg1BqL04+2HtQLm/E+kUNKVVIF6TtkmFRushGnX5xk0dHvvJJd3c2hiyKWbNbOWK8wW
 LMNUX1AEwhsz3HiJ9Rx1UPSXvLBIfB3ZtcrruheOSbF2CaRvsfuh7RTcG1gly7kxIIzS
 c45w==
X-Gm-Message-State: AOAM531AeLWHDTpgzFdJuKATacVFSsKKAoFBZrkF0dKei56zhREZbGWj
 99VQCo1JpGQyAxKsntOvfcOOXbCek+E=
X-Google-Smtp-Source: ABdhPJy11m66Dh5MHjarbXy1VTbcfYqZcIx8GmHBa0ppPXb+Vn/EiHBX5xR5XBkdyl5vLh2Eotsf4g==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr1860029wmc.56.1639599917569;
 Wed, 15 Dec 2021 12:25:17 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] hw/scsi/lsi53c895a: Do not abort when DMA requested and
 no data queued
Date: Wed, 15 Dec 2021 21:25:03 +0100
Message-Id: <20211215202515.91586-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 qemu-stable@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Poulin?= <jeromepoulin@gmail.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ruhr-University <bugs-syssec@rub.de>, Gaoning Pan <pgn@zju.edu.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

If asked for DMA request and no data is available, simply wait
for data to be queued, do not abort. This fixes:

  $ cat << EOF | \
    qemu-system-i386 -nographic -M q35,accel=qtest -serial none \
      -monitor none -qtest stdio -trace lsi* \
      -drive if=none,id=drive0,file=null-co://,file.read-zeroes=on,format=raw \
      -device lsi53c895a,id=scsi0 -device scsi-hd,drive=drive0,bus=scsi0.0,channel=0,scsi-id=0,lun=0
  lsi_reset Reset
  lsi_reg_write Write reg DSP2 0x2e = 0xff
  lsi_reg_write Write reg DSP3 0x2f = 0xff
  lsi_execute_script SCRIPTS dsp=0xffff0000 opcode 0x184a3900 arg 0x4a8b2d75
  qemu-system-i386: hw/scsi/lsi53c895a.c:624: lsi_do_dma: Assertion `s->current' failed.

  (gdb) bt
  #5  0x00007ffff4e8a3a6 in __GI___assert_fail
      (assertion=0x5555560accbc "s->current", file=0x5555560acc28 "hw/scsi/lsi53c895a.c", line=624, function=0x5555560adb18 "lsi_do_dma") at assert.c:101
  #6  0x0000555555aa33b9 in lsi_do_dma (s=0x555557805ac0, out=1) at hw/scsi/lsi53c895a.c:624
  #7  0x0000555555aa5042 in lsi_execute_script (s=0x555557805ac0) at hw/scsi/lsi53c895a.c:1250
  #8  0x0000555555aa757a in lsi_reg_writeb (s=0x555557805ac0, offset=47, val=255 '\377') at hw/scsi/lsi53c895a.c:1984
  #9  0x0000555555aa875b in lsi_mmio_write (opaque=0x555557805ac0, addr=47, val=255, size=1) at hw/scsi/lsi53c895a.c:2095

Cc: qemu-stable@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vadim Rozenfeld <vrozenfe@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Reported-by: Jérôme Poulin <jeromepoulin@gmail.com>
Reported-by: Ruhr-University <bugs-syssec@rub.de>
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
Fixes: b96a0da06bd ("lsi: move dma_len+dma_buf into lsi_request")
BugLink: https://bugs.launchpad.net/qemu/+bug/697510
BugLink: https://bugs.launchpad.net/qemu/+bug/1905521
BugLink: https://bugs.launchpad.net/qemu/+bug/1908515
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/84
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/305
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/552
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20211123111732.83137-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/lsi53c895a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 85e907a785..4c431adb77 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -621,8 +621,7 @@ static void lsi_do_dma(LSIState *s, int out)
     dma_addr_t addr;
     SCSIDevice *dev;
 
-    assert(s->current);
-    if (!s->current->dma_len) {
+    if (!s->current || !s->current->dma_len) {
         /* Wait until data is available.  */
         trace_lsi_do_dma_unavailable();
         return;
-- 
2.33.1



