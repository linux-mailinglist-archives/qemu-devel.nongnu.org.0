Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC593BB73C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 08:35:55 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ICw-0006Tr-7J
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 02:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0IC9-0005p8-3c
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:35:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42222
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0IC7-0003Rf-3f
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:35:04 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0IBm-00090u-G0; Mon, 05 Jul 2021 07:34:42 +0100
To: Finn Thain <fthain@linux-m68k.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-7-f4bug@amsat.org>
 <d95b2ae6-c849-1b79-36f0-25c5133cca7a@ilande.co.uk>
 <b2cbdfbf-398-3530-b37b-5416aa612af9@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <d44ae2a3-112a-a84e-5900-bdfa7594cd1c@ilande.co.uk>
Date: Mon, 5 Jul 2021 07:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b2cbdfbf-398-3530-b37b-5416aa612af9@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 6/6] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Cc: Laurent Vivier <laurent@vivier.eu>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2021 02:36, Finn Thain wrote:

>> Unfortunately I don't have a test mips64el image available to see if this
>> combination works for Linux. Phil, do you have a suitable test kernel and
>> rootfs image available to allow this to be tested?
>>
> 
> You can build and boot a mipsel vmlinux by following the steps I described
> previously. In the kernel messages you'll see the jazzsonic driver attempt
> to probe the device. When it succeeds, you'll see the MAC address
> reported. You can also observe the regression I reported with regards to
> patch 2/6, "dp8393x: don't force 32-bit register access".

Those instructions are useful, but since I am not a MIPS developer I don't have an 
existing toolchain/kernel tree and rootfs available to test this.

If you can provide me with a link to your vmlinux and rootfs with busybox or similar 
in it, I can take a look to see what is happening here. Otherwise it's almost 
impossible for me to understand and debug the problem you are seeing on your setup.


ATB,

Mark.

