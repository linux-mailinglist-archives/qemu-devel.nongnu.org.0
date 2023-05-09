Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D896FC5B8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:01:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwM0y-0008A8-Pw; Tue, 09 May 2023 08:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwM0l-00089d-OI
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwM0j-0005Sq-L7
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683633604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eruX1xU0kSyUmT6Iz9QvGjV36rpRjfCr5CWvM8poI4=;
 b=T4/+4T0ZOyCUuvQsy1Bn65RMjaDuIT0utOZAQIlDSDZrMBjDrizfuc1eTGT477W4uocxXR
 gTia6eabjjaCAjCJejViU3AFj74UIG5MYCuvl3H9xDtAUGELlUoRDxNhQiD5py4xZ9As6L
 u+3WMBoaDpwkI8nG5/yS7E8LC+9F1zw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-4I5lLG9wMgq1hiol8gWM3w-1; Tue, 09 May 2023 07:59:31 -0400
X-MC-Unique: 4I5lLG9wMgq1hiol8gWM3w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-965cd056598so640246666b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 04:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683633570; x=1686225570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9eruX1xU0kSyUmT6Iz9QvGjV36rpRjfCr5CWvM8poI4=;
 b=jmy3PyAmkTPeFnNL71BZO6tzzKDvYHml3Fwj74MtoAdGGq/UmVPpOgxVxCMAMn4BNo
 qGvm2jSQNhN1CspZ35JHY5qnPg2kyulGiyuc7OW+g9fDryMJQdv4UkhmdgcvjV2sKUfs
 01055bg89qeUnF7TrolKaYO/8QgmKSgeXwGqmzIu99rtPqJYy1NrGJyT2B3pFyBQpm6/
 NgYF8d6+nMEUXI3txfHExFci7gAtPrIJyKurELgjJeene7GtTCqF3fWrBzliuKqCBAKW
 dasqjpgVjuZREFpKNltqntL8Sb/M4X0PtdiyhSlhBqDxjgB9eKw1RCtXUPNHY6Mfvtei
 6u2g==
X-Gm-Message-State: AC+VfDy44uhkXWQJx7y7Zl5IXxIwrhUOSp7jtQEbpyMERqF8BVPfwgwE
 Imep2+MNedtuqoUUjsu1bdrsBddt+W9UxnZ9fff2YKbhVirOl0d2V8Qg+YH/1edYtLYuhwy7gbX
 BuqUVuFMpaVMsb1M=
X-Received: by 2002:a17:907:96ac:b0:948:a1ae:b2c4 with SMTP id
 hd44-20020a17090796ac00b00948a1aeb2c4mr14233137ejc.6.1683633570032; 
 Tue, 09 May 2023 04:59:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ544JYtH8LpCO9uuM42FYSV20eB2pwuXTIgsc0QbKXijndLrZGQZvwXLkOGnE34jXV3w6qs3Q==
X-Received: by 2002:a17:907:96ac:b0:948:a1ae:b2c4 with SMTP id
 hd44-20020a17090796ac00b00948a1aeb2c4mr14233115ejc.6.1683633569647; 
 Tue, 09 May 2023 04:59:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ev21-20020a17090729d500b00965b416585bsm1259833ejc.118.2023.05.09.04.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 04:59:29 -0700 (PDT)
Message-ID: <bfde137b-3cb6-319b-2e94-57457531e855@redhat.com>
Date: Tue, 9 May 2023 13:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
 <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
 <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
 <70da6b28-d731-7e3b-b5a6-7d9983389d57@redhat.com> <878rdxbuoe.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <878rdxbuoe.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/9/23 13:37, Alex Bennée wrote:
>> Then, an accurate description that uses "functional" in that sense
>> could be as follows:
>>
>> The Kconfig system will include any devices and subsystems that are
>> mandatory for a given machine type, and will flag any configuration	
>> conflicts. However, the person doing the configuration still needs to
>> know which devices are needed (on top of the mandatory ones) to obtain
>> a functional guest, and Kconfig will not provide any hints in this
>> respect.
>
> So I thought that was the model I was following in adding devices but it
> seems I don't understand the no-defaults behaviour. What is the
> difference between a device that is added in the machine.c that makes it
> required or expendable with -nodefaults?

First of all let's look at softmmu/vl.c, which is what creates the 
backends of the default devices.  These backends are basically automatic 
command line options of the "old" kind that directs both the creation of 
a backend and how it's associated to a device.

For example, if you have neither a -serial option nor a "-device 
isa-serial" option, vl.c's qemu_create_default_devices() will create the 
machine as if you specified one of "-serial mon:stdio", "-serial stdio" 
or "-serial vc:80Cx24C"; if you have none of -netdev/nic/-net, it will 
literally add two "-net" command line options corresponding to "-net nic 
-net user"; and so on for many other devices unless the board opts out 
(CD-ROM, floppy, SD card, parallel).   There's also a default monitor 
which is a bit out of topic here.

In any case, the effect of these "old" command line options is to 
populate various arrays, for example serial_hds[] for serial ports and 
nd_table[] for NIC backends.

There are then two ways that a board can process these arrays.  It can 
either _always_ create the device and possibly leave it not connected to 
any backend, or it can create the device only if the backend exists. 
Looking at qemu-system-aarch64's "-M virt", pl011 is always created with 
create_uart(), i.e. even with "-nodefaults"; NICs instead are only 
created if the backend exists (search for "nd_table" in hw/arm/virt.c).

In the former case, the device will have to be select-ed in Kconfig.  In 
the latter case, instead, the device will have an "imply" directive, and 
will be left out by --without-default-devices.

Paolo


