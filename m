Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36942DE802
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 18:25:45 +0100 (CET)
Received: from localhost ([::1]:33066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqJVg-0006jd-QZ
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 12:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqJTg-0005yV-IN
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqJTM-0003JS-Ih
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608312198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yT/+FWuw5z1fvHYafELKl/UnZUkO1XdC1i1khLiNjOg=;
 b=CMi4vTXLP7pOU82uKpIGOWpB8ql6LpWnknW3FSQxwLaDRGHI+61G5yAXas72zFK2vUqFmJ
 tfHevhsXBI1UEN/VdPXDMItZ4HHuK4NhTvkey3OFdLxy9wFh6uHEoZFriMrS4/oqmSfC1R
 4TH8aU1O7hTKFEWYGBG9sY0fta8xuPc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-sdVV0QJQMj2TNMwcpyGiJw-1; Fri, 18 Dec 2020 12:23:17 -0500
X-MC-Unique: sdVV0QJQMj2TNMwcpyGiJw-1
Received: by mail-ed1-f69.google.com with SMTP id h5so1383931edq.3
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 09:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yT/+FWuw5z1fvHYafELKl/UnZUkO1XdC1i1khLiNjOg=;
 b=eGoaoYFVmBKJdEyBZa76WUSTjCmOu5TkF3kqC2UGfBGSLsr/f12pgXhV2bX3qaTrEy
 f77nZHe0zQypSgliHQ4DlSAJ0UqwFKMf8JhwdMxIGGreAHssAtWCM14YIf3LPIMfHlTl
 k8tnJ62m8qbEtxu3bybZWSGArhRqxLsdb8KQoG7bwO6450NyFBVlpYR5IZ7uokAlmpjr
 vMtsMPx4PcLqSZ9vWyt96FwWwVHnAr/bLGO2z0kIx0gdPf8Qhvn1FW1WJX65SAsnSYAJ
 /IXhPnwgSGIfxHlnx9lZz6oV8IXDZFviC0XPSoQYmqdUII6fzF4qPmrPU6C8XMbrwMoM
 qYTQ==
X-Gm-Message-State: AOAM530j08o9kbTdFWlL+2eynXlesJQVM7080rNSfn1SCy4ZFk8lMyRZ
 611q9TVxtTh8Tp5eHOjWrdGXq1PrAxuLi+sDYke2vTWSiDnfP0CByOGccp8KVuehj3zxJ2SrA+S
 un9K76LRlEiuJLB7oReD46IEXNl8pN3FF1naHd62r/RI9DrPhGFpeILhLvJEy8+TOuZY=
X-Received: by 2002:a17:907:36a:: with SMTP id
 rs10mr4926117ejb.411.1608312195353; 
 Fri, 18 Dec 2020 09:23:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyoeVeTMYSyxTyjK3UGJJkNK4DQUU5jbkf6achoJiEcyT8t2FjqvWQA2k5RWDestpT+TTuNQ==
X-Received: by 2002:a17:907:36a:: with SMTP id
 rs10mr4926095ejb.411.1608312195103; 
 Fri, 18 Dec 2020 09:23:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i18sm11718920edt.68.2020.12.18.09.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 09:23:14 -0800 (PST)
Subject: Re: [PULL v2 00/11] testing and configure updates
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20201217094330.17400-1-alex.bennee@linaro.org>
 <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
 <87v9d0q9rr.fsf@linaro.org>
 <CAFEAcA9dFV5ym=N1XQBJrXHYgu5NNRJC8eB9pPRaK2CokHoHxg@mail.gmail.com>
 <87pn37qqh1.fsf@linaro.org>
 <CAFEAcA-UmyTw8Sn5yZrZFxumJRPv-oGg4uL++7av0oTh8fEAMw@mail.gmail.com>
 <87blerqblh.fsf@linaro.org> <878s9vqbh4.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <91499156-7bdc-a994-340b-b1c8e9a65dcc@redhat.com>
Date: Fri, 18 Dec 2020 18:23:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <878s9vqbh4.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/20 18:17, Alex Bennée wrote:
>> I'm surprised about build.ninja and Makefile.ninja Don't they get
>> regenerated by the configure?

This just means that meson _looked_ at some moxie file, so the files are 
a dependency of configure.

> Even weirder, re-run configure and the list grows!
>
>    meson-private/microblazeel-softmmu-config-devices.mak.d
>    meson-private/sh4eb-softmmu-config-devices.mak.d
>    meson-private/xtensa-softmmu-config-devices.mak.d
>    meson-private/mips64-softmmu-config-devices.mak.d
>    meson-private/nios2-softmmu-config-devices.mak.d
>    meson-private/rx-softmmu-config-devices.mak.d
>    meson-private/tricore-softmmu-config-devices.mak.d
>    meson-private/s390x-softmmu-config-devices.mak.d
>    meson-private/microblaze-softmmu-config-devices.mak.d
>    meson-private/riscv64-softmmu-config-devices.mak.d
>    meson-private/riscv32-softmmu-config-devices.mak.d
>    meson-private/sparc64-softmmu-config-devices.mak.d
>    meson-private/arm-softmmu-config-devices.mak.d
>    meson-private/xtensaeb-softmmu-config-devices.mak.d
>    meson-private/sh4-softmmu-config-devices.mak.d
>    meson-private/mips-softmmu-config-devices.mak.d
>    meson-private/or1k-softmmu-config-devices.mak.d
>    meson-private/sparc-softmmu-config-devices.mak.d
>    meson-private/x86_64-softmmu-config-devices.mak.d
>    meson-private/avr-softmmu-config-devices.mak.d
>    meson-private/mips64el-softmmu-config-devices.mak.d
>    meson-private/mipsel-softmmu-config-devices.mak.d
>    meson-private/ppc-softmmu-config-devices.mak.d
>    meson-private/aarch64-softmmu-config-devices.mak.d
>    meson-private/i386-softmmu-config-devices.mak.d
>    meson-private/alpha-softmmu-config-devices.mak.d
>    meson-private/ppc64-softmmu-config-devices.mak.d
>    meson-private/hppa-softmmu-config-devices.mak.d
>    meson-private/m68k-softmmu-config-devices.mak.d
>    meson-private/cris-softmmu-config-devices.mak.d
>    moxie-softmmu-config-devices.h
>    build.ninja

This is expected since there's still an unconditional "source 
hw/moxie/Kconfig".

Alex, would you like to just drop the deprecation patch?  I can pick it 
up in my tree and try to debug it.

Paolo


