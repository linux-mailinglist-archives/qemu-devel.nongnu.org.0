Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB73699A98
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShVG-0002Ih-RC; Thu, 16 Feb 2023 11:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShV7-0002IG-1n
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:52:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShV5-0005xt-8p
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676566370;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgjhFD+W/qPsHQW/LYSNNLiSl3Ah26asiJ19nFAQOfM=;
 b=fR0F7yyQmIQHadDeuN5WEPBNn+NsBRfT/JB5lDu3w+ZBF1mo1EkhPSwa6NQ7F6ouyp35yF
 ixvmJgY4Wt/YYCk1jovT3kGh6mFfIry4OlXAoOPFc/leLYNuphZ/Bfi9tGv5TZkF+RDjeW
 NBchgtFpyTdSmgyHwe4UOBQwXKyjU8o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-w-3Y5lUVNRyD3dCHM0wmvg-1; Thu, 16 Feb 2023 11:52:48 -0500
X-MC-Unique: w-3Y5lUVNRyD3dCHM0wmvg-1
Received: by mail-qt1-f200.google.com with SMTP id
 s4-20020ac85284000000b003b849aa2cd6so1518873qtn.15
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgjhFD+W/qPsHQW/LYSNNLiSl3Ah26asiJ19nFAQOfM=;
 b=8NxhavDie8LzZDZFpcJrJm92S7wd6Jtk7tkac1PRKJCK+CNHKGnS1U53yQGWnSgXYl
 1rVS2xQcHcmLoDmUvDL82QvsgFbqnBZht/ChOS7MZQp2qB7zmy2smhq6J17rF7aS13Kt
 f0txzKt5kx6V57mTFdB5r4g/Z2VFko9FmqXjxLN/0VSpOhoNYwjta9wtIx9vMG07rlwR
 6xSAnApWkv1/bYs8E3bjFoBuhH+U5FTEbz4T2kU0cCvfNdY61lTePDNEVK2cZ/O5uQoi
 d6Toc2Qhr6NgJX3+x+IZPa/dZbTSAC3mJPCcRRC0p6jMkTj8xeMRhFc/y+PHSi1lxOtp
 8e1A==
X-Gm-Message-State: AO0yUKXEyDlNYPXNVgaELquxWGHvc+odJvrEExFwyU26OPXt8+Ng9/NO
 IY0X+BajIjvMtbEgUVHZ2ukcnZC47+aTO4N5Z3oErdJhVkUtv8ZA7vDHN6jVhZrTVJwOZt7przu
 Qo0s0fcL+NPo6jmGRTfSE
X-Received: by 2002:ac8:5bc7:0:b0:3b2:4309:99e with SMTP id
 b7-20020ac85bc7000000b003b24309099emr10667900qtb.54.1676566367772; 
 Thu, 16 Feb 2023 08:52:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9GFPewMbMRrCFnYKZnkerqBugPlFH38VQLKIlBgYjKmmanScS0hr468X/ZPIAfG+2EZ1vWkQ==
X-Received: by 2002:ac8:5bc7:0:b0:3b2:4309:99e with SMTP id
 b7-20020ac85bc7000000b003b24309099emr10667879qtb.54.1676566367511; 
 Thu, 16 Feb 2023 08:52:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 i17-20020ac80051000000b003a6a19ee4f0sm1537882qtg.33.2023.02.16.08.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:52:46 -0800 (PST)
Message-ID: <e349bd12-23c9-87bd-f9ba-654c7885489c@redhat.com>
Date: Thu, 16 Feb 2023 17:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 10/16] hw/arm/smmuv3: Make TLB lookup work for stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-11-smostafa@google.com>
 <00066890-06bc-3091-8484-bf39c29df77b@redhat.com>
 <Y+40glPkaM0aK5C/@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+40glPkaM0aK5C/@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/16/23 14:49, Mostafa Saleh wrote:
> Hi Eric,
>
> On Thu, Feb 16, 2023 at 12:32:21PM +0100, Eric Auger wrote:
>>>      SMMUTransTableInfo *tt;
>>>      SMMUTransCfg *cfg = NULL;
>>> +    uint8_t granule_sz, tsz;
>>>      IOMMUTLBEntry entry = {
>>>          .target_as = &address_space_memory,
>>>          .iova = addr,
>>> @@ -764,21 +767,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>          goto epilogue;
>>>      }
>>>  
>>> -    tt = select_tt(cfg, addr);
>> maybe we shall adapt select_tt for S2 instead of using temp? I know
>> there is a single range on S2 but well, use tt[0]?
> We can adapt select_tt for S2, but we would need to have an instance
> of SMMUTransTableInfo in SMMUS2Cfg instead of having vttb,tsz..
> inlined, as the function returns a pointer to the SMMUTransTableInfo.
> I don’t think we can reuse tt[0], as this would change when we support
> nesting, so I think we just isolate s1 and s2 from the beginning.

OK fair enough, let's wait for others' feedbakcs then.

Eric
>
>
>>> -    if (!tt) {
>>> -        if (cfg->record_faults) {
>>> -            event.type = SMMU_EVT_F_TRANSLATION;
>>> -            event.u.f_translation.addr = addr;
>>> -            event.u.f_translation.rnw = flag & 0x1;
>>> +    if (STAGE1_SUPPORTED(s->features)) {
>> maybe check the enable state instead.
> Yes, if stage-1 is not enabled, tt might not be valid, I will update it.
>
> Thanks,
> Mostafa
>


