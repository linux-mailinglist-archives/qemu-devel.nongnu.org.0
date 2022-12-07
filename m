Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38995646143
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 19:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2zPQ-0008R8-01; Wed, 07 Dec 2022 13:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2zPN-0008Qu-VB
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:44:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2zPL-0000PM-4z
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670438677;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tai6Ocb3wQzy7DU3OtPVDl9drNxzCa1U/rzpGyVn2fY=;
 b=W2uqs7MTQmDPxIk2xTxXZtKbhVGt9ooQ/n1i9RAKfi3c3naKzTueW3aa1hdbzf2kIGSFEY
 UjJi8418LNv2WeF1xvULKQnPsVeATRegUa7gF6wbPMNubRFbkOYGXDgP7CEQfgFcG51atk
 4OqUNl1NYNvMFSxB4ToT3rCx6taepoA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-mUqXEqZXNYSuSm5KZxhZIg-1; Wed, 07 Dec 2022 13:44:36 -0500
X-MC-Unique: mUqXEqZXNYSuSm5KZxhZIg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p2-20020adfaa02000000b00241d7fb17d7so4486254wrd.5
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 10:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tai6Ocb3wQzy7DU3OtPVDl9drNxzCa1U/rzpGyVn2fY=;
 b=kD9wttx1JMNEZLwgCYJbuWIESx4wf9DI3T2bHIybM+FUvkAfoHkKcJIHKF86ETzvUJ
 A5tdCuDoxnGR4wzI3VJWmRQRerdzNNLnlk1MV/dLJFbd4r5yWzDTMtcD51QjzQLnoT47
 nW7zQ9BlH0/zOudK82OdBTmvD6QRBkymxThzNRzbYEzj2RsSuElnzgMYmg4p2IDMDhPF
 xFQJGaaMw1I+kyafH6UjeptMDYIh7Cr49NU29ItkrnzVrgWSn21Q2zPDScwM82KLjFhN
 S29lNh6UVbceLpth8+fhOvnmWmpx9hhL3UhejxvGRV+9wQtHtxQdOeT5gtWqODgU3EZX
 EIkA==
X-Gm-Message-State: ANoB5plOqVUkO8DU3kDShUEJqvM2ZX9KAOTM/iUNpYnETlWCVSCQ7v+F
 0rp7OZ7cFSr37n1FQ3MXNaIvDgTeeg5c1emoL2tm8GEHa0Bc3IIR15H0VAy7aQ6Vr/c03KXoPhw
 SUV9vgY6rOZflbvo=
X-Received: by 2002:a05:600c:2145:b0:3d0:920f:f7b7 with SMTP id
 v5-20020a05600c214500b003d0920ff7b7mr14943163wml.22.1670438675421; 
 Wed, 07 Dec 2022 10:44:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4rWVwHbPLUq7vda1lsG3Kj+Kt1LfWrutDn5wR39l7dG8Hwqyyld0c4/RWxPoVP/0tNYJZcmg==
X-Received: by 2002:a05:600c:2145:b0:3d0:920f:f7b7 with SMTP id
 v5-20020a05600c214500b003d0920ff7b7mr14943148wml.22.1670438675239; 
 Wed, 07 Dec 2022 10:44:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003c6b874a0dfsm2929762wmi.14.2022.12.07.10.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 10:44:34 -0800 (PST)
Message-ID: <d3ba280e-0955-a599-29ec-3fd24df9fd23@redhat.com>
Date: Wed, 7 Dec 2022 19:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, paul@nowt.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <CAJSP0QXKf5X0FijR64_0JWUBcnpNm-Jk58bfCk=966dZmj7NOw@mail.gmail.com>
 <660c1fa1-3575-1849-01d0-8411ca4101d8@redhat.com>
 <64a40f5d-855e-7f70-ba1f-df464abcfddf@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <64a40f5d-855e-7f70-ba1f-df464abcfddf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi,

On 12/7/22 19:23, Richard Henderson wrote:
> On 12/7/22 10:08, Eric Auger wrote:
>> On 12/7/22 16:55, Stefan Hajnoczi wrote:
>>>> I am using this configure cmd line:
>>>>
>>>> ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/qemu
>>>> --target-list=x86_64-softmmu --docdir=/usr/share/doc/qemu --enable-kvm
>>>> --extra-cflags=-O --enable-trace-backends=log
>>>> --python=/usr/bin/python3
>>>> --extra-cflags=-Wall --extra-cflags=-Wundef
>>>> --extra-cflags=-Wwrite-strings --extra-cflags=-Wmissing-prototypes
>>>> --extra-cflags=-fno-strict-aliasing --extra-cflags=-fno-common
>>>> --extra-cflags=-Werror=type-limits
>>>>> If you added it manually then let's fix this in 8.0 since it's not
>>>>> tested/supported and very few people will see this issue.
>>> Did you create the ./configure command-line manually? Do you think
>>> other people will hit this?
>> no I did not. I just tried to install a fresh qemu repo and just ran the
>> above configure command.
>
> Stefan's question is where did you get this configure command?
this is the native unmodified configure from
https://git.qemu.org/git/qemu.git/.
>
> If it came from an rpm script or suchlike, we might take more notice
> than if this is just you adding --extra-cflags for your own testing.
>
>
>> I am actually surprised nobody hit that already.
>
> Adding -Wall is not standard, nor all the other -W that you are
> adding.  I think you should not be surprised that you run into problems.
OK that's a useful indication. I used to have this configure cmd line
for a while and have not paid much attention to it until now, I
acknowledge. This was useful to catch compilation errors at some point I
guess.
>
> While you can make a case for auditing the code base and adding these
> to the default set of warning flags, that's a job for the next
> development cycle.

Let me clarify, I am not insisting for that fix to land in 7.2 all the
more so it is pretty late. I just wanted to report the compilation issue
and since I use the std qemu pieces with a pretty standard tool chain I
thought somebody else would be likely to hit the same problem.

Thanks

Eric
>
>
> r~
>


