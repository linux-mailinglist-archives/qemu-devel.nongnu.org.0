Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE5434047A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:22:19 +0100 (CET)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqjK-0005Ky-BU
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMqhh-0004mo-3c
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMqhY-0004va-MU
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616066427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWtkvykRAY/78KnpoF81DazzETT2/cX/5ttcrbhOAaU=;
 b=cW1XGXnln71Vrqb0+QAlqN4mvX7T/H59+0w5bc4QVtR8fajOVOrd1Bv/DhUNcontUG+G4n
 juINaEFcgmArz9odwbyyGUWuoxkNoIye1qbM0viWpoHiiyXUp/NL6sLn03OE7MGKqiJQwD
 01rML1urjtxcMcGkgmTktk3vVIAJB5E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-FfNEP4fsMhiG4Gk8wrVOvQ-1; Thu, 18 Mar 2021 07:20:23 -0400
X-MC-Unique: FfNEP4fsMhiG4Gk8wrVOvQ-1
Received: by mail-wr1-f69.google.com with SMTP id 9so4375802wrb.16
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cWtkvykRAY/78KnpoF81DazzETT2/cX/5ttcrbhOAaU=;
 b=BS6kbq6y0P3zV/z46oiYD12ruay4xC6sZ2Q8YxYNADiF5sl+rrDP4YcMhLCGT6Ou4Z
 SigaM/kuSZEKLqT2k+f9fySqIIhqnzBMzX8+eQLSEUr1jym5q87joQdiOVLN8Rrfs0W+
 DVk6JLwxVUAdRjd9y0+vjTtAP/2jw/L7Gnj0xUdjNx2IeiJSpkKCH2D00fsm1I0OM37E
 9cqiEYhkPfk1sPgmQCKnSYAGOYaQcb0rq8IcKsAVZ6AyN/EQ42e/JDzfnVtWWhy0vk12
 Wj0KOW0uYOBNKSz9D4KnUF6AYpsnSbr3NHGwo07evz+vJU6tXOXHWTZj9vK/Ef+Q6L2y
 qFrA==
X-Gm-Message-State: AOAM531f7KbiNrrBx56wc7leMPrzgmV2JYaGQPYk2Ac+w2pz/G4Yq6P7
 l5lYIZakixUjujabyV8X60dlb9taoNAZWCqEYOemqXvphqLWFIkRYaYC4AtOcQoMrN0Ub2Nt9a2
 8Q1IpQDrdeEjxzLY=
X-Received: by 2002:adf:ea47:: with SMTP id j7mr8875976wrn.377.1616066422480; 
 Thu, 18 Mar 2021 04:20:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWPbpjtZ2nx4rMBS2aL1O0Wir82V55QsQkPFBofV5yGziljkm7D3A4Pw74mJtc1bAQPCeBaA==
X-Received: by 2002:adf:ea47:: with SMTP id j7mr8875957wrn.377.1616066422263; 
 Thu, 18 Mar 2021 04:20:22 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 21sm2064652wme.6.2021.03.18.04.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 04:20:21 -0700 (PDT)
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <a90be442-97c9-cefc-df6f-655a6387d54d@redhat.com>
 <CAFEAcA_BcRkJHjoRaxQs2ZO=JJqPpvGhHkG2bNJOqh_-EHr_xg@mail.gmail.com>
 <0644d4cb-cfc6-83f0-5887-2bff29cb58c4@redhat.com>
 <CAFEAcA-6xAHOBC5e2uEh1EkXmWK+k9d5By9aXugA7hbxC8fZiQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3be69144-bb34-af3d-20fa-64c5cc56c520@redhat.com>
Date: Thu, 18 Mar 2021 12:20:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-6xAHOBC5e2uEh1EkXmWK+k9d5By9aXugA7hbxC8fZiQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 12:10 PM, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 10:45, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 18/03/21 11:40, Peter Maydell wrote:
>>> On Thu, 18 Mar 2021 at 10:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>
>>>> On 18/03/21 11:06, Laurent Vivier wrote:
>>>>> This also removes the virtio-devices test, I think we should keep the
>>>>> files, but in the files to disable the PCI part when it is not
>>>>> available.
>>>>
>>>> I think we should just shuffle the targets in the gitlab YAML to bypass
>>>> the issue.
>>>
>>> Then we'll hit it again later. I'm pretty sure this isn't the
>>> first time we've run into "some test makes dubious assumptions"...
>>
>> We can both fix qemu-iotests and CI configuration, but m68k is certainly
>> not the culprit here.  And we are going to make more assumptions over
>> time, not fewer, in order to keep the CI time at bay.
> 
> I don't see why CI time is relevant to whether the test says
> "I require X,Y,Z, so don't run me on configs without those"
> or whether it just randomly assumes X,Y,Z are always present
> or that if it says "I require W" than W must imply X,Y,Z...

Recently we changed a bit our view and are trying to have smarter
tests. In particular building target/device agnostic tests, and
have the test queries the QEMU binary what features/devices are
available before running. This will take some time before we get
there, unlikely for the 6.0 release. For short term, Paolo's
"shuffle gitlab YAML" suggestion is simpler.


