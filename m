Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67873BC87F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:28:40 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hNf-0002Vr-97
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m0hMb-0001Xx-K8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:27:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1m0hMX-0004O2-IJ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625563648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZI6JlBEMpBbAN8Ji4bJqvAW2dcMGv5nmDNIQpERZzE=;
 b=bcD06G8XCr6VuDCa65KIPFptbtP3UZvonAOQaAUIYeCGCX2J+mT/DLz57kAiylp70yZa4c
 QZj8RfE4/fqbFUOyRjQHy0AyTb106oqN2X2Lca/mdVH4Xr7JsgKS44QS2gJWU1zWIlMmAJ
 GKtGkr0UQHwteWBsOF+/Tlj4Et7YcaE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-fOfWD1qdNMOGJ_zP8P_YZg-1; Tue, 06 Jul 2021 05:27:27 -0400
X-MC-Unique: fOfWD1qdNMOGJ_zP8P_YZg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso184848wmj.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 02:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AZI6JlBEMpBbAN8Ji4bJqvAW2dcMGv5nmDNIQpERZzE=;
 b=axJj+7maR+DC7x/WQX5TFzaK3nAYHxgw5eaqQiIeu5oPDG50gufgYpGwzgKDX3bcpr
 735xI8KiVWkURdqJf32KdzRrysj2zUYUYFPPGNaAHuTqFm+X0VnbF9U1H4iRFbA9nlyT
 /5aaQn5FZg7mI+IUQlVwpk3eXXaquVYQ4/SWNHoI53jkeJcqzK3j0kUgosOsnerPiU/W
 VyrFMONPLm6l4u4t2G7BAVx7MaVzGVtozPMhCOyCk+MUpHU3/7dLRTui1MpxZ2B/zLSg
 QlfcSgNCUATSSEXEbcPrhIi6ItPueC4X7hA1MHV4XLxWRgf/GfPb6ZP3mIt4Ti63YEGG
 s6hg==
X-Gm-Message-State: AOAM5312VonTaE/qZ+pXKZhkDBy1isV69M/lcFzSwx30JoTT6tXAHvYv
 Fota1KuMB0X3wiLkt5uIYkvYlONtB1eR3npC3lWfK2WTAzFeS3d6va/tF6LNkzYzF9ouqSrYBt5
 Ghpm0KM/lADwRzGI=
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr3292553wrx.284.1625563645886; 
 Tue, 06 Jul 2021 02:27:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ayTg1QPRJHe68HFGH9gOzOm8ylqKZc8vVz2qpBYeYZLvud/k+hXZbOL+7FsT2PJSeTtssg==
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr3292535wrx.284.1625563645702; 
 Tue, 06 Jul 2021 02:27:25 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y7sm16539224wro.51.2021.07.06.02.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 02:27:25 -0700 (PDT)
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-e9-oBgK9wi6DOp5SGGd4vm-3sQY-fFn7HdTM842D1mg@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <ad4f6ee9-baa3-c328-a412-62301c5228e2@redhat.com>
Date: Tue, 6 Jul 2021 11:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-e9-oBgK9wi6DOp5SGGd4vm-3sQY-fFn7HdTM842D1mg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 7/5/21 4:07 PM, Peter Maydell wrote:
> On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>>
>> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
>> translation which triggers an LPI via INT command as well as write
>> to GITS_TRANSLATER register,defined enum to differentiate between ITS
>> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
>> Each of these commands make use of other functionalities implemented to
>> get device table entry,collection table entry or interrupt translation
>> table entry required for their processing.
>>
>> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
>> ---
>>  hw/intc/arm_gicv3_its.c            | 361 ++++++++++++++++++++++++++++-
>>  hw/intc/gicv3_internal.h           |  26 +++
>>  include/hw/intc/arm_gicv3_common.h |   2 +
>>  3 files changed, 388 insertions(+), 1 deletion(-)
> 
>> +/*
>> + * This function handles the processing of following commands based on
>> + * the ItsCmdType parameter passed:-
>> + * 1. trigerring of lpi interrupt translation via ITS INT command
>> + * 2. trigerring of lpi interrupt translation via gits_translater register
>> + * 3. handling of ITS CLEAR command
>> + * 4. handling of ITS DISCARD command
>> + */
> 
> "triggering"
> 
>>  #define DEVID_SHIFT                  32
>>  #define DEVID_MASK                MAKE_64BIT_MASK(32, 32)
> 
>> @@ -347,6 +368,11 @@ FIELD(MAPC, RDBASE, 16, 32)
>>   * vPEID = 16 bits
>>   */
>>  #define ITS_ITT_ENTRY_SIZE            0xC
>> +#define ITE_ENTRY_INTTYPE_SHIFT        1
>> +#define ITE_ENTRY_INTID_SHIFT          2
>> +#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
>> +#define ITE_ENTRY_INTSP_SHIFT          26
>> +#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)
> 
> This is still using a MASK value that's at the bottom of the
> integer, not in its shifted location.
There are other locations, pointed out by former comments, where this
kind of unusual masking scheme is used but well...

Thanks

Eric

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 


