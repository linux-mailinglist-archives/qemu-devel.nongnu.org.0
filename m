Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA1828FEA5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 08:55:57 +0200 (CEST)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTJee-0000Ya-EJ
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 02:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTJc7-0007BK-1q; Fri, 16 Oct 2020 02:53:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56612
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTJc3-0000UD-Af; Fri, 16 Oct 2020 02:53:18 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTJc3-00073P-OV; Fri, 16 Oct 2020 07:53:17 +0100
To: Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20201013114922.2946-1-mark.cave-ayland@ilande.co.uk>
 <20201013114922.2946-3-mark.cave-ayland@ilande.co.uk>
 <20201016001803.GC7078@yekko.fritz.box>
 <CABLmASE+GzEhSgqqJmum+Xu7DkyQX6PtboKLhA4LyaOY7PYoSA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <67efe378-7979-9a51-7c66-8d8c3f55e335@ilande.co.uk>
Date: Fri, 16 Oct 2020 07:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CABLmASE+GzEhSgqqJmum+Xu7DkyQX6PtboKLhA4LyaOY7PYoSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 2/3] grackle: use qdev gpios for PCI IRQs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.019,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/10/2020 07:45, Howard Spoelstra wrote:

> Hi,
> 
> I see compilation of the current ppc-for-5.2 branch fail with:
> 
> ../hw/pci-host/grackle.c: In function ‘grackle_realize’:
> ../hw/pci-host/grackle.c:68:11: error: ‘GrackleState’ has no member named ‘pic’
>     68 |     if (!s->pic) {
>        |           ^~
> make: *** [Makefile.ninja:1741: libcommon.fa.p/hw_pci-host_grackle.c.o] Error 1
> 
> Best,
> Howard

I see - as per the cover letter, my series is a replacement for Phil's original patch 
at https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02988.html (the PIC link 
is now completely removed), so the solution here is to drop patch 7daac97 
"hw/pci-host/grackle: Verify PIC link is properly set".


ATB,

Mark.

