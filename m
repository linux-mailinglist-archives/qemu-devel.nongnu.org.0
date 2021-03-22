Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65968344D44
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:29:01 +0100 (CET)
Received: from localhost ([::1]:60242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOMO-0002m2-5h
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAe-0007dP-2B; Mon, 22 Mar 2021 13:16:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAc-0000Um-6b; Mon, 22 Mar 2021 13:16:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id x16so17966525wrn.4;
 Mon, 22 Mar 2021 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e70W9uzyKpOsFheDpYOYyrHpDU6wCRfHiqNqYkONK9M=;
 b=dgZuUUpCyVXaLr+jwsgCADs4MqprbrmPJxEZdqvaRQjIUzeRM72QU8mY3rKieczzUW
 IeRbANrUmVJ4a3I/47YuWdih9z+K8Ke0B1GYw/FuRPtZae/QICerrlBNTEbtklxUxw63
 qUPgHctWTAK0jjLDPxzqQqdEptex83wTErfCtFgQH6yXdz7nC3RSnNUZ09Ds2XYAVMP+
 kmiB3xL9S67RVam3k4ZsjAZa7uZDO+zen+9Js2tblQVazQZj/PQiAjaNHtCec4zq8ntV
 hYXdPcdLfF11kHkkGJLGS+4GuvqZNF4TWoJLE/z8EFFYqNcuxeD2R6i6J073qq54Sq9q
 aHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e70W9uzyKpOsFheDpYOYyrHpDU6wCRfHiqNqYkONK9M=;
 b=iM3p6aW/9wgNR4U5SyYgEniTBjnHvLBbQ6D0ODPkef1Un6Q1Ugva5UOhHAkAZy5z81
 vB3B8ntx4gnbinNngLE9jcICpsEmVTUeIPOuEH4zItl+z5YKZwZPTWOqMq+1KQyR5+yc
 vfn3o0HAitXJ+dbcMIXspA5NCOuinb3PYTUryzATD9l/fYqRo6cwtx28Juq2fHuB8Gde
 JsKwVU87eBSCMzV1i/tR9LafPLuwoFD3/dk5fuz5WR1Y5SY4thKTo4tvuFRNiN6kNkvW
 aLELBafqbnpJY8ZXiReaXMTDjdOU0Yk68a3NHZyP+LUkdY13GatWQjbdS3AAhc52/LP3
 v/qw==
X-Gm-Message-State: AOAM530Xs8SP0rGtlYaAMhIauImyshAehxZU0RC8LikIAyL8QpT9L6ix
 +EuGXVU1Ytuh5EwX+wUBea9v4+uP5Et9yg==
X-Google-Smtp-Source: ABdhPJywopL+GmuIEalv64+RFWA+XvTfuATTBMZHIXoIniRBWoR5BBrUQDIsCOO4W/y3beuXEyMDFg==
X-Received: by 2002:adf:dfc3:: with SMTP id q3mr563250wrn.121.1616433407774;
 Mon, 22 Mar 2021 10:16:47 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c8sm51766wmb.34.2021.03.22.10.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:16:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[]
 when a different block size is programmed
Date: Mon, 22 Mar 2021 18:16:10 +0100
Message-Id: <20210322171610.4183696-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322171610.4183696-1-f4bug@amsat.org>
References: <20210322171610.4183696-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Simon=20W=C3=B6rner?= <contact@simon-woerner.de>,
 Bin Meng <bin.meng@windriver.com>, Muhammad Alifa Ramdhan <info@starlabs.sg>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Cornelius Aschermann <cornelius.aschermann@rub.de>,
 Bin Meng <bmeng.cn@gmail.com>, Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

If the block size is programmed to a different value from the
previous one, reset the data pointer of s->fifo_buffer[] so that
s->fifo_buffer[] can be filled in using the new block size in
the next transfer.

With this fix, the following reproducer:

outl 0xcf8 0x80001010
outl 0xcfc 0xe0000000
outl 0xcf8 0x80001001
outl 0xcfc 0x06000000
write 0xe000002c 0x1 0x05
write 0xe0000005 0x1 0x02
write 0xe0000007 0x1 0x01
write 0xe0000028 0x1 0x10
write 0x0 0x1 0x23
write 0x2 0x1 0x08
write 0xe000000c 0x1 0x01
write 0xe000000e 0x1 0x20
write 0xe000000f 0x1 0x00
write 0xe000000c 0x1 0x32
write 0xe0000004 0x2 0x0200
write 0xe0000028 0x1 0x00
write 0xe0000003 0x1 0x40

cannot be reproduced with the following QEMU command line:

$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
      -nodefaults -device sdhci-pci,sd-spec-version=3 \
      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
      -device sd-card,drive=mydrive -qtest stdio

Cc: qemu-stable@nongnu.org
Fixes: CVE-2020-17380
Fixes: CVE-2020-25085
Fixes: CVE-2021-3409
Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
Reported-by: Simon Wörner (Ruhr-Universität Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210303122639.20004-6-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d0c8e293c0b..5b8678110b0 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1140,6 +1140,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         break;
     case SDHC_BLKSIZE:
         if (!TRANSFERRING_DATA(s->prnsts)) {
+            uint16_t blksize = s->blksize;
+
             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
 
@@ -1151,6 +1153,16 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 
                 s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
             }
+
+            /*
+             * If the block size is programmed to a different value from
+             * the previous one, reset the data pointer of s->fifo_buffer[]
+             * so that s->fifo_buffer[] can be filled in using the new block
+             * size in the next transfer.
+             */
+            if (blksize != s->blksize) {
+                s->data_count = 0;
+            }
         }
 
         break;
-- 
2.26.2


