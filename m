Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406C830E03E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:56:41 +0100 (CET)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LSK-0004Eg-AG
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7LNg-0000M2-1B
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:51:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7LNa-0007RH-I8
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612371101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ovy1YAuDOME0hxSe47uWyZX6OCjft24qpapQ9wqQZM=;
 b=QTCuO98lI6OI9CVmojoAaI1XsF8gS6OIigtx0uPYw4RIL4iUbZoPJbnlByyO1HjyF85Pzu
 9sHRGqWAz5GZilbcEmtHrAL+FvHfTS2fFG1qZvVrHaZxayI+bAhwrjaDPkpIExkhcFew78
 QatGSShuMhpljarLRBZnFH/ZHoDw/9Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-Wg_b-fSZOVq3YUBpkk_CeQ-1; Wed, 03 Feb 2021 11:51:37 -0500
X-MC-Unique: Wg_b-fSZOVq3YUBpkk_CeQ-1
Received: by mail-ej1-f72.google.com with SMTP id w16so77552ejk.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ovy1YAuDOME0hxSe47uWyZX6OCjft24qpapQ9wqQZM=;
 b=ZbUsJONYsN5Utb22W18ZPqpdILyDLCJXAhjY2dXJGtB2O0AtaHXoWdoe2sF2pmcYeg
 PoVleG8j0u09YtaKXbmjdJEBt1UJkDPiU0pqEIS/V5cE4AiwmywFf6XRhR/Ey0NfODhN
 bdADHRHWN5oQM0KDSDXnQ3zpSP8MgkiHgvXLp72KFtRTakW7tzWYM4Uf/qSAsKELFR0Z
 23a5my2yLG+Cl+7a2GWT8wrRJkt7eyY/aEJh1ocJH08ueE6of6DOPY5a4V8wevpK/8jM
 kkckohKR8hw153IoNoOhlb5/ij4EJrJ+FcY3xauJlz3r5+BiKjrTMt303gn7tiNJc1dg
 bXIg==
X-Gm-Message-State: AOAM533zJGoKdQnkWbSaPmOe02uVnWirlrjYP2LYDhdGdMT+29OUay3R
 x0EXcUpXvGuSTA96kKnKKFC5DaMWXC0KhdEbjuMMx1KyOOUMOW/rdqjIygCvwiouHL011TqRUge
 aSrL/SwwVbuZvjQM=
X-Received: by 2002:a17:906:6791:: with SMTP id
 q17mr563758ejp.116.1612371096221; 
 Wed, 03 Feb 2021 08:51:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaL75K32Q7nGNVEnI1XmfPkK/Z11609MF/R++hergyDV7c6NfVqcvZMotTN7lWpVteMxPRaQ==
X-Received: by 2002:a17:906:6791:: with SMTP id
 q17mr563742ejp.116.1612371096012; 
 Wed, 03 Feb 2021 08:51:36 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id jp6sm1259867ejb.17.2021.02.03.08.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:51:35 -0800 (PST)
Subject: Re: usb-wacom-tablet failing to register
To: Markus Armbruster <armbru@redhat.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <CAOf5uwkxAVNs_=TtVwUiEKyp+UZO_bT26sdCneR679Q5hZ_J2A@mail.gmail.com>
 <CAOf5uw=_tT1h612vnsHjCSRWhQg3_rFWeh9cic86sgKX8ZGubg@mail.gmail.com>
 <CAOf5uw=uiL2vVJQYaGcKU_SvVFDd-_h6QuaSZ9abZZQuZKEaUw@mail.gmail.com>
 <87h7sgjtys.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d3ad4c7e-fd3d-b891-4275-effb86ef7961@redhat.com>
Date: Wed, 3 Feb 2021 17:51:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87h7sgjtys.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 9/2/20 1:31 PM, Markus Armbruster wrote:
> Michael Nazzareno Trimarchi <michael@amarulasolutions.com> writes:
> 
>> Hi Markus
>>
>> I have seen that you are a committer there so what I have seen that
> 
> I know precious little about USB, and nothing about this particular
> device.  I'm cc'ing our USB maintainer Gerd.
> 
>> This request is not implement
>>  switch (request) {
>>     case InterfaceRequest | USB_REQ_GET_DESCRIPTOR:
>>
>> When linux probe it fail here
>>
>> ret = hid_get_class_descriptor(dev, interface->desc.bInterfaceNumber,
>>>                         HID_DT_REPORT, rdesc, rsize);
>>
>> I think that I miss something in documentation
>>
>> Running 5.8.0-rc3 and qemu 4.2.0
>>
>> Michael
>>
>> On Sat, Aug 8, 2020 at 4:59 PM Michael Nazzareno Trimarchi
>> <michael@amarulasolutions.com> wrote:
>>>
>>> Hi
>>>
>>> What I have seen is that the parse fail to execute
>>> hid ll_driver parse fai for
>>>
>>>  ret = hid_get_class_descriptor(dev, interface->desc.bInterfaceNumber,
>>>                         HID_DT_REPORT, rdesc, rsize);
>>>
>>> Now this is not implemented in hw/dev-wacom.c . What am I missing?
>>>
>>> #!/bin/sh
>>> IMAGE_DIR="${0%/*}/"
>>>
>>> if [ "${1}" = "serial-only" ]; then
>>>     EXTRA_ARGS='-nographic'
>>> else
>>>     EXTRA_ARGS='-serial stdio'
>>> fi
>>>
>>> export PATH="/home/michael/work/amarula/buildroot/output/host/bin:${PATH}"
>>> exec   qemu-system-i386 -M pc -kernel ${IMAGE_DIR}/bzImage -usb
>>> -device usb-wacom-tablet -drive
>>> file=${IMAGE_DIR}/rootfs.ext2,if=virtio,format=raw -append "rootwait
>>> root=/dev/vda console=tty1 console=ttyS0"  -net nic,model=virtio -net
>>> use
>>> r  ${EXTRA_ARGS}
>>>
>>> This is how I run it
>>>
>>> Michael
>>>
>>> On Sat, Jul 11, 2020 at 4:38 PM Michael Nazzareno Trimarchi
>>> <michael@amarulasolutions.com> wrote:
>>>>
>>>> Hi all
>>>>
>>>> On my 4.17.0-rc1 linux kernel i386 running on qemu, I can't register
>>>> the wacom driver emulation
>>>> QEMU emulator version 4.2.0 (Debian 1:4.2-3ubuntu6.3)
>>>> Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
>>>>
>>>> [    0.395368] ata2.00: configured for MWDMA2
>>>> [    0.397049] scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM
>>>>   2.5+ PQ: 0 ANSI: 5
>>>> [    0.584135] usb 2-1: new full-speed USB device number 2 using xhci_hcd
>>>> [    0.734449] usb 2-1: New USB device found, idVendor=056a,
>>>> idProduct=0000, bcdDevice=42.10
>>>> [    0.734461] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>>>> [    0.734466] usb 2-1: Product: Wacom PenPartner
>>>> [    0.734470] usb 2-1: Manufacturer: QEMU
>>>> [    0.734474] usb 2-1: SerialNumber: 1-0000:00:04.0-1
>>>> [    0.737347] usbhid 2-1:1.0: can't add hid device: -32
>>>> [    0.737366] usbhid: probe of 2-1:1.0 failed with error -32
>>>>
>>>> I get back an error. Any suggestions?

Do you still have that issue?


