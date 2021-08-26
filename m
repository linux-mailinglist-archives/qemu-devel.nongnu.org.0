Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20B3F8333
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 09:40:07 +0200 (CEST)
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ9za-00009Z-0I
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 03:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ9yL-0007fH-Q6
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 03:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ9yI-00047M-Bg
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 03:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629963525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxyuCmhXnqP1VjbJDb9nxVDyugVP8jjeS7ev9WRf980=;
 b=UAWyZbRt2GnZoRlE1KH9ys0RWz+/ncFBdXaIHPSUaeTym3BG8ZLK6Z3XwASPU3OkH8tKE7
 pc/rj53glZKFGKnGAyngds6feQNF2K6L5ZrRUmNA9V3QxrHc4ulmyKtPD6wstLcrZ9sGx8
 oObgoBNFXFqXm72r2t+AUW5S4VB6exs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-8dX_W7pSMQeaWgsgAM1-tw-1; Thu, 26 Aug 2021 03:38:44 -0400
X-MC-Unique: 8dX_W7pSMQeaWgsgAM1-tw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so556661wrr.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 00:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NxyuCmhXnqP1VjbJDb9nxVDyugVP8jjeS7ev9WRf980=;
 b=cEVIshDl2yKyYH173A9+kszQYdWrwOoImwaPFXxr+6w/GxPXovILxKCLIqI5U3oDUm
 f1nKhCaKHyH9Rc5Ksjk2BTuYKiQnkj9J6V9gsNY7es9XKMjZGDINvU7qr5bKPkz8kmCz
 hCEkx5/FIZQzpIfV+pOqhbAFjoh7q1OluISqtoDsCgoUYQnJe15X9UFT79giegg8u2Lu
 JtP/dTrq8CoWPQj5rVe001mE2+0vBAbZAgQnMQK0x8kzekIJA090ZqG35BN+Rq5DLPYa
 pyxhR7v5smqtrZiglKiechM5n5AXKH2YZOvUmITMiIT+b1eWT6cxSaZyDJHie0c93LlH
 +NPA==
X-Gm-Message-State: AOAM533an5yLu9WdJNWLfDoJ+ToEoIZAnD4WL5gLUsfFxA5Gle2w02Pn
 YSKeQIsqxsUmICfx9LCF435CXwk1fl/b9TUl2RxoQm2yKDUAPIb6jBbE1GHsrEGF5svdKyY4Z+U
 mYCYeZAcWwC3HoSULxbVRU10yPG56D0VlIPo/NZWad8IQ9bUi1EpgWhq1wquq+8n1
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr10815183wme.119.1629963522573; 
 Thu, 26 Aug 2021 00:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi2vdl61aelY/zZnYLv6f7zZGx4+hrLkIr+q09bChgvCIcNhtLDYFthcfQbXgoqDQq0Qf+ww==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr10815161wme.119.1629963522320; 
 Thu, 26 Aug 2021 00:38:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t8sm2521543wrx.27.2021.08.26.00.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 00:38:41 -0700 (PDT)
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
 <CAJ+F1CKx=24Hssrz=yz+D8Q2nTXcgaLeMFdB5tfHfdWRAZ-p+g@mail.gmail.com>
 <CAFEAcA-_Xcep33jG91M3j=bySpWS60zKyydm-jO8nn8nKg_6aQ@mail.gmail.com>
 <CAJ+F1CKo2hVhwKs+fH-W5rq04gCPiwjxe5HfFsg16gvTnH5U-A@mail.gmail.com>
 <YScGLe9HTm404Jc8@yekko>
 <CAJ+F1C+fxCyW+SrORudyoBi=ZYQD_v2MkAdRbaVgW-gh9580QA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <39d9b033-6d51-7571-c503-a4e8eabc298f@redhat.com>
Date: Thu, 26 Aug 2021 09:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+fxCyW+SrORudyoBi=ZYQD_v2MkAdRbaVgW-gh9580QA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 9:34 AM, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Aug 26, 2021 at 7:11 AM David Gibson
> <david@gibson.dropbear.id.au <mailto:david@gibson.dropbear.id.au>> wrote:
> 
>     On Thu, Aug 26, 2021 at 12:11:17AM +0400, Marc-André Lureau wrote:
>     > Hi
>     >
>     > On Thu, Aug 26, 2021 at 12:00 AM Peter Maydell
>     <peter.maydell@linaro.org <mailto:peter.maydell@linaro.org>>
>     > wrote:
>     >
>     > > On Wed, 25 Aug 2021 at 20:55, Marc-André Lureau
>     > > <marcandre.lureau@gmail.com <mailto:marcandre.lureau@gmail.com>>
>     wrote:
>     > > > fdt_check_full was added in 1.4.7:
>     > > > https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=v1.4.7
>     <https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=v1.4.7>
>     > > >
>     > > > Only ubuntu appears to be lagging a bit behind. I wonder if
>     they would
>     > > consider an update.
>     > >
>     > > I doubt it. You would need to wait until that actually falls off
>     > > our supported list. You also have a couple of years to wait until
>     > > Debian oldstable is no longer on our supported list.
>     > >
>     > > Maybe, I don't know why debian oldstable would have received a
>     new version
>     > plus fixes, and not ubuntu.
>     >
>     > It seems we could have our own fallback copy of fdt_check_full()
>     though..
>     > I'll give that a try.
> 
>     We could, but fdt_check_full() is actually a pretty complex function.
> 
> 
> Yeah, that would be used for those who don't have >= 1.4.7.
> 
> Alternatively we could lower the fdt_check_full to fdt_check_header in
> this case? It seems it is used to verify the DT from SLOF. It may be
> trusted I suppose, or a malformed DT may only impact the guest?

Alternative (or complementary?) approach:
https://lore.kernel.org/qemu-devel/20210511155354.3069141-1-philmd@redhat.com/


