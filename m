Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29B46B109C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 19:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZy93-0005b1-GA; Wed, 08 Mar 2023 13:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZy91-0005Zs-Il
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 13:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZy8z-0005ah-L0
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 13:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678298645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULMuGhenDMzJOMqCV7CU+NoigLk/a95PMgvS6PFIE8A=;
 b=F8EGzxiJUkuneQJQLusiqBomiVweKdsxxUjkCnDr1ihwrokSe5m3HFTzztQBpPokQGowi8
 maQWwMSme2D1sHRikvIqfMhew1AQTxyAjmi/7Dqf7r+O75AyzXRB6YepC4+Pt3K2oOWFxY
 HRwSDJ0fsDdSKNOQUpsSlrUwB+TLxxQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-aVPK-KJON4mV6KYZ5r0F_Q-1; Wed, 08 Mar 2023 13:04:02 -0500
X-MC-Unique: aVPK-KJON4mV6KYZ5r0F_Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 a7-20020a056000188700b002cdd0562b11so3086372wri.11
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 10:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678298641;
 h=in-reply-to:references:cc:to:from:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ULMuGhenDMzJOMqCV7CU+NoigLk/a95PMgvS6PFIE8A=;
 b=lYY+D0ooYhJFUCsDiiZDeZWU1g618y5jdViPnvb07FaPDXVbrOyTahov6aHp/edSIr
 +2tz5O4QeVBEpmRyw9hOe7BCbHVbTUZOgCGxDWfU4pxJMzBwQuPdPnzvdPukU3ZU0olX
 Y0/F8rcQofB4xktw1Y+iV2k94PDfYnWOSuKkr4diI6tAZLFV1UczFc91aKA9bDSWoO3a
 XQYgAFO+UglZurkLEOSGNS+FXOozbaeg1vZrGYL3dxPMg+9BPCt0S+lEWYzTSRcFq/z0
 BSg4XITn9bFw0/T1lADP/OP9RJfhQbKGyUGnEHeExNeRRkx6ITxqOtxSiIeaGjdsCDps
 jjHg==
X-Gm-Message-State: AO0yUKUTqZjIKN+9u94FVqWsMz5Q/KBrrNJfBylxhVyC315dqKRVs8IP
 YNsMQ/MnT0fSrWOGyDXkmfN5pKDJTyNKrpNidqSszRUbnDjTmaTfd2VwUdEnPNrNMiREsri4Bg+
 1CyStG2g2mlkCDEc=
X-Received: by 2002:adf:e5c4:0:b0:2ce:8199:daba with SMTP id
 a4-20020adfe5c4000000b002ce8199dabamr2264398wrn.19.1678298640823; 
 Wed, 08 Mar 2023 10:04:00 -0800 (PST)
X-Google-Smtp-Source: AK7set9uyfppdCluC/eh97RR6gmLiIyTpOdfC6ZfZe+2JQNQzXCHY4HmgHFzW4gmduy3hn/KzllebA==
X-Received: by 2002:adf:e5c4:0:b0:2ce:8199:daba with SMTP id
 a4-20020adfe5c4000000b002ce8199dabamr2264378wrn.19.1678298640418; 
 Wed, 08 Mar 2023 10:04:00 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b002c54fb024b2sm15648977wrj.61.2023.03.08.10.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 10:03:59 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------akFXaH5KGjXJVpHmaI4Omu0i"
Message-ID: <2c5b2bff-2ab2-e6e4-b324-19c2e11d9c54@redhat.com>
Date: Wed, 8 Mar 2023 19:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Deadlock with ide_issue_trim and draining
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>, QEMU Developers <qemu-devel@nongnu.org>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1e3813b6-f2d0-9bd5-a270-e5835c13b495@proxmox.com>
 <97638730-0dfa-918b-3c66-7874171b3e5c@redhat.com>
In-Reply-To: <97638730-0dfa-918b-3c66-7874171b3e5c@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------akFXaH5KGjXJVpHmaI4Omu0i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.03.23 14:44, Hanna Czenczek wrote:
> On 07.03.23 13:22, Fiona Ebner wrote:
>> Hi,
>> I am suspecting that commit 7e5cdb345f ("ide: Increment BB in-flight
>> counter for TRIM BH") introduced an issue in combination with draining.
>>
>>  From a debug session on a costumer's machine I gathered the following
>> information:
>> * The QEMU process hangs in aio_poll called during draining and doesn't
>> progress.
>> * The in_flight counter for the BlockDriverState is 0 and for the
>> BlockBackend it is 1.
>> * There is a blk_aio_pdiscard_entry request in the BlockBackend's
>> queued_requests.
>> * The drive is attached via ahci.
>>
>> I suspect that something like the following happened:
>>
>> 1. ide_issue_trim is called, and increments the in_flight counter.
>> 2. ide_issue_trim_cb calls blk_aio_pdiscard.
>> 3. somebody else starts draining.
>> 4. ide_issue_trim_cb is called as the completion callback for
>> blk_aio_pdiscard.
>> 5. ide_issue_trim_cb issues yet another blk_aio_pdiscard request.
>> 6. The request is added to the wait queue via blk_wait_while_drained,
>> because draining has been started.
>> 7. Nobody ever decrements the in_flight counter and draining can't 
>> finish.
>
> Sounds about right.
>
>> The issue occurs very rarely and is difficult to reproduce, but with the
>> help of GDB, I'm able to do it rather reliably:
>> 1. Use GDB to break on blk_aio_pdiscard.
>> 2. Run mkfs.ext4 on a huge disk in the guest.
>> 3. Issue a drive-backup QMP command after landing on the breakpoint.
>> 4. Continue a few times in GDB.
>> 5. After that I can observe the same situation as described above.
>>
>> I'd be happy about suggestions for how to fix it. Unfortunately, I don't
>> see a clear-cut way at the moment. The only idea I have right now is to
>> change the code to issue all discard requests at the same time, but I
>> fear there might pitfalls with that?
>
> The point of 7e5cdb345f was that we need any in-flight count to 
> accompany a set s->bus->dma->aiocb.  While blk_aio_pdiscard() is 
> happening, we don’t necessarily need another count.  But we do need it 
> while there is no blk_aio_pdiscard().
>
> ide_issue_trim_cb() returns in two cases (and, recursively through its 
> callers, leaves s->bus->dma->aiocb set):
> 1. After calling blk_aio_pdiscard(), which will keep an in-flight count,
> 2. After calling replay_bh_schedule_event() (i.e. qemu_bh_schedule()), 
> which does not keep an in-flight count.
>
> Perhaps we just need to move the blk_inc_in_flight() above the 
> replay_bh_schedule_event() call?

While writing the commit message for this, I noticed it isn’t quite 
right: ide_cancel_dma_sync() drains s->blk only once, so once the 
in-flight counter goes to 0, s->blk is considered drained and 
ide_cancel_dma_sync() will go on to assert that s->bus->dma->aiocb is 
now NULL.  However, if we do have a blk_aio_pdiscard() in flight, the 
drain will wait only for that one to complete, not for the whole trim 
operation to complete, i.e. the next discard or ide_trim_bh_cb() will be 
scheduled, but neither will necessarily be run before blk_drain() returns.

I’ve attached a reproducer that issues two trim requests.  Before 
7e5cdb345f, it makes qemu crash because the assertion fails (one or two 
of the blk_aio_pdiscard()s is drained, but the trim isn’t settled yet).  
After 7e5cdb345f, qemu hangs because of what you describe (the second 
blk_aio_pdiscard() is enqueued, so the drain can’t make progress, 
resulting in a deadlock).  With my proposed fix, qemu crashes again.

(Reproducer is run like this:
$ qemu-system-x86_64 -drive if=ide,file=/tmp/test.bin,format=raw
)

What comes to my mind is either what you’ve proposed initially (issuing 
all discards simultaneously), or to still use my proposed fix, but also 
have ide_cancel_dma_sync() run blk_drain() in a loop until 
s->bus->dma->aiocb becomes NULL.  (Kind of like my original patch 
(https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00024.html), 
only that we can still use blk_drain() instead of aio_poll() because we 
increment the in-flight counter while the completion BH is scheduled.)

Hanna
--------------akFXaH5KGjXJVpHmaI4Omu0i
Content-Type: application/octet-stream; name="test.bin"
Content-Disposition: attachment; filename="test.bin"
Content-Transfer-Encoding: base64

/DHAjtiOwL8AfjHAuQAB8qu/AH5mxwUBAAAAZsdFBAAAAQBmx0UIAQAAAGbHRQwAAAEAuAKx
uoaAuRBwMfbNGlO/BAC4CrHNGltTgMkHvwQAuA2xzRpbU78gALgKsc0ag+H8UYnKMMDusASD
wgLuZrigfAAAg8ICZu+68AG+lHy5CACs7kLi+1qwAe669gOwBO769AABAQAAAMAGAACQkAB+
AAAAAgCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAVaoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==

--------------akFXaH5KGjXJVpHmaI4Omu0i
Content-Type: text/plain; charset=UTF-8; name="test.asm"
Content-Disposition: attachment; filename="test.asm"
Content-Transfer-Encoding: base64

Zm9ybWF0IGJpbmFyeQp1c2UxNgoKb3JnIDB4N2MwMAoKRE1BX0JVRiA9IDB4N2UwMAoKY2xk
Cgp4b3IgICAgIGF4LCBheAptb3YgICAgIGRzLCBheAptb3YgICAgIGVzLCBheAoKOyBjbGVh
ciBETUEgYnVmZmVyCm1vdiAgICAgZGksIERNQV9CVUYKeG9yICAgICBheCwgYXgKbW92ICAg
ICBjeCwgMjU2CnJlcG56IHN0b3N3Cgo7IHR3byBUUklNIHJlcXVlc3RzIChib3RoIGFyZSB0
aGUgc2FtZTogb25lIHNlY3Rvciwgc3RhcnRpbmcgYXQgc2VjdG9yIGluZGV4IDEpCm1vdiAg
ICAgZGksIERNQV9CVUYKbW92ICAgICBkd29yZCBbZGkrIDBdLCAweDAwMDAwMDAxCm1vdiAg
ICAgZHdvcmQgW2RpKyA0XSwgMHgwMDAxMDAwMAptb3YgICAgIGR3b3JkIFtkaSsgOF0sIDB4
MDAwMDAwMDEKbW92ICAgICBkd29yZCBbZGkrMTJdLCAweDAwMDEwMDAwCgo7IGZpbmQgSURF
IFBDSSBkZXZpY2UKbW92ICAgICBheCwgMHhiMTAyCm1vdiAgICAgZHgsIDB4ODA4Ngptb3Yg
ICAgIGN4LCAweDcwMTAKeG9yICAgICBzaSwgc2kKaW50ICAgICAweDFhCgo7IGJ4IGhhcyBQ
Q0kgYWRkcmVzcwpwdXNoICAgIGJ4Cgo7IGVuYWJsZSBCTStNRU0rSU8KCm1vdiAgICAgZGks
IDB4MDQgOyBjb21tYW5kL3N0YXR1cwptb3YgICAgIGF4LCAweGIxMGEgOyByZWFkIGNvbmZp
ZyBkd29yZAppbnQgICAgIDB4MWEKCnBvcCAgICAgYngKcHVzaCAgICBieAoKb3IgICAgICBj
bCwgMHg3IDsgQk0rTUVNK0lPCm1vdiAgICAgZGksIDB4MDQKbW92ICAgICBheCwgMHhiMTBk
IDsgd3JpdGUgY29uZmlnIGR3b3JkCmludCAgICAgMHgxYQoKcG9wICAgICBieApwdXNoICAg
IGJ4Cgo7IHJlYWQgQkFSNCAoRE1BIEkvTyBzcGFjZSkKCm1vdiAgICAgZGksIDB4MjAgOyBi
YXI0Cm1vdiAgICAgYXgsIDB4YjEwYQppbnQgICAgIDB4MWEKCmFuZCAgICAgY3gsIDB4ZmZm
YyA7IERNQSBJL08gYmFzZQpwdXNoICAgIGN4Cgptb3YgICAgIGR4LCBjeAoKOyBzZXQgdXAg
RE1BCgp4b3IgICAgIGFsLCBhbCA7IHN0YXR1czogMApvdXQgICAgIGR4LCBhbAoKbW92ICAg
ICBhbCwgMHgwNCA7IGNsZWFyIHBlbmRpbmcgaW50ZXJydXB0cwphZGQgICAgIGR4LCAyCm91
dCAgICAgZHgsIGFsCgptb3YgICAgIGVheCwgcHJkdAphZGQgICAgIGR4LCAyCm91dCAgICAg
ZHgsIGVheAoKOyBzZW5kIFRSSU0gY29tbWFuZAoKbW92ICAgICBkeCwgMHgxZjAKbW92ICAg
ICBzaSwgZHNtX3RyaW1fY21kCm1vdiAgICAgY3gsIDgKb3V0X2xvb3A6CmxvZHNiCm91dCAg
ICAgZHgsIGFsCmluYyAgICAgZHgKbG9vcCAgICBvdXRfbG9vcAoKOyBzdGFydCBETUEgdHJh
bnNmZXIKCnBvcCAgICAgZHgKbW92ICAgICBhbCwgMHgwMQpvdXQgICAgIGR4LCBhbAoKOyBp
bW1lZGlhdGVseSByZXNldCBkZXZpY2UsIGNhbmNlbGxpbmcgb25nb2luZyBUUklNCgptb3Yg
ICAgIGR4LCAweDNmNgptb3YgICAgIGFsLCAweDA0Cm91dCAgICAgZHgsIGFsCgpjbGkKaGx0
CgoKZHNtX3RyaW1fY21kOgpkYiAweDAwLCAweDAxLCAweDAxLCAweDAwLCAweDAwLCAweDAw
LCAweGMwLCAweDA2CgpwY2lhZGRyOgpkdyA/CgphbGlnbig4KQpwcmR0OgpkZCBETUFfQlVG
CmRkIDUxMiBvciAweDgwMDAwMDAwCgp0aW1lcyA1MTAtKCQtJCQpIGRiIDAKZHcgMHhhYTU1
Cgp0aW1lcyA1MTIgZGIgMAo=

--------------akFXaH5KGjXJVpHmaI4Omu0i--


