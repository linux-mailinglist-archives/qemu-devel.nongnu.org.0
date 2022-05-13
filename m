Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B36526723
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:34:21 +0200 (CEST)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYF9-0004qI-T0
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npXox-0003Xd-5b; Fri, 13 May 2022 12:07:23 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npXov-0003rh-A7; Fri, 13 May 2022 12:07:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id g6so17190102ejw.1;
 Fri, 13 May 2022 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jykZIpNg5SNn1B4JRI9EWoF3P7TraENugle19PndUXk=;
 b=HIzylZkgCjsEat4RuvkXFdAmb/WcCmH8NmAtfoJFEpIONz7QQh2/WjmZ08nKEyV++6
 5P4/ipQzUqQZvvrCxmXkrw5Sby/Eqa///ozP8Pef+1RqxWmHoMKJDaCX7JUPKg9qawMF
 EryNuDVIQiJs37Ao5OuZ63+Qei5RC5uXu4jF1Pwll9P95QaU/fm8jgJdLqMjXcgyrjcl
 WpJDUPjGBPAlvy/m+ToObpZbwqM4/sb4d2iO5ZEwwd6R9drvbochjr2B6oPd/k0SDdeA
 KhddwcGk5xDyA6xiP31lVBzI7gvxc6RmBjiqIMQrg/rmn1US9UXzJS8Pob9ijzQtYq4i
 JtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jykZIpNg5SNn1B4JRI9EWoF3P7TraENugle19PndUXk=;
 b=MHY6eHNVdGysw7n2Z1MgyJxFNMt+PdCjPj/ESIMo+doKrla1D7e7xXxW4NEfb613rl
 d6HncRs1+vykmo337UDjn0jxcULnXIreYs+sFALT7ejBgCLMUPCs4+drMfw7Mcs2smzq
 yUCZFlkxwsAnAF7lldEVzqUZCCD07CEjd8n38+NFwQdha1/QP8EXZzUMjheTBouKZ/gW
 qy7k6zhcjEVBoOE+cBaVWDE84/PH06bSPlezsi7juFcwDdqmpJlFFD2nhLR/A83o6cOx
 fGW8xv2d2vKFFTklLapqN/4ritCrnBQeJ+iwcSDYbwT2ORV+TAWFVCzVL1xujFx6PK30
 u7Qg==
X-Gm-Message-State: AOAM5329caFEjIGEgDUOMBqXEIRm3K69N8lWXFASEA4jyolt1x0dPTzm
 83Xqzzcf2XWYFez4BduFpn8=
X-Google-Smtp-Source: ABdhPJzGqi6sg1EHmlCzHVPXZjdmfAWfysBCPUmCNBhKyFM0NP+ReFdpgJ5L/0IEJtdZMhX6uQ548A==
X-Received: by 2002:a17:907:1c0b:b0:6f5:64f4:91df with SMTP id
 nc11-20020a1709071c0b00b006f564f491dfmr4958800ejc.750.1652458031461; 
 Fri, 13 May 2022 09:07:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a170906550200b006f3ef214e72sm872500ejp.216.2022.05.13.09.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 09:07:11 -0700 (PDT)
Message-ID: <a8b3d981-dbd2-5ae9-6601-c661d3899451@redhat.com>
Date: Fri, 13 May 2022 18:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <0248b5df-dbc6-48bf-b5c8-e5c73decc1c1@redhat.com>
 <CAFn=p-ZHW31EnhgUt5uBcnnAEZ0XNZEgxq=pyPHnDShqcGGGCQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-ZHW31EnhgUt5uBcnnAEZ0XNZEgxq=pyPHnDShqcGGGCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/13/22 17:39, John Snow wrote:
> On Fri, May 13, 2022, 6:21 AM Paolo Bonzini <pbonzini@redhat.com 
> <mailto:pbonzini@redhat.com>> wrote:
> 
>     On 5/13/22 02:06, John Snow wrote:
>      > The only downside I am really frowning at is that I will have to
>      > replicate some "update the venv if it's outdated" logic that is
>     usually
>      > handled by the Make system in the venv bootstrapper. Still, I
>     think it's
>      > probably the only way to hit all of the requirements here without
>     trying
>      > to concoct a fairly complex Makefile.
>      >
>      > any thoughts? If not, I'll just move on to trying to hack up that
>      > version next instead.
> 
>     I would not even bother with keeping the venv up to date.  Just
>     initialize
> 
> I'm worried about this idea being very inconvenient for iterative 
> development of the python code.

Wouldn't "-e" mostly avoid the inconvenience?

> I'm not sure this makes sense. python/qemu will continue to exist 
> in-tree and will only ever be "internal" in that sense. It won't be 
> something you can wholesale install from pip.
>
> i.e. I plan to continue to break off pieces and upstream them, but I 
> intend to leave several modules as internal only.

Oh, that's what I was missing.  I thought long term all of it would come 
from pip.  But anyway...

> So I'm not sure "internal" vs "pip" makes sense config-wise, it's 
> intended to be a mixture of both, really.

... then neither "system" nor "pip" would not cover the parts of 
"python-qemu" that are always internal, i.e. currently only 
"python-qemu-qmp".  And after

  $python -m venv venv/

you would have

  $python -m pip install -e python/

(That's probably a better way to invoke a pip that's related to $python, 
at least until the venv exists).

By the way, where would you put the python-qemu-qmp submodule?

> But, I suppose this is how you'd like to address different venv setup 
> behaviors to accommodate spec builds vs dev builds - with a configure 
> flag of some kind.

Yes.

> (I suppose you'd then like to see configure error out if it doesn't have 
> the necessary requisites given the venv-style chosen?)
> 
>     - use CONFIG_PYTHON_QEMU to enable/disable iotests in
>     tests/qemu-iotests/meson.build
> 
> So it's just skipped if you don't have the reqs to make the venv? (Not 
> an error?)

That's usually what we do with missing bits yes; you can use 
--enable-python-qemu to force an error in that case.

>     - add a configure option --enable-avocado=
>     {system,pip,auto,enabled}/--disable-avocado and matching
>     CONFIG_AVOCADO=y to config-host.mak
> 
>     - use it to enable/disable acceptance tests in tests/Makefile.include
> 
> And this is how you propose eliminating the need for an always-present 
> avocado builddep.

Yep.

>     rm -rf venv/
>     $python -m venv venv/
>     do_pip venv/ enable_python_qemu qemu.qmp python/qemu -- qemu.qmp
>     do_pip venv/ enable_avocado avocado -- -r tests/requirements.txt
> 
> Won't this rebuild the venv like *all of the time*, basically whenever 
> you see the "configuration is stale" message?

Yes, it would.  I think that's going to happen less and less since 
configure is on a serious diet; but it might still be annoying.  OTOH 
installing system packages (or also "pip install --user") will speed up 
creating the virtual env, because then pip will not be run in the venv.

> That both seems like way too often, *and* it wouldn't cover cases when 
> it really ought to be refreshed.

Which cases are those?

Paolo

