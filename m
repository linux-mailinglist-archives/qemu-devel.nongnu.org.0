Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011D3F1BD4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:44:20 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjHH-0006VZ-GB
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjEw-0001cJ-SU
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjEv-0007YA-AS
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqzCjfjb5h9IcPdl70FmVugn+5wS8Buwyd5ngEDix30=;
 b=Pa5FYMlkMmkU9silDHDqfxoFhBtOsKz0ecimgpF7Dkq/yMU/dPz3HzjkWq7LEe+Iqg9ML/
 rDnKB41+1maCk2DtLxsCejLyxj4lZB/AvNSA2wa3sYZKkfPoj4CrjRtKQVipPE5Qs7xPoA
 rcJHYdYeK9vhCEHqxzFcLf51GnRXGAY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-31NXfaKiO_iPQCN5lPZfhQ-1; Thu, 19 Aug 2021 10:41:51 -0400
X-MC-Unique: 31NXfaKiO_iPQCN5lPZfhQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l6-20020a05600c4f0600b002e70c0dfaf1so641023wmq.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AqzCjfjb5h9IcPdl70FmVugn+5wS8Buwyd5ngEDix30=;
 b=eXA354ZCtC04M+KiJI8tVKKYov+RFnYuXEcWDxdoGR3J1tqEbQcr4kfEm0g5cQPS+E
 Y2Icv0Z2vuChlq7SHZEPoy4L95tAau+FOCdoqIXk4guWRBKwl8uZw0YX2c73LLCzEhDv
 H3EzLbFkx3LyTWEDD2Lpnn4m/BTf9t6NBr2JCa/zeyi/L61djbw/MhqzzS4R0UoSiMdN
 X/hm/5HVNdsF8Ocrej6x+BtWiTiEmsiTjoER74fj0BdnGbxPR85OhZTV2z5EDfzIkGUy
 bPrjc9XGDRI0i6h413pOHEnoW6zKF3dJ4aw6IXpXw/3+JLaEzHyoFo+19nYBJbJSTOww
 HUDg==
X-Gm-Message-State: AOAM531tTGdh8ZToAqqUP1/1usrxG2pfpUMOeRBibh/LZdalrJGj0PMd
 fqseb2bl4ply0S+I+1VI9uy5owOFcOfm5wYPKL3m7Y4ERPHvdD6tCibSdFXnI50tb6B8LZ/+FRs
 Rrh1noieypWz0Qes=
X-Received: by 2002:a1c:150:: with SMTP id 77mr14006259wmb.90.1629384110271;
 Thu, 19 Aug 2021 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTTVau90p2PpID3+ToWxZacIvILfg+I/qJbyzzLA2UyZ7XnYdwaPFsq8/bqogFYP7BDLu73Q==
X-Received: by 2002:a1c:150:: with SMTP id 77mr14006250wmb.90.1629384110146;
 Thu, 19 Aug 2021 07:41:50 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p3sm3178103wrr.21.2021.08.19.07.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:41:49 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] memory: Have address_space_create() re-use global
 &address_space_memory
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-7-philmd@redhat.com>
 <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <14b38d05-74d3-10c7-ffa8-14b8f78817ef@redhat.com>
Date: Thu, 19 Aug 2021 16:41:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 4:34 PM, Peter Maydell wrote:
> On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> We already have a global AddressSpace created along with the
>> global get_system_memory(): address_space_memory. Return it
>> directly instead of creating the same AS with a different name.
>>
> 
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 16a2b518d8d..e4506b5a0d5 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -2941,6 +2941,10 @@ AddressSpace *address_space_create(MemoryRegion *root, const char *name)
>>  {
>>      AddressSpace *as;
>>
>> +    if (root == get_system_memory()) {
>> +        return &address_space_memory;
>> +    }
> 
> But most ASes aren't set up with address_space_create().
> This doesn't do anything for the common case where the
> AS is initialized with address_space_init().
> 
> This also seems to me to be the tail wagging the dog. If we think
> 'info mtree' has too much duplicate information (which it certainly
> does) then we should make mtree_info() smarter about reducing that
> duplication. Off the top of my head, we could change the code that
> prints ASes to do something like:
> 
>    hashtable = an empty hashtable;
>    QEMU_FOREACH(as, ...) {
>        qemu_printf("address-space: %s\n", as->name);
>        name = lookup as->root in hashtable;
>        if (name) {
>            qemu_printf("...same as address-space %s\n", name);
>            continue;
>        }
>        add (as->root, as->name) to hashtable;
>        mtree_print_mr(as->root...);
>        qemu_printf("\n");
>    }

Got it, thanks for the review, explanation & suggestion :)


