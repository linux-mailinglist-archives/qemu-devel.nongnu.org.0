Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2731F9B3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:15:36 +0100 (CET)
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5d9-00041Y-GK
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD5Y6-0001PF-Lx
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:10:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD5Y2-0004pk-9T
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:10:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613740216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jGcGI7NMghM+yk1S+/9TaFdhXOwNXb9bOpWsAjCScw=;
 b=esAIITrpLepRmaS4YNlNa9QF/XUJMgSZ1FWy0gPTZbMmgzkp9B06ELtPHgCdu0U/VcUbW1
 w3kFC9hGMCGp5Gn/bEuqN5E5bSah8AmsPTQKQPQJ3GrRTtf2muLRet82CR2eWuaA9iCk5R
 ByxkrgYC/BI6RWsPHLJ8mTBBYCCG7wA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-balaBDGUM66bsbFwXdkRCg-1; Fri, 19 Feb 2021 08:10:12 -0500
X-MC-Unique: balaBDGUM66bsbFwXdkRCg-1
Received: by mail-wm1-f69.google.com with SMTP id f123so698019wma.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 05:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6jGcGI7NMghM+yk1S+/9TaFdhXOwNXb9bOpWsAjCScw=;
 b=VQOc5FAMX2KrR2P+gm0dg6ToFZFRMqRJOy8tI2myWqen88FuZvWVkG/WAHBwpCGS26
 sTwRxpkhIJNL5P9rzpE5GQ01oyvNeN4ClwLdADeJOkz1iJEFT4tWh/yuFEc9CwB9uEAd
 e9sywCxNkLp2MkOQNor9BB+3xvHMyEFbS8yRA1honKRZD1Z/FihQCTJMgYxEO/T1TDWz
 Re/46+tm4sTSDs79EPn9AmWphmmqebAKkQdF1r/k8ZDPl6cpgeiwc14uDQxDq2w8MSO7
 7/mqHLC+0TTi3j6cF8IbFrQ1Lk4j0yY8ZGxdbW2HUwN1Ymcdrpj+qXxQCu4ZzfNDTifM
 OdhQ==
X-Gm-Message-State: AOAM530hVJdeXEEwr/tZJeYpYvgz409fVc+jkXjR1+IDaQ1WNJPBGo+z
 pzwYxCQfze/WI1A/UCnCqbcX/aQ/SyPvC/q64LNumJxp0Fzx8zrgb41a4er04gP8q++0/x6PWHt
 9u3WWHZ8w/CQaSNE=
X-Received: by 2002:a1c:6285:: with SMTP id w127mr8350362wmb.73.1613740211399; 
 Fri, 19 Feb 2021 05:10:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4PULfk9OFDjBUSPC4GzRniF6nKl/EuIq4jXzq+iccnrD0VYLy4CJeVgC3SwgGnwklt1SYQg==
X-Received: by 2002:a1c:6285:: with SMTP id w127mr8350322wmb.73.1613740211223; 
 Fri, 19 Feb 2021 05:10:11 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c6sm12723259wrt.26.2021.02.19.05.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 05:10:10 -0800 (PST)
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
 <YC+oZWDs3PnWHPQo@redhat.com>
 <9540912b-1a81-1fd2-4710-2b81d5e69c5f@redhat.com>
 <YC+sgaN1EyKeyyOQ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a1bc4d09-804d-66a5-a3ef-6feea8606d2c@redhat.com>
Date: Fri, 19 Feb 2021 14:10:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YC+sgaN1EyKeyyOQ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 1:18 PM, Daniel P. Berrangé wrote:
> On Fri, Feb 19, 2021 at 01:15:25PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/19/21 1:00 PM, Daniel P. Berrangé wrote:
>>> On Fri, Feb 19, 2021 at 12:44:21PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> This series aims to improve user experience by providing
>>>> a better error message when the user tries to enable KVM
>>>> on machines not supporting it.
>>>
>>> Improved error message is good, but it is better if the mgmt apps knows
>>> not to try this in the first place.
>>
>> I am not sure this is the same problem. This series addresses
>> users from the command line (without mgmt app).
> 
> Users of mgmt apps can launch the same problematic raspbi + KVM config
> as people who  don't use a mgmt app.
> 
>>> IOW, I think we want "query-machines" to filter out machines
>>> which are not available with the currently configured accelerator.
>>>
>>> libvirt will probe separately with both TCG and KVM enabled, so if
>>> query-machines can give the right answer in these cases, libvirt
>>> will probably "just work" and not offer to even start such a VM.
>>
>> Yes, agreed. There are other discussions about 'query-machines'
>> and an eventual 'query-accels'. This series doesn't aim to fix
>> the mgmt app problems.
> 
> I think this should be fixing query-machines right now. It shouldn't
> be much harder than a single if (...) test in the code.

OK I misunderstood you at first, now I got it. Will include that in v2.


