Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25BA2CA1D2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:53:40 +0100 (CET)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4E0-0003am-25
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk4Bh-0002Ew-L3
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:51:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk4Bf-0005g4-3R
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606823474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9/OymEFDkrdSf6Gf/IDIoKzOf1uuT7P6YWvQEA/Ybc=;
 b=MXoUfDZH0Ty07XT15uXWDp17/1cRx7jze7o8RPWDbcEQgajqsVZ+NgnhCULfxNK3pIzY0t
 +yVbm+wilhskvRHwIFinna4ZbLmJvoO2Mu/uDv4Aj9e9X9NFZcqHFzIOlFN1ifU/b/Iz62
 wV/E4uhK4yncFzW8x+kvUj/gZgM151Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Er7X5r4qM7un71rHtUi3wg-1; Tue, 01 Dec 2020 06:51:12 -0500
X-MC-Unique: Er7X5r4qM7un71rHtUi3wg-1
Received: by mail-ej1-f72.google.com with SMTP id bm18so1093679ejb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d9/OymEFDkrdSf6Gf/IDIoKzOf1uuT7P6YWvQEA/Ybc=;
 b=KGyd89Ba5nXcooWMmvW003HMcWHHMyprOsS+TlCJRkuNf0yRC8SIw2H+qzfibUyGC1
 +0Pd2hS/MHJTP90LcQVnSRyxOViGRkVYZYqZIm+2ALXFQ0wCdEYJxDz8zP/Xn553lvsi
 0xYj0eP7SvvOI9tDBnAMh+ZsfQR11eKHRV7NkhTXsayzWtO594b7y0pLdR1zNjQ7Jpu+
 WAtgsCe3vIt91EUCW1BW89FFoIstwCnY99Ek0CyIWPc5vjQUIdxarch1PPTiP0JLLuTj
 4vbE4K+OyA5PWuQbM4Am6nfJUMRye/KQsEMsuTHkrj5auel9woJrx34uzu07KdcTSBZQ
 0RUQ==
X-Gm-Message-State: AOAM531V3GLTI24sqYEIv+a+kOwVtpJWxsa86HXzR4EtiruGylnVFcF7
 pcQvWUj4zmuyjiiGUhTpjkdhxEwoj2MRB/5sgcL+ix1uNGLgaT0Lc5WqNHKZo9z87sWODCiAzl8
 BJ6IOPMhoJJ7g5O2FJ0Yp1kgyB9GNHjkwWn6c4z+Xt/LxdYdsfpSK/Fxm30djzjbMoTs=
X-Received: by 2002:a05:6402:1714:: with SMTP id
 y20mr2691210edu.306.1606823471230; 
 Tue, 01 Dec 2020 03:51:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBVhWVcMoloRlCLUk+XgfFn3eu7sf3lh6jbJuBbcewqDHjeivuq+GgM1Lel9/DB3/mywq6UA==
X-Received: by 2002:a05:6402:1714:: with SMTP id
 y20mr2691188edu.306.1606823470917; 
 Tue, 01 Dec 2020 03:51:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s12sm735102ejy.25.2020.12.01.03.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 03:51:10 -0800 (PST)
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: P J P <ppandit@redhat.com>, John Snow <jsnow@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
Date: Tue, 1 Dec 2020 12:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Wenxiang Qian <leonwxqian@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 14:57, P J P wrote:
> +-- On Wed, 18 Nov 2020, P J P wrote --+
> | During data transfer via packet command in 'ide_atapi_cmd_reply_end'
> | 's->io_buffer_index' could exceed the 's->io_buffer' length, leading
> | to OOB access issue. Add check to avoid it.
> |  ...
> |  #9  ahci_pio_transfer ../hw/ide/ahci.c:1383
> |  #10 ide_transfer_start_norecurse ../hw/ide/core.c:553
> |  #11 ide_atapi_cmd_reply_end ../hw/ide/atapi.c:284
> |  #12 ide_atapi_cmd_read_pio ../hw/ide/atapi.c:329
> |  #13 ide_atapi_cmd_read ../hw/ide/atapi.c:442
> |  #14 cmd_read ../hw/ide/atapi.c:988
> |  #15 ide_atapi_cmd ../hw/ide/atapi.c:1352
> |  #16 ide_transfer_start ../hw/ide/core.c:561
> |  #17 cmd_packet ../hw/ide/core.c:1729
> |  #18 ide_exec_cmd ../hw/ide/core.c:2107
> |  #19 handle_reg_h2d_fis ../hw/ide/ahci.c:1267
> |  #20 handle_cmd ../hw/ide/ahci.c:1318
> |  #21 check_cmd ../hw/ide/ahci.c:592
> |  #22 ahci_port_write ../hw/ide/ahci.c:373
> |  #23 ahci_mem_write ../hw/ide/ahci.c:513
> |
> | Reported-by: Wenxiang Qian <leonwxqian@gmail.com>
> | Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

Prasad, please try to put yourself in the reviewer's shoes.

1) Obviously this condition was not in the mind of whoever wrote the 
code.  For this reason the first thing to understand if how the bug came 
to happen, which precondition was not respected.  Your backtraces shows 
that you came from ide_atapi_cmd_read_pio, so:

- ide_atapi_cmd_reply_end is first entered with s->io_buffer_index == 
s->cd_sector_size

- s->lba is assumed to be != -1.  from there you go to cd_read_sector -> 
cd_read_sector_cb and then reenter ide_atapi_cmd_reply_end with 
s->io_buffer_index == 0.  Or to cd_read_sector_sync and then continue 
down ide_atapi_cmd_reply_end, again with s->io_buffer_index == 0

- if s->elementary_transfer_size > 0, the number of bytes that are read 
is bounded to s->cd_sector_size - s->io_buffer_index

- if s->elementary_transfer_size == 0, the size is again bounded to 
s->cd_sector_size - s->io_buffer_index in this code:

             /* we cannot transmit more than one sector at a time */
             if (s->lba != -1) {
                 if (size > (s->cd_sector_size - s->io_buffer_index))
                     size = (s->cd_sector_size - s->io_buffer_index);
             }

So my understanding is that, for the bug to happen, you need to enter 
ide_atapi_cmd_reply_end with s->lba == -1 despite being in the read CD 
path.  This might be possible by passing 0xFFFFFFFF as the LBA in 
cmd_read.  The correct fix would be to check lba against the media size 
in cmd_read.

This is reasoning that you should understand even before starting to 
write a patch.  Did you do this step?  If so, no problem---I still 
believe the patch is incorrect, but please explain how my reasoning is 
wrong and we'll take it from there.  If not, how do you know your patch 
is not papering over a bigger issue somewhere?


2) The maintainer is not the one that knows the code best: it's only 
someone who is trusted to make judgment calls that are good enough.  My 
job is to poke holes in your reasoning, not to reverse engineer it.  So 
if you did do step 1, you need to explain it to me, because at this 
point you know this part of the code better than I do.  This is a step 
that you did not do, because your commit message has no such explanation.

There's also another reason to do this: recording the details of the bug 
in the commit message helps anyone who wants to understand the story of 
the code.


3) We also need to ensure that the bug will not happen again.  Did you 
get a reproducer from the reporter?  If not, how did you trust the 
report to be correct?  If so, did you try to include it in the QEMU 
qtest testsuite?


If my understanding of the bug is correct, the patch is not the correct 
fix.  The correct fix is to add an assertion here *and* to fix the 
incorrect assumption up in the call chain.  For example:

- add an assertion in ide_atapi_cmd_read_{dma,pio} that s->lba <= 
s->nb_sectors && s->lba != -1

- add a range check in cmd_read and cmd_read_cd similar to what is 
already done in cmd_seek (but checking the full range from lba to 
lba+nb_sectors-1.


Even if the patch were correct, however, bullets (2) and (3) are two 
reasons why this patch is not acceptable for QEMU's standards---not even 
for a security fix.

This is nothing new.  Even though I have sometimes applied (or redone_ 
your fixes, I have told you a variation of the above every time I saw a 
a patch of yours.  The output of "git log --author pjp tests" tells me 
you didn't heed the advice though; I'm calling you out this time because 
it's especially clear that you didn't do these steps and because the 
result is especially wrong.

Thanks,

Paolo


