Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D83523159
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 13:20:47 +0200 (CEST)
Received: from localhost ([::1]:50344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nokOa-0000Ys-Eb
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 07:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nokJh-00059W-1f
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nokJe-0003Kv-7Z
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652267736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxmkoTG/Xxe/2qNx41TizfE/bg6U1PV28QkMh8IIoGE=;
 b=L+IIJ1NKEGhY5ctMPvbs6jIWzkzarDqytrZvCDACMhWk2vwP6fck+AIFF0FMmzoz9mzEP+
 6cLC6ifd8TlLAO6R411iUJzF0CkyjfiLu8H0vBpcP8gcYeYezlhNWlQhiCmGGffG0RoaYM
 Jub2QH0Y8Nm6pb+t2sfu4M8SJ1Hz4sA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-LrAuOuulPRi8s19W2_ZPGA-1; Wed, 11 May 2022 07:15:35 -0400
X-MC-Unique: LrAuOuulPRi8s19W2_ZPGA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo615083wml.1
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 04:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UxmkoTG/Xxe/2qNx41TizfE/bg6U1PV28QkMh8IIoGE=;
 b=1ZI03c9SfXqIe442u54qMGnKqVeym0D8wtnRdFO8w39jwn7JZGkZja2eFJRNk+nXXz
 I1zEWKJZB127p14EB4IlZM/Hmc2KeE6L/MaY+qrPCWA5zJVdTTKmHuQuUYv+NtRQ5VBu
 EhA3IWxXbrqXVJvnin9gcjkmtEyLNUfuy2GZx53jBJ//RacYrSAxXYkR9BAegjhGL9Tr
 SsUo1PphL368N/GOj6J+vgpth8PAtfex+TWJCeekYsyLeh/2ZV8wGxNYIsxbr9Xmb43S
 2v1jqUDPOruHhvDWY7X5TlGqB2B6QBXIpD8gp5KkWU6cxWjzrUR4hX/qxkuvEyrAnV//
 kcAA==
X-Gm-Message-State: AOAM532slZUPEgBXIK5Sb1/ksvikhakNzwBPfFhjjY7x8rjq0o9boc8n
 tHJYOxRYoPusuWMuAIM8pz+Kb6XKiSbY14juqL5uw3ch7aXZ/Bdd1Q7MNb4uT2/IrDq+7mW6Wal
 MJYu7/pU/l6C7rb8=
X-Received: by 2002:a1c:4b14:0:b0:394:2ece:c049 with SMTP id
 y20-20020a1c4b14000000b003942ecec049mr4383602wma.158.1652267733886; 
 Wed, 11 May 2022 04:15:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT1d86Ct/XZGvBzSDYyrSVKoTGs1vGBipHiG9hZAyw9z6f/OLno+xvOmnRB2i9I3RWhi8koQ==
X-Received: by 2002:a1c:4b14:0:b0:394:2ece:c049 with SMTP id
 y20-20020a1c4b14000000b003942ecec049mr4383569wma.158.1652267733641; 
 Wed, 11 May 2022 04:15:33 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600012cc00b0020c5253d8dcsm1403968wrx.40.2022.05.11.04.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 04:15:33 -0700 (PDT)
Message-ID: <c0fb8289-1b56-6e7f-e053-b19dffcfc87b@redhat.com>
Date: Wed, 11 May 2022 13:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Robert Foley <robert.foley@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220510195612.677494-1-thuth@redhat.com>
 <YnuCEPOj70J+1NXx@redhat.com>
 <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
 <f40ceb7b-8412-8da2-7c16-2590debecaed@redhat.com>
 <CAAdtpL4oGW28-r0ZuMV9nBoZGDR5L9PYM2jsKw0Fmuwx68MWdw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAAdtpL4oGW28-r0ZuMV9nBoZGDR5L9PYM2jsKw0Fmuwx68MWdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 11/05/2022 13.13, Philippe Mathieu-Daudé wrote:
> +Fam
> On Wed, May 11, 2022 at 1:03 PM Thomas Huth <thuth@redhat.com> wrote:
>> On 11/05/2022 12.46, Philippe Mathieu-Daudé wrote:
>>> +Robert
>>>
>>>    On Wed, May 11, 2022 at 11:30 AM Daniel P. Berrangé
>>> <berrange@redhat.com> wrote:
>>>>
>>>> On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
>>>>> According to our "Supported build platforms" policy, we now do not support
>>>>> Ubuntu 18.04 anymore. Remove the related files and entries from our CI.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>    Seems like nobody touched the 18.04-based tests/vm/ubuntu* files in a
>>>>>    very long time, so I assume these are not used anymore and can completely
>>>>>    be removed now.
>>>>
>>>> Or it could mean that they are working fine and so haven't needed
>>>> changes...
>>>
>>> Yes :)
>>
>> At least for me "make vm-build-ubuntu.aarch64" is only failing with ssh
>> timeouts (on my x86 laptop) ... is this really supposed to work with TCG, or
>> is this KVM (on arm hosts) only?
> 
> Yes this timeout code is not working. I suppose it is tied to the TCG host perf.
> I suggested a pair of patches to increase it but back then Fam didn't accepted
> them because IIRC these VMs were used by patchew (previous to Gitlab).
> Today we have better framework for testing, so I wouldn't use this script on
> CI, but it is still valuable for manual testing.
> 
> Robert's email doesn't work anymore. Since I don't have x86 workstation
> anymore, I'll probably use these tests/vm for testing. So let me add a
> "upgrade tests/vm/ubuntu to 22.04" to my TODO list. If I fail and nobody
> miss them, then I won't object to remove them.

All right, I'll respin my patch with the VMs excluded (and containers moved 
to a separate patch).

  Thomas



