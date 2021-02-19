Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F431F5DF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:27:47 +0100 (CET)
Received: from localhost ([::1]:52872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD18c-0003QU-3w
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lD178-0002qS-EP
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:26:15 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:42420
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lD172-0006B7-PY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:26:13 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id E1E71DA06BD;
 Fri, 19 Feb 2021 09:26:03 +0100 (CET)
Subject: Re: [PATCH] net: eepro100: validate various address values
From: Stefan Weil <sw@weilnetz.de>
To: P J P <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
 <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
 <6qo84891-7or2-7p58-rr4-n2n46o5730rq@erqung.pbz>
 <00338810-b72e-6a9c-eef0-3c0adc764695@weilnetz.de>
Message-ID: <43340d92-55da-61f2-5ad1-c8e3d6679f6d@weilnetz.de>
Date: Fri, 19 Feb 2021 09:26:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <00338810-b72e-6a9c-eef0-3c0adc764695@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.02.21 um 09:08 schrieb Stefan Weil:

> Okay, I can confirm the infinite recursion now.
>
> The test case triggers memory writes by the hardware which cause new 
> actions of the same hardware and so on.
>
> I don't know how the real hardware would handle that case.
>
> For QEMU we can extend the current code which tries to prevent endless 
> loops: the device status EEPRO100State can be extended by a recursion 
> counter to limit the number of recursions, or maybe a boolean flag 
> could be used to stop any recursion of action_command(). I prefer the 
> second variant (no recursion at all) and suggest to add a diagnostic 
> message as well like it is done for the endless loop case.


If there are no recursions in normal use, the following patch should work:

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 16e95ef9cc..2474cf3dc2 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -279,6 +279,9 @@ typedef struct {
      /* Quasi static device properties (no need to save them). */
      uint16_t stats_size;
      bool has_extended_tcb_support;
+
+    /* Flag to avoid recursions. */
+    bool busy;
  } EEPRO100State;

  /* Word indices in EEPROM. */
@@ -837,6 +840,14 @@ static void action_command(EEPRO100State *s)
         Therefore we limit the number of iterations. */
      unsigned max_loop_count = 16;

+    if (s->busy) {
+        /* Prevent recursions. */
+        logout("recursion in %s:%u\n", __FILE__, __LINE__);
+        return;
+    }
+
+    s->busy = true;
+
      for (;;) {
          bool bit_el;
          bool bit_s;
@@ -933,6 +944,7 @@ static void action_command(EEPRO100State *s)
      }
      TRACE(OTHER, logout("CU list empty\n"));
      /* List is empty. Now CU is idle or suspended. */
+    s->busy = false;
  }

  static void eepro100_cu_command(EEPRO100State * s, uint8_t val)


