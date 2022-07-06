Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B84F567C59
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 05:12:26 +0200 (CEST)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8vSi-0001yT-HJ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 23:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o8vQM-00019v-Bu
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 23:10:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o8vQH-0004HJ-6X
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 23:09:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d5so12519012plo.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 20:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=4SQt47P1SxZCim5R4qaBeYpiSmadSwwvhu/0lpoB8Ew=;
 b=1X+0O+ebwagcyGcVbcmjBKwTdioXs3uhbho2yTEehTVXWjwjJ1E7rvKnTiv+CAl1w2
 GRW0khodYzHUI82POadSTsUlMQpRu4D/oZ4cL1ksI2F8mHbYfxrQa9EqCR6WkaNg7W3a
 YCdqe01x0SHO+tBqtbigLpSj6Bi5Qjb3ZIlRE+AKfGWNDd7mMEHf2xfMTzAZFgHjAtdR
 0Y8RFW8YJzjG3S9inmeNxbcEYXRFVG4/O8dMRxiioqLhsv0d7uzvyEBINybqK1CVhaPv
 vlshHVMXbhUd6ufA3UZJ0PSR5PJ6EwFWR15OVXH70cs6vKTj8m9mOO1vuhCtVIpVmYlL
 6Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=4SQt47P1SxZCim5R4qaBeYpiSmadSwwvhu/0lpoB8Ew=;
 b=y1y0dvdIqQ1bG0m/asq6r/8XOzPsLRVUTF46EynSQnM+0SV6/tmol31FVjBh2SCsWX
 p4m3Z6de7A7HPLMlThWSzm06k++729DSLYq+1HSqu/vNRqKnBO1kG5L/xnxymeyWcy0w
 VZhgPl1UhzHSyVyOyX0irQOjocSUw0vz98w/OAjNe6bLpRxhjrM34EvM3QHeKQ/R6C5o
 dTo36q0X9GZNYIC07UgRbPABGUyLGqhlOHUUoYMy+SLvkHy2hTzBzRuwEucD9lSLpH4h
 9MboxZsePH46f/Ad6zGyhHEEDg7EX+W/bnywMn82iRzx39nQtWH7mSvFaBWD1lnVdyRj
 RLzA==
X-Gm-Message-State: AJIora+OFpUTsrf19E8piYF73F/r468v9UmSiaYDDiM86iLZSFwHmUFE
 hQtyEwd+m0l4CmbuawKTYlIoUw==
X-Google-Smtp-Source: AGRyM1tsrsBCXWBjjoQnv2c7KsAb2DDxXz6S0Pxvi3rTBmCXuEiwzC6OC/MhI6A4MNke81Fea0QHSA==
X-Received: by 2002:a17:902:cf03:b0:16b:e692:c104 with SMTP id
 i3-20020a170902cf0300b0016be692c104mr12642983plg.134.1657076989832; 
 Tue, 05 Jul 2022 20:09:49 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090a8b8d00b001ec798b0dc4sm15791094pjn.38.2022.07.05.20.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 20:09:49 -0700 (PDT)
Message-ID: <d43a478f-e54b-e624-8c67-2392bf3d3dbb@bytedance.com>
Date: Wed, 6 Jul 2022 11:04:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/1] qga: add command 'guest-get-cpustats'
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, QEMU <qemu-devel@nongnu.org>
References: <20220704023618.626849-1-pizhenwei@bytedance.com>
 <20220704023618.626849-2-pizhenwei@bytedance.com>
 <CAJ+F1CKvsDdJsurivOToZue=HsyrXbuRK2hNxA0UjJsKwhCkZA@mail.gmail.com>
 <1b3f926b-9fe6-a3ec-b697-6fa8471510ad@bytedance.com>
In-Reply-To: <1b3f926b-9fe6-a3ec-b697-6fa8471510ad@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/22 16:00, zhenwei pi wrote:
> 
> 
>>     +##
>>     +# @GuestOsType:
>>     +#
>>     +# An enumeration of OS type
>>     +#
>>     +# Since: 7.1
>>     +##
>>     +{ 'enum': 'GuestOsType',
>>     +  'data': [ 'linuxos', 'windowsos' ] }
>>
>>
>> I would rather keep this enum specific to GuestCpuStats, 
>> "GuestLinuxCpuStatsType"?
>>
> 
> Hi,
> 
> 'GuestOsType' may be re-used in the future, not only for the CPU 
> statistics case.
> 
>> I would also drop the "os" suffix
>>
> I'm afraid we can not drop "os" suffix, build this without "os" suffix:
> qga/qga-qapi-types.h:948:28: error: expected member name or ';' after 
> declaration specifiers
>          GuestLinuxCpuStats linux;
>          ~~~~~~~~~~~~~~~~~~ ^
> <built-in>:336:15: note: expanded from here
> #define linux 1
> 

Hi, Marc

Could you please give any hint about this issue?

>>     +
>>     +
>>
>>
>>
>> Looks good to me otherwise.
>> thanks
>>
>> -- 
>> Marc-André Lureau
> 

-- 
zhenwei pi

