Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D0437B579
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:31:46 +0200 (CEST)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghTD-0007cd-7j
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lghSF-0006kA-FU
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lghSC-0001fa-LH
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620797438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQDcYaoo7UtIJkYj5FKIdeNZ+9RoFiL4ckcKofajUFE=;
 b=aDZ5FDY6LttTfPC/ShMibAawZgzP0XrKCSryJ8etqZaaw7gzRlOGWldCcl/ozbU3YqAeUW
 wn5PAEAVUFWJ3DNhyVgSSOkekxk+/ZunXpS+ccUr/plJhVA5ejI/9qQ7waDM+46IwWvilo
 luajzpeBLVWbChn7sBkw6BLImWmLA6E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-zAdR5dWqNkO5awiAk2zlOQ-1; Wed, 12 May 2021 01:30:36 -0400
X-MC-Unique: zAdR5dWqNkO5awiAk2zlOQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so1125749wmc.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EQDcYaoo7UtIJkYj5FKIdeNZ+9RoFiL4ckcKofajUFE=;
 b=RFZd+lZbjExGTJ/G6F3AqUFMk3EfPaiwAhoLRVTKYQR8aBlvllq3ZrZunwizUDU3jL
 K+U1uKqFtG0fJ2TnZPz7FS7OVfHSzxE8KKy3ZD+LeD3OotQMScd9eCnc/sCkSbbLjL9B
 0m9I1Jjq28DJLNE5UwK0lBQQI4AqscjMPQXLiPsUI5ZbPIrgh7NrM3imzwWDe7D/S15H
 tF8tAUWPyM/TTDf6aYh9wIxHviYdapUrQXSA07cT2Gydg4eXMZ2m8JbsCZOkqtzLGH8r
 mw07d9alM/qjIyQQuyNyVPtQm9hKVM2S138gYji1Bgk85aIbZAQVwbmdXdCvnvRVIX3T
 gYHg==
X-Gm-Message-State: AOAM531X4BMx4kmGyNw+G5qi204UnenkJfyMYj4WxruLEfr4S8o0POf6
 /kAThEEHgwscC70HOh7S/m+IHPuKz5eLN9UpnotIC6Krog+JlchDeENbeN6a6QRLnHv0Ze2MRNF
 r9zlw9UChEJRypDI=
X-Received: by 2002:adf:f891:: with SMTP id u17mr43363045wrp.352.1620797435807; 
 Tue, 11 May 2021 22:30:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7eyYTg9yArGZVtQa4WtoivtiwKXWtnrYLivX0i22H31Mdv8ftTdtsj+4CvtHRUtexkp5UoA==
X-Received: by 2002:adf:f891:: with SMTP id u17mr43363013wrp.352.1620797435583; 
 Tue, 11 May 2021 22:30:35 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id a76sm3494473wmd.16.2021.05.11.22.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 22:30:35 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com> <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
 <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
 <87594332-49d3-2859-c893-9071200e8713@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <79d124be-c881-3007-13ff-4422d2da0b1c@redhat.com>
Date: Wed, 12 May 2021 07:30:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87594332-49d3-2859-c893-9071200e8713@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 07.08, Philippe Mathieu-Daudé wrote:
> On 5/12/21 6:53 AM, Thomas Huth wrote:
>> On 12/05/2021 05.57, Philippe Mathieu-Daudé wrote:
>>> On 5/12/21 4:24 AM, David Gibson wrote:
>>>> On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> Per the kconfig.rst:
>>>>>
>>>>>     A device should be listed [...] ``imply`` if (depending on
>>>>>     the QEMU command line) the board may or  may not be started
>>>>>     without it.
>>>>>
>>>>> This is the case with the NVDIMM device, so use the 'imply'
>>>>> weak reverse dependency to select the symbol.
>>>>
>>>> Uh.. It should definitely be possible to start a pseries machine
>>>> without NVDIMM.  I would have guessed the same for PC.
>>>
>>> Yes, this is what this patch does. With it we can build with:
>>> CONFIG_NVDIMM=n
>>
>> But with "imply" you could end up with a PSERIES that does not have
>> NVDIMM when also using --without-default-devices, couldn't you?
> 
> Not currently, because of the CONFIG_NVDIMM=y.
> 
>> Why don't you use "select" instead of "imply" ?
> 
> Because as David said earlier:
> 
> "It should definitely be possible to start a pseries machine
> without NVDIMM."

Oops, sorry, looks like I did not have enough coffee yet and misread David's 
comment ... patch looks fine, indeed.

Reviewed-by: Thomas Huth <thuth@redhat.com>



