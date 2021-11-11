Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07DA44D2C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:56:54 +0100 (CET)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4x3-0007bn-VL
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml4vt-0006Os-VY
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:55:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml4vs-0001Lr-H3
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636617339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oQMvsyW4ydW7k0glJiKRgjghNV+EDg2jCoPlbYIffM=;
 b=a2NJ9rA2KBssKg0YCyD0zWT/cuWu7KIrmzIqLnIcyfXQYfW04mntzgDOrdWEOW6aFDWZDK
 3gy14wdjW+22hdM+GnrSlWftDXB7nIuxAQwBgsJ+nUNc8zIsAFq+I0nTgcOt/KBnAqpvaF
 xarYt8T3GwugqpBgpWsBEIX8+Sp9oBg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-tankFt8TOEGESz9AGydrtg-1; Thu, 11 Nov 2021 02:55:38 -0500
X-MC-Unique: tankFt8TOEGESz9AGydrtg-1
Received: by mail-wm1-f71.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso2308041wmc.1
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5oQMvsyW4ydW7k0glJiKRgjghNV+EDg2jCoPlbYIffM=;
 b=CPCvdwO24TJuGRWb94OCUvLrP1gKGHXLci8KyBxR//TaQ102ickmXsuDaQRfPXr3c4
 8tAEal/OPD2mKfF42X9weHKbMGZnMInoBdn5R35OhTxYfLKzMdJbe+BdavlpnncSlZ32
 l2yylTsyzsA8veyHr+hHbcbMOqLBim4/wE1vkNpG4NsvqUpFHHF3jOw9hePbxyfLFVJn
 D057RMjzFoMz0GXsj7Lr+yAMysiemr1enoqzhg5RxUtG5ua41vQIKfezQdBlcUgexQA/
 14kmiE22IItDmUKCPp8Jkz6e1lYBD575uiNaSRtdftTPb+OUacoV/8pO8kQFNfZ1FVS9
 hNjA==
X-Gm-Message-State: AOAM533BTAF9UQhu6kqv69+o76m8ZkRQT2dpVLEvxVqsxV7uZIMV9goL
 noRGaoc3KFM0X4rC4o9kRvUOeyDBKmppUSfZN1/5YMYeSjN4T5ak+jqQ3uHs0HoJ09+c9q3KoUx
 ZJYXbKTGhzXzvtF4=
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr6448247wrz.215.1636617336890; 
 Wed, 10 Nov 2021 23:55:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcfLod/N91fM+njkshtl4EZpKOQsLc942xp9SJVjMMqhFvdsK7XLFkmX+I8oSkmip20CnuTQ==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr6448233wrz.215.1636617336741; 
 Wed, 10 Nov 2021 23:55:36 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i17sm2066895wmq.48.2021.11.10.23.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 23:55:36 -0800 (PST)
Message-ID: <4b440a94-8e9f-4153-591e-d56ffac529a0@redhat.com>
Date: Thu, 11 Nov 2021 08:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 3/5] numa: Support SGX numa in the monitor and Libvirt
 interfaces
To: Yang Zhong <yang.zhong@intel.com>, Eric Blake <eblake@redhat.com>
References: <20211101162009.62161-1-yang.zhong@intel.com>
 <20211101162009.62161-4-yang.zhong@intel.com>
 <20211110165540.souq5vgqtfn2hsft@redhat.com>
 <20211111061850.GA4787@yangzhon-Virtual>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111061850.GA4787@yangzhon-Virtual>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pbonzini@redhat.com, jarkko@kernel.org, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 07:18, Yang Zhong wrote:
> On Wed, Nov 10, 2021 at 10:55:40AM -0600, Eric Blake wrote:
>> On Mon, Nov 01, 2021 at 12:20:07PM -0400, Yang Zhong wrote:
>>> Add the SGXEPCSection list into SGXInfo to show the multiple
>>> SGX EPC sections detailed info, not the total size like before.
>>> This patch can enable numa support for 'info sgx' command and
>>> QMP interfaces. The new interfaces show each EPC section info
>>> in one numa node. Libvirt can use QMP interface to get the
>>> detailed host SGX EPC capabilities to decide how to allocate
>>> host EPC sections to guest.
>>>
>>> (qemu) info sgx
>>>  SGX support: enabled
>>>  SGX1 support: enabled
>>>  SGX2 support: enabled
>>>  FLC support: enabled
>>>  NUMA node #0: size=67108864
>>>  NUMA node #1: size=29360128
>>>
>>> The QMP interface show:
>>> (QEMU) query-sgx
>>> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
>>> [{"node": 0, "size": 67108864}, {"node": 1, "size": 29360128}], "flc": true}}
>>>
>>> (QEMU) query-sgx-capabilities
>>> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
>>> [{"node": 0, "size": 17070817280}, {"node": 1, "size": 17079205888}], "flc": true}}
>>
>> Other than the different "size" values, how do these commands differ?
> 
> 
>   As for QMP interfaces,
>   The 'query-sgx' to get VM sgx detailed info, and 'query-sgx-capabilities' to get
>   the host sgx capabilities and Libvirt can use this info to decide how to allocate
>   virtual EPC sections to VMs.

What about renaming/aliasing as 'query-host-sgx' / 'query-guest-sgx'?


