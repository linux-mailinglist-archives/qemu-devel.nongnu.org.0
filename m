Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7FC387AFE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:20:30 +0200 (CEST)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0aD-0001mH-88
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj0YO-0000Rx-E4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:18:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj0YL-00049A-6y
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621347511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jbhyWrTzjEMxfD3xqco3gIGxgC9f5Kt8G5qdF9Ken0w=;
 b=YA3TNmpKe7cdwfR2J6stSP7PXptvq14LVS4kjiBEcdQFpD6RZUd8e2Jhs0aA2rwxxeNb2J
 NbCUXsg5PAbzL28yQyvBEbZmi2+hzoj8a+x23nhH5JaXl+gVdqb49DNrQjZoTJNQx6Dd7h
 GbiyE61TkZ6wQioYTBhcaO+fvxsKy7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-24WuJFtOMbiBF2A3P25mew-1; Tue, 18 May 2021 10:18:29 -0400
X-MC-Unique: 24WuJFtOMbiBF2A3P25mew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 811E8AFD0C;
 Tue, 18 May 2021 14:18:17 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452A060855;
 Tue, 18 May 2021 14:18:12 +0000 (UTC)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: P J P <ppandit@redhat.com>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <48257773-c423-a7e3-afb7-5909606b0688@redhat.com>
 <84950qo-8613-oo49-o876-p1op4r3ss60@erqung.pbz>
From: John Snow <jsnow@redhat.com>
Message-ID: <9ff4a630-6b48-70f7-41ee-36368a68782e@redhat.com>
Date: Tue, 18 May 2021 10:18:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <84950qo-8613-oo49-o876-p1op4r3ss60@erqung.pbz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

(I know this is extremely backwards from how good code ought to be 
written where we centralize protecting sane values from becoming object 
state.)

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

(Which, to be clear, is 100% OK by me for this patch.)

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

Understand. Maybe I can help. The fuzzer reproducer is a great first 
step, but just needs to be "back-translated" into the logical operations 
it is performing so that the test code is readable.

I started doodling a tracer patch similar to the IDE one I checked in 
some ages ago to give symbolic names to the registers on read/write, 
which makes "reading" Alexander's fuzzing reproducers a bit easier.

I'll go work on that for a little while.

> * I'll check and revise the patch with above details asap.

OK; on your own schedule. I will try to leap on the patches as soon as I 
get them before the FDC code falls out of my head again.

If at all possible, I wouldn't mind seeing a series bundled with the 
other FDC fixes outstanding aggregated together. It will be easier (for 
me) to make sure I have everything up to date and together. (If it isn't 
too much hassle for you.)

AFAIK there's one for reads and one for writes that are very similar -- 
they protect against null BLK reads when we do not have a floppy drive 
present.

Thank you,
--js

> 
> 
> Thank you.
> --
>   - P J P
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
> 


