Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1337B557
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:11:10 +0200 (CEST)
Received: from localhost ([::1]:58904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgh9J-0003hm-2K
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgh74-0001ss-M5
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgh70-0005W4-IK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620796124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOMZjGtqxOQlsN+U1IEb0tEKh8Ml+YaaJkvn+j4SU1I=;
 b=QE2zhUek9+lJaBkLqHgsjDXSM7fhr2EZ0GypCXPV9Kr2Ts7fvOEyN1I0fkbUEX2I3xxeBf
 tGqhlBIPkPoaKE/hqJpiFNXMudd1/3HMSZQYlq+HI5/mon0FOnlYXUHc3bkUzjjfFS57TI
 N/XuXkPfEqlQQAWeX5CrrPq9qGXTAxw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-CQYww5ohNxiMxd9dnwM8fQ-1; Wed, 12 May 2021 01:08:40 -0400
X-MC-Unique: CQYww5ohNxiMxd9dnwM8fQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 91-20020adf94640000b029010b019075afso9607909wrq.17
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOMZjGtqxOQlsN+U1IEb0tEKh8Ml+YaaJkvn+j4SU1I=;
 b=kYt1bmeKnp57StOocQxnBDnizrStIgLe+Lvg+flDGTsubu5O63lOICsgPyvfDpJvWN
 mlX1CiiiIwy9gdjw1R2GzaI2CFWVDAaeOFT9QNTg4i9oCreB90Q1AqUCGwAaRx6Nc1MK
 80dFifrFZcb7WYyBe3idyG6GPP5FJE4yc0yFtMc4aXsjLaV4I7O8JPeFPpjuQ+x/ckOJ
 z5AT4I+T7rewC0nI9bUaG7BA8fexHswwicdOedKnf0b5XgnEpDqlKKux9it14cVSxE4+
 YGU6/eYjyfH6XrJGU7ytG6xEH/vl86IRFOvziymH8DF7uXwnFpV76z7/rpLYNNxbuagi
 2Axg==
X-Gm-Message-State: AOAM532M5agfHrmcjmD7ebfLP4TxfWqJbuTzAj2SXsYSw0DWxeny9dln
 RDY2viNLQ0xfLfuxke45vzPRxWOUsoAFarT762jT3Nd6D7wMtVza3OAeMGV0Jzd7umZpysj07sA
 oG3l6RZAN0O+XdtE=
X-Received: by 2002:a1c:540b:: with SMTP id i11mr9602594wmb.40.1620796119074; 
 Tue, 11 May 2021 22:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc3MCGRVChDhxzUHlHpcPjgIpl7G+qEmNzzretF+0zA9hMC9wGVALFEdMpoT7wWEcR7Itqrg==
X-Received: by 2002:a1c:540b:: with SMTP id i11mr9602572wmb.40.1620796118789; 
 Tue, 11 May 2021 22:08:38 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a15sm32588297wrx.9.2021.05.11.22.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 22:08:38 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com> <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
 <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <87594332-49d3-2859-c893-9071200e8713@redhat.com>
Date: Wed, 12 May 2021 07:08:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 5/12/21 6:53 AM, Thomas Huth wrote:
> On 12/05/2021 05.57, Philippe Mathieu-Daudé wrote:
>> On 5/12/21 4:24 AM, David Gibson wrote:
>>> On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Per the kconfig.rst:
>>>>
>>>>    A device should be listed [...] ``imply`` if (depending on
>>>>    the QEMU command line) the board may or  may not be started
>>>>    without it.
>>>>
>>>> This is the case with the NVDIMM device, so use the 'imply'
>>>> weak reverse dependency to select the symbol.
>>>
>>> Uh.. It should definitely be possible to start a pseries machine
>>> without NVDIMM.  I would have guessed the same for PC.
>>
>> Yes, this is what this patch does. With it we can build with:
>> CONFIG_NVDIMM=n
> 
> But with "imply" you could end up with a PSERIES that does not have
> NVDIMM when also using --without-default-devices, couldn't you?

Not currently, because of the CONFIG_NVDIMM=y.

> Why don't you use "select" instead of "imply" ?

Because as David said earlier:

"It should definitely be possible to start a pseries machine
without NVDIMM."


