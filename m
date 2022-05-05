Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AF51C452
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:56:39 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdqI-0004d5-5f
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmdjz-0000Na-GB; Thu, 05 May 2022 11:50:09 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmdjx-0006LX-HV; Thu, 05 May 2022 11:50:07 -0400
Received: by mail-ej1-x633.google.com with SMTP id gh6so9589498ejb.0;
 Thu, 05 May 2022 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g05cc1a4gdayGzLVXAcYQmlWghTZVxQCxakW1++iUQ0=;
 b=NVUJU/rEshQ/H7YnPVtWBq2901NG4K4KLaX1JVuTs3X/mDcPHQH27vJfyd5pqPetRR
 sWpcjvu9t4+q66fD7xeNbRRHi+W/us179gCRzpQ4LfplUUOojv1MaIY0nyF7mHCW/3Dh
 d0VbeIz7hFYybVD2Nqxmz4tvVePDirLDuGToGQLxDrzbwMP5IcycN9XnTulG+voEkRKW
 CvIQWW7sM1Re5vtTSGs23IKnWm7UGdmz3aua27CNhmL3Gwv0DaQFgyWTV1aUZrtXQ/Tg
 fuZVPI2C8tVqGKqWlqvy/C3/WsmmUrFyrJmiG9X21pOCDJ9DdOMzLPWHgJ1jCYeBKNj+
 NYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g05cc1a4gdayGzLVXAcYQmlWghTZVxQCxakW1++iUQ0=;
 b=0Ygvmo77CHKzfr2SJohj/FIhX7m9XaYbs8+H6/NMbfc1GOQ5dAR7bMNSuZ2LL4RrZi
 IVqTGtZBon2htejvgj1fx4eYC+mS7Qv0zeaDYiilrCzPP688nOrnkXld1krRiXbsKqeL
 DyTPHNjZABoNHccEMA7M0vSdyFmqukrlsV7ftHLAQnlh+N18RgjkmZRXQLLOk56CiYCs
 2VSBQTkw+DFuG26nEhJrVqcVu6bSHbRwREnLiNJTVEGteE1DmlcKXu3BLmH4W+5e61pT
 53VoxL6Rc4Rj5wFUg3+qSRGXrg0AGg+7YLK7habQMDLZN1DXScewWbOegC0nP7+pPi10
 78Pw==
X-Gm-Message-State: AOAM530Xt8xN2JAAKNwmF9yOgLmxGM64LEm+uN/e8NuQ1//hJ8D/NvOj
 cMNsb7GiO2kbAxQErM34wV0=
X-Google-Smtp-Source: ABdhPJx+mbfT7RcFJQEaNhsf8cQx7TeIhBMlkpVqvU5gy9SDqEVqtUd8F3BcIXJD6oqb213+zGl/kA==
X-Received: by 2002:a17:907:3f8b:b0:6e8:318d:1def with SMTP id
 hr11-20020a1709073f8b00b006e8318d1defmr27775287ejc.153.1651765802799; 
 Thu, 05 May 2022 08:50:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020aa7c04e000000b0042617ba639asm999085edo.36.2022.05.05.08.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 08:50:01 -0700 (PDT)
Message-ID: <ca23e571-354e-1251-412d-5cae1741aa61@redhat.com>
Date: Thu, 5 May 2022 17:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: iotests and python dependencies
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOGJ+rUIn2S8ZOD@redhat.com>
 <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
 <YnPEGrwa9KVyup6T@redhat.com>
 <CAFn=p-ZpoJvoZSnk9gN+uiaas=h-tvZqBCZw2kJf88=rq_5LYQ@mail.gmail.com>
 <07a829c2-4eb8-01e3-0c8c-691c1420f51a@redhat.com>
 <CAFn=p-Zfonw462fKT=TBKCRLbZ2xPUwsK-SeRJhgfxYwNRJEsg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-Zfonw462fKT=TBKCRLbZ2xPUwsK-SeRJhgfxYwNRJEsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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

On 5/5/22 16:13, John Snow wrote:
> 
>     I would rather keep python/qemu/qmp as a submodule for a longer time,
>     and still go through a virtual environment that installs it together
>     with its pip dependencies.
> 
> 
> A small headache relating fixes to both locations, but if you'd like to 
> see it to prove that the installation mechanism works in general, then 
> OK. I'm willing to deal with the pain until the next release to let us 
> go through a testing cycle. Reluctantly. Maybe.
> 
> I'm assuming you mean as a subpackage and not a [git] submodule. If you 
> do mean git, then ... uh. That might be messy.

Yeah, I meant a git submodule in qemu.git...  It would also be the 
easiest way to build a subpackage in Fedora, since it would be part of 
the QEMU tarballs.

Paolo

