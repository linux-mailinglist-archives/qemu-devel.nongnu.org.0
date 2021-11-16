Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D02453914
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:59:15 +0100 (CET)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2ji-00016m-0P
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn2iG-0000Eq-Uk
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn2iA-0008Sg-RV
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637085457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FuQ33/+dfJfRsecoXdeSqxDEwKcVGFvW0A6DMsTVJsI=;
 b=IR0XXuo8+uLan0d6jqBvzx2AKQypBIocwOw2oYJn9tyxX0GgXiZmqpiXPFLJm+IXy2ffj0
 DnYBwjoVsB9kQoTvFiOKDyH5BfuWyXL1CE+VJjOc0yxCzvFUUkJ1i5qEjS4DzGYm/IdfQT
 Bn9cl4b6NpuuTTI5H08CE3DNNBC8+7k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-L7vRGhO3Mz2rbAlPG5YhRw-1; Tue, 16 Nov 2021 12:57:35 -0500
X-MC-Unique: L7vRGhO3Mz2rbAlPG5YhRw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso4694525wrj.12
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 09:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FuQ33/+dfJfRsecoXdeSqxDEwKcVGFvW0A6DMsTVJsI=;
 b=IDiqQrbb4biqqlyriAu6eIeRbdazPWkxWRYA6M6TtUrcUkrlj0MP9N3MVL2HX5FGY2
 AzZsE3WbFJl+XIZtMLdaob7J58J651BwzdnYaKKOopU9JJPPHXFr3BACBE3UeZKEoG07
 KmcIgqYrlCAxkyLdYriSB6TVJVQ2A7yFRNsG19KacWlZTJ7TbiAOY881JasPoSFQWcmf
 TOIHyD2W8TeMd7v08b5F5EyfJqB3oyrX4JgRwb0kGfuexuTAC3nGfA2FX6qeuZKM38qZ
 ErqGibRx0+2VQ6zv9QoD6Mcvg3B9Vg1yUoJkbanhrWjTIUMOZDKNEMQNFCvy25yllaci
 VTIQ==
X-Gm-Message-State: AOAM530cE2HVpS66s9yxl6Wx0QLUC7UAAY94goYTKEN7Bq6/MOAZBHSb
 2J6DjPmL3mV7Ae/5MnDMphTSJAUG2bBY5z638m9vBj4aGuQSq+oJTg5XBvcodxmbLCn0STcvO7D
 84sCjUXtDKTPTJHk=
X-Received: by 2002:a05:600c:190b:: with SMTP id
 j11mr9670170wmq.112.1637085453767; 
 Tue, 16 Nov 2021 09:57:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP++JTseXhfoOUN+qOksxvTZ1ocymL4E2F+FvI2ag/3jp067oF8dxNLxBhqRXqfvNcpnwGxA==
X-Received: by 2002:a05:600c:190b:: with SMTP id
 j11mr9670137wmq.112.1637085453527; 
 Tue, 16 Nov 2021 09:57:33 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p62sm3083987wmp.10.2021.11.16.09.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:57:33 -0800 (PST)
Message-ID: <fa0555bc-cabc-ccea-4f03-eeada196cfb5@redhat.com>
Date: Tue, 16 Nov 2021 18:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
 <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
 <ae41e917-8b22-07dc-31dd-902dbc5d5c0d@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <ae41e917-8b22-07dc-31dd-902dbc5d5c0d@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 18:30, Cédric Le Goater wrote:
> On 11/16/21 18:28, Richard Henderson wrote:
>> On 11/16/21 6:12 PM, Philippe Mathieu-Daudé wrote:
>>> On 11/16/21 17:46, Cédric Le Goater wrote:
>>>> On 11/14/21 01:51, Alexey Kardashevskiy wrote:
>>>>> The following changes since commit
>>>>> d139786e1b3d67991e6cb49a8a59bb2182350285:
>>>>>
>>>>>     ppc/mmu_helper.c: do not truncate 'ea' in
>>>>> booke206_invalidate_ea_tlb() (2021-11-11 11:35:13 +0100)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     git@github.com:aik/qemu.git tags/qemu-slof-20211112
>>>>>
>>>>> for you to fetch changes up to
>>>>> 73944a4bf4ab259b489af8128b4aec525484d642:
>>>>>
>>>>>     pseries: Update SLOF firmware image (2021-11-13 14:47:56 +1100)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Alexey Kardashevskiy (1):
>>>>>         pseries: Update SLOF firmware image
>>>>>
>>>>>    pc-bios/README   |   2 +-
>>>>>    pc-bios/slof.bin | Bin 991744 -> 991920 bytes
>>>>>    roms/SLOF        |   2 +-
>>>>>    3 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> Queued for 7.0.
>>>
>>> I am not sure this is a good idea, as this will make bisection
>>> painful over the release tag.
>>
>> It is my understanding that Cedric will rebase for the mainline PR. 
>> At least that's how David was handling subsystem pulls.
> 
> Yes. I don't plan to send a PR on tree without rebasing. I am just
> collecting now.

Oh this is not a signed subsystem pull request, so you can rebase, OK.


