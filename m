Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F3348701
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:39:19 +0100 (CET)
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFu2-0008BM-ME
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lPFt3-0007mA-KP
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:38:17 -0400
Received: from mail142-23.mail.alibaba.com ([198.11.142.23]:39334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lPFt0-0003jH-MA
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:38:17 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1057777|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0268789-0.00141912-0.971702;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=1; RT=1; SR=0; TI=SMTPD_---.JpraRpj_1616639865; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JpraRpj_1616639865)
 by smtp.aliyun-inc.com(10.147.41.121);
 Thu, 25 Mar 2021 10:37:45 +0800
To: qemu-devel@nongnu.org
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: Questions about qtest on interrupt controller
Message-ID: <cfae615f-171b-d90b-6ea3-46989bd958d6@c-sky.com>
Date: Thu, 25 Mar 2021 10:37:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------512567F3AF4969EAC4EFF1A2"
Content-Language: en-US
Received-SPF: none client-ip=198.11.142.23; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-23.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------512567F3AF4969EAC4EFF1A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi folks,

When I am writing  qtest  cases for an interrupt controller,  I 
encounter some problems.

*1) Can't intercept both the irq in and irq out for the same device.*

It's a necessary feature for an interrupt controller qtest. However, as 
you can see  from qtest.c,  when a device has intercepted irq out or irq 
in, it can't intercept another.

" if (irq_intercept_dev) {

             qtest_send_prefix(chr);

             if (irq_intercept_dev != dev) {

                 qtest_send(chr, "FAIL IRQ intercept already enabled\n");

             } else {

                 qtest_send(chr, "OK\n");

             }

             return; }

"

In my opinion,  this code in qtest is protecting from intercepting irqs 
repeatedly. But irq in and out are different directions, they should be 
intercepted simultaneously. Is it right?

*2) Can't get  the right IRQ num.*

If  I  intercept an IRQ out,  I can get the num of IRQ if the IRQ 
raises, .  But the really IRQ I want to get is the IRQ that the 
interrupt controller selected out. However I can't get this IRQ from 
qtest_irq_handler.

Are there already some methods to surmount these problems?  Any advice 
is well appreciated. Thanks very much.

Zhiwei



--------------512567F3AF4969EAC4EFF1A2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi folks,</p>
    <p>When I am writing  qtest  cases for an interrupt controller,  I
      encounter some problems.</p>
    <p><b>1) Can't intercept both the irq in and irq out for the same
        device.</b></p>
    <p>It's a necessary feature for an interrupt controller qtest.
      However, as you can see  from qtest.c,  when a device has
      intercepted irq out or irq in, it can't intercept another.</p>
    <pre><font face="Times New Roman, Times, serif">"
	if (irq_intercept_dev) {</font></pre>
    <pre><font face="Times New Roman, Times, serif">            qtest_send_prefix(chr);</font></pre>
    <pre><font face="Times New Roman, Times, serif">            if (irq_intercept_dev != dev) {</font></pre>
    <pre><font face="Times New Roman, Times, serif">                qtest_send(chr, "FAIL IRQ intercept already enabled\n");</font></pre>
    <pre><font face="Times New Roman, Times, serif">            } else {</font></pre>
    <pre><font face="Times New Roman, Times, serif">                qtest_send(chr, "OK\n");</font></pre>
    <pre><font face="Times New Roman, Times, serif">            }</font></pre>
    <pre><font face="Times New Roman, Times, serif">            return;
	}</font></pre>
    <pre><font face="Times New Roman, Times, serif">"</font>
</pre>
    <p>In my opinion,  this code in qtest is protecting from
      intercepting irqs repeatedly. But irq in and out are different
      directions, they should be intercepted simultaneously. Is it
      right?<br>
    </p>
    <p><b>2) Can't get  the right IRQ num.</b></p>
    <p>If  I  intercept an IRQ out,  I can get the num of IRQ if the 
      IRQ raises, .  But the really IRQ I want to get is the IRQ that
      the interrupt controller selected out. However I can't get this
      IRQ from qtest_irq_handler.</p>
    <p>Are there already some methods to surmount these problems?  Any
      advice is well appreciated. Thanks very much.<br>
    </p>
    <p>Zhiwei<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------512567F3AF4969EAC4EFF1A2--

