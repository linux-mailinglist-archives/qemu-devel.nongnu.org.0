Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C468B73F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwmt-0000In-71; Mon, 06 Feb 2023 03:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pOwmo-0000IY-OM
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:23:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pOwmn-0005yC-2z
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675671815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0OpMXp15UlrsUv+Kaa9AX/d5XBD023859CWToXau0I=;
 b=L40BQPOyHlf/yAUgf84trabosYSONRHRj20O7A/+V2KVh3F+VlLew9+GUu9+NtLtrzQln6
 Z8u5oP1oxkw2HfwiSmBZvLNunGTY/WnOkjGVRHYutG9PYD615p0HapyaRk4EnIATJa5pnw
 ug8Fahsivc4Mm+4lPA8G8fg36Pb5hdM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-VF4-NCN-MSioPfP_ek9hjA-1; Mon, 06 Feb 2023 03:23:34 -0500
X-MC-Unique: VF4-NCN-MSioPfP_ek9hjA-1
Received: by mail-qk1-f200.google.com with SMTP id
 g22-20020a05620a13d600b00726e7ad3f44so7348281qkl.8
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 00:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T0OpMXp15UlrsUv+Kaa9AX/d5XBD023859CWToXau0I=;
 b=6eLNSJQqYDerEW9mBJ6jh/ZqVixhYiHt38cB3DzAL+UVOG6W/bfACPa4uJHZKzw3/b
 WQ7sMlcrdA5zswm4x5mgGz8F8jyGdq3qWXSjU/JRLLSAx5CBkLrUnFsu0ZZyExej9du5
 nOp4qaXi1fYXnUw3glFJ5RK+ODS9Ms4RdDdHBLXBuk3RPCJR6yMWD5fvsvOh2E4c71Og
 qrLB5eRdecxSmlhCDxIvhYBhCEhOjeFq4a1zNA4uHz7HM3Uwgx32Y+Vi933L53tq/V6G
 DZG4i/jHG9X5e4kUOlHJnARykxI1zxJ7b32DwHLR6DqPl7Oea6Qn8ozMnGVCd2sWg7uG
 bnHg==
X-Gm-Message-State: AO0yUKVSVO7TLIpJgbB7HGWy4IcGRYDgHmpjnyP4Q+5tkP4Z+wAnfZFy
 pE+wUyEKNWmc1XxwcTh2R/WL+2fO0ID1llEwOWigIieDi1en64cY+/5O7rz5dvMXnMxFO8344V6
 GDMjegJJSJOA9YpA=
X-Received: by 2002:ac8:5847:0:b0:3b8:61df:e298 with SMTP id
 h7-20020ac85847000000b003b861dfe298mr33548843qth.3.1675671814243; 
 Mon, 06 Feb 2023 00:23:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/npHIUM5cw7jnVy1GaKN2+sTdPpGD0lhU3jBVFqSZSXUrItVYeQDtEWzpdUUsevJSdoKAYAw==
X-Received: by 2002:ac8:5847:0:b0:3b8:61df:e298 with SMTP id
 h7-20020ac85847000000b003b861dfe298mr33548827qth.3.1675671813998; 
 Mon, 06 Feb 2023 00:23:33 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 m28-20020a05620a13bc00b006fec1c0754csm6888650qki.87.2023.02.06.00.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 00:23:33 -0800 (PST)
Message-ID: <e076fc9f-c0fb-f871-559c-faa968418340@redhat.com>
Date: Mon, 6 Feb 2023 09:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL 00/11] Net patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20230202062126.67550-1-jasowang@redhat.com>
 <CAFEAcA8TbQFZTG_M3djxiXD+42y8C=QtXrfO9jVEOY4V1PAGGA@mail.gmail.com>
 <fe517a25-b7fc-3227-fb1b-b10be66898f0@redhat.com>
 <CAFEAcA9Z4G74W8k4t3=+vJ5x-W6Skuq_rjbxEj7GHq+7BWEeug@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAFEAcA9Z4G74W8k4t3=+vJ5x-W6Skuq_rjbxEj7GHq+7BWEeug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/5/23 13:36, Peter Maydell wrote:
> On Sat, 4 Feb 2023 at 20:09, Laurent Vivier <lvivier@redhat.com> wrote:
>>
>> On 2/4/23 15:57, Peter Maydell wrote:
>>> On Thu, 2 Feb 2023 at 06:21, Jason Wang <jasowang@redhat.com> wrote:
>>>>
>>>> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>>>>
>>>>     Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     https://github.com/jasowang/qemu.git tags/net-pull-request
>>>>
>>>> for you to fetch changes up to 2bd492bca521ee8594f1d5db8dc9aac126fc4f85:
>>>>
>>>>     vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-02 14:16:48 +0800)
>>>>
>>>> ----------------------------------------------------------------
>>>
>>> Something weird has happened here -- this pullreq is trying to
>>> add tests/qtest/netdev-socket.c, but it already exists in the
>>> tree and doesn't have the same contents as the version in your
>>> pull request.
>>>
>>> Can you look at what's happened here and fix it up, please ?
>>
>> Thomas and Jason have queued the patch:
>>
>>     tests/qtest: netdev: test stream and dgram backends
>>
>> For Jason it's because it's needed by
>>
>>     net: stream: add a new option to automatically reconnect
>>
>> For me, both patches (in tree and Jason's one) are identical to my v7
>> (except the one that is merged does not have Thomas' acked-by).
> 
> When I tried to merge the pullreq I got conflicts because they
> weren't the same, notably in the set of #include lines.

The differences in the file are introduced by the following patch 10/11:

5b28ced1bc6d net: stream: add a new option to automatically reconnect

Thanks,
Laurent


