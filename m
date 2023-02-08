Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB468E4CA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:10:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY2A-0001fv-Ow; Tue, 07 Feb 2023 19:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY24-0001Uc-Ru
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:09:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY20-0000AO-RE
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:09:51 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso252742wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jIiUU75Atj8qa3gMrpLh2yn5nh9Mk7q/+OnYQS1E7a4=;
 b=Kt232GgHN4T6AWPc0WSU22AJ21/nmoA7g7P+PeC91n7/N/x2a5SSFKas4QhjLrKwqy
 ci2JTex7SD4RuUUYqMTLtW31NNA2arKll401miXg+18sO94PC3RVVZCnHDHxgu990qVq
 JPuTJKv2uea43x1QwLsnOuC8ALGtK9i+IvkZAOY7WWOnJu8X/wK2Tzeb7Tke823qXVoP
 Ercd25fZ9dGKH7zug6uu2bShWMV6+cNP5h7JL5dnwzKpawPK5Qw0VtNn0gQsNesDKVHP
 g2kilboYrFlmMT8V3lN62VtsAqzk35QyEOf4Y/qdG+/eF7eAuHj37WMUbEj99T3F5ASd
 qGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jIiUU75Atj8qa3gMrpLh2yn5nh9Mk7q/+OnYQS1E7a4=;
 b=4bs92qVGBg4h6VLJBgVm2M9bwiFrbQUoQD5nZ24dfjro3DkwMtb/3A1byOCBgs2Dfb
 fvAXRCMEEi4ksBDeOQ2OFd4x/KHetOUOUVbyAAvlhF1gjWWvnM+L7KLRHzcNyMXnSvds
 BPl6YNf6AtAHPBJdLmlmkiZfaYnTvkW+aKAC4jZdn44BwM5gX7LdvR5Vlx/3PsrfKK7P
 /6Emod7pDHv3n4HGVk+OI91GtgF13ooefXcmsoJawKQavPa09KdzEvtrNbNY6TnHX/eT
 4crfEz1IP2qvrCvDHIZ4iZTUN24cb9I3CRICnMX+qT1dfjdJfGcyBbDZUWzHv0iRqDGU
 il4g==
X-Gm-Message-State: AO0yUKVfFnB1VxcHzcxz1mV9k+BRqSRL1VFFMK1tpqG82JKS/6V+kymi
 efPqVyBItL7Nfi1nLGqajb1yzkzfTvYIC9UT
X-Google-Smtp-Source: AK7set/lFy3/8oARS4wfjy0PTWSSqZXDH8Q2T3caqYqnKKMtVZP/uXoCav/xnOdI5qAPn5jknmdJhg==
X-Received: by 2002:a05:600c:44c9:b0:3df:f9e9:7600 with SMTP id
 f9-20020a05600c44c900b003dff9e97600mr4676841wmo.25.1675814986672; 
 Tue, 07 Feb 2023 16:09:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a5d4907000000b002c3e306d3eesm7938417wrq.17.2023.02.07.16.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 16:09:46 -0800 (PST)
Message-ID: <b8d9ef38-5831-61e8-b9a4-3d4c1b642c65@linaro.org>
Date: Wed, 8 Feb 2023 01:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/7] hw/ide: Untangle ISA/PCI abuses of ide_init_ioport()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208000743.79415-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/2/23 01:07, Philippe Mathieu-Daudé wrote:
> Background thread:
> https://lore.kernel.org/qemu-devel/5095dffc-309b-6c72-d255-8cdaa6fd3d52@ilande.co.uk/
> 
> The ide_init_ioport() method expect an ISA device, but is
> massaged to accept NULL device (IOW, non-ISA devices...).
> 
> A plausible explanation is QOM objects can only inherit one
> parent, and ide_init_ioport() was first used with ISA children.
> Later it was adapted to accept PCI children in a convoluted
> way. The PIIX IDE function abuse it.
> 
> This series rename the current ide_init_ioport() as
> ide_init_ioport_isa(), then add a generic ide_init_ioport()
> which works with PCI devices.
> 
> This is required to proceed with more PIIX cleanups.
> 
> Philippe Mathieu-Daudé (7):
>    hw/isa: Un-inline isa_bus_from_device()
>    hw/isa: Use isa_address_space_io() to reduce access on global 'isabus'
>    hw/ide: Rename ISA specific ide_init_ioport() as ide_init_ioport_isa()
>    hw/ide: Introduce generic ide_init_ioport()
>    hw/ide/piix: Use generic ide_init_ioport()
>    hw/isa: Assert isa_register_portio_list() gets non-NULL ISA device
>    hw/ide/piix: Remove dead code in pci_piix_init_ports()

Forgot:
Based-on: <20230207234615.77300-1-philmd@linaro.org>
"exec/ioport: Factor portio_list_register[flush_coalesced]() out"
https://lore.kernel.org/qemu-devel/20230207234615.77300-1-philmd@linaro.org/



