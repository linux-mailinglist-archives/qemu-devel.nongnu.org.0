Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBA6D0A35
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 17:44:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phuQP-0000Ae-00; Thu, 30 Mar 2023 11:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phuQM-00009a-95
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 11:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phuQK-0000XI-N3
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 11:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680190966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWrjjMp9+UUd30oMuPZbDjzwtG+YdVxvoIR8g4ix2Do=;
 b=Qx2e/QiM0u4Ya3+qfiA+xU0/atRZUCOJwhLp1yNzeetm7cD3MlOVBTdshn904JbYKiRssT
 +0B7DBQzj1fR/Rfk2UKD2NHVtou9ZxLCX5sA0zivw/aFvouyWj0RIa1PcBv4eFcoVRqLBf
 ROXS81yIXEwK775rw9HlcFFLZl/4uy0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-KuRjBIWEPDShYbiA_jXGLQ-1; Thu, 30 Mar 2023 11:42:45 -0400
X-MC-Unique: KuRjBIWEPDShYbiA_jXGLQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 d187-20020a3768c4000000b00746864b272cso9061262qkc.15
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 08:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680190965;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWrjjMp9+UUd30oMuPZbDjzwtG+YdVxvoIR8g4ix2Do=;
 b=EhB1ZBxIRvJ9kOJZgw2XUg56D8Dt7bAHoDlIIRz/fHTmUIJ93agReorviY8GrAVzfA
 QgUE68j1ia5wkO6zX2ARrOvoPSi0kXs/HhswqnNXhNmbUt5u7ZiximnxGAbfS3bmFp+A
 NqBGXdoI3G22sJ/2SpSxHDpjE/a0963so49BA1ka/ivCUzYo0w3R0xCk7eD7lib7WdLH
 UxfwK5E+T6GLHrU+8ccGynwLjfEVpD8HgBTwXZipywuGebmDDB8upLf4VYh9PS1yc5DA
 JJcWPfFA2XwqOGUkT81RyOM8ZRkr0509CVPq6byvPE5FXKA1gb4Bh9aPsxofZgvL26PH
 ieMA==
X-Gm-Message-State: AAQBX9eHp6gkvVi5bRr/88Kp/Fl5Ku3/hNW/ht8TOz1AwyxIqPhbWESn
 th/0/8+5s0/qNHcPCjS2cZq1YGQaGA8sJ72i5AOsjBYY3h0MMLZHf51GBhu6sb+GG6PeYVB3Fjw
 QagXe+zBf3/abNZ0=
X-Received: by 2002:a05:622a:1cb:b0:3e4:e2ee:7e5a with SMTP id
 t11-20020a05622a01cb00b003e4e2ee7e5amr28188232qtw.42.1680190965031; 
 Thu, 30 Mar 2023 08:42:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zf/b6UtQdioRKGGHJ8EqM4vsbN18WR3wVifHSiYWxlKwk2wZvM9LhLtuOQScg14ufSFs8htw==
X-Received: by 2002:a05:622a:1cb:b0:3e4:e2ee:7e5a with SMTP id
 t11-20020a05622a01cb00b003e4e2ee7e5amr28188205qtw.42.1680190964769; 
 Thu, 30 Mar 2023 08:42:44 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-166.web.vodafone.de.
 [109.43.178.166]) by smtp.gmail.com with ESMTPSA id
 141-20020a370793000000b0074672975d5csm15293446qkh.91.2023.03.30.08.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 08:42:44 -0700 (PDT)
Message-ID: <2b237e97-5490-9ca0-a540-707ca0fc2669@redhat.com>
Date: Thu, 30 Mar 2023 17:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] hw/mips/malta: Fix the malta machine on big endian hosts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-stable@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Rob Landley <rob@landley.net>
References: <20230330152613.232082-1-thuth@redhat.com>
 <CAFEAcA_2H9rMG6uu8JY8VDY96UjmvPuXBYzoQmy8adM+sqUF+Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_2H9rMG6uu8JY8VDY96UjmvPuXBYzoQmy8adM+sqUF+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 30/03/2023 17.33, Peter Maydell wrote:
> On Thu, 30 Mar 2023 at 16:27, Thomas Huth <thuth@redhat.com> wrote:
>>
>> Booting a Linux kernel with the malta machine is currently broken
>> on big endian hosts. The cpu_to_gt32 macro wants to byteswap a value
>> for little endian targets only, but uses the wrong way to do this:
>> cpu_to_[lb]e32 works the other way round on big endian hosts! Fix
>> it by using the same ways on both, big and little endian hosts.
>>
>> Fixes: 0c8427baf0 ("hw/mips/malta: Use bootloader helper to set BAR registers")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   I've checked that both, the kernel from
>>   https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mipsel.tgz
>>   and the kernel from
>>   https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz
>>   now boot fine on both, a little endian (x86) and a big endian (s390x) host.
>>
>>   hw/mips/malta.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
>> index af9021316d..b26ed1fc9a 100644
>> --- a/hw/mips/malta.c
>> +++ b/hw/mips/malta.c
>> @@ -629,9 +629,9 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
>>
>>       /* Bus endianess is always reversed */
>>   #if TARGET_BIG_ENDIAN
>> -#define cpu_to_gt32 cpu_to_le32
>> +#define cpu_to_gt32(x) (x)
>>   #else
>> -#define cpu_to_gt32 cpu_to_be32
>> +#define cpu_to_gt32(x) bswap32(x)
>>   #endif
> 
> So if we:
>   * do nothing to the value on a BE host
>   * swap the value on an LE host
> 
> isn't that the same as cpu_to_be32() in both cases?

No, it's about the *target*, not the host:

* do nothing to the value for a BE *target*
* swap the value for LE *targets*

It's quite weird and it also took me a while to understand this, but this 
seems to be the way it's working right with all combinations.

  Thomas


