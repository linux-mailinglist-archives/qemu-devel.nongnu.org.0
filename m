Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850040555A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:33:23 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOKB8-0007P3-4B
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOKAA-0006jD-D9
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOKA7-0000MJ-7c
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631194337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGF0j2qV7x34ZhnmkTvCCXUxky0G7slwj+huJ7vOVRY=;
 b=BZz5CLJUgtaoRefKGQ6/bYWn4eKx5UdY5W6IZ2+N5MI2aaMd9GZ8ztDkB1S1imxGmpt9oB
 EbzfhRSK9DDsIhW1p7Hv9h3gYSKRAdXxQW88ThkBKDhXRKeRNRYa2tsQ92DhOD6wHyYdYr
 oXfZoL2fR3gZg9MjV4qzfgUXtHcNKf4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-cG59tBPQNeGFqBxJ7SAztA-1; Thu, 09 Sep 2021 09:32:16 -0400
X-MC-Unique: cG59tBPQNeGFqBxJ7SAztA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so776627wma.4
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 06:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PGF0j2qV7x34ZhnmkTvCCXUxky0G7slwj+huJ7vOVRY=;
 b=0O2OOPEnizLlhLChgPAzFVC18H1VSxByb6F/StCSioo4FzFuxiWFJ4q2XgIkfCV6Ld
 ttWMbUH+Ig8alM1m2rNRMb+QIax/TLBjhXOiCBBUX2uZHSP3dZH4JeOFW9ZzxoVmE6Uk
 b53mFPywZeLllJZOqoxlHWXTRU9V1ZR9N4GEzB4l5K6bNGZjLQWlphZz63i1GtV+qiQI
 E5AMbMi1y1Uuq54pUKRzEWwTwhmxIZZpCiteLpRQeZNv93jBcIj2mNN7EYSngv9aaxRh
 IkgTYgNxSkWYZ1eFb3psfUs7y0hSAqGEl+TDkxW/7943xxv8JRudn+mvTILiUIwpWSw3
 PzIA==
X-Gm-Message-State: AOAM532o9ZyGnYf1g0zuOLRG3zPm07Mc1GogXY1zuL68Spot04QUrDjJ
 MiiJldVxEy8v72ISAUjIDHlivOmGWvlVar27ZIsk7V9R33Cs+vE4ANZGc9WJ18wSeCD0pNV4m0i
 UWyZIuBqYtPm5QC0=
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr2990796wmd.33.1631194335345; 
 Thu, 09 Sep 2021 06:32:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyqjT3pCUxGswCz8WI5iROBNWx5vzPxN04ToPV6iyMnd1icroxClx7FE+0KP7V5fTbgbNmew==
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr2990764wmd.33.1631194335046; 
 Thu, 09 Sep 2021 06:32:15 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id e2sm1864329wra.40.2021.09.09.06.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 06:32:14 -0700 (PDT)
Subject: Re: [PULL v4 00/43] (Mostly) x86 changes for 2021-09-06
To: Peter Maydell <peter.maydell@linaro.org>, Yang Zhong <yang.zhong@intel.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
 <CAFEAcA-3GX07Ub9cEOFyC36Yj9N+G2Awq2pKg-wVJvv1Oif8Jg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <57c6f722-be74-a12c-d20b-70e2bf228409@redhat.com>
Date: Thu, 9 Sep 2021 15:32:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3GX07Ub9cEOFyC36Yj9N+G2Awq2pKg-wVJvv1Oif8Jg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 3:25 PM, Peter Maydell wrote:
> On Wed, 8 Sept 2021 at 11:07, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit f9128631fbeb40a55f7bc145397981c963d40909:
>>
>>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-09-07 13:24:43 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 3b942628231462c56c883a6273cf137d2a382f8f:
>>
>>   ebpf: only include in system emulators (2021-09-08 08:07:04 +0200)
>>
>> ----------------------------------------------------------------
>> * SGX support (Sean, Yang)
>> * vGIF and vVMLOAD/VMSAVE support (Lara)
>> * Fix LA57 support in TCG (Daniel)
>> * Avoid pointless warnings for static user-only compilation (Thomas)
>> * Fix --disable-system compilation if libbpf is found
>> * target-i386.rst restructuring
>>
> 
> Philippe seems to have some review remarks on the SGX patches,

I wanted to comment on the latest "Kconfig: Add CONFIG_SGX support"
patch and didn't really realize the latest was the pull request.
I meant to NAck the patch, but since it is pulled, the issue I reported
can be fixed on top (we are not close to releasing), I don't want to
give Paolo more work... Sorry for the noise.

> and also I found that on my local machine this was pretty
> consistently hanging in the migration test. David G says there's
> a maybe fix for that in another pullreq, so I'll see if that helps...
> 
> -- PMM
> 


