Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09244DBC9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:50:16 +0100 (CET)
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlF9L-0005Db-W2
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlF5y-00031y-2m
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:46:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlF5p-0001Xm-53
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636656394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQWCON3DH16Z6kOfimb60CreHNjs3gO195UPnMPLPDQ=;
 b=d2iptC/P3qYZouqYARjpVddZBbBVeGXBO3HwvlzmNZd/VEhqWnmMlbgA4GrDiC7hgT1d9+
 GrDs8P+sFkCHko2GeqSZjIT8Y8QRdwi0FHWZTioU8KjRuhbhZrX7mwH0Ggwd8v3v4C8bkx
 uEu1t5CHzDe/x/AKCU9UmJODcZ9uqmA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-PQFRy6IXNfCtYqVJvO6tDw-1; Thu, 11 Nov 2021 13:46:33 -0500
X-MC-Unique: PQFRy6IXNfCtYqVJvO6tDw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so3024813wmq.9
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 10:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zQWCON3DH16Z6kOfimb60CreHNjs3gO195UPnMPLPDQ=;
 b=aQ2AvAn4hw7nPqEW4VzcNzOdYd5ZQwFl+IOjD+1d7ncH2gYJON1Pmf2IdyC4Z/1LxT
 oCixUyf5C4L2K0v4aAdBT25UQyVVZNmh+w+gg8YBdlzOHNhs+AQTIQlGUs1lLPOc5GrG
 XhKvSZ3KPCOKNxMVItX5KCSASwjiMOObN0XAOhhlGme7op6HQMfhMKLxl2dhdcPzpSXO
 zhDKbDkevLL8L5XvI4lZhSburEhGas+10vfi3sF04e1qdeyxpGkv3IQpVyXtUErimErE
 vfvxLmXKHUW/MksdbxpWvom7Hv/kp72bN+DMfO/oCfn6cR5O0yowVqLRpEMFF0jdMg9O
 p87g==
X-Gm-Message-State: AOAM531MOxcO3EBxgSsPSq3KFndL6qebNYZlgf0FXvDijJ9mxqb8Y2qW
 133LF9sKkFD4nC7MUfSqsd2g8h1af7rj8ZYWcFKvIqyk09bfQSFE/56k/FZ2CwFL0ER+Bqxny58
 HjD4cAZYcr+3gHXk=
X-Received: by 2002:adf:f201:: with SMTP id p1mr11416276wro.243.1636656391920; 
 Thu, 11 Nov 2021 10:46:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8u7ljiP23Y6puzX1f7+ZMTEURlIv6jlHOUnMOa/LtN4xR+xAJFV70RZ/L0QxHAHNfpgO6QA==
X-Received: by 2002:adf:f201:: with SMTP id p1mr11416243wro.243.1636656391655; 
 Thu, 11 Nov 2021 10:46:31 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm4797773wmp.1.2021.11.11.10.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 10:46:31 -0800 (PST)
Message-ID: <2d711ff2-2280-a283-7206-0b5bd1db4bad@redhat.com>
Date: Thu, 11 Nov 2021 19:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2] hw/nvme/ctrl: Fix buffer overrun (CVE-2021-3947)
To: Klaus Jensen <its@irrelevant.dk>
References: <20211111153125.2258176-1-philmd@redhat.com>
 <YY1cH52EbS1sEUDn@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YY1cH52EbS1sEUDn@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 19:08, Klaus Jensen wrote:
> On Nov 11 16:31, Philippe Mathieu-Daudé wrote:
>> Both 'buf_len' and 'off' arguments are under guest control.
>> Since nvme_c2h() doesn't check out of boundary access, the
>> caller must check for eventual buffer overrun on 'trans_len'.
>>
>> Cc: qemu-stable@nongnu.org
>> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
>> Fixes: f432fdfa121 ("support changed namespace asynchronous event")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/nvme/ctrl.c | 22 ++++++++++++----------
>>  1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 6a571d18cfa..634b290e069 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -4072,7 +4072,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
>>      NvmeNamespace *ns;
>>      time_t current_ms;
>>  
>> -    if (off >= sizeof(smart)) {
>> +    trans_len = MIN(sizeof(smart) - off, buf_len);
>> +    if (trans_len >= sizeof(smart)) {
>>          return NVME_INVALID_FIELD | NVME_DNR;
>>      }
>>  
>> @@ -4094,7 +4095,6 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
>>          }
>>      }
>>  
>> -    trans_len = MIN(sizeof(smart) - off, buf_len);
>>      smart.critical_warning = n->smart_critical_warning;
>>  
>>      smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
> 
> Uhm. Hehe.
> 
> This "fix" breaks all log pages. Take smart_info as an example. Say the
> offset is zero and the buffer length is 512. The transfer length
> (trans_len) then becomes 512 and it ends up returning Invalid Field in
> Command because trans_len equals sizeof(smart).
> 
> Worse, this "fix" actually *introduce* oob's all over the place if
> 
>     off > sizeof(smart) && buf_len < sizeof(smart)
> 
> 
> Example
> 
>    sizeof(smart) = 512
>    off = 516 (must be dword aligned to get to this spot)
>    buf_len = 4 (same, but is always aligned)
>    => trans_len = min(512 - 516, 4) = 4
>    if (1 >= 512) => false
> 
> And we end up with
> 
>    nvme_c2h(n, &smart + 516, 4, req);

Doh, I missed the '+ off' part in the nvme_c2h() call...


