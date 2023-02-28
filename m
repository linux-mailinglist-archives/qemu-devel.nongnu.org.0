Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9D6A5555
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:15:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWw4l-0000uT-TN; Tue, 28 Feb 2023 04:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWw4j-0000u1-V2
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWw4g-0007HT-AT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677575704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtPWLZOeXu1C5NyaeaHanhZFNS29T87n43afAPxa5So=;
 b=BrHSUENeYDKHCIe+uO+oyRbOpZ3dzS/efNIf4qaZsmbmo/5FEhMHxQ76HdnuZGmYsSa2lX
 FSkIAy22LtjMnO8Fhu7KtvU0+RhfAdGqfmoq3gVpB2jt+hCH0a3Hzf19K/QmkZFVXJglof
 DHlz79X8d88tEoRGkhuyuJR73mKSY/0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-w6qei9G_Nzmn1_v22IdCRA-1; Tue, 28 Feb 2023 04:15:02 -0500
X-MC-Unique: w6qei9G_Nzmn1_v22IdCRA-1
Received: by mail-qv1-f70.google.com with SMTP id
 l13-20020ad44d0d000000b004c74bbb0affso4806955qvl.21
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 01:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NtPWLZOeXu1C5NyaeaHanhZFNS29T87n43afAPxa5So=;
 b=ED2bdmpvAXdItdxoo8s+huihm+7Ssr5nRxIKvIMtowK0A8mWDK2QBfbXCAfbmAdlIX
 XrIcY34R46xx4aqsQUP9kLT69SooOLfZeUnWhZrQRX/jZhRXZpUL6kHSHbgj9r34FNlt
 qJ2i3V4l7jBiOElUKXk23gJAB1cDPYLIdTX7m4gpT2gmzTUKM/xqzcREGVpxI5Ie3bbV
 00a6WK84AXs+BxIEZL0NaWM508psLRi8R2gLyyhhz6TZt5KMxa6pV8XhtlRoP6DHnRXm
 y15S6KeV1OkUi0X3dSuOG9M4irdnWHM9z5Jsc6g5lByN5uBHpZCkgLBRZAa3KJaBuUIL
 THHw==
X-Gm-Message-State: AO0yUKVJhUtcwI0P7k6ewHqIcmh5WxxXWJcZcRS62SgyrMwG8oFk6zUO
 5Ymd2ElXJXBVAVRP1ZrS3kQPW3P2o0wmBd5y2ib4QDKsO25k1I0xX+GM9aAZVdUYKIWA42e+CmH
 TQZQk8fJclIFgzyQ=
X-Received: by 2002:a05:622a:1aa0:b0:3bf:e4da:2367 with SMTP id
 s32-20020a05622a1aa000b003bfe4da2367mr4024651qtc.3.1677575701966; 
 Tue, 28 Feb 2023 01:15:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+tlULtl5hsjg8wm7tkSWgo9aPXWHB0qpTqsH249PIqNMrW49odQ2jTi+8oJFuSxDyLBqorgg==
X-Received: by 2002:a05:622a:1aa0:b0:3bf:e4da:2367 with SMTP id
 s32-20020a05622a1aa000b003bfe4da2367mr4024622qtc.3.1677575701703; 
 Tue, 28 Feb 2023 01:15:01 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 y24-20020ac87058000000b003b0766cd169sm6367904qtm.2.2023.02.28.01.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 01:15:01 -0800 (PST)
Message-ID: <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
Date: Tue, 28 Feb 2023 10:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org> <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228040115-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/02/2023 10.03, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
>> On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
>>> On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
>>>> On 27/02/2023 21.12, Michael S. Tsirkin wrote:
>>>>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>>>>> I feel like we should have separate deprecation entries for the
>>>>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>>>>> although they're related they are independant features with
>>>>>> differing impact. eg removing qemu-system-i386 affects all
>>>>>> host architectures, not merely 32-bit x86 host, so I think we
>>>>>> can explain the impact more clearly if we separate them.
>>>>>
>>>>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>>>>> a superset.
>>>>>
>>>>> Removing support for building on 32 bit systems seems like a pity - it's
>>>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>>>> and the maintainance overhead is quite small.
>>>>
>>>> Note: We're talking about 32-bit *x86* hosts here. Do you really think that
>>>> someone is still using QEMU usermode emulation
>>>> to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
>>>
>>> I don't know - why x86 specifically? One can build a 32 bit binary on any host.
>>> I think 32 bit x86 environments are just more common in the cloud.
>>
>> Can you point to anything that backs up that assertion. Clouds I've
>> seen always give you a 64-bit environment, and many OS no longer
>> even ship 32-bit installable media.
> 
> Sorry about being unclear. I meant that it seems easier to run CI in the
> cloud in a 32 bit x64 environment than get a 32 bit ARM environment.

It's still doable ... but for how much longer? We're currently depending on 
Fedora, but they also slowly drop more and more support for this 
environment, see e.g.:

  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_dropping/

  Thomas


