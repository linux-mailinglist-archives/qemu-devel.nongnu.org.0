Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9676537FA87
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 17:21:49 +0200 (CEST)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhD9o-0007B2-MJ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 11:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhD8J-0006CI-V5
 for qemu-devel@nongnu.org; Thu, 13 May 2021 11:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhD8I-0003pF-6g
 for qemu-devel@nongnu.org; Thu, 13 May 2021 11:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620919212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUOBG96FeKEAlythuay7krrBFUO5qGFP5H/0apHhH4o=;
 b=a+xQmMkICrJX3nKQorWUR8ZwnyShkL1Ct8l51H/fsiKBg+YtRf/v9ho3lb6DNKhsRojlCj
 pWip+pP604QPpu8iyRD0+GPTiixcmxr+ty/jnDTqFy6lugox1NWUaVFe82jxl3MyhFCzmM
 3/+0CPFF9fL2U5KhWxZMPCOCihQs+fc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-dswlY48gNDGTOquCtpEmdQ-1; Thu, 13 May 2021 11:20:11 -0400
X-MC-Unique: dswlY48gNDGTOquCtpEmdQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 n6-20020a0564020606b029038cdc241890so1312204edv.20
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 08:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UUOBG96FeKEAlythuay7krrBFUO5qGFP5H/0apHhH4o=;
 b=QfPl0gS86j20aeJzqj8y+Wx48IR69qjylejhbMD81DjJPLA6C3qipmCFyLpapZly/e
 NnZR2NO4B9fPCX/nOb870ytXZwFkqLqgu2fCLG+V1ZSKsGD3SeldRGNGla1gJSqmFEqQ
 BLUTbEfEr505OKZE/KEI5oHG0yn2MKme7xCHhIsQRVHPWvMeS6GW36wp3Gvb5+wrWSn6
 Kqp4GYin4FdqKMQgSlu/sQyV1pL5EsL0vMo5xzPpTNbXbbWvyKSI4vxQklP8rGaeOBku
 ENIYp7IDmPe+nszyuMfhGL3KUWlR2hbOcxIYdWqP3TgGvR7SQy4l2YK05RG7pYyDcmi+
 DBMA==
X-Gm-Message-State: AOAM532htFUvvxwHwG/oypKWv6D7eg4Y6y5A0/sSPO6dVwwyDukH8z5j
 i5xU3AqLVnhBApitqpQOZlmhcm8+hy25Ko5773MpbA5Uhj65BGEmcRVdsuXzftgwFvu3FrXlRLe
 n6AyW5tGbpN/DHgE=
X-Received: by 2002:a17:907:7b9f:: with SMTP id
 ne31mr44208006ejc.139.1620919209974; 
 Thu, 13 May 2021 08:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymOdujMxaXXpY3LuHPfnbn0hZHScRz6IRn/N1AeOhzkaz90+0pM+e7mmcvl4/n2el0DS3acw==
X-Received: by 2002:a17:907:7b9f:: with SMTP id
 ne31mr44207985ejc.139.1620919209744; 
 Thu, 13 May 2021 08:20:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id aj8sm1928704ejc.64.2021.05.13.08.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 08:20:09 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com> <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
 <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com> <YJt9iiXF48P77gOY@yekko>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <161fa4ca-5407-790c-8e2f-e0665c89fd6f@redhat.com>
Date: Thu, 13 May 2021 17:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJt9iiXF48P77gOY@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 qemu-ppc@nongnu.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 09:02, David Gibson wrote:
>> But with "imply" you could end up with a PSERIES that does not have NVDIMM
>> when also using --without-default-devices, couldn't you? Why don't you use
>> "select" instead of "imply" ?
> Oh.. clearly I misunderstand the semantics of "imply".  If we don't
> need NVDIMM for PSERIES, why does there need to be any Kconfig
> connection between them at all?

Because you still want it in the binary by default (i.e. unless 
--without-default-devices).

Basically,

config PSERIES
     imply NVDIMM

is the same as

config NVDIMM
     default y if PSERIES

Both of them are a way to say "PSERIES can work with NVDIMM so you want 
to include it unless you want some fine tuning".  In Linux "imply" is 
very rarely used, while in QEMU it's quite common because it keeps the 
many per-board defaults close together.

Paolo


