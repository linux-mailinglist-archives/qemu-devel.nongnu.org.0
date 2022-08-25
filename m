Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F05A0FCD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:01:45 +0200 (CEST)
Received: from localhost ([::1]:45252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBYO-0004Pz-I6
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRBUI-00014h-89
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRBUC-0000sH-Ay
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661428643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OH9t8beWK4TVJli1JliRBOVnErEkOVi3iHXJxtVTI8=;
 b=Ksx8S6ZKisgj+ZmFmdngunnoJLIhQjks1CSNzaw3sMwv3YClEAjgdhExS+4arHK7bJZSap
 oHK/DVJ++Sn8jkcmRcfviMXfBW/flvbZkH4OfYD9Lci/w+IPdeFLTmKg65XgT+u5nayvPK
 i6/v0AlljyZT4qDUhVarFE2guFa4He0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-iFRcM_uGM4-7eAdoaeshRw-1; Thu, 25 Aug 2022 07:57:22 -0400
X-MC-Unique: iFRcM_uGM4-7eAdoaeshRw-1
Received: by mail-wr1-f71.google.com with SMTP id
 c6-20020adfa706000000b00222c3caa23eso3322651wrd.15
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 04:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=6OH9t8beWK4TVJli1JliRBOVnErEkOVi3iHXJxtVTI8=;
 b=PyDIBp7EyIFdZQY5TT7M7Lm2QPq/ivJ2iMsc28Ps0HgBODGZtzdoWs4sbt6AcaYTs3
 dnz5c2kbS/3TNyYH1wOuAPqXbUY3DbmELiXC/l4H03/GgHAfIqR/Wet3xdNasOm0R0OV
 Gu2nP1CEy0Q99qISeY6h5Aw7gdxiWS2IYrLPEq+NDy8IOU2OHOtABJJinbrm+leRHwvU
 7LignTPeYHKlm5cl6rH2VohkWPx4xwKzHYubyqOiOsaLJJ72agFhihuIZkwnyddVXPDr
 eEaHrk7tskrnvLbpSvfRCivYexis+WHuWP7CzclpNMmVJCIHi8HTyioXhZn4rjvRmPeO
 XWTQ==
X-Gm-Message-State: ACgBeo0S1VtTtog1MDYea3BnSoN8dA53cxAo9RuvQVCavhZhR1K+x4yu
 uP9JOsgFJ5IrXB7yoaR/YxUG1Tkoe8NXz4RihynHneHOjbRQnwkn2NK1/hF3Hr4y2HDtchdHeO4
 I6oVXXs2sZQlS5Ag=
X-Received: by 2002:a05:600c:1f1b:b0:3a5:f4f4:f599 with SMTP id
 bd27-20020a05600c1f1b00b003a5f4f4f599mr2152933wmb.39.1661428641411; 
 Thu, 25 Aug 2022 04:57:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4TdCpDcZlLDxzRgs/XEx2y8/zCaLne/a+00eZAmKL8k0MrxIHNACgG2np8Z4xnC76rAi1QBA==
X-Received: by 2002:a05:600c:1f1b:b0:3a5:f4f4:f599 with SMTP id
 bd27-20020a05600c1f1b00b003a5f4f4f599mr2152919wmb.39.1661428641164; 
 Thu, 25 Aug 2022 04:57:21 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c129200b003a5fa79007fsm4917408wmd.7.2022.08.25.04.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:57:20 -0700 (PDT)
Message-ID: <cc366956-adc7-7ca6-a056-0bad28fdca06@redhat.com>
Date: Thu, 25 Aug 2022 13:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qiaonuohan@cn.fujitsu.com
References: <CAJ+F1CL27O8dmGSws=-QgutRRpM2NHcued28gnvt5jWo2WeUvw@mail.gmail.com>
 <e7b3468a-cdfb-4592-8a7a-48da2fa77647@redhat.com>
 <CAFEAcA9OH4ih2pOUbsv6dTMW=3_9LTkzSRj4ogO4oxVS4fOASw@mail.gmail.com>
 <bd40c251-b670-3a9a-f29c-86268d06a5b7@redhat.com>
 <CAFEAcA85Ek=Uf-VfQmZKcyrBGU6zR-mrV3tA7mODorjr_52y2A@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Page alignment & memory regions expectations
In-Reply-To: <CAFEAcA85Ek=Uf-VfQmZKcyrBGU6zR-mrV3tA7mODorjr_52y2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.08.22 13:47, Peter Maydell wrote:
> On Thu, 25 Aug 2022 at 08:27, David Hildenbrand <david@redhat.com> wrote:
>> On 24.08.22 21:55, Peter Maydell wrote:
>>> Lumps of memory can be any size you like and anywhere in
>>> memory you like. Sometimes we are modelling real hardware
>>> that has done something like that. Sometimes it's just
>>> a convenient way to model a device. Generic code in
>>> QEMU does need to cope with this...
>>
>> But we are talking about system RAM here. And judging by the fact that
>> this is the first time dump.c blows up like this, this doesn't seem to
>> very common, no?
> 
> What's your definition of "system RAM", though? The biggest

I'd say any RAM memory region that lives in address_space_memory /
get_system_memory(). That's what softmmu/memory_mapping.c cares about
and where we bail out here.


> bit of RAM in the system? Anything over X bytes? Whatever
> the machine set up as MachineState::ram ? As currently
> written, dump.c is operating on every RAM MemoryRegion
> in the system, which includes a lot of things which aren't
> "system RAM" (for instance, it includes framebuffers and
> ROMs).

Anything in address_space_memory / get_system_memory(), correct. And
this seems to be the first time that we fail here, so it's either a case
we should be handling in dump code (as you indicate) or some case we
shouldn't have to worry about (as I questioned).

> 
> -- PMM
> 


-- 
Thanks,

David / dhildenb


