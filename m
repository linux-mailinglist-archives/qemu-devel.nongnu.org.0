Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC1387E5C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 19:26:52 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj3UY-0001hb-RP
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 13:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj3SD-0000tH-G7
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:24:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj3S4-0007VE-KH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621358654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DO5TS2u8zoYt5pHW3R4C/U8G+tga7XinQRORdYP+M4w=;
 b=A3r0WRB6LrBKAU8b33K6znge/JC8hDYFF4y2KiCUP386gxP67hzXXTlDQ5hOCiybK/6LEw
 1fgwOcJDO4mZwxgeafmN5OoO5NiaOlvJgpGJjzeDeC2jUeLbr6A5A6Gu7Ux8n0R4QHpCgW
 okVfLiQ5c8GvUKSQHIQ6SaMhs816Oac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-NhQOKOg5MtK1L9JfSZXcvg-1; Tue, 18 May 2021 13:24:12 -0400
X-MC-Unique: NhQOKOg5MtK1L9JfSZXcvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B536E801106;
 Tue, 18 May 2021 17:24:11 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B746859452;
 Tue, 18 May 2021 17:24:10 +0000 (UTC)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: P J P <ppandit@redhat.com>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <48257773-c423-a7e3-afb7-5909606b0688@redhat.com>
 <84950qo-8613-oo49-o876-p1op4r3ss60@erqung.pbz>
From: John Snow <jsnow@redhat.com>
Message-ID: <11abadd6-abbd-3937-b5a3-203f3593a19a@redhat.com>
Date: Tue, 18 May 2021 13:24:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <84950qo-8613-oo49-o876-p1op4r3ss60@erqung.pbz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, hannes Reinecke <hare@suse.com>,
 Gaoning Pan <pgn@zju.edu.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 5:01 AM, P J P wrote:
>    Hello John,
> 
> +-- On Mon, 17 May 2021, John Snow wrote --+
> | >       /* Selected drive */
> | > -    fdctrl->cur_drv = value & FD_DOR_SELMASK;
> | > +    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
> | > +        fdctrl->cur_drv = value & FD_DOR_SELMASK;
> | > +    }
> |
> | I don't think this is correct. If you look at get_cur_drv(), it uses the
> | TDR_BOOTSEL bit to change the logical mappings of "drive 0" or "drive 1" to be
> | reversed. You don't check that bit here, so you might be checking the wrong
> | drive.
> |
> | Plus, the TDR bit can change later, so I think you shouldn't actually protect
> | the register write like this. Just delete this bit of code. We ought to
> | protect the drives when we go to use them instead of preventing the registers
> | from getting "the wrong values".
> 
> * I see.
> 
> | >       cur_drv = get_cur_drv(fdctrl);
> | > +    if (!cur_drv->blk) {
> | > +        FLOPPY_DPRINTF("No drive connected\n");
> | > +        return 0;
> | > +    }
> |
> | This seems fine ... or at least not worse than the other error handling we
> | already have here. (Which seems to be ... basically, none. We just ignore the
> | write and do nothing, which seems wrong. I guess it's better than a crash...
> | but I don't have the time to do a proper audit of what this is SUPPOSED to do
> | in this case.)
> |
> | > -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
> | > +            if (cur_drv->blk == NULL
> | > +                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv),
> | > fdctrl->fifo,
> |
> | Seems fine, but if we had a drive for the earlier check, will we really be in
> | a situation where we don't have one now?
> |
> | Ignore the bit I sent earlier about the qtest reproducer not correlating to
> | this patch -- it does, I was experiencing an unrelated crash.
> 
> * Okay.
> 
> 
> | On 5/17/21 7:12 AM, P J P wrote:
> | > Do we need a revised patch[-series] including a qtest? OR it can be done at
> | > merge time?
> |
> | If you have the time to write a qtest reproducer, you can send it separately
> | and I'll pick it up if everything looks correct.
> 
> * Yes, that seems better, I'll try to create a qtest, but it may take time.
> 

I minified alexander's reproducer, which uses as few writes and as few 
bits as possible to achieve the same crash. It makes it easier to see 
what's going on with the DPRINTF/traces a little better.

outb 0x3f2 0x04
outb 0x3f4 0x03

outb 0x3f5 0x25
outb 0x3f5 0x01
outb 0x3f5 0x0
outb 0x3f5 0x0
outb 0x3f5 0x0
outb 0x3f5 0x0
outb 0x3f5 0x00
outb 0x3f5 0x00
outb 0x3f5 0x01

outb 0x3f3 0x04
outb 0x3f5 0x0


Annotated:

# fdctrl->cur_drv starts at 0x00
# fdctrl->dor starts at 0x0c (DMA, RESET#)
# fdctrl->dsr starts at 0x00

 > outb 0x3f2 0x04
fdc_ioport_write write reg 0x02 [DOR] Digital Output Register val 0x04
   DOR changed from default after SeaBIOS init from 0x0c to 0x04
   DMA GATE# (0x08) set from 1 --> 0
   DMA GATE# appears needed to coerce fdc into a "non-dma transfer".
   +RESET# remains on. Needed to avoid engaging RESET routine.

 > outb 0x3f4 0x03
fdc_ioport_write write reg 0x04 [DSR] Date Rate Select Register val 0x03
   DSR: +DRATE SEL1
   DSR: +DRATE SEL0
   Needed to prevent "data rate mismatch" error handling by write cmd.

The next 9 bytes (all to 0x3f5) set up the write command.

0x25 selects the "Write (BeOS)" command.
0x01 selects drive1.
...
0x01 appears to say that a sector is "1 byte", but oddly enough no other 
value seems to trigger this crash. Not sure why. Recommend investigating 
if you have time. Could be transfer length calculation bug.

 > outb 0x3f3 0x04
fdc_ioport_write write reg 0x03 [TDR] Tape Drive Register val 0x04
     TDR: +BOOTSEL
     This changes the meaning of cur_drv and flips selection (as far as 
I can tell) back to drive0 instead of the command's programmed drive1.

 > outb 0x3f5 0x00
fdc_ioport_write write reg 0x05 [FIFO] Data val 0x00
     write is attempted on "drv1" which due to BOOTSEL maps back to 
"drv0", which is undefined.


This should (I hope) help guide to write a more targeted patch and a 
good qtest case.

--js

> * I'll check and revise the patch with above details asap.
> 
> 
> Thank you.
> --
>   - P J P
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
> 
> 


