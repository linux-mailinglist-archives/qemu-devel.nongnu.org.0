Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677906AFA51
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZghx-00017w-21; Tue, 07 Mar 2023 18:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZghu-00017Y-SG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:26:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZghr-0007dk-U5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:26:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so143013wmb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678231614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tuqFRgIuZ4P97LUA0hRJCkk0C0eemYPFkyeXQF2boOM=;
 b=a7jjDE5/nroPUvZUdQGYuZH+NSoL9h33sE5iCq0oYHg4Hbj8944n5rk4m88leuqL1B
 bjL7HRkZlMtD+WYGYKvyey1rdRkgyu348vuMXqaYEoVvMQXAkOxoe9NfijoBTyPM5C0a
 PpWWQamVA+Gw+EdBrUacjS6NW6vO7pJJc/+iPsKdCWGrcou/bP8QGmcGgpAzWVOSlmJH
 OLQjufO9XBgbgrB8FfDBGTkDADWsvuRTLThVh7STn+Wo3yzpsmLjsan5KnbD186ObNFl
 qEj4NZ2YfT7tf4GHJc8JZtP+iZ47OpmEr8ZnEKUOdZRh1ZOP8ZlWCHXmqP6HIH7Pvekh
 38JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678231614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tuqFRgIuZ4P97LUA0hRJCkk0C0eemYPFkyeXQF2boOM=;
 b=eL2hwCiEwMmuTvfJntHI54wxt792fMdFqivssx+8xLVxiVGHdWiEpcHA7+zM+w/ITq
 EqyM1gba7iQAwtH7byu4M7xxDtsglDF+AK+CZ2gMmPhBEbGZ+8IJUkyjvsR5Z4obMiTF
 kXZGQ+fo9nA5YES6HbI/yMLRZQ5boigOYVIYm7yTYVR8mLto7wPBOc8LWMkJ8PsmLN4Y
 ESL8Gxrh93ZND8vkLc17S25LBZptQPc/3dsMRv3iVZP4FrQjqB2AwT57Z6mu1Ahqdq8j
 9t5r+rHSg4VM0+cNkiFMr6oQWlIPlfZ0YZk+ZSMjSAyYGziuWt7XUCypY+d5YtasEdqS
 nOkg==
X-Gm-Message-State: AO0yUKVlJmdjyfewWRbMrzb2QLT2OKKAx8hkeIRtYL13r3xSSQOCn0tj
 zG7oQt07Nsg3AoaGdsGYlNFu5g==
X-Google-Smtp-Source: AK7set8ug5hknOh4vkpJs2RhDAU7Vjyrmms2iGRmH9fXFjP0uGJsjSrbu9zfoiZnz7US8ToinF7N6Q==
X-Received: by 2002:a05:600c:35d2:b0:3ea:f6c4:5f2a with SMTP id
 r18-20020a05600c35d200b003eaf6c45f2amr13331768wmq.17.1678231614174; 
 Tue, 07 Mar 2023 15:26:54 -0800 (PST)
Received: from [192.168.10.175] (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c43d200b003dec22de1b1sm13821337wmn.10.2023.03.07.15.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 15:26:53 -0800 (PST)
Message-ID: <17f90f14-dfc2-cb8b-d408-cfe403deae5f@linaro.org>
Date: Wed, 8 Mar 2023 00:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/27] Enable PV backends with Xen/KVM emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <c53bca89-53d3-11ca-a768-dc7e9143e7b1@linaro.org>
 <16e41045564e3dfc988a636081022321b3dbcfe8.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <16e41045564e3dfc988a636081022321b3dbcfe8.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 23:34, David Woodhouse wrote:
> On Tue, 2023-03-07 at 21:20 +0100, Philippe Mathieu-Daudé wrote:
>>
>> This tag only appears in the cover letter, and is missing in each patch.
>> It would have been acceptable if it were in the PR tag, but
>> the tag (which for some reason isn't displayed in your cover letter)
>> is simply "PV back end support for emulated Xen".
>>
>> You can fetch a series with tag applied with b4:
>> https://github.com/mricon/b4
>>
>> You can post signed PR with easily with git-publish:
>> https://github.com/stefanha/git-publish
> 
> Indeed, while I knew that the testing had been done, I didn't actually
> have that Tested-by: tag to cut and paste until after I'd pushed the
> tree to gitlab for CI, and signed the tag.
> 
> But I realise that I can just update the tag, since it's signed and it
> was only referenced by name. And nobody but you has looked yet so
> nobody will notice... this one look better?
> 
> https://git.infradead.org/users/dwmw2/qemu.git/tag/refs/tags/xenfv-2

LGTM, thanks!

