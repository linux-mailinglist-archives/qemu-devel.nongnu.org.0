Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164193E4179
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:19:05 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD0Uy-000882-5y
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD0UC-0007FO-V8
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:18:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD0UA-0005eN-9y
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628497093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0i4JWQBVVD5jGH8ZEyIPP14sxJ1C1vbYGBbhbf81Io=;
 b=BP8u2bYmekebQKL+nsK1V7cknc+NfcgutURR/R0Ek5CJJ4hSNGvyaU7BsVfnpRSfunm/1M
 6zuvnfZLZg+TZL1wVt7HUkjk93avqKfIqWlOS7GvOBPPfHtEaBHvtytV/aw3Mv5mVvsaeK
 mleKvPykIkDIOilziICl5/OVMhFSDws=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-Wn_YrFtsMWKsTUUDj8rgaQ-1; Mon, 09 Aug 2021 04:18:12 -0400
X-MC-Unique: Wn_YrFtsMWKsTUUDj8rgaQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso5112856wri.18
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 01:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j0i4JWQBVVD5jGH8ZEyIPP14sxJ1C1vbYGBbhbf81Io=;
 b=JhcEOwyLqU5cyG5kNeUBPnhi19LYIqsGiWArptqsMArXkd6Q+UIq2NPmGHA3nAtJSg
 zLfJJxDoGTZbeBN2fHY3mOxwkILFzNHowveB/jNd3NRwqXLi22NOdmJJTfG0qpMjqMX6
 XprUMKIGfhxZ3j+Fq9f99Fh6RDNQXb/k7WMzNUnjJ4iYrOEBPLvppj5O5lxPn7+8ndyY
 NZkbHrL3wrFo3UqbDf/JY95opqi83dQe58JsHHTgc+3+hqClvwMTEn2+/2zHNJ2VjNz1
 QqXlIsQVmLxMPad5ZjGQNRw0pos2oSCUm2msKXIvYd9VXHtpKy6IW4eQDebYig4ij/3o
 qntg==
X-Gm-Message-State: AOAM532HPqTCWhGUVoaigSsFnGPqO9/dpcKSjU8egNZ06/m7viO/NO66
 z5QEOatMrwqH7qauXNtB3AoVnjnbJKlgygebtwGUl4LbWz8lykiHUA3kRFXvX5YErqiuqFgn1lb
 jptsSWnV47HnIeWL7MO0MiwrUJBX+A7V/HZ/fvMeoPmgMnaUNC6BOgG+rB8kGMIGf
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr2032977wro.107.1628497090669; 
 Mon, 09 Aug 2021 01:18:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8xLLOFwTyYZzLHjY2GYGiYsF2Qd0pco0dqbFcoyy0mLreEEEDo/FOmEZpxHvXARrT+f08eg==
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr2032948wro.107.1628497090407; 
 Mon, 09 Aug 2021 01:18:10 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f3sm19024824wro.30.2021.08.09.01.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 01:18:10 -0700 (PDT)
Subject: Re: [PATCH] ppc/pnv: update skiboot to commit 820d43c0a775.
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210806180040.156999-1-clg@kaod.org>
 <3935af0a-1fee-9a56-21ea-d4c94b886bd3@redhat.com>
 <81996cbe-e526-64cb-cfe6-40327effe66d@kaod.org>
 <4e7b51b8-8b77-3634-eab5-eccc2e01b7c7@redhat.com>
 <95c51605-a1dd-5e20-5f8c-8dbcc9de9100@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <14ee6281-b805-48ba-29e4-495e8c337f57@redhat.com>
Date: Mon, 9 Aug 2021 10:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <95c51605-a1dd-5e20-5f8c-8dbcc9de9100@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 10:14 AM, Cédric Le Goater wrote:
> On 8/9/21 10:06 AM, Philippe Mathieu-Daudé wrote:
>> On 8/9/21 9:55 AM, Cédric Le Goater wrote:
>>> Hello Phil,
>>>
>>> On 8/9/21 9:06 AM, Philippe Mathieu-Daudé wrote:
>>>> Hi Cédric,
>>>>
>>>> On 8/6/21 8:00 PM, Cédric Le Goater wrote:
>>>>> It includes support for the POWER10 processor and the QEMU platform.
>>>>
>>>> 1/ Can you include the output of 'git shortlog v6.4..820d43c0' here?
>>>
>>> OK. See attachement.
>>
>> By "here" I meant in the commit description ;)
> 
> yeah I know but David queued the patch already.

Queued for 6.2 ;) David doesn't have problem to update an
unmerged queue. So are you expecting him to amend the attachment
to your commit?


