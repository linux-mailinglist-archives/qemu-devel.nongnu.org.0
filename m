Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561E456D1C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:19:51 +0100 (CET)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0zm-0002ee-DK
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:19:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo0y5-0001DI-87
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:18:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo0xl-0006Gh-V6
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637317065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IL05vT27FcLneIppnj0QkWtuqz/IU8lSuKtG24oZGes=;
 b=clI83S0PTDxhnHSDTXFaJyYkynqFBD0/nKpp7Phnz7q4PNEKJca5kthyYP2Oy9AewpAz/+
 w+W5UlUamLy0bvhe9wq7apnlhSecib8nvXQ1y/RN5Kgmb5mmjKCXye/KDUWHbij/Wpqlan
 xTzq+ilVjwGVOzram6uI+VpakFbtlBw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-javfiiFeNzuL0-HjeG8WMA-1; Fri, 19 Nov 2021 05:17:43 -0500
X-MC-Unique: javfiiFeNzuL0-HjeG8WMA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so5674144wmc.7
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 02:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IL05vT27FcLneIppnj0QkWtuqz/IU8lSuKtG24oZGes=;
 b=1wn0v77Nd5wX5YysrMbVdIfNl0zswYHIDnukgl2rdvMTtCulnSmilYjAX2O/bL8U6m
 s85HTS/gtMWM5lJYyaM2YMgbHIp+/tWotl5Z425B8wFhQ/Tlz9BsUQhmUds0HZtf5wDG
 frgeb5tFgt2Db9GCejyf/ssqeV9dZMWSBVY9sxE1wX9lUfys/k4bNV1esOfvMdfOllyK
 lMGk/cXE40AlqzbRDpY069i1PTwRN5yDZzlVR7N7lGSNTROANvb7X94ql+A5j8ftts5o
 YbdCqH1IIH4JZTHOKFxOYfBtCRsPNEm4wCmzSxcvpDD8T6+H28CEpnZ/YlH1swte/f6D
 ECxg==
X-Gm-Message-State: AOAM530cy7AHTpSUsU1nc90cQ7W7zAa3o4DHx623b1UTK5V9ASlufgi9
 ekP70WZBKpJk7Nntg8SLBvN9NYQEhEvaNQMUUZ2IzTlahl6HnvTH/SY/wUhOoXqzkwJyVmo2sKW
 ejYVwFWP8aE9px/0=
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr5866576wri.308.1637317062634; 
 Fri, 19 Nov 2021 02:17:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+sQkFRI8r0iasOpds9iDsAaCNF58tGdyhl+iDPrTdDobtXs37ggsKnlopsIs06xlmhV66Dw==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr5866537wri.308.1637317062406; 
 Fri, 19 Nov 2021 02:17:42 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o12sm2724132wmq.12.2021.11.19.02.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:17:41 -0800 (PST)
Message-ID: <a77cae42-bedd-8380-f7ab-22bc99c6ccfb@redhat.com>
Date: Fri, 19 Nov 2021 11:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 0/2] hw/display: Do not allow multiple (identical)
 VGA devices
To: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211118192020.61245-1-philmd@redhat.com>
 <776204b8-22df-555b-1836-425995272fd9@ilande.co.uk>
 <c7cb668d-1ed4-c9a6-7c27-d8892c625f0c@redhat.com>
 <a77c94fe-633a-5c33-e6e5-2715f89f2b90@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <a77c94fe-633a-5c33-e6e5-2715f89f2b90@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, SPF_HELO_NONE=0.001,
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

On 11/19/21 10:58, Thomas Huth wrote:
> On 19/11/2021 10.49, Philippe Mathieu-Daudé wrote:
>> On 11/19/21 09:21, Mark Cave-Ayland wrote:
>>> On 18/11/2021 19:20, Philippe Mathieu-Daudé wrote:
>>>
>>>> Commit 7852a77f598 fixed creating multiple TYPE_ISA_VGA devices,
>>>> generalize the fix to all VGA devices.
>>>>
>>>> See https://gitlab.com/qemu-project/qemu/-/issues/44
>>>>
>>>> Philippe Mathieu-Daudé (2):
>>>>     hw/display: Add Error* handle to vga_common_init()
>>>>     hw/display: Do not allow multiple identical VGA devices
>>>>
>>>>    hw/display/vga_int.h        |  2 +-
>>>>    hw/display/ati.c            |  4 +++-
>>>>    hw/display/cirrus_vga.c     |  4 +++-
>>>>    hw/display/cirrus_vga_isa.c |  4 +++-
>>>>    hw/display/qxl.c            |  4 +++-
>>>>    hw/display/vga-isa-mm.c     |  3 ++-
>>>>    hw/display/vga-isa.c        | 11 ++---------
>>>>    hw/display/vga-pci.c        |  8 ++++++--
>>>>    hw/display/vga.c            | 17 ++++++++++++++++-
>>>>    hw/display/virtio-vga.c     |  4 +++-
>>>>    hw/display/vmware_vga.c     |  2 +-
>>>>    11 files changed, 43 insertions(+), 20 deletions(-)
>>>
>>> Hi Phil,
>>>
>>> I don't think this is correct for non-ISA devices: for example years ago
>>> I had a PC running Windows 98SE with 2 identical PCI graphics cards
>>> configured in dual-head mode.
>>>
>>> IIRC the BIOS would bring up the first graphics card and configure it to
>>> use the legacy ISA VGA ioports for compatibility, and then once the main
>>> OS drivers loaded both cards were switched to PCI mode and configured
>>> using the BARs as normal.
>>
>> The problem here is QEMU technical debt, not the hardware.
>>
>> When vga_common_init() calls memory_region_init_ram_nomigrate()
>> with obj=NULL, "vga.vram" is registered as a QOM singleton.
>>
>> Updating it would
>> 1/ require non-QOM devices to be QOM'ified
> 
> So sounds like that's the right way to go here.
> 
>> and 2/ break migration unless using HPFM which I don't master.
> 
> What's HPFM?

Hocus Pocus Freakin' Magic


