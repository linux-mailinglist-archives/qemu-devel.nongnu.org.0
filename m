Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC486B0C3E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 16:10:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZvQ8-0003Wv-3Z; Wed, 08 Mar 2023 10:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZvQ5-0003Wg-UP
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 10:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pZvQ4-0003cq-7N
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 10:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678288163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rS3lSlvhJamGquivlBMNDCwZG1TLH6rkhGbFuQd++ds=;
 b=LhcgLyd0FrG854vJqzsXWEW9Q5hKaTHpGbOgmkky99gPnSHP9B+Cz1ro7taEp+u/iZXxue
 32Ldxq2jjW5lpk/iRG8dM/6yPwp3rhiRFtUhCzu4wz0iNdl6Ju61A3gkF6KpzmGtyRSxvm
 2IyA0kp16cHUhjurS+Y7jHeDAkosgd0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-gqkzFhU6Pp-S6_Hi4rnvvA-1; Wed, 08 Mar 2023 10:03:03 -0500
X-MC-Unique: gqkzFhU6Pp-S6_Hi4rnvvA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so5966038wms.3
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 07:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678287773;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rS3lSlvhJamGquivlBMNDCwZG1TLH6rkhGbFuQd++ds=;
 b=jWi5ySzvzB7iBSKs8wMEpEnK5Qu2Emdx78LlZjion1gWXJUQDNrk1VMtxdY6CqBsD3
 xl1CX9VgVZu+4TDfl0YkQ23nM9p9TrfQrnI4ahpcRnlWY3//l9ELj6G83uOtrpFdsLk3
 brG0bRzNFhhsmvUouBebbly1S4Jp9dVm9MHmhG52+BlHp6ifKQl74VepFuppk+rBfn83
 mkC8a2M2ZoBjMqSCd3k0b3nVOYRpv1jdSk2mr5mM0Y2zUj8P1DlzWgfLRBCdXcfBeLgY
 kSOxXMmgs07OevzFjmMvujtWR/ccr/0aOYHOac1o0X4belUHo2znZdDOZta/ttPAZmdd
 MPpg==
X-Gm-Message-State: AO0yUKWJXtQ3EDZprbNM9rNCDAc7HZFaKBPzzQGkbmI8Af40W6slVQj5
 O3B2OTHiga+GEqudVLkcnbY/7kNwhmrv7+pBqpt6Rml9hn6Dw5O4vUMAwG1y9EikRaCu1Zcam/d
 MeVDcjDvHb+aLgIo=
X-Received: by 2002:a5d:4cc8:0:b0:2ce:3e1a:befd with SMTP id
 c8-20020a5d4cc8000000b002ce3e1abefdmr12159931wrt.5.1678287773301; 
 Wed, 08 Mar 2023 07:02:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8WJFpFJT9Qu3ix36jj0CEFDV256QxGs2QlOk91jxwatreByipcAURSu6dSk4AuN+JgaFN61Q==
X-Received: by 2002:a5d:4cc8:0:b0:2ce:3e1a:befd with SMTP id
 c8-20020a5d4cc8000000b002ce3e1abefdmr12159899wrt.5.1678287772941; 
 Wed, 08 Mar 2023 07:02:52 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a5d564e000000b002cde25fba30sm15533447wrw.1.2023.03.08.07.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 07:02:52 -0800 (PST)
Message-ID: <1a9e4479-8b84-d3a2-d57b-7f5e273dd282@redhat.com>
Date: Wed, 8 Mar 2023 16:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Deadlock with ide_issue_trim and draining
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, QEMU Developers <qemu-devel@nongnu.org>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1e3813b6-f2d0-9bd5-a270-e5835c13b495@proxmox.com>
 <97638730-0dfa-918b-3c66-7874171b3e5c@redhat.com>
 <011bccb7-e45d-72a8-f87f-2d65d5934407@redhat.com>
 <018e2b20-4d0a-509a-d106-0fd8a0895821@proxmox.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <018e2b20-4d0a-509a-d106-0fd8a0895821@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 08.03.23 11:35, Fiona Ebner wrote:
> Am 07.03.23 um 15:27 schrieb Hanna Czenczek:
>> On 07.03.23 14:44, Hanna Czenczek wrote:
>>> On 07.03.23 13:22, Fiona Ebner wrote:
>>>> Hi,
>>>> I am suspecting that commit 7e5cdb345f ("ide: Increment BB in-flight
>>>> counter for TRIM BH") introduced an issue in combination with draining.
>>>>
>>>>   From a debug session on a costumer's machine I gathered the following
>>>> information:
>>>> * The QEMU process hangs in aio_poll called during draining and doesn't
>>>> progress.
>>>> * The in_flight counter for the BlockDriverState is 0 and for the
>>>> BlockBackend it is 1.
>>>> * There is a blk_aio_pdiscard_entry request in the BlockBackend's
>>>> queued_requests.
>>>> * The drive is attached via ahci.
>>>>
>>>> I suspect that something like the following happened:
>>>>
>>>> 1. ide_issue_trim is called, and increments the in_flight counter.
>>>> 2. ide_issue_trim_cb calls blk_aio_pdiscard.
>>>> 3. somebody else starts draining.
>>>> 4. ide_issue_trim_cb is called as the completion callback for
>>>> blk_aio_pdiscard.
>>>> 5. ide_issue_trim_cb issues yet another blk_aio_pdiscard request.
>>>> 6. The request is added to the wait queue via blk_wait_while_drained,
>>>> because draining has been started.
>>>> 7. Nobody ever decrements the in_flight counter and draining can't
>>>> finish.
>>> Sounds about right.
>>>
>>>> The issue occurs very rarely and is difficult to reproduce, but with the
>>>> help of GDB, I'm able to do it rather reliably:
>>>> 1. Use GDB to break on blk_aio_pdiscard.
>>>> 2. Run mkfs.ext4 on a huge disk in the guest.
>>>> 3. Issue a drive-backup QMP command after landing on the breakpoint.
>>>> 4. Continue a few times in GDB.
>>>> 5. After that I can observe the same situation as described above.
>>>>
>>>> I'd be happy about suggestions for how to fix it. Unfortunately, I don't
>>>> see a clear-cut way at the moment. The only idea I have right now is to
>>>> change the code to issue all discard requests at the same time, but I
>>>> fear there might pitfalls with that?
>>> The point of 7e5cdb345f was that we need any in-flight count to
>>> accompany a set s->bus->dma->aiocb.  While blk_aio_pdiscard() is
>>> happening, we don’t necessarily need another count.  But we do need it
>>> while there is no blk_aio_pdiscard().
>>>
>>> ide_issue_trim_cb() returns in two cases (and, recursively through its
>>> callers, leaves s->bus->dma->aiocb set):
>>> 1. After calling blk_aio_pdiscard(), which will keep an in-flight count,
>>> 2. After calling replay_bh_schedule_event() (i.e. qemu_bh_schedule()),
>>> which does not keep an in-flight count.
>>>
>>> Perhaps we just need to move the blk_inc_in_flight() above the
>>> replay_bh_schedule_event() call?
>> FWIW, doing so at least keeps the reproducer from
>> https://bugzilla.redhat.com/show_bug.cgi?id=2029980 working.
>>
> And I'm not able to run into my current issue anymore :) Thank you!

Great! :)

> FWIW, the suggested change and explanation sound good to me. Are you
> going to send a patch for it?

Sure, can do.

Hanna


