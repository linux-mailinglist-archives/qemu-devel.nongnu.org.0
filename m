Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9126F5CB7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:08:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFxs-00080q-Sa; Wed, 03 May 2023 13:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puFxL-0007rk-A9
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:07:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puFxH-0002zL-Qd
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683133671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GeVRbKnFuCP+4OhTYPMW6U5K3oMVVY5MPo/dWXJMRdw=;
 b=cZVFBf/olPsjndCFWfq/0w5vQOcBqNzGRBHK4dYI0oNb8BsdB4VoNnUYnZXcR45B2vaNY/
 RQpnNpHTv/p9CnKL8FXywZVo6uZnPI0gCMlG7pyEzrG6/8euMpstLfPXrQj/ybuQZJ/nSI
 2N4K3P3I4vXD0ZyQTFG7kKYTPL2Lj0E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-dDcUZ3qLNquj4tIzjHvvrQ-1; Wed, 03 May 2023 13:07:49 -0400
X-MC-Unique: dDcUZ3qLNquj4tIzjHvvrQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a348facbbso658601166b.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683133668; x=1685725668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GeVRbKnFuCP+4OhTYPMW6U5K3oMVVY5MPo/dWXJMRdw=;
 b=dnfSk/PGHhFYPLHtsxWdIBeubCJ/4OlpPW+o3SAT6OqWECAEbnYRhyKFyGiwS1zKLo
 I5s/uQhJiRtmNO2TkTPaEfRXSbH0KAkJZEpHguvI5+YrWMgHX/GgFeSG2CiaBCFlSAGI
 /crBM2uZWFD8bDIChN/GZ6Q3SyrYK9F9DC/ZebSI7zejm7XJCnIv2X+GeW11YEfF5Y0k
 wqSLbJLBh4ZYUppNTG9ihiol1vQE2SaO9DwjD4TKqFVYCSfOHQELIDh9iczeRA2JiwLN
 /chLmvZJptffIh/Oy6OFPms2jFy6/+8D26vlq+/ncOjsxQV5MTAShWKSIMtdmWjGbp3b
 gX/A==
X-Gm-Message-State: AC+VfDyFEpqlhAsIJfaSpyk4sv1wlAzVQ66MJ6Ym0cZs75z2AYZ6oaVe
 riO3HnN2QF9Uwo/Y7qhKGElwoI3aZVFVAok6f4J8q8xtNSlraxONR7uPARcmrn6uxYhDbOBzU5h
 5ujl2Z+/ELrFlZaU=
X-Received: by 2002:a17:907:789:b0:958:4c5d:7dd2 with SMTP id
 xd9-20020a170907078900b009584c5d7dd2mr3532348ejb.72.1683133668350; 
 Wed, 03 May 2023 10:07:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7STaLxCGcxJItnHaVGnSTJ5UaoX38BOCV4UBHkabGUEmNHGdv31jmVseOaaKhMk19kZ3BscA==
X-Received: by 2002:a17:907:789:b0:958:4c5d:7dd2 with SMTP id
 xd9-20020a170907078900b009584c5d7dd2mr3532308ejb.72.1683133667923; 
 Wed, 03 May 2023 10:07:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 q15-20020a056402032f00b0050bfa1905f6sm553649edw.30.2023.05.03.10.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:07:47 -0700 (PDT)
Message-ID: <5c480805-ffe9-22e7-b543-85d7e2cb5799@redhat.com>
Date: Wed, 3 May 2023 19:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 07/22] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102
 machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-8-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/3/23 11:12, Alex Bennée wrote:
> From: Fabiano Rosas <farosas@suse.de>
> 
> This machine hardcodes initialization of the USB device, so select the
> corresponding Kconfig. It is not enough to have it as "default y if
> XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
> disables the default selection resulting in:
> 
> $ ./qemu-system-aarch64 -M xlnx-zcu102
> qemu-system-aarch64: missing object type 'usb_dwc3'
> Aborted (core dumped)
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230208192654.8854-8-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   hw/usb/Kconfig | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)

This one is correct: "-M xlnx-zcu102 -nodefaults" has a usb_dwc3 device.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 168c1e8089..cec7898bb7 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -439,6 +439,7 @@ config XLNX_VERSAL
>       select OR_IRQ
>       select XLNX_BBRAM
>       select XLNX_EFUSE_VERSAL
> +    select XLNX_USB_SUBSYS
>   
>   config NPCM7XX
>       bool
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index ce4f433976..0ec6def4b8 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -136,5 +136,4 @@ config USB_DWC3
>   
>   config XLNX_USB_SUBSYS
>       bool
> -    default y if XLNX_VERSAL
>       select USB_DWC3


