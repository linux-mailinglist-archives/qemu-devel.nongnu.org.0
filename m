Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7CA6A3DFC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 10:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZYK-0006aU-4y; Mon, 27 Feb 2023 04:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWZYI-0006Wa-7a
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:12:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWZYF-0003EO-9g
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677489126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aB4Bn7wobn23hBjLm919VbWySt9cJ1R5a1rYO091io=;
 b=c0Y/BYGbnpQlX8w4Dzh4WpJQXS/VfUdM71dOIc5medCdW4xqL+Pi/uWrkEXOcfSPZQGb8l
 wCL8cu0A47oWJuIRuHnxeJLsEKFzksBbgkNkIu+Fwm0NpULngnEh/X/B/QBAWcPxfzSoZD
 jhcMCmWUHohnIz+izfcSAoy9y00z/AQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-YJGcMKEFOR2L3CNZrdnn4A-1; Mon, 27 Feb 2023 04:12:04 -0500
X-MC-Unique: YJGcMKEFOR2L3CNZrdnn4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 m7-20020a056000008700b002c7047ea429so635875wrx.21
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 01:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1aB4Bn7wobn23hBjLm919VbWySt9cJ1R5a1rYO091io=;
 b=uJF+CtjGtltjSPZXCLCKxkNPkO+uo8a7053EBejkQq/J3icS4T2w8G9qoJ0Zw5MpHR
 GSWanQADVV15jInz7PQxmuPeqne2kjjsOyYHaqemrpcydlhLctzoX1yi8VrAQ5xLB7EF
 Xf+9aZKZK1aPEimr5iw3gxtNs0Ypf+cFy5jI0UfRkK9+f8uHv6NMMM+7ijNiLTNU6W3Z
 84ugLxrOaKj8OSWwycajTYi1yJ4Eq6QqvE3uYLaoG4OEtysl8RxRiM6CYC5Id78W/9Au
 V8biXbneSRhoPopMChPoFZCBz4gNh8130iucqlK56cUotiPMyktRliNXi9JXquMHBUuu
 ry8w==
X-Gm-Message-State: AO0yUKV86pJ2RdM1uvq21/Av4DM46cU+esG4oOjzY5uuBg6bnubPKt9C
 Agb2xQ13aT4ddjZzhFFIah5PhEi4fcmhNd+4/W/uUBlFadI9ViPG7mXBkpQ6S+vIETgQ9yMLSME
 RO9Pl4M2LeM5gi5A=
X-Received: by 2002:adf:ee50:0:b0:2c9:8b81:bcf2 with SMTP id
 w16-20020adfee50000000b002c98b81bcf2mr5296828wro.29.1677489123546; 
 Mon, 27 Feb 2023 01:12:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/KgoIcpp6nstqqFM59B9tiHgdvGXp0MPXJ02BuGJLDUXJJTdaZrZP0KMfub3smWscu3d8eng==
X-Received: by 2002:adf:ee50:0:b0:2c9:8b81:bcf2 with SMTP id
 w16-20020adfee50000000b002c98b81bcf2mr5296807wro.29.1677489123216; 
 Mon, 27 Feb 2023 01:12:03 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 fm26-20020a05600c0c1a00b003e6dcd562a6sm8668210wmb.28.2023.02.27.01.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 01:12:02 -0800 (PST)
Message-ID: <ea176722-9dee-0df6-edf2-b8ff8e1193ba@redhat.com>
Date: Mon, 27 Feb 2023 10:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/29] Block layer patches
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
 <CAFEAcA8uYhS=MoOuGpYo90uF7mCa1JH6fapy+qvW8iCsNMmBfA@mail.gmail.com>
 <d6280636-d40f-a79d-ead0-4b94a0628f10@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d6280636-d40f-a79d-ead0-4b94a0628f10@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 24/02/2023 22.35, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 24/2/23 19:50, Peter Maydell wrote:
>> On Thu, 23 Feb 2023 at 18:51, Kevin Wolf <kwolf@redhat.com> wrote:
>>>
>>> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
>>>
>>>    Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into 
>>> staging (2023-02-21 11:28:31 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://repo.or.cz/qemu/kevin.git tags/for-upstream
>>>
>>> for you to fetch changes up to 0f385a2420d2c3f8ae7ed65fbe2712027664059e:
>>>
>>>    block/rbd: Add support for layered encryption (2023-02-23 19:49:35 +0100)
>>>
>>> ----------------------------------------------------------------
>>> Block layer patches
>>>
>>> - Lock the graph, part 2 (BlockDriver callbacks)
>>> - virtio-scsi: fix SCSIDevice hot unplug with IOThread
>>> - rbd: Add support for layered encryption
>>>
>>> ----------------------------------------------------------------
>>
>>
>> Applied, thanks.
> 
> Configuring with --extra-cflags=-ggdb, on
> 
> C compiler for the host machine: clang (clang 14.0.0 "Apple clang version 
> 14.0.0 (clang-1400.0.29.202)")
> C linker for the host machine: clang ld64 820.1
> Host machine cpu family: aarch64
> Host machine cpu: aarch64
> ...
>      CFLAGS                       : -ggdb -g -O2
> 
> I'm getting:
> 
> ../../block/io.c:182:38: warning: reading variable 'bdrv_aio_preadv' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>                                  drv->bdrv_aio_preadv ||
>                                       ^
> ../../block/io.c:997:14: warning: reading variable 'bdrv_aio_preadv' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>      if (drv->bdrv_aio_preadv) {
>               ^
> ../../block/io.c:1003:20: warning: reading variable 'bdrv_aio_preadv' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>          acb = drv->bdrv_aio_preadv(bs, offset, bytes, qiov, flags,
>                     ^
> ../../block/io.c:1076:14: warning: reading variable 'bdrv_aio_pwritev' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>      if (drv->bdrv_aio_pwritev) {
>               ^
> ../../block/io.c:1082:20: warning: reading variable 'bdrv_aio_pwritev' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>          acb = drv->bdrv_aio_pwritev(bs, offset, bytes, qiov, flags,
>                     ^
> ../../block/io.c:2899:25: warning: reading variable 'bdrv_aio_flush' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>      } else if (bs->drv->bdrv_aio_flush) {
>                          ^
> ../../block/io.c:2905:24: warning: reading variable 'bdrv_aio_flush' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>          acb = bs->drv->bdrv_aio_flush(bs, bdrv_co_io_em_complete, &co);
>                         ^
> ../../block/io.c:2991:49: warning: reading variable 'bdrv_aio_pdiscard' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>      if (!bs->drv->bdrv_co_pdiscard && !bs->drv->bdrv_aio_pdiscard) {
>                                                  ^
> ../../block/io.c:3058:28: warning: reading variable 'bdrv_aio_pdiscard' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>              acb = bs->drv->bdrv_aio_pdiscard(bs, offset, num,
>                             ^
> ../../block/io.c:3094:24: warning: reading variable 'bdrv_aio_ioctl' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>      if (!drv || (!drv->bdrv_aio_ioctl && !drv->bdrv_co_ioctl)) {
>                         ^
> ../../block/io.c:3102:20: warning: reading variable 'bdrv_aio_ioctl' 
> requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
>          acb = drv->bdrv_aio_ioctl(bs, req, buf, bdrv_co_io_em_complete, &co);
>                     ^
> 11 warnings generated.

This can also reproduced in the gitlab-ci:

  https://gitlab.com/thuth/qemu/-/jobs/3837884040#L2862

Peter, in case you also have a github account, could you maybe enable the 
Cirrus-CI for your gitlab repo like it is explained here:

  .gitlab-ci.d/cirrus/README.rst

?

  Thanks,
   Thomas


