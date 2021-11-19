Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D6B456E09
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 12:12:35 +0100 (CET)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo1oo-0006OR-8q
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 06:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo1mu-0005cb-Nc
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:10:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo1ms-0005Jk-8i
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637320232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bp1iwj2YQk4L6D6SUpVdz5mojZME9d9CpESu4EYAtp0=;
 b=QtylLyVXX+9NAJHGE62u3mYqBTyGtppJv1Q9dmoSJxo/xlk3X8qvdyym93q/9erkaToAOr
 y5sy70LQ18maHpTwjO8sfTaGklN0UgwSUI00VD9ue8gWMdFTqxFTKHtsUPaoGlz3Zr5ed1
 J684cKPCgDcoAZmHtECIdvz8aJTAmjA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-x6erwJSwPam_G2s0OMb1Aw-1; Fri, 19 Nov 2021 06:10:31 -0500
X-MC-Unique: x6erwJSwPam_G2s0OMb1Aw-1
Received: by mail-ed1-f70.google.com with SMTP id
 p4-20020aa7d304000000b003e7ef120a37so8079236edq.16
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 03:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bp1iwj2YQk4L6D6SUpVdz5mojZME9d9CpESu4EYAtp0=;
 b=veR3K4hKmOVRLl+igcf+N4UpHGmI8rYty87pCiMyALFfFGC4ZWi0GNycdL6sD5Y5Yu
 t1WoniELTOXNyvqpdGDpvtu4XQwK5fTR4HZ1BhdE39SYT8DKSjEiyvdGpdqc4Bqg2cPN
 NH1+HL0zql6cUwnFaiTA4CQTEb4A9UM3MsHKncYn6NHa5/MVMu7jf9NVZ+WO51DNE0mW
 g4pR3cjWqRkBMjzPitoH8aMdmGYs5bozpWXHtCNxHoLa0IH94jvH1iyu+q6YXXq5lKb8
 w2/6Z1bA+dBomB/cuXqn3f0M2zjYTi9i5ZVmjS30ze4o3/f8zRAopKYc3D2R0gdh0AuI
 BpwQ==
X-Gm-Message-State: AOAM5329lFEoA5rY+iclrLvztAtW8OduDALwNCqIpbqVlhDMqfc+jPtf
 MO5xaTBbcOWAGl9kWf0Wo6KyfbwfRgDFS3e3BJq9XrMhTcAAS1lqvJBi5JSDhnT/rM5zyCK/4ch
 ndzQln+mW854x+ns=
X-Received: by 2002:a17:907:6291:: with SMTP id
 nd17mr6742880ejc.194.1637320230335; 
 Fri, 19 Nov 2021 03:10:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu1hHag91cRhwoE7hE5iCcGtoSnlOoG3OF+QBrzK4CoED0kIGSosevvrnwNg1j+l/zWupkkA==
X-Received: by 2002:a17:907:6291:: with SMTP id
 nd17mr6742832ejc.194.1637320230066; 
 Fri, 19 Nov 2021 03:10:30 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id t7sm1283215edi.90.2021.11.19.03.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 03:10:29 -0800 (PST)
Message-ID: <031e8bff-5140-a3ee-99ae-da3136b5954f@redhat.com>
Date: Fri, 19 Nov 2021 12:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/display: Do not allow multiple (identical)
 VGA devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211118192020.61245-1-philmd@redhat.com>
 <776204b8-22df-555b-1836-425995272fd9@ilande.co.uk>
 <c7cb668d-1ed4-c9a6-7c27-d8892c625f0c@redhat.com>
 <a77c94fe-633a-5c33-e6e5-2715f89f2b90@redhat.com>
 <a77cae42-bedd-8380-f7ab-22bc99c6ccfb@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <a77cae42-bedd-8380-f7ab-22bc99c6ccfb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2021 11.17, Philippe Mathieu-Daudé wrote:
> On 11/19/21 10:58, Thomas Huth wrote:
>> On 19/11/2021 10.49, Philippe Mathieu-Daudé wrote:
>>> On 11/19/21 09:21, Mark Cave-Ayland wrote:
>>>> On 18/11/2021 19:20, Philippe Mathieu-Daudé wrote:
>>>>
>>>>> Commit 7852a77f598 fixed creating multiple TYPE_ISA_VGA devices,
>>>>> generalize the fix to all VGA devices.
>>>>>
>>>>> See https://gitlab.com/qemu-project/qemu/-/issues/44
>>>>>
>>>>> Philippe Mathieu-Daudé (2):
>>>>>      hw/display: Add Error* handle to vga_common_init()
>>>>>      hw/display: Do not allow multiple identical VGA devices
>>>>>
>>>>>     hw/display/vga_int.h        |  2 +-
>>>>>     hw/display/ati.c            |  4 +++-
>>>>>     hw/display/cirrus_vga.c     |  4 +++-
>>>>>     hw/display/cirrus_vga_isa.c |  4 +++-
>>>>>     hw/display/qxl.c            |  4 +++-
>>>>>     hw/display/vga-isa-mm.c     |  3 ++-
>>>>>     hw/display/vga-isa.c        | 11 ++---------
>>>>>     hw/display/vga-pci.c        |  8 ++++++--
>>>>>     hw/display/vga.c            | 17 ++++++++++++++++-
>>>>>     hw/display/virtio-vga.c     |  4 +++-
>>>>>     hw/display/vmware_vga.c     |  2 +-
>>>>>     11 files changed, 43 insertions(+), 20 deletions(-)
>>>>
>>>> Hi Phil,
>>>>
>>>> I don't think this is correct for non-ISA devices: for example years ago
>>>> I had a PC running Windows 98SE with 2 identical PCI graphics cards
>>>> configured in dual-head mode.
>>>>
>>>> IIRC the BIOS would bring up the first graphics card and configure it to
>>>> use the legacy ISA VGA ioports for compatibility, and then once the main
>>>> OS drivers loaded both cards were switched to PCI mode and configured
>>>> using the BARs as normal.
>>>
>>> The problem here is QEMU technical debt, not the hardware.
>>>
>>> When vga_common_init() calls memory_region_init_ram_nomigrate()
>>> with obj=NULL, "vga.vram" is registered as a QOM singleton.
>>>
>>> Updating it would
>>> 1/ require non-QOM devices to be QOM'ified
>>
>> So sounds like that's the right way to go here.
>>
>>> and 2/ break migration unless using HPFM which I don't master.
>>
>> What's HPFM?
> 
> Hocus Pocus Freakin' Magic

LOL, ok, thanks, TIL.

Anyway, IMHO I'd rather fix this issue by properly QOM'ifying the 
vga-isa-mm.c code and breaking migration here (who's migrating such old ISA 
devices anyway?) instead of introducing more kludges
that might cause other trouble (see also 
https://gitlab.com/qemu-project/qemu/-/issues/733 ).

  Thomas


