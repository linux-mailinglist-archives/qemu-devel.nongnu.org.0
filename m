Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC6478FF6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:32:53 +0100 (CET)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myFE4-0000Zs-4A
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myF7V-0000rU-Lr
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 10:26:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.151.124]:54350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myF7S-0003Wl-Bb
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 10:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639754760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FuRamanaxZidpUfb1LeE7IozXIb//DYcmQ5SmKakIs=;
 b=Tif2UPcz/qy8HkIAquT7xqwJ4z9CNPrEHTiwrL7ofp3VL+HQw6ayx+rQiSmORr79QgZS6P
 9uX+uChyjf99DsRdgOYvyu9zdmCQPowisy2eyietvHox5E6+LXWPRWTX7ZkKaNlRwso1S4
 MLJ19C9JnQu34CytjufW6kkvMxjc+1w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-PIAMJ8cpNaWGRsX997wiCQ-1; Fri, 17 Dec 2021 10:25:57 -0500
X-MC-Unique: PIAMJ8cpNaWGRsX997wiCQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so705870wmp.1
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 07:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4FuRamanaxZidpUfb1LeE7IozXIb//DYcmQ5SmKakIs=;
 b=2dxaPjqR56l3tU9YyzlqzYsT+ztjrauoJu73IoOgO0hX9fw+ap2FOdLK6pyB4IY+Se
 vpuThoQ1Xxj9j6fT9KuEBHQ+nBFcFlSYCv41ejm7H1XytVmbeGoGLSYX0naCmfGjjd7E
 Ki50qdfGfS9fXKaW4xOIj49vsbVS/o2JSY0hZ7Glk2YAjiZZJZeuPT2j0khSXoI8yXwZ
 raeDcvPc65o9lCwqwnbAhLfoLsMuBQDoJSe0jPwrzuSr8VDnu1IJcn/4tdLfkPSpCd/Q
 /xZR9IEbZtVaYsSJq5C1x5joI3uvFfNj3lUenyra83KrvkLgFEA5c7zLj1Wo5tRLSwNF
 hlsg==
X-Gm-Message-State: AOAM531HsYhgnAoNCgPMiqIUwTvmo8Bt2+FFbHtPcerFyOVjRYCPHE1u
 AH4SCPFJ+GFG686PnyMktO7vFBddZ+UYule4RXsyjNtlpymPkYLWIj8dUS3zNtNAdAdjafI2dcE
 EI/LcKxR/SXPgvZQ=
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr3042303wrd.392.1639754756069; 
 Fri, 17 Dec 2021 07:25:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsHjR5KN5AGMb15H8HnzLR0C/5yoQpxWo+hhIzQaMxdEnYmGdMvpxg6bVTdkRAsEORzMXEoA==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr3042266wrd.392.1639754755785; 
 Fri, 17 Dec 2021 07:25:55 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id 5sm5171691wmk.0.2021.12.17.07.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 07:25:55 -0800 (PST)
Message-ID: <9ba126ef-8381-bdd1-5866-0e5a05aa5d17@redhat.com>
Date: Fri, 17 Dec 2021 16:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
To: Alexander Bulekov <alxndr@bu.edu>
References: <20211217030858.834822-1-alxndr@bu.edu>
 <380ea0e5-a006-c570-4ec8-d67e837547ee@redhat.com>
 <20211217143045.x6ct3dwhc7vmery6@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211217143045.x6ct3dwhc7vmery6@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.151.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 15:30, Alexander Bulekov wrote:
> On 211217 1458, Philippe Mathieu-Daudé wrote:
>> On 12/17/21 04:08, Alexander Bulekov wrote:
>>> Here's my shot at fixing dma-reentracy issues. This patch adds a flag to
>>> the DeviceState, which is set/checked when we call an accessor
>>> associated with the device's IO MRs.
>>
>> Your approach is exactly what Gerd suggested:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg831437.html
> 
> Yes - my bad for not searching my mail more carefully.

Well it is not "exactly" the same, but almost.

>>
>>> The problem, in short, as I understand it: For the vast majority of
>>> cases, we want to prevent a device from accessing it's own PIO/MMIO
>>> regions over DMA.
>>>
>>> This patch/solution is based on some assumptions:
>>> 1. DMA accesses that hit mmio regions are only dangerous if they end up
>>> interacting with memory-regions belonging to the device initiating the
>>> DMA.
>>> Not dangerous:  sdhci_pio->dma_write->e1000_mmio
>>> Dangerous:      sdhci_pio->dma_write->sdhci_mmio
>>
>> It doesn't have to be dangerous, see Paolo's example which
>> invalidated my previous attempt and forced me to write 24
>> patches in multiples series to keep the "niche" cases working:
>> https://www.mail-archive.com/qemu-block@nongnu.org/msg72939.html
> 
> I don't understand what IO accesses this decodes to. This is loading a
> picture into VRAM?

I'd say "loading a picture into VRAM via the DMA" but am not sure :)

This link is helpful:
http://petesqbsite.com/sections/tutorials/tutorials/peekpoke.txt


