Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C3B31E87C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:35:18 +0100 (CET)
Received: from localhost ([::1]:60816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgeS-000337-N1
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lCgdd-0002Uj-09
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 05:34:25 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lCgdb-0003Sr-2r
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 05:34:24 -0500
Received: by mail-wm1-x333.google.com with SMTP id w4so2394058wmi.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 02:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gzOcyeujVARNWjWUEzo0HScFYeC30tEB3aJcs0J0lag=;
 b=XuNo6KJxF4OtF0PcMzvUHZwHvS8rvB09qIXbW7tbKmLZwHeRNnfJEjtntBCAp3QRuU
 3XDfBk+0dHH0h5LDAZnkhKi/c3okqX7ZkEfidx32vBF40Qhbpu2fsKF21BaYXyyZeIEi
 gE7qxgdygPumOCxt+VQRTWn6pnJ9ppe2LuahT8FGo0ELG2v2habej8PpcjxXOOSgwCFT
 dPKNIYrrtEbKRHxX3h80SpN7y7U5hcwfYlLhWzPgmXQ8gG31/pd7UXux41+heAsWvIMi
 FFS/SHOMqUmQnxtzr1BJ1+t3GrAMxUkxq0hcHEuX/A4zvfAl3IZUXwKh4n7y5h1WVd0H
 vlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=gzOcyeujVARNWjWUEzo0HScFYeC30tEB3aJcs0J0lag=;
 b=o9oghP0p9UmmUFZKTHhaluj1xjwvYuH3PKPcwwWS45k9fOOezu8uR2LBUc67qxjr03
 9yp49ikAWwfG0SgmBdIFA3FayS2FIAmM/gTyhgzhildoDTI431GKg9OIKbZ8ysj+zmow
 3Ly9HCZZyxvZKg7Zlig/3w/19TL6n3BL4GEyFMNTUCUhyYDf2hv78oefOsYiiVA4rYFT
 9ZOV0hciZ+2uTRwP/A8CdI+gI7qmaZWa7Ef7xEGe1FO6m907/d0jBdTaWUsEOk1gHOXP
 3PfCTEPxjXxtv5l7X99bbecd1oTYBpZiwOeOwrK9Jw4J/ceJPACkK8C9k5EkST418NV6
 smjA==
X-Gm-Message-State: AOAM5318XX93vo3MIxsgsy0srqZn6CSxf+J1j9TBTQiej1CEGuolZQy8
 18/77X+bLgsrzCpXHRHlWDXBLg==
X-Google-Smtp-Source: ABdhPJz4qhCGPO9HhowCqEtw7GB4pTK2PW1zcefhuwXU4EeoSE7JXqNGmQxFYD690P8UGeHA/+hEOA==
X-Received: by 2002:a7b:c411:: with SMTP id k17mr3006814wmi.185.1613644460973; 
 Thu, 18 Feb 2021 02:34:20 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id u137sm7299544wmu.20.2021.02.18.02.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 02:34:20 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 045db9a6;
 Thu, 18 Feb 2021 10:34:19 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [RFC PATCH 0/3] hw/pflash_cfi01: Reduce memory consumption when
 flash image is smaller than region
In-Reply-To: <cuneehgj9f7.fsf@dme.org>
References: <20210216142721.1985543-1-david.edmondson@oracle.com>
 <df4db595-c2db-4fa8-0a4b-1403117dcc76@redhat.com>
 <cunh7mcjaw3.fsf@dme.org>
 <fcff2ad0-0280-f78f-c563-5e18ec37f800@redhat.com>
 <cuneehgj9f7.fsf@dme.org>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Thu, 18 Feb 2021 10:34:19 +0000
Message-ID: <cun1rddk6l0.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::333;
 envelope-from=dme@dme.org; helo=mail-wm1-x333.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-02-16 at 15:53:48 GMT, David Edmondson wrote:

> On Tuesday, 2021-02-16 at 16:44:58 +01, Philippe Mathieu-Daud=C3=A9 wrote:
>
>> On 2/16/21 4:22 PM, David Edmondson wrote:
>>> On Tuesday, 2021-02-16 at 16:03:05 +01, Philippe Mathieu-Daud=C3=A9 wro=
te:
>>>=20
>>>> I am not a block expert, but I wonder if something like this could
>>>> be used:
>>>>
>>>> - create a raw (parent) block image of 64MiB
>>>>
>>>> - add a raw (child) block with your 768kB of VARS file
>>>>
>>>> - add a null-co (child) block of 63Mib + 256kiB
>>>>
>>>> - pass the parent block to the pflash device
>>>=20
>>> I'm not clear how this would behave if there is a write to the device at
>>> (say) 1MiB.
>>
>> Discarded.
>>
>>> More philosophically, how should it behave?
>>
>> null-co: reads return zeroes, writes are discarded.
>>
>>> My expectation was that if the machine says that there is 64MiB of
>>> writable flash, we have to allow writes throughout the full 64MiB and
>>> (significantly) persist them to the backing block device.
>>>=20
>>> Just because the backing block device started out 768KiB big doesn't
>>> mean that we should not write to the remaining extent if that's what the
>>> VM attempts.
>>>=20
>>> Would the above approach achieve that? (It doesn't sound like it.)
>>
>> Well this was a simple suggestion if you know your guest won't access
>> anything beside these 768KiB (IIRC AAVMF "consumes" the flash devices
>> and doesn't expose them to the guest via ACPI/other).
>
> If that's the case, mirroring the approach in the patch that I sent
> should work - we run the 768kiB as a subregion with IO/ROMD behaviour,
> fail or discard writes to the rest and read as zero.
>
>> If you are into memory optimization, this is worth considering.
>> Else it doesn't make sense.
>>
>> AAVMF is designed for virtual world. Is the virtual world interested in
>> doing firmware upgrade on the CODE flash? Unlikely, if you want to
>> upgrade AAVMF you'd do it on the host. Why not mount the CODE flash as
>> ROM? I suppose because AAVMF does CFI MMIO accesses to detect the flash,
>> but I wonder what is the point if this flash will be ever written...
>
> I don't expect that the CODE flash will ever be written by the guest, no
> (it's generally presented to the guest as read-only), and currently the
> VARS flash is also often presented read-only as well, but I don't think
> that is a situation that we can maintain given increasing use (DBX
> updates, for example).
>
> If it's acceptable to limit flash writes to the extent of the underlying
> block device then things are straightforward. It's not clear to me that
> this is the case.

Looking at the AAVMF implementation, it seems to me that if the initial
VARS image is prepared as being 768KiB in size (which it is), none of
AAVMF itself will attempt to write outside of that extent.

If that is correct, it would support the idea of allowing writes only to
the sub-region of the 64MiB that is covered by the backing block device.

This would allow the same approach as used for read-only devices to be
used for read-write devices - it's mostly a matter of deleting some code
from the patch that I sent. The additional patch on top of the previous
series would be:
https://p.dme.org/0004-hw-pflash_cfi01-Allow-devices-to-have-a-smaller-back=
.patch.html
(Presumably this would just be squashed into the previous patch in
reality.)

If AAVMF is not going to try to use any of the region outside of the
VARS, do we need to persist writes to the rest of the region?

If so, would it be acceptable for those writes to persist only for the
lifetime of a QEMU instance? (Memory could be allocated "on demand" so
that a read after write would behave, but the content would be thrown
away when QEMU exits.)

dme.
--=20
Everyone I know, goes away in the end.

