Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87E3D3D33
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:09:56 +0200 (CEST)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xkJ-0001m8-OF
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6xit-000126-7Q
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6xir-0001U6-Lu
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627056502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxZBXtPoxJqMuAtL7Eeb67g0vkgRqZ4LMu64mdFmMTA=;
 b=Kmt7Uos2Rdytf/ovidhAIiwT/M1Dt879jSkt8v1TdvVYPyCxg6gTFZqIocyyGtn2xs6JY7
 w9Jm7soBlgV20ujGmWXwf+X069zpWYUDvVEspVUWYtnvhbbrAPebOGu2kdMEt/nc0GiMoP
 bO/aQuF+5+NocUcUN9+wPjx9Guud+mU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-dmYsk6xKP2y04Ig_fJNZrQ-1; Fri, 23 Jul 2021 12:08:21 -0400
X-MC-Unique: dmYsk6xKP2y04Ig_fJNZrQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 q19-20020a1709064cd3b02904c5f93c0124so688190ejt.14
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NxZBXtPoxJqMuAtL7Eeb67g0vkgRqZ4LMu64mdFmMTA=;
 b=cwA6X/RS5qTadpdEMYCroxvadlmFHY6mTbPdHW6oZfJ7fdgsL5ijMUEDjNBxuQXJR2
 yU0jGwwZQG02a8Bgif2tK+nuxD983fnX9sNJfToYtWyBh2XG4Pdue0PUBIEDvvU+tukC
 Enb7Rg71C5kcI2p/PojBDdqisb2s3TjGQavG4pELwTmiWgKq13EmvgvNy90DomD+gN32
 E3FT2GFK0Q1DFVBvOyS1YmBvZYyKGLHPN8h6BfAfNbfduLEAdkvnta88Q5089ChhGGs8
 cyumPf+IL1XpKbYVhIY4gppCViXxqKA542ifjPIQI+kHX86a/K7pYHpdLZuf2MfxEEgf
 IZJw==
X-Gm-Message-State: AOAM531N5ujscG2YJUuXiM/zxQLskARtfv7iHbHI5rqV7A/bNSswx3BR
 R5bL1ekXgqxwPdLjqcGU9zhRMpzG4zfiD7PmFGnRagViAiEzJdhOHdxvirDYBvjAuzGXnjvKOfp
 FYGeDiKBgaoqwAm140t1qj1RZaQv27dQbj3JiT12oOBGaPmxy6e1i5eM1y3TANKps69c=
X-Received: by 2002:a17:906:260e:: with SMTP id
 h14mr672471ejc.258.1627056499958; 
 Fri, 23 Jul 2021 09:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFM3NQkzaNC9V5DYfRQCFEzD+piVEHhnFAaDPty685tiGQOGSHo0Bns455p67UmXAd6ss9JA==
X-Received: by 2002:a17:906:260e:: with SMTP id
 h14mr672447ejc.258.1627056499655; 
 Fri, 23 Jul 2021 09:08:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id i6sm12780795edt.28.2021.07.23.09.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 09:08:19 -0700 (PDT)
Subject: Re: [PULL 0/2] QAPI/QOM bugfix for QEMU 6.1
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210723100137.978910-1-pbonzini@redhat.com>
 <CAFEAcA9oS3PNysRTDcOA=Kww-_8ouJiG-5+CRqd4otiVWtrvRA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4a50addd-5534-5ec9-0626-f7d2fdc60123@redhat.com>
Date: Fri, 23 Jul 2021 18:08:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9oS3PNysRTDcOA=Kww-_8ouJiG-5+CRqd4otiVWtrvRA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/07/21 17:52, Peter Maydell wrote:
> On Fri, 23 Jul 2021 at 11:04, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit 143c2e0432859826c9e8d5b2baa307355f1a5332:
>>
>>    Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2021-07-19' into staging (2021-07-19 19:06:05 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream-qapi
>>
>> for you to fetch changes up to 2f164a6c5e4a9e24a6d33fcd680f322dcf53a44e:
>>
>>    qom: use correct field name when getting/setting alias properties (2021-07-23 11:57:15 +0200)
>>
>> ----------------------------------------------------------------
>> Fix for QOM alias properties (e.g. -M pflash0).
>>
>> ----------------------------------------------------------------
>> Paolo Bonzini (2):
>>        qapi: introduce forwarding visitor
>>        qom: use correct field name when getting/setting alias properties
> 
> Hi -- could you check whether this failed gitlab job for
> build-oss-fuzz is valid or just another flaky CI issue, please?
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1448031475
> 
> The backtrace showing the leaks seems to be in the new test case
> added in this pull, so my guess is it's real...

Yeah, I was about to ask you not to pull this.

Paolo


