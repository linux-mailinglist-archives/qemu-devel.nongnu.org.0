Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB0327FBE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:41:56 +0100 (CET)
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGio5-0003uF-Ji
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lGil6-0001eg-2U
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:38:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lGil3-0002ao-Gg
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:38:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id k66so14538520wmf.1
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 05:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=huoBhlCYFeDimNGtOjp/zuvqaBBR5G2/2Bg5LAsPTZU=;
 b=i5VBQiBTir6SvT7gzRZBSGrOqNnaZ5ZKCQ3g9NUXvdMRAc4jqnJZHq2V03aZwmhOc+
 IOVZDvi0TMqy5bb69R1Q8MuFicdb9dKK5I1Ja6CnSBdApagTUldVbt2LKVsR3h8fwYju
 4O77gDq7nif5NTbQbyBPACFeoqyE51j7eMZ4OiyrhuaDAoKA2VVI+lWHTSq++Gu/nIuj
 oTrZ7smhXR2l0iaQV5zto9/ZzNGk3eN/z02jkotI/yCo6RNKREmlG7uXpPHFT3WDeSJf
 gKAtS0nHLsVBuihIyCXr+MzVv8XPwn9J1sHNmdQHrUFAakFrdtbCEdgznF1QqxOyHJuc
 qflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=huoBhlCYFeDimNGtOjp/zuvqaBBR5G2/2Bg5LAsPTZU=;
 b=MCqX2RYnce0IC5hnVlR5SzQlTuNSdiV6oU/ScDGqsQH6m+SUsyqGDvENAM+k60bVTG
 PItcgDGz8RjkcoqgDPLI8TJ5sY42VRTOv4UnSwLjmplx4RYTMYCNSX5Uyv6gPt6zZ0iN
 uxq/ZV3YqoxZJghfoCqOlrqY8Baye+8vNbpe34cGq4GNMEaNKEojnmg/dptFYS6rEOE4
 btVT6/L0BVbwFKsUME6sQgCM5EC6HSvnz2EtpQRqM9e13NJ+53ZB7oAHt27D4UYeKuGf
 CUhEViZLEbp+BIZl3cylUAbzilXP2MCAE/7+2ltt0sJ1uHxhPLff9KNOX2Aw71SMnxII
 5czQ==
X-Gm-Message-State: AOAM533VAKL6AtsIqF5h9NjvAQxu4ZETM2sVbO2g1YLxyw4wBfffHufv
 DmMOZ5mSGoH1Ul8Nc7wx9ARnog==
X-Google-Smtp-Source: ABdhPJywjofKW48a/2o0Z9SyUQ/2naF0yq4v+tm+T0ZW1tws/ii7PmEalz6q2aVYnytXcQ1wZIELWg==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr15722936wmb.14.1614605923261; 
 Mon, 01 Mar 2021 05:38:43 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id p6sm11200036wru.2.2021.03.01.05.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 05:38:42 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id fef18acf;
 Mon, 1 Mar 2021 13:38:41 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
In-Reply-To: <be6e184a-21e9-81f7-4f2e-363213a389b4@redhat.com>
References: <20210225230238.3719051-1-philmd@redhat.com>
 <20210225230238.3719051-4-philmd@redhat.com> <m2im6fb5k9.fsf@dme.org>
 <be6e184a-21e9-81f7-4f2e-363213a389b4@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Mon, 01 Mar 2021 13:38:41 +0000
Message-ID: <m2a6rnat9a.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::334;
 envelope-from=dme@dme.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 haibinzhang <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-03-01 at 12:50:33 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> On 2/26/21 9:23 AM, David Edmondson wrote:
>> On Friday, 2021-02-26 at 00:02:38 +01, Philippe Mathieu-Daud=C3=A9 wrote:
>>=20
>>> If the block drive is read-only we will model a "protected" flash
>>> device. We can thus use memory_region_init_rom_device_from_file()
>>> which mmap the backing file when creating the MemoryRegion.
>>> If the same backing file is used by multiple QEMU instances, this
>>> reduces the memory footprint (this is often the case with the
>>> CODE flash image from OVMF and AAVMF).
>>>
>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>>  hw/block/pflash_cfi01.c | 20 ++++++++++++++------
>>>  hw/block/pflash_cfi02.c | 18 ++++++++++++++----
>>>  2 files changed, 28 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
>>> index a5fa8d8b74a..5757391df1c 100644
>>> --- a/hw/block/pflash_cfi01.c
>>> +++ b/hw/block/pflash_cfi01.c
>>> @@ -743,11 +743,19 @@ static void pflash_cfi01_realize(DeviceState *dev=
, Error **errp)
>>>          pfl->ro =3D 0;
>>>      }
>>>=20=20
>>> -    memory_region_init_rom_device(
>>> -        &pfl->mem, OBJECT(dev),
>>> -        &pflash_cfi01_ops,
>>> -        pfl,
>>> -        pfl->name, total_len, errp);
>>> +    if (pfl->blk && pfl->ro) {
>>> +        memory_region_init_rom_device_from_file(&pfl->mem, OBJECT(dev),
>>> +                                                &pflash_cfi01_ops, pfl,
>>> +                                                pfl->name, total_len,
>>> +                                                qemu_real_host_page_si=
ze,
>>> +                                                RAM_SHARED,
>>> +                                                blk_bs(pfl->blk)->file=
name,
>>=20
>> How will this behave if someone does:
>>=20
>>     -drive file=3DOVMF_CODE.fd.qcow2,index=3D0,if=3Dpflash,format=3Dqcow=
2,readonly=3Don
>>=20
>> Honestly, I'm not sure why they would, but it works today.
>
> OK I can add a check for "raw" driver, but I don't know to check for
> offset =3D=3D 0.

This is pretty much where I got to when I tried using mmap() and gave up
(mostly because I figured that adding layer violating checks to the
pflash driver would not be well received, but also because we don't
share the same underlying file between multiple VMs and I wasn't sure
that it would eventually work well for writable devices).

dme.
--=20
Driving at 90 down those country lanes, singing to "Tiny Dancer".

