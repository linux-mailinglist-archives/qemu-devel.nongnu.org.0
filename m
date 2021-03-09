Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B3332A4E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:24:15 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeDV-0001WP-K9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJdbj-0006i8-4p
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:45:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJdbg-0005dM-Ix
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615301107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5iDdX+KeaMWvhAz6I0ypuxm4fXm8JQ0KpuEoyZURuc=;
 b=iuQJ4DqTsg8aySuQcMz7QqeuE+PdQ/o2jswf5LOx7VlaSEk9BmEnhuMiR1Vfr4zDplRdnp
 n3zMXGrzrldzEqEvUyE3uf44vu9lvKBSN8G/Tlu4GaEOlP0Ci8hcZhBM08cGnsdxaLX5q/
 B04a5/4kqKWfOO5bdSv1nGgqmkhIEY0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-toFQWOf-MueAmsfEphVZEQ-1; Tue, 09 Mar 2021 09:45:06 -0500
X-MC-Unique: toFQWOf-MueAmsfEphVZEQ-1
Received: by mail-wr1-f70.google.com with SMTP id v13so6530369wrs.21
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A5iDdX+KeaMWvhAz6I0ypuxm4fXm8JQ0KpuEoyZURuc=;
 b=gvL7fLsc2sBZ8va0XSwQrFncGOomBlvagI7pKYNLATgI4OHjWLYhUpOktCPPeSAn0j
 p3K+jsHYoNkSVlEJmL1ZJva41hg1fnkR10i5CD7dIG1gcny4jfAXuJpuE7Gsb0BbZPQ4
 W436b+jzxXVfnoe0hIgENIW2VkJiqjkFsh9EV4vJ+QVtvT++pf8YC0+rrLDu455ka7Nc
 TX11JVHhGUvdx9woRPB79MZ4YIjFoYjBdIjYU2v3G1ifL8sK1sqrrkT9GWfnM4+cqDty
 +z1AcqQfxRVnE3TMYijjE1syyv+oyyX1jnsb73oAiA+Th2gPONeC1H4iTh94cAr+zfYr
 CIxw==
X-Gm-Message-State: AOAM531zvmjM3+dyAYJluaZR5+sKlKQL6yR1YDfViBQm36lCkUPAN7DE
 z7UlpdaZM+q6K2Pt1dqmlVzvQv59RADxGEXnFZWmxVP1895euD9FWUosAOsNzz8zCKgJQXvaI4c
 ZVB23qSXuXvICAIU=
X-Received: by 2002:a5d:4d8a:: with SMTP id b10mr8809047wru.395.1615301104785; 
 Tue, 09 Mar 2021 06:45:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8ObrEfIuht3NBomzy6s+LYO4eIYBEt6ikVd0WT0zNlwoQ+BoA9FyNh0ftHXpI5XJUKkIIOQ==
X-Received: by 2002:a5d:4d8a:: with SMTP id b10mr8809016wru.395.1615301104501; 
 Tue, 09 Mar 2021 06:45:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t23sm5146812wra.50.2021.03.09.06.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:45:03 -0800 (PST)
Subject: Re: [PATCH] usb: Un-deprecate -usbdevice (except for -usbdevice audio
 which gets removed)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210309142940.943831-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <75f9eac2-9981-ee1f-b158-5d1136c993c6@redhat.com>
Date: Tue, 9 Mar 2021 15:45:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309142940.943831-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 15:29, Thomas Huth wrote:
> When trying to remove the -usbdevice option, there were complaints that
> "-usbdevice braille" is still a very useful shortcut for some people.
> Thus we never remove this option. Since it's not such a big burden to
> keep it around, and it's also convenient in the sense that you don't
> have to worry to enable a host controller explicitly with this option,
> we should remove it from he deprecation list again, and rather properly
> document the possible device for this option instead.
> 
> However, there is one exception: "-usbdevice audio" should go away, since
> audio devices without "audiodev=..." parameter are also on the deprecation
> list and you cannot use "-usbdevice audio" with "audiodev".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

It's missing an addition to docs/system/removed-features.rst for 
"-usbdevice audio"; otherwise looks good.

By the way, we should add an equivalent of "-nic" for audio devices when 
removing -soundhw.  Something like "-audio 
BACKEND[,model=DEVTYPE],ARGS"; it would be equivalent to "-audiodev 
BACKEND,ARGS,id=audiodev0 -device DEVTYPE" with DEVTYPE, and would 
instead be processed by the board if DEVTYPE is not specified.

Paolo

> ---
>   docs/system/deprecated.rst |  9 ---------
>   hw/usb/dev-audio.c         |  1 -
>   qemu-options.hx            | 38 ++++++++++++++++++++++++++++++++------
>   softmmu/vl.c               |  2 --
>   4 files changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index cfabe69846..816eb4084f 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -21,15 +21,6 @@ deprecated.
>   System emulator command line arguments
>   --------------------------------------
>   
> -``-usbdevice`` (since 2.10.0)
> -'''''''''''''''''''''''''''''
> -
> -The ``-usbdevice DEV`` argument is now a synonym for setting
> -the ``-device usb-DEV`` argument instead. The deprecated syntax
> -would automatically enable USB support on the machine type.
> -If using the new syntax, USB support must be explicitly
> -enabled via the ``-machine usb=on`` argument.
> -
>   ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
>   '''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
> diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
> index e1486f81e0..f5cb246792 100644
> --- a/hw/usb/dev-audio.c
> +++ b/hw/usb/dev-audio.c
> @@ -1024,7 +1024,6 @@ static const TypeInfo usb_audio_info = {
>   static void usb_audio_register_types(void)
>   {
>       type_register_static(&usb_audio_info);
> -    usb_legacy_register(TYPE_USB_AUDIO, "audio", NULL);
>   }
>   
>   type_init(usb_audio_register_types)
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 90801286c6..cef8c2da57 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1705,7 +1705,7 @@ ERST
>   
>   DEFHEADING()
>   
> -DEFHEADING(USB options:)
> +DEFHEADING(USB convenience options:)
>   
>   DEF("usb", 0, QEMU_OPTION_usb,
>       "-usb            enable on-board USB host controller (if not enabled by default)\n",
> @@ -1723,9 +1723,31 @@ DEF("usbdevice", HAS_ARG, QEMU_OPTION_usbdevice,
>       QEMU_ARCH_ALL)
>   SRST
>   ``-usbdevice devname``
> -    Add the USB device devname. Note that this option is deprecated,
> -    please use ``-device usb-...`` instead. See the chapter about
> +    Add the USB device devname, and enable an on-board USB controller
> +    if possible and necessary (just like it can be done via
> +    ``-machine usb=on``). Note that this option is mainly intended for
> +    the user's convenience only. More fine-grained control can be
> +    achieved by selecting a USB host controller (if necessary) and the
> +    desired USB device via the ``-device`` option instead. For example,
> +    instead of using ``-usbdevice mouse`` it is possible to use
> +    ``-device qemu-xhci -device usb-mouse`` to connect the USB mouse
> +    to a USB 3.0 controller instead (at least on machines that support
> +    PCI and do not have an USB controller enabled by default yet).
> +    For more details, see the chapter about
>       :ref:`Connecting USB devices` in the System Emulation Users Guide.
> +    Possible devices for devname are:
> +
> +    ``braille``
> +        Braille device. This will use BrlAPI to display the braille
> +        output on a real or fake device (i.e. it also creates a
> +        corresponding ``braille`` chardev automatically beside the
> +        ``usb-braille`` USB device).
> +
> +    ``ccid``
> +        Smartcard reader device
> +
> +    ``keyboard``
> +        Standard USB keyboard. Will override the PS/2 keyboard (if present).
>   
>       ``mouse``
>           Virtual Mouse. This will override the PS/2 mouse emulation when
> @@ -1737,9 +1759,13 @@ SRST
>           position without having to grab the mouse. Also overrides the
>           PS/2 mouse emulation when activated.
>   
> -    ``braille``
> -        Braille device. This will use BrlAPI to display the braille
> -        output on a real or fake device.
> +    ``u2f-key``
> +        U2F (Universal Second Factor) key.
> +
> +    ``wacom-tablet``
> +        Wacom PenPartner USB tablet.
> +
> +
>   ERST
>   
>   DEFHEADING()
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ff488ea3e7..76ebe7bb7a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3180,8 +3180,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                   qemu_opts_parse_noisily(olist, "usb=on", false);
>                   break;
>               case QEMU_OPTION_usbdevice:
> -                error_report("'-usbdevice' is deprecated, please use "
> -                             "'-device usb-...' instead");
>                   olist = qemu_find_opts("machine");
>                   qemu_opts_parse_noisily(olist, "usb=on", false);
>                   add_device_config(DEV_USB, optarg);
> 


