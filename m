Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1C64264C8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 08:42:45 +0200 (CEST)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYjae-0005p2-HS
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 02:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mYjXu-0004mB-TV
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 02:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mYjXn-000237-OY
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 02:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633675186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZlrUaIRrIxEms7hXvf5kXighrMlUczCWqEX1APEC2Aw=;
 b=aUB4E64L1LA4wvSD4Un7o2UTyOv6vztQHEoqZd5oOB3/WSRczNxICcdF9Qh6AA/eOt+0G8
 xw09KhWQggawUTbtsHSXXb209XzPI3g8j/otn2v84NcSdMu8eBqPhb7gEfDJGjDJEhAW/1
 4Y2psQ/7aovG7svvnUAKkvVrNZx0SE4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-zUF3lug2NfGnRRx5XABQoQ-1; Fri, 08 Oct 2021 02:39:40 -0400
X-MC-Unique: zUF3lug2NfGnRRx5XABQoQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so6477422wrg.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 23:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZlrUaIRrIxEms7hXvf5kXighrMlUczCWqEX1APEC2Aw=;
 b=D40JFrvFmKb54TESrHqm/YaGSqxKOIAKUUVzGpJigzlgaphAIkDZYmlOaBZaez5gZl
 6h0dAk+DLhaRqsKUk+eOm0CZnbpzQs3JLwuP35Qq2oXUpESfQO2I3dl55hOGBIgsWODv
 9Mg285zjS65y7c+2soDS4O0T+oup3Y4zui+AVH8rTezG03BYebcv7YzxayZQ9M0RlfW/
 n3Sq05FMfzWt+1po/qhNlK99StcInxke4z6RxYoL4asN+X2pRIJENK7GKusdNyTOux4c
 DyN2BRCzSy6dVhaYwgcNkMMCEemtGWj/jrvAGBfYyCCmAIFETXSKjwxXTXMzZdobxXbW
 RJJw==
X-Gm-Message-State: AOAM530cV8q9c1hx4Gk4eOpOOyCcF9R19xoskGg/n0KUOl7fg/1FqKT5
 YFYilZAF5WyQS6wWv0qcM+WZXrGAfWAu1rCsumlX0y9ppEZOX0qByEzjCuoVMjJAzAsqMkvqd0b
 r52iYrHRJd7w7eXw=
X-Received: by 2002:a5d:64ab:: with SMTP id m11mr1686086wrp.343.1633675179389; 
 Thu, 07 Oct 2021 23:39:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyphH1FVJNFF4ywl2LQg6VZGTaGmBVUjzLESAz+GMMRkuyrb3I21sZX3G/VyJMjBj84WGMwnA==
X-Received: by 2002:a5d:64ab:: with SMTP id m11mr1686063wrp.343.1633675179113; 
 Thu, 07 Oct 2021 23:39:39 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id l124sm10886003wml.8.2021.10.07.23.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 23:39:38 -0700 (PDT)
Message-ID: <6c65e7f0-482c-1a85-3146-82f3d2314e8f@redhat.com>
Date: Fri, 8 Oct 2021 08:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 00/17] iotests: support zstd
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
 <b0fb7a33-c273-33e2-fc80-d5488fbce877@redhat.com>
 <4d839852-8939-0536-55d3-12c2e6503f33@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <4d839852-8939-0536-55d3-12c2e6503f33@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.10.21 18:29, Vladimir Sementsov-Ogievskiy wrote:
> 9/14/21 20:08, Hanna Reitz wrote:
>> On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
>>> These series makes tests pass with
>>>
>>>     IMGOPTS='compression_type=zstd'
>>>
>>> Also, python iotests start to support IMGOPTS (they didn't before).
>>>
>>> v3:
>>> 02-04,06,08,14,17: add Hanna's r-b
>>> 07  iotests.py: filter out successful output of qemu-img create
>>>        fix subject
>>>        handle 149, 237 and 296 iotests
>>>           (note, 149 is handled intuitively, as it fails :(
>>
>> It was also reviewed intuitively. :)
>>
>> Thanks, applied to my block branch:
>>
>> https://github.com/XanClic/qemu/commits/block
>>
>
> Hmm, patches are not here neither in master. Aren't they missed somehow?

Yes, I had to remove them because they broke other test configurations 
(like `-o refcount_bits=1`): 
https://lists.nongnu.org/archive/html/qemu-block/2021-09/msg00692.html

Hanna


