Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F02551895
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:14:07 +0200 (CEST)
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3GIA-0001O4-8g
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3GBu-0001kx-Ig
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3GBp-0004tg-TO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655726852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFobYPMte4xNwcMInHHdOnAC/4ILfqbCjMXYgVvPmQ0=;
 b=blhnnBZeWsmNhOUEPQ+eDSBAKCDQodeS4MSQ3M38+SdzOEU82VC9LsYCyzhFz4jaIUqVzZ
 x+CJmOntQD5fnMoP4cH1PIJlLpYoc1GTNf/oczdxlv+IJqU+1FxFXUXUx6ZVmjxmBqTpLe
 pn4ZiC9OTJXYkjPNBZ8n7YYroW1PC5g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-Pd09SEJNOcq6gXoNeGneEA-1; Mon, 20 Jun 2022 08:07:31 -0400
X-MC-Unique: Pd09SEJNOcq6gXoNeGneEA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h205-20020a1c21d6000000b0039c96ec500fso6809959wmh.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 05:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FFobYPMte4xNwcMInHHdOnAC/4ILfqbCjMXYgVvPmQ0=;
 b=MvcIRhm8VfUqRlxdrvinRLqHXJNml7Kro00URtAVSo/RUkyBj3KT2f5fgzKD/d6xY9
 V4GgzGeusIayKg4B7iBkmI7Jtn5F0d8VKlS4qpyytsUS+WgJdgcbdlMPqeNER3DCZGRl
 3SJ9Aw9HQ2MvNQWRHQx8NyzI+avvJIkup4tQprDO6mLYHhx9xv9X/D9FTFHL+PDUxMJm
 rSsqtzZpC9tNWu2+YTKYy9XOcJ5IENGv9PUJ4wUGR1UAbgH1rXikaglpQovIcCW0gaOm
 aYSF7H77MB0mx5TLK9E9h52pGOehmeWGj2T0DeOaEzY14oROWOjgNJFiYjq7Mr0D26Bu
 Ithw==
X-Gm-Message-State: AJIora9DddJSvfS3aApzjZRBASAk9JSjyOrn1vH5/pYoKidGq0dN+L5B
 IoO2e4NdtmN3S28iRy4shUvPnAtsRnXVEFWgNU4PYlQBXgTRgAeE0LF9bkRTbt3AFJo6lZAFb3P
 adYVH2ECkJb9Ejtk=
X-Received: by 2002:a5d:500a:0:b0:21b:8274:9ddc with SMTP id
 e10-20020a5d500a000000b0021b82749ddcmr14423954wrt.251.1655726850203; 
 Mon, 20 Jun 2022 05:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uPPE0Y9frAtV1oe1sKcoI7+RBGB22mb4PpfXKdXzoAiuBC3tUoOyT6htMDCFmuDXrMxisIcQ==
X-Received: by 2002:a5d:500a:0:b0:21b:8274:9ddc with SMTP id
 e10-20020a5d500a000000b0021b82749ddcmr14423929wrt.251.1655726849879; 
 Mon, 20 Jun 2022 05:07:29 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-241.web.vodafone.de.
 [109.43.178.241]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b0039c50d2d28csm19101262wmq.44.2022.06.20.05.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 05:07:29 -0700 (PDT)
Message-ID: <82e9f989-c903-ae13-3a8f-2edc94b73a50@redhat.com>
Date: Mon, 20 Jun 2022 14:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Building tools on unsupported cpu/arch
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers
 <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <31fb2fcb-6ad0-b769-9ec9-94fba0679065@msgid.tls.msk.ru>
 <beb38967-f089-c0f2-eb41-f33277e38d44@redhat.com>
 <0b98e946-3f1b-0e2c-8beb-9cc878190c06@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <0b98e946-3f1b-0e2c-8beb-9cc878190c06@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 20/06/2022 12.54, Michael Tokarev wrote:
> 20.06.2022 13:31, Thomas Huth write:
>> On 30/04/2022 16.11, Michael Tokarev wrote:
>>> Hello!
>>>
>>> Previously, it was possible to build qemu tools (such as qemu-img, or 
>>> qemu-ga)
>>> on an unsupported cpu/architecture.  In a hackish way, by specifying
>>> --enable-tcg-interpreter on the ./configure line.
>>>
>>> Today (with 7.0), it does not work anymore, with the following error
>>> during configure:
>>>
>>>   common-user/meson.build:1:0: ERROR: Include dir host/unknown does not 
>>> exist.
>>
>> Did you ever send a patch for this? I something like this should do the job:
>>
>> diff a/common-user/meson.build b/common-user/meson.build
>> --- a/common-user/meson.build
>> +++ b/common-user/meson.build
>> @@ -1,3 +1,7 @@
>> +if not have_user
>> +   subdir_done()
>> +endif
>> +
> 
> https://salsa.debian.org/qemu-team/qemu/-/blob/master/debian/patches/common-user-no-user.patch 
> 
> 
> I dunno which one is right - "have_user" or "have_linux_user & have_bsd_user".

Both should be fine - have_user is just a shortcut:

$ grep have_user meson.build
have_user = have_linux_user or have_bsd_user
...

Could you send it as a proper patch? (otherwise I could assemble a patch, 
too, if you prefer that)

  Thanks,
   Thomas


