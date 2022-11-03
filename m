Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B856187C6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:40:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqf8c-0002HQ-A4; Thu, 03 Nov 2022 14:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf8Z-0002G1-Mr
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqf8Y-0006H3-C7
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667500821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kk+BYiaBR58HmHgqgG13ssYEmOdofky43AuPM5NP94w=;
 b=XiH/WdCixy1/6XityoGui7nkFOg5gJmY8ahKi5dPNx5a7Hgm4oVuY8eMxg1EciaHhCGVMo
 MWI23rOVMjJAX7tOBRTt/O3fOkYRBXpHAsbDLcdx0VJyqXLpMhxfBA4I5xKff+UqYj4qqO
 3ieOYeoYQ0tx0UBQb8Pc4n/r1L02Whc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-lLRFi8PrN8W-by_l2NDwsg-1; Thu, 03 Nov 2022 14:40:20 -0400
X-MC-Unique: lLRFi8PrN8W-by_l2NDwsg-1
Received: by mail-ed1-f70.google.com with SMTP id
 v18-20020a056402349200b004622e273bbbso1955092edc.14
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 11:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kk+BYiaBR58HmHgqgG13ssYEmOdofky43AuPM5NP94w=;
 b=puKI+mWD26VyIUR8jdk9h2Nr6S9B9ALSF2CR/hq9xvABmAdT/Zlcue08uCRdOSStds
 leWK/jy2cIT0CIKeqDE9UP34G3PdP9n6JYwDjn+yPYRVj49jlLRyv28zYyT0y09XpgJ/
 HbtzUoEJdXMDr4wtCBe9HuBVbW0ZQTO3gcor1JgEuU0pbi20gn1ur4TBH0tAlxkobfRW
 HvDYHCq5WmBt6RWVaIVKw6xr8ZT8EDKxZ40AqfcfpJqUP2sl+ba3ZpEoqoKS2T8qGLdM
 HQyyk3LrCZCSXCDjvOAljOUGKkkqF10mD85Y8KYD0M2THNAG0tFwS8/A01gFCItUdBvP
 Rczw==
X-Gm-Message-State: ACrzQf3qfNeMd0NZqIQCQ3dZ/SGap2A6fZ4aSirens8T6ml59a1bbqNC
 BDHMAV1a9IG41Au8mQV+ZEJW8Au01R6cwmu4W0RD/jYtfAkLoaWvxDxFzkA5V27fAiiRyjV/7B6
 t6Hx6La5ixejjxoA=
X-Received: by 2002:a17:907:6a09:b0:7ae:2793:aa23 with SMTP id
 rf9-20020a1709076a0900b007ae2793aa23mr2072754ejc.184.1667500819173; 
 Thu, 03 Nov 2022 11:40:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+KFNPDgaUwWLwQHYf0ywd2DzPWc2Mo+/4hUStNu0u7GoBG2sczc2OX0lUMWECCEoRNNNwMQ==
X-Received: by 2002:a17:907:6a09:b0:7ae:2793:aa23 with SMTP id
 rf9-20020a1709076a0900b007ae2793aa23mr2072731ejc.184.1667500818889; 
 Thu, 03 Nov 2022 11:40:18 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 sd15-20020a1709076e0f00b0073d7ab84375sm832435ejc.92.2022.11.03.11.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 11:40:17 -0700 (PDT)
Message-ID: <7a77a85e-e990-aef1-60a9-91201628a758@redhat.com>
Date: Thu, 3 Nov 2022 19:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3] target/i386: Fix calculation of LOCK NEG eflags
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
References: <20221024084155.713121-1-huqi@loongson.cn>
 <3beb23f8-0a7b-26c0-65d8-77a552d1b61b@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <3beb23f8-0a7b-26c0-65d8-77a552d1b61b@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 12:22, Qi Hu wrote:
> ping
> 
> On 2022/10/24 16:41, Qi Hu wrote:
>> In sequence:
>> ---
>> lock negl -0x14(%rbp)
>> pushf
>> pop    %rax
>> ---
>>
>> %rax will obtain the wrong value becasue the "lock neg" calculates the
>> wrong eflags. The "s->T0" is updated by the wrong value.
>>
>> You can use this to do some test:
>> ---
>> #include <assert.h>
>>
>> int main() 

This is already part of a pull request.

Paolo


