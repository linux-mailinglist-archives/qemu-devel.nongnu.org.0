Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E918047585E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:05:45 +0100 (CET)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxT2W-0007Wz-V3
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:05:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSx5-0004PD-C1
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSx1-0007GJ-Su
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639569603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kDV+/shjunLtnlYvkaDBcqXgZfCA1rvDEjoM/Uw2iY=;
 b=ditpF4Y+mCh/jMgNQCBV5CxLFGeNcgYMGY7JwT+wai50gkgemmiyxo7rzlQS4ua8sPRSqd
 PAFIS9A77aykyCYQCGVwTn20aAJRLdZXij2nAic1ogy/n4ro1gLHGBgFpVii0QiQBLZQzQ
 NmYF7tHBeXGr9MOWtL4cinelG8wDExM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-qS9HLTs-MJK5eaHJkCDZWw-1; Wed, 15 Dec 2021 07:00:01 -0500
X-MC-Unique: qS9HLTs-MJK5eaHJkCDZWw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso5832536wrj.12
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 04:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3kDV+/shjunLtnlYvkaDBcqXgZfCA1rvDEjoM/Uw2iY=;
 b=6f2wK0FDMmb7sv1prcBnipHQb1McRmVP3oiEKkVBkiwLE3jGU5pAJ7u/IjssR73+F1
 ZvZPXIH2yvbf2JOIum44Qrq3x2li0jRQfzFG+yw1Bt5UYiT46WCMwsX9Xcj3Wsv1ziuI
 kcFdI8hlA2Mu8W/w6Kpx9hlcvtAU2oML+fKES1EbklLIJF9/mERoxYeOGP1DsGT58Rze
 kS+Pf3s9nABe5zX7zcikrWhyADdthGplygOk4j6/ExQQ6LZE67rhJcSAe/r2hHEAo1eH
 5iLOUleYTL6/8bSQ2PwzlE/p1wZzNBnDfA+xhThk1hd1qxnhIQnIwWypUfWJs3uD2CFM
 Pvfw==
X-Gm-Message-State: AOAM531nyMDQHPlxDAHEOjr0xkvU4bwvlulY0CxsRz3kE/JHjqGlu7Dm
 5Ezo/ZqXLm+GeP+SuM8tRIbjhNTqd5zSxWTTHJ4VYDi50VEHowRyMVhIEwhBSVMDZ3g4Bdw5S2Y
 uAY3yB7cvb4eO0W0=
X-Received: by 2002:a5d:6101:: with SMTP id v1mr4067207wrt.598.1639569600615; 
 Wed, 15 Dec 2021 04:00:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtjxyFKeDNBGljscai2F+RSmwZ80GinPJw3Lscz4cP8CnaFp7w0AySeIv6ERSdWThYbVoAQw==
X-Received: by 2002:a5d:6101:: with SMTP id v1mr4067193wrt.598.1639569600399; 
 Wed, 15 Dec 2021 04:00:00 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g5sm2631685wri.45.2021.12.15.03.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:59:59 -0800 (PST)
Message-ID: <b25b2c55-c12c-f9f7-4773-baba838bc68b@redhat.com>
Date: Wed, 15 Dec 2021 12:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 04/18] ui: avoid warnings about directdb on Alpine /
 musl libc
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-5-berrange@redhat.com>
 <b1babd61-02f9-8083-cda0-99d69839b10e@redhat.com>
 <YZ5BLGegxcbFmEpo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YZ5BLGegxcbFmEpo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:42, Daniel P. Berrangé wrote:
> On Wed, Nov 24, 2021 at 02:32:56PM +0100, Thomas Huth wrote:
>> On 24/11/2021 14.01, Daniel P. Berrangé wrote:
>>> On Alpine, SDL is built with directfb support and this triggers warnings
>>> during QEMU build
>>>
>>> In file included from /usr/include/directfb/direct/thread.h:38,
>>>                   from /usr/include/directfb/direct/debug.h:43,
>>>                   from /usr/include/directfb/direct/interface.h:36,
>>>                   from /usr/include/directfb/directfb.h:49,
>>>                   from /usr/include/SDL2/SDL_syswm.h:80,
>>>                   from /builds/berrange/qemu/include/ui/sdl2.h:8,
>>>                   from ../ui/sdl2-gl.c:31:
>>> /usr/include/directfb/direct/os/waitqueue.h:41:25: error: redundant redeclaration of 'direct_waitqueue_init' [-Werror=redundant-decls]
>>>     41 | DirectResult DIRECT_API direct_waitqueue_init        ( DirectWaitQueue *queue );
>>>        |                         ^~~~~~~~~~~~~~~~~~~~~
>>
>> I think that's a bug in the SDL2 package of Alpine. I've had trouble with
>> that one in the past already ... so not sure whether it's our job now to
>> work around bugs in that crappy Alpine package... I'd prefer if we simply do
>> not compile-test SDL on Alpine instead.
> 
> It is a harmless bug in directfb headers, which has no ill
> effects other than producing a warning when some app uses
> -Wredundant-decls.  Of course Alpine would ideally get this
> patched, but at the same time it is reasonable for Alpine
> users to want SDL and if someone has this package installed
> already we don't want QEMU build to break due to -Werror.

We should avoid adding #pragma directives in generic header,
but I agree -Wredundant-decls is harmless here, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Case in point, as we auto-generate dockerfiles to ensure
> all pre-requisites are installed in all dockerfiles,  the
> Alpine dockerfile gains SDL and exposes this bug. We could
> turn off -Werror but that's a overly big hammer compared
> to this targetted fix.
> 
> Regards,
> Daniel
> 


