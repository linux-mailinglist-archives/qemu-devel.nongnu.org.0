Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394434226B9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:34:35 +0200 (CEST)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjeR-0001Xi-Rs
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXja9-0008Fl-Qv
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXja4-0006wM-1n
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633436998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cghCI6ATKZJaIwt18rI93ccnRBtmgwD43Q4iU3tP8xg=;
 b=VSmg7oXhfxPefFkOiKyCI2enZhi2i0YcZmF7H0QA+SxpbpWfwZiZvD2k6KMZ2JtQ/mLDn4
 JsksPWrHc1dwzFeC2hiv0iasRdV9Q8KwRJRpVVHxfSohcDGT6zMsXnW4W5sPGG2/K2ZlzD
 fW0xQ1+mv2KuXLbqkAintoWdfrKsXA0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-9zt0IStcO-WOQkRCDrCc_g-1; Tue, 05 Oct 2021 08:29:57 -0400
X-MC-Unique: 9zt0IStcO-WOQkRCDrCc_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 h24-20020a7bc938000000b0030d400be5b5so6317474wml.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 05:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cghCI6ATKZJaIwt18rI93ccnRBtmgwD43Q4iU3tP8xg=;
 b=SE5dba037LYK/5j1jqYSRM6q0XJicj5ZU/hc9tkYT0fxZodCdbhKA4+VGjWTmmC7+t
 U4cBfx0FWE1LR+KtY3zzprlcI2t52QZt9LEa4PIvINEIw3kDO9f7C6cgj0qE/c/y4O7p
 bWniYHSA84vxPHM+Dr9TXjyug/Ff3tXC2n/C44Nj/9ZxsaoNlg2zLvK8aFA2MUDd2MjX
 aq5uWwVcx0FgmZmD4FHSqotxHeMeiIYshPfCSU7jFuNIfnIIS+won4gXL2mq80RKSLT0
 DAvlz/NxOFMZC5G7LE8pUYWoF+7L2dSfvjf1hkppliORGKzuTRwm3trkHkMuphQ6lL6i
 TSDw==
X-Gm-Message-State: AOAM532R6d2EcF9h0by11M+qlQspYAe4NnVmq0ZKpA883LFovHojHASx
 A5ZT/f1CebBMDFc8+LcoHly3v91ApULVidlGhWeNCW4LMQ+KY41iqvKLnVupNNx7tzuN9ba3pi7
 PMG9LPcx9OpJFOOk=
X-Received: by 2002:adf:a4ca:: with SMTP id h10mr21454437wrb.28.1633436996115; 
 Tue, 05 Oct 2021 05:29:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJbjATrFHY1NjQfFnfVeIul7TpbCk4NTdZlxTSeuTPvM1bQSOvUjq8FW8avB2Sxw5RbPtYdg==
X-Received: by 2002:adf:a4ca:: with SMTP id h10mr21454386wrb.28.1633436995753; 
 Tue, 05 Oct 2021 05:29:55 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id p6sm12996414wrj.95.2021.10.05.05.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 05:29:55 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
Date: Tue, 5 Oct 2021 14:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/2021 14.20, BALATON Zoltan wrote:
> On Tue, 5 Oct 2021, Cédric Le Goater wrote:
>> On 10/5/21 08:18, Alexey Kardashevskiy wrote:
>>> On 05/10/2021 15:44, Christophe Leroy wrote:
>>>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as 
>>>>>>>>>> far as I
>>>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>>>> also not possible
>>>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>>>
>>>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>>>
>>>>>>>> True. I did some more research, and seems like there was once
>>>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>>>> couple of years ago already:
>>>>>>>>
>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>>>
>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>>>
>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>>>
>>>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>>>> successfully using these boards for anything, so we should
>>>>>>>>> deprecate-and-delete them.
>>>>>>>>
>>>>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>>>
>>>>>>> I really would like to be able to use them to validate Linux Kernel
>>>>>>> changes, hence looking for that missing BIOS.
>>>>>>>
>>>>>>> If we remove ppc405 from QEMU, we won't be able to do any regression
>>>>>>> tests of Linux Kernel on those processors.
>>>>>>
>>>>>> If you/someone managed to compile an old version of u-boot for one of 
>>>>>> these
>>>>>> two boards, so that we would finally have something for regression 
>>>>>> testing,
>>>>>> we can of course also keep the boards in QEMU...
>>>>>
>>>>> I can see that it would be usefor for some cases, but unless someone
>>>>> volunteers to track down the necessary firmware and look after it, I
>>>>> think we do need to deprecate it - I certainly don't have the capacity
>>>>> to look into this.
>>>>>
>>>>
>>>> I will look at it, please allow me a few weeks though.
>>>
>>> Well, building it was not hard but now I'd like to know what board QEMU 
>>> actually emulates, there are way too many codenames and PVRs.
>>
>> yes. We should try to reduce the list below. Deprecating embedded machines
>> is one way.
> 
> Why should we reduce that list? It's good to have different cpu options when 
> one wants to test code for different PPC versions (maybe also in user mode) 
> or just to have a quick list of these at one place.

I think there are many CPUs in that list which cannot be used with any 
board, some of them might be also in a very incomplete state. So presenting 
such a big list to the users is confusing and might create wrong 
expectations. It would be good to remove at least the CPUs which are really 
completely useless.

  Thomas


