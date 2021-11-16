Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4326453244
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:32:33 +0100 (CET)
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxdY-0002vh-QS
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmxc9-0001tb-Ht
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:31:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmxc7-0001GU-Ci
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637065862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMSnny62XwhRSYptV9unxYJ0ZS1BLQvN5es9SGXUpkk=;
 b=ZPKeSCZ29iCD2i3CKHMZhYq0gpS6BpabBl2UilEVXWIVLScq6wphH1aMIFI4JXAJNa7h9q
 iLEU/7E9Eg8yo8ggEr+ILAOGix5+Smu2gIot/zZ9IYW4G2Jk/yadB8sq71QvBNS4PEMnKG
 9ypfwQe2mBHXxGtGYR34hHL79yndzLk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-nlObvAPhOlmc2kj6La8SOg-1; Tue, 16 Nov 2021 07:31:01 -0500
X-MC-Unique: nlObvAPhOlmc2kj6La8SOg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso4446123wrq.16
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gMSnny62XwhRSYptV9unxYJ0ZS1BLQvN5es9SGXUpkk=;
 b=REi/ep/pmYrMu/KZCDlgRCY4QMgRcmYkP16U6v+LfcM329Nde9kElIRNZFHggvhg4i
 9QjFg8mc0+hz0/5D6Zm3gcVRvfG6B5FcjlxfjJRYsyKzXd5Wt9AvsQfmqxuyiZTIKptx
 IzqtPFZoTt8wNusbly93H0ggRkhuxTFOZ8veX6zqx12Fhr/0cw2VNXK8ftvSXxdOACNL
 GEge/cuf7UKcazSCnYx0YrfN3SrEeUw25vv0unJFdy2ODOXxa//iWTkhcZLZfCWBc/mJ
 L24o3rOTl0Fawo9cxdwQ3klvhfuLpPhrW47Dxugss8pr2ooc1T+LgOhr2EAd7IkeIcp6
 AbKw==
X-Gm-Message-State: AOAM5322V1aI8wmau5o4+57ktLi6EPxyj3gJmUdUCeXIyaR08so5jdWZ
 ceFnSUy1y2LA9VBiHQRK+USzeR5rBwXwiY9qDVztuKa0ymARr3SyOdSP4GvgJj+wRKPRnGt1LGV
 TDP1qeHxXPtOUxRY=
X-Received: by 2002:adf:d082:: with SMTP id y2mr8650672wrh.214.1637065860456; 
 Tue, 16 Nov 2021 04:31:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrObMSWaJk9RhEJWzXz86v9INsjiTG3uIliezfTyG97FTzV1HXnamOsCBQPBM6hqA16ExYfQ==
X-Received: by 2002:adf:d082:: with SMTP id y2mr8650626wrh.214.1637065860229; 
 Tue, 16 Nov 2021 04:31:00 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id q4sm17471445wrs.56.2021.11.16.04.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:30:59 -0800 (PST)
Message-ID: <895b0347-121f-1335-25af-91274a2f140a@redhat.com>
Date: Tue, 16 Nov 2021 13:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 06/25] include/block/block_int: split header into I/O
 and global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-7-eesposit@redhat.com>
 <3f91c9e4-fac9-f03c-a8a3-5940ac49434b@redhat.com>
 <74c3db67-50bd-bc1f-3977-108615ac402e@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <74c3db67-50bd-bc1f-3977-108615ac402e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.11.21 11:24, Emanuele Giuseppe Esposito wrote:
>
>
> On 12/11/2021 13:17, Hanna Reitz wrote:
>> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>>> Similarly to the previous patch, split block_int.h
>>> in block_int-io.h and block_int-global-state.h
>>>
>>> block_int-common.h contains the structures shared between
>>> the two headers, and the functions that can't be categorized as
>>> I/O or global state.
>>>
>>> Assertions are added in the next patch.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   blockdev.c                             |    5 +
>>>   include/block/block_int-common.h       | 1164 +++++++++++++++++++
>>>   include/block/block_int-global-state.h |  319 +++++
>>>   include/block/block_int-io.h           |  163 +++
>>>   include/block/block_int.h              | 1478 
>>> +-----------------------
>>>   5 files changed, 1654 insertions(+), 1475 deletions(-)
>>>   create mode 100644 include/block/block_int-common.h
>>>   create mode 100644 include/block/block_int-global-state.h
>>>   create mode 100644 include/block/block_int-io.h
>>
>> [...]
>>
>>> diff --git a/include/block/block_int-common.h 
>>> b/include/block/block_int-common.h
>>> new file mode 100644
>>> index 0000000000..79a3d801d2
>>> --- /dev/null
>>> +++ b/include/block/block_int-common.h
>>
>> [...]
>>
>>> +struct BlockDriver {
>>
>> [...]
>>
>>> +    /**
>>> +     * Try to get @bs's logical and physical block size.
>>> +     * On success, store them in @bsz and return zero.
>>> +     * On failure, return negative errno.
>>> +     */
>>> +    /* I/O API, even though if it's a filter jumps on parent */
>>
>> I don’t understand this...
>>
>>> +    int (*bdrv_probe_blocksizes)(BlockDriverState *bs, BlockSizes 
>>> *bsz);
>>> +    /**
>>> +     * Try to get @bs's geometry (cyls, heads, sectors)
>>> +     * On success, store them in @geo and return 0.
>>> +     * On failure return -errno.
>>> +     * Only drivers that want to override guest geometry implement 
>>> this
>>> +     * callback; see hd_geometry_guess().
>>> +     */
>>> +    /* I/O API, even though if it's a filter jumps on parent */
>>
>> ...or this comment.  bdrv_probe_blocksizes() and 
>> bdrv_probe_geometry() are in block-global-state.h, so why are these 
>> methods part of the I/O API?  (And I’m afraid I can’t parse “even 
>> though if it’s a filter jumps on parent”.)
>>
>
> Ok this is weird. This comment should not have been there, please 
> ignore it. It was just a note for myself while I was doing one the the 
> many pass to split all these functions. This is not I/O and as you 
> probably have already seen, I did not put in I/O. Also patch 19 takes 
> care of the function pointers in BlockDriver, not this (but you 
> discovered it already).
>
> Apologies.

Not a problem, things like this happen.  Just makes you wonder as a 
reviewer. :)

Hanna


