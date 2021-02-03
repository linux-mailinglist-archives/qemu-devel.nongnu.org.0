Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D130DFE0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:39:44 +0100 (CET)
Received: from localhost ([::1]:32860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LBv-0005k9-32
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7L1V-00044A-EA
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7L1T-0003Nh-6j
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4dzqpMy4aY/dm//+IODxm7tdTyHiGWfHPu341Rpufc=;
 b=H0CVvrz5Kyfwo/1VoVVWeIptRXHXtLpgqvLaEKxR4jbHRcuKPkEaxxM3qkuz0dECU3M28b
 K+gXaw0grYMO/4TZaDczoUDE12jL0zAnf1ApRij6uEou4oy34eZAI4wfmbu0meIBA8AS41
 OCeDuLNKPyhHxTHkDPpivUYrW5bcX8w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-HfqTEo_fPaKntsDKHuo0YQ-1; Wed, 03 Feb 2021 11:28:50 -0500
X-MC-Unique: HfqTEo_fPaKntsDKHuo0YQ-1
Received: by mail-ed1-f72.google.com with SMTP id g2so95956edq.14
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F4dzqpMy4aY/dm//+IODxm7tdTyHiGWfHPu341Rpufc=;
 b=N2nDeDkc5AInIStNn9ZdKbgXxc/J4z1kdA8cm0FO0V5+m0LY6t4VgR1tUP8WXx0Kle
 zRbrdtpiJTXAWGvvCM9JMxN8rpl89oHspbeCfKL1yiVsWpK7JoFZN2QvqN6wCT3TY4/e
 kkKOVhqpWgxUZB7KRIT7phGtAKFLlTEeXTIJszAfJwBucp5/Ozo5Yi63iOBD4VBXBVdf
 tJjq+sGKc6RDSOBluQHpRxLn+NVXB70gqJh149dZyXRuJLZWnBSUbA5rsuhdTH1vvg9F
 gRRj2JG4ykBvQiq+HpkxTwnGy1Hgr+1XcRO0T7raKQcLWTSGqltb6POvyNLDyswsaYP8
 vI5Q==
X-Gm-Message-State: AOAM532X5y6gKDLrPKvarsQprlgKjjBwObQzVYvHsM9u0t5pNFlXc8UC
 Iiyx0LIXz/8H0YuO4sRWobJvN354hgv3p1mneM/Dp2iVbdbRJhczEBSZqoajGK5ahBaNfZ8EOaZ
 6KX5GaIQlsyMxzo4=
X-Received: by 2002:a05:6402:318e:: with SMTP id
 di14mr3795553edb.223.1612369729706; 
 Wed, 03 Feb 2021 08:28:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGa2Uwd0a4DD5nI5wmMNZ8QTo+DdmsDWVfThTPZvreBPZZH8dBpAyOL/BWkRFOP5BQCqGAhw==
X-Received: by 2002:a05:6402:318e:: with SMTP id
 di14mr3795535edb.223.1612369729531; 
 Wed, 03 Feb 2021 08:28:49 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id f22sm1211698eje.34.2021.02.03.08.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:28:48 -0800 (PST)
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
To: avocado-devel <avocado-devel@redhat.com>
References: <20210128185300.2875-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5e83921f-9287-5d93-3051-6065232bb357@redhat.com>
Date: Wed, 3 Feb 2021 17:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128185300.2875-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Anders Roxell <anders.roxell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing avocado-devel for test idea.

On 1/28/21 7:53 PM, Alex Bennée wrote:
> The wiki and the web are curiously absent of the right runes to boot a
> vexpress model so I had to work from first principles to work it out.
> Use the more modern -drive notation so alternative backends can be
> used (unlike the hardwired -sd mode).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
> index 7f1bcbef07..30b1823b95 100644
> --- a/docs/system/arm/vexpress.rst
> +++ b/docs/system/arm/vexpress.rst
> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU model:
>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
>    provided on the command line then QEMU will edit it to include
>    suitable entries describing these transports for the guest.
> +
> +Booting a Linux kernel
> +----------------------
> +
> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
> +enough to get something running.
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=arm
> +  $ export CROSS_COMPILE=arm-linux-gnueabihf-
> +  $ make multi_v7_defconfig
> +  $ make
> +
> +By default you will want to boot your rootfs of the sdcard interface.
> +Your rootfs will need to be padded to the right size. With a suitable
> +DTB you could also add devices to the virtio-mmio bus.
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -cpu cortex-a15 -smp 4 -m 4096 \
> +      -machine type=vexpress-a15 -serial mon:stdio \
> +      -drive if=sd,driver=file,filename=armel-rootfs.ext4 \
> +      -kernel zImage  \
> +      -dtb vexpress-v2p-ca15-tc1.dtb \
> +      -append "console=ttyAMA0 root=/dev/mmcblk0 ro"
> 


