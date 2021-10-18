Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D598431A1D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 14:54:03 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcS9S-0003zh-8Y
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 08:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcRzX-0008LQ-Cl
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcRzS-0001S8-LM
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634561020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gkFdUyN6Lw06Vjd9YckEkhfk+Ikvr5MsBvj8F3+3tg=;
 b=dfhJzSPjXeUmkJI/25NrbFx+3FxFTDm8IV3C3O4UDvWF9OignQ32/K0JZmtF3hQ0Ti3itt
 Sw9Onqu8QOeetz/ZFyvHXCpy0cdQU7T8oD/bcTl6MKrH/5Oo+0vGpMJ52hL+cAsRwW5i+Z
 YC3MYtF/zItnKYh1kQf0Xq0+paWD07A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-gU6N5jClOO2NidUcSP6lYQ-1; Mon, 18 Oct 2021 08:43:39 -0400
X-MC-Unique: gU6N5jClOO2NidUcSP6lYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso2033589wmc.1
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 05:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=0gkFdUyN6Lw06Vjd9YckEkhfk+Ikvr5MsBvj8F3+3tg=;
 b=WC9myf2fznZZSzK8c74/i3e3dXqsRa8eDTHeEH+i5fs2gsGLwHgqpbWY7NxxfXkUp6
 zCUk6KhFNuWtOuc4wMiDhws2fgiVNL7Me1ogdmZX+IOyuMQwqNyPl1v7WRee3gsDANkl
 HpEVCufyRnTaLESu7654W6Af8MX6WltvdViW4WTDtJbYTzcHdCShWxIJV8gIjGpLxYBK
 pLvoiOimQVis/JUCB8jL4t6Fn9uUYPxHBuPNzTkC+d+CHgthx2CwzSqXehAkGxvPucfq
 yqJa5IRnEq26IMTZM5s6ajcwhib0RBSVKE8ULj4vwp6tnSQq4W+/Fw/nb8mEX2eLP6Q6
 MJfQ==
X-Gm-Message-State: AOAM533OdAJPwQhpXFo3GuhFAfPa9dONF3tvUBLleGWw3nflhQ2v2DxC
 3jKzpKCtJyhZY+FKtmGAIM+bB/ikQK5++I7+wSvzZzAdaZXYnkb+JnyaSoAeOVlvVEB3QWLQWYr
 lRthLH8lup/JMf/8=
X-Received: by 2002:a1c:2395:: with SMTP id
 j143mr30925300wmj.107.1634561018200; 
 Mon, 18 Oct 2021 05:43:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7av4sQIsposu4txLwIjD+yYtOWZg8XOD1JauvUq3PB8fBmvnXfzzPmDC0Gqdh9zRIFky0BA==
X-Received: by 2002:a1c:2395:: with SMTP id
 j143mr30925281wmj.107.1634561017991; 
 Mon, 18 Oct 2021 05:43:37 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c132sm18615401wma.22.2021.10.18.05.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 05:43:37 -0700 (PDT)
Message-ID: <96f0985f-d4e8-c9d1-87a8-78cde0a16ed8@redhat.com>
Date: Mon, 18 Oct 2021 14:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: a quetion about sysbus_realize_and_unref function
To: Chan Kim <ckim@etri.re.kr>, Markus Armbruster <armbru@redhat.com>
References: <00ac01d7c417$d7c23580$8746a080$@etri.re.kr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <00ac01d7c417$d7c23580$8746a080$@etri.re.kr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 'qemu-discuss' <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 10/18/21 14:01, Chan Kim wrote:
> Hi, list members,
> 
> I see for example in hw/arm/virt.c, when it creates a device to attach
> to a system bus, it calls “sysbus_realize_and_unref(SYS_BUS_DEVICE(dev),
> &error_fatal);” function
> 
> .
> 
> static void create_its(VirtMachineState *vms)
> 
> {
> 
>     const char *itsclass = its_class_name();
> 
>     DeviceState *dev;
> 
>  
> 
>     if (!itsclass) {
> 
>         /* Do nothing if not supported */
> 
>         return;
> 
>     }
> 
>  
> 
>     dev = qdev_new(itsclass);
> 
>  
> 
>     object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gic),
> 
>                              &error_abort);
> 
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> 
>     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_ITS].base);
> 
>  
> 
>     fdt_add_its_gic_node(vms);
> 
>     vms->msi_controller = VIRT_MSI_CTRL_ITS;
> 
> }
> 
>  
> 
> The document says it decrements the reference counter and when the ref
> count is non zero, the object can’t be removed.
> 
> Then why does it call sysbus_realize_and_unref function to reduce the
> ref count of the system bus(=parent object) of the device being create?

The qemu-devel@nongnu.org is better for developer questions.

Cc'ing Markus for:

commit 496a8525622d4ac5d276f76840dd30eddb73672d
Author: Markus Armbruster <armbru@redhat.com>
Date:   Wed Jun 10 07:32:33 2020 +0200

    sysbus: New sysbus_realize(), sysbus_realize_and_unref()

    Sysbus devices almost always plug into the main system bus.
    qdev_create() even has a convenience feature to make that easy:
    a null bus argument gets replaced by the main system bus.
    qdev_realize() and qdev_realize_and_unref() do the same.

    We can do better.  Provide convenience wrappers around
    qdev_realize() and qdev_realize_and_unref() that don't take a
    @bus argument.  They always pass the main system bus.


