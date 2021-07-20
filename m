Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7963CF8C7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:26:16 +0200 (CEST)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5nt9-0006DT-4M
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5ns3-0005FB-3W
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5nrz-0008RT-W1
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626780301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIGmNb/O1ANuIWDglBDjPw549fxXaik6yyKDAD0bx+A=;
 b=LqaFRHOmMg53nCTXGohtyEajj38MbI5U1cVHvMZJGvd+ovdJXANqnVe7UJ6XxPCizYFRpU
 aegMpxKvhcBjk0yZZua2Ud/0dcXhAl/8iYIfM6mhdLoM9nPxNn0ub533ZC7NBcH2rQv7my
 3zaDJEPkb3VY4yd0m8WBCZp18NSbBR0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-npVko4BxMRiFJ1515XecWA-1; Tue, 20 Jul 2021 07:25:00 -0400
X-MC-Unique: npVko4BxMRiFJ1515XecWA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o10-20020a05600002cab02901426384855aso7679678wry.11
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIGmNb/O1ANuIWDglBDjPw549fxXaik6yyKDAD0bx+A=;
 b=HARSHVcX/6qYRg2QurP7d5K1YD4MQoB37+w4g6zJ4kCd8OZnaqFtklrlR6o+Fv9DvW
 WIF7/9NkNTrG5D2AQNfkVXxcmSYkIZ8joxM2jb52LDofiWa9w2sWOkgKPiILU1LMr/EF
 3iZgyfm/2Fjg0rZpgS8fYNdU8qjOd1k+ZcBXejGX+ftyfJEzLXXAPFhRQMsCEC61jdTg
 fUA2+jWd9fsUP2OFfAXSaL3lzn1hqm4MuVmrtaIf3xq052sYpRMQMZ+lkIgIKj+Tinnz
 inleQHDbXWQamKQdgTqdz4w2X87fo9A7pMlnym2MWHElgejL2AkGHIKP2+1fWt6eD/13
 Ki5g==
X-Gm-Message-State: AOAM531wfRufSkQjybotGhC/aQ/kcgom2m4n2XbdOPU0jl5UyHwsVM5W
 Lf64Il7qPq0mg4DDaedBXbzF3s8zfYUukbHmqv/RbimhJfOXA2YcFpIojCi406QxXZxVzGCvkxQ
 Ldfj+wzyma/8YMmw=
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr15506392wmj.154.1626780298932; 
 Tue, 20 Jul 2021 04:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUqMdH0aXAKeHJBMMPYNTIn9sfd/ZIG917Mk9297qitNMK9hZsnsxg2QU+GP1xoF5zxoC2sg==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr15506377wmj.154.1626780298747; 
 Tue, 20 Jul 2021 04:24:58 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z13sm23963201wro.79.2021.07.20.04.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:24:58 -0700 (PDT)
Subject: Re: [PATCH 0/4] Add support for Fujitsu A64FX processor
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 'Peter Maydell' <peter.maydell@linaro.org>
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA_xMdsLtsyX3aV+JKoLuNiaR3zHmv1NXwVUkWRSAbQuAA@mail.gmail.com>
 <TYCPR01MB61601256BD8311CE6D2A6767E9E29@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <324188bb-3837-318f-4542-1a1762bc6943@redhat.com>
Date: Tue, 20 Jul 2021 13:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB61601256BD8311CE6D2A6767E9E29@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ishii,

On 7/20/21 9:34 AM, ishii.shuuichir@fujitsu.com wrote:
> Hi, peter
> Thank you for your comment.
> 
>> Hi; it looks like something with your outgoing email setup still disagrees
>> with QEMU's mailing list server :-(  As far as I can tell these emails didn't
>> make it to the list, so only people on the direct-cc list will have
>> seen them :-(
> 
> As you said, it seems that I am not listed in the mail server again.
> When I contacted the server administrator before, 
> the server administrator took care of it so that my e-mail address would not be judged as spam mail, 
> but I am in the process of contacting the server administrator again.

Meanwhile you can send your series via sourcehut: https://sr.ht/

> If the mail server is able to list it correctly,
> should we resubmit the V1 patch series to list it properly?
> Or, since there are patches that have already been commented on,
> should I post them as a V2 patch series that reflects those comments?
> 
> Best regards.
> 
>> -----Original Message-----
>> From: Peter Maydell <peter.maydell@linaro.org>
>> Sent: Monday, July 19, 2021 9:49 PM
>> To: Ishii, Shuuichirou/石井 周一郎 <ishii.shuuichir@fujitsu.com>
>> Cc: Thomas Huth <thuth@redhat.com>; Laurent Vivier <lvivier@redhat.com>;
>> Paolo Bonzini <pbonzini@redhat.com>; qemu-arm <qemu-arm@nongnu.org>;
>> QEMU Developers <qemu-devel@nongnu.org>
>> Subject: Re: [PATCH 0/4] Add support for Fujitsu A64FX processor
>>
>> On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
>> <ishii.shuuichir@fujitsu.com> wrote:
>>>
>>> Hello, everyone.
>>
>> Hi; it looks like something with your outgoing email setup still disagrees
>> with QEMU's mailing list server :-(  As far as I can tell these emails didn't
>> make it to the list, so only people on the direct-cc list will have
>> seen them :-(
>>
>> thanks
>> -- PMM


