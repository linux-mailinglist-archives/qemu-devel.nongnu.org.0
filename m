Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EDA31CD4C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:55:33 +0100 (CET)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2hI-0000lL-Q3
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lC2fk-0008LL-Df
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:53:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lC2fg-0004TC-HY
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:53:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id x4so14942409wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 07:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZL7cCA9ZufnnYpq1BMVpGD72uv0oS9reVif+GGXak58=;
 b=DnJUTl9heO4wPdqKhOdqWY39DDhyduhKEYytmD9n+d4KHWkmtHh3b63/QmCD4RecUa
 8Buk5UURgiQFoBMq9RRNKbHPDCNCuV/nDC7KtweEuZ0M1ovZDVFiKPTZ9uKI8wOQMiWo
 jxrGrq+ELr1/uFN7gKju6R08pyoZAiBA4v1F4r4tkicvhysXJFBkSLJsSXociI6UArxK
 A3JZfRAktsHY+YXrtfzAUPS5HLBBdzRxdxbpKJuIWm+8m2WPjSquuTzCElxz0e4PLdkh
 os6qABRRXtskILjuRyE8MvRC1mMYMmQlqQ1W5NNwPsRVYLanXVcWUCsGT4RxT+rpBrNv
 Ippg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ZL7cCA9ZufnnYpq1BMVpGD72uv0oS9reVif+GGXak58=;
 b=iqg1hrE1l/gxXeAbqQC/CobwxpZtCzFwgiTcMX/H/M1sdhYCeEI59JPZ/7Y+IYf1eZ
 w2bZCHo3I/6LX/LWBJwRY1SymJrJZXTdMrQunbzoLBdrYVcj2Ymp5+cgkuu59Ez7ISZQ
 BD0tpo3t2R2yKOs/AG+vG7lK5Hl7JnR64BpcIN9ohYiTm8iB7aFRTXLsu49jOYN7Ck3E
 SntrE116XKOWCsAJ75Qvu8DeknjE2pJrmVKqFn+LBut18+vITe+c+o6TyXCOUbpZhX4F
 Hxr2am5te8fvtJNOa41ycyi7GYXDfc5Ecp2rh5ArozEy7ImmudPp9ShwviyqSjZ0s7SW
 x4XQ==
X-Gm-Message-State: AOAM532SsqncKo4h00Zak2nErw0HJ+Jjy8zHXdtqOyVCmW/uTdM8YjKN
 5ZXMPD5fqb2dOhg68OjgF3FCUQ==
X-Google-Smtp-Source: ABdhPJy6uWNGTLicJtb7ntwAEmnjulHqgwD74M6vk683xjoGIPNk3nRI6km4VH1j6P6obFqSLvXAOQ==
X-Received: by 2002:a05:600c:4c94:: with SMTP id
 g20mr3712880wmp.41.1613490830117; 
 Tue, 16 Feb 2021 07:53:50 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id v204sm4340412wmg.38.2021.02.16.07.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:53:49 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id be10ef3d;
 Tue, 16 Feb 2021 15:53:48 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [RFC PATCH 0/3] hw/pflash_cfi01: Reduce memory consumption when
 flash image is smaller than region
In-Reply-To: <fcff2ad0-0280-f78f-c563-5e18ec37f800@redhat.com>
References: <20210216142721.1985543-1-david.edmondson@oracle.com>
 <df4db595-c2db-4fa8-0a4b-1403117dcc76@redhat.com>
 <cunh7mcjaw3.fsf@dme.org>
 <fcff2ad0-0280-f78f-c563-5e18ec37f800@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Tue, 16 Feb 2021 15:53:48 +0000
Message-ID: <cuneehgj9f7.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::32a;
 envelope-from=dme@dme.org; helo=mail-wm1-x32a.google.com
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

On Tuesday, 2021-02-16 at 16:44:58 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> On 2/16/21 4:22 PM, David Edmondson wrote:
>> On Tuesday, 2021-02-16 at 16:03:05 +01, Philippe Mathieu-Daud=C3=A9 wrot=
e:
>>=20
>>> I am not a block expert, but I wonder if something like this could
>>> be used:
>>>
>>> - create a raw (parent) block image of 64MiB
>>>
>>> - add a raw (child) block with your 768kB of VARS file
>>>
>>> - add a null-co (child) block of 63Mib + 256kiB
>>>
>>> - pass the parent block to the pflash device
>>=20
>> I'm not clear how this would behave if there is a write to the device at
>> (say) 1MiB.
>
> Discarded.
>
>> More philosophically, how should it behave?
>
> null-co: reads return zeroes, writes are discarded.
>
>> My expectation was that if the machine says that there is 64MiB of
>> writable flash, we have to allow writes throughout the full 64MiB and
>> (significantly) persist them to the backing block device.
>>=20
>> Just because the backing block device started out 768KiB big doesn't
>> mean that we should not write to the remaining extent if that's what the
>> VM attempts.
>>=20
>> Would the above approach achieve that? (It doesn't sound like it.)
>
> Well this was a simple suggestion if you know your guest won't access
> anything beside these 768KiB (IIRC AAVMF "consumes" the flash devices
> and doesn't expose them to the guest via ACPI/other).

If that's the case, mirroring the approach in the patch that I sent
should work - we run the 768kiB as a subregion with IO/ROMD behaviour,
fail or discard writes to the rest and read as zero.

> If you are into memory optimization, this is worth considering.
> Else it doesn't make sense.
>
> AAVMF is designed for virtual world. Is the virtual world interested in
> doing firmware upgrade on the CODE flash? Unlikely, if you want to
> upgrade AAVMF you'd do it on the host. Why not mount the CODE flash as
> ROM? I suppose because AAVMF does CFI MMIO accesses to detect the flash,
> but I wonder what is the point if this flash will be ever written...

I don't expect that the CODE flash will ever be written by the guest, no
(it's generally presented to the guest as read-only), and currently the
VARS flash is also often presented read-only as well, but I don't think
that is a situation that we can maintain given increasing use (DBX
updates, for example).

If it's acceptable to limit flash writes to the extent of the underlying
block device then things are straightforward. It's not clear to me that
this is the case.

dme.
--=20
She's got no name, but she is family.

