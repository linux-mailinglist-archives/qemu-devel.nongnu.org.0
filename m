Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270B36A9643
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:29:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3b2-0006SN-Ts; Fri, 03 Mar 2023 06:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY3b0-0006SD-8r
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:29:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY3ax-00052q-H2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677842942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEoLIsWMhat7MPW4eNTb7IjlQaoySkJ6G0BjA0kPS10=;
 b=AzQdLBd9WUCfixjHMYbewUXSFCCysa7yh4JukAV+Kqvp2dbXGI39MOQ8TS3NRj35c5Dq12
 ufQq/RbyQW4hUxvAiL627jmMmOCuXTJJgFcnZpxUcshFFClJlOTnX1O2Ec+84CUAaj9UCv
 k4XA0B7LqCy925mc2Ahjd5T2g1/nTPo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-syI8Gq1oN22k2A5lZY2zAA-1; Fri, 03 Mar 2023 06:29:00 -0500
X-MC-Unique: syI8Gq1oN22k2A5lZY2zAA-1
Received: by mail-wr1-f72.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso343958wru.15
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GEoLIsWMhat7MPW4eNTb7IjlQaoySkJ6G0BjA0kPS10=;
 b=DYvZ/Gpww4hiqpKWEebjcRB4Ba2K2P5kbQtQ0Xe8KFfD9FPMrJyuajFTN0fvqfZYVH
 0jc+HOC/fganfvzBJ11vpqRYHDY0IKbiQaYLJYTFpMteXRgO7FWq3XGRHeV2CD3yBXDt
 HXHARrg0X1UUfFA+sa8XUGbdG3i+5T3UgZpmhHfILqYttV+/FKXVll9JlN7ctaT4VHaz
 5c2g5ecUowVfhuvW6Soah7UtJSYJ7gS4cosEmjYVIx3hgoebxl2cTnzgbeolblS6QJRi
 7DtJolRTyRePY4sWc9Yy+JWeT3VOAvfJjZg7rEV5bwyOJywRj8dj1XgeCM8XKR+9YvVo
 yRBg==
X-Gm-Message-State: AO0yUKUT/V76z1ve4Dx6Y60E+S7HC5GCGEEeGfXLV63jbwQCgDaAGM0D
 KafoEV4nXfqUr7JCevl8e56dqS/gmYrYI0la+qsdldO8d2j7/+4anl4l32hjaD7qd/ff0X3HIqu
 55+Rt47B4VEX6ECE=
X-Received: by 2002:adf:fe86:0:b0:2c7:a9ec:12 with SMTP id
 l6-20020adffe86000000b002c7a9ec0012mr1362693wrr.11.1677842939837; 
 Fri, 03 Mar 2023 03:28:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+1V8WUc2sZncvVCxhJrNcYHWmQZ4Khazui+N9BFXNUGnu/I5tBX9YwhLpnDg5dQnQDuTdlGg==
X-Received: by 2002:adf:fe86:0:b0:2c7:a9ec:12 with SMTP id
 l6-20020adffe86000000b002c7a9ec0012mr1362679wrr.11.1677842939528; 
 Fri, 03 Mar 2023 03:28:59 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 e18-20020adffc52000000b002ca864b807csm1968091wrs.0.2023.03.03.03.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 03:28:59 -0800 (PST)
Message-ID: <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
Date: Fri, 3 Mar 2023 12:28:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com> <87edq6i4jf.fsf@secure.mitica>
 <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 03/03/2023 12.18, Peter Maydell wrote:
> On Fri, 3 Mar 2023 at 09:10, Juan Quintela <quintela@redhat.com> wrote:
>>
>> Daniel P. Berrangé <berrange@redhat.com> wrote:
>>> On Thu, Mar 02, 2023 at 05:22:11PM +0000, Peter Maydell wrote:
>>>> migration-test has been flaky for a long time, both in CI and
>>>> otherwise:
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
>>>> (a FreeBSD job)
>>>>    32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
>>>>
>>>> on a local macos x86 box:
> 
> 
> 
>> What is really weird with this failure is that:
>> - it only happens on non-x86
> 
> No, I have seen it on x86 macos, and x86 OpenBSD
> 
>> - on code that is not arch dependent
>> - on cancel, what we really do there is close fd's for the multifd
>>    channel threads to get out of the recv, i.e. again, nothing that
>>    should be arch dependent.
> 
> I'm pretty sure that it tends to happen when the machine that's
> running the test is heavily loaded. You probably have a race condition.

I think I can second that. IIRC I've seen it a couple of times on my x86 
laptop when running "make check -j$(nproc) SPEED=slow" here.

  Thomas



