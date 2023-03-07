Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73936AE63D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:21:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZa3V-0008Ft-I2; Tue, 07 Mar 2023 11:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZa3M-0008Em-3i
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:20:42 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZa3K-0006c3-Ld
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:20:39 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g3so12704474wri.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678206037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ogb79LIPbQj7AnIUJcjlpLXSh96i3dhHEsugGh8lu/g=;
 b=gZSjOgEL/YmLtQ3LzLwco1TdfcBUA+fs1xzbUtvYDWdskjL3u0TL8Iqdp8XgXVKCWe
 VtvczOQNGRTioGy/lnqUJxpi3jwFVKWTjTQRQ2V1ZipfUv7msS8ttHBm0teE8/OtjM9z
 KokVfk+KZogwuqVCwuGGBr+bEUz9e0LzdmItZAeRZi3IN73GfKW9S/mC6MDCzfRYGBvy
 aFEzBsESbEeCqAuzXL+MNibwY4AAgfvCsXWG2kRcMRIeu04KUpnqKBZzxSK0BMMGcN0+
 2Mk//Plh/ghrxlzaaaLs818eYv2auPLrguxLy8S1BLXkeDZZE0kPKhTWCAcQeDJB4qvJ
 b1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ogb79LIPbQj7AnIUJcjlpLXSh96i3dhHEsugGh8lu/g=;
 b=KjUiJ2HVJ2rlijhARAOkH7Cp7Xb5fcxOUgTnU1d2ytaYGzaU2uNZmhmqxWomgW0hqa
 47w8V1N4e9+X4P88Rr4D78tk/CjT0rHrcpnvxhwYikpmhCBuM2ZhkwbQ1TcTNaKy3JeY
 9jj5H1y1fwphebQ2TLyk6otlJ48Hw8jTlqKfREok5DSk6AcXE1xN552fSID9qAL79lPU
 xl/wTZaheIuHDxd4swL3rDXSlGVoL5Vy0/Hxo74xWbOUJJ5zaaHhLsLZgzg7nAYtBS+U
 ybNfgB5pdsVmMoF/8TbXBDHD/735zjw+hkIRhevRNr3cgIbDhDPi4J3QfEQZbVgWk+dW
 vuPQ==
X-Gm-Message-State: AO0yUKUhshQYd2te42PtRN1hy9CIJ/yE6mj3NKp7R96NLgvuGy/riPVD
 lpHCRS4Pd09QGSu/LcLxiMMvOA==
X-Google-Smtp-Source: AK7set/it7fcct4R9uPKvEeCssN05s+cnjx0wle+5kfBmUa78tfl3cOoNbj6s//BEx7dZ/vw2i1+0g==
X-Received: by 2002:adf:e101:0:b0:2c7:1e43:e578 with SMTP id
 t1-20020adfe101000000b002c71e43e578mr9634704wrz.41.1678206036977; 
 Tue, 07 Mar 2023 08:20:36 -0800 (PST)
Received: from [192.168.248.175] (131.red-95-127-34.staticip.rima-tde.net.
 [95.127.34.131]) by smtp.gmail.com with ESMTPSA id
 z4-20020a056000110400b002ce3b31753fsm12008365wrw.26.2023.03.07.08.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:20:36 -0800 (PST)
Message-ID: <349bc5cc-65d6-6e65-2910-40a530f4cb47@linaro.org>
Date: Tue, 7 Mar 2023 17:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v9 0/7] Pegasos2 fixes and audio output support
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, ReneEngel80@emailn.de
References: <cover.1678188711.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cover.1678188711.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 12:42, BALATON Zoltan wrote:
> v9:
> - OK here it is again with a revert. *sigh*
> 
> BALATON Zoltan (5):
>    hw/display/sm501: Add debug property to control pixman usage
>    Revert "hw/isa/vt82c686: Remove intermediate IRQ forwarder"
>    hw/isa/vt82c686: Implement PCI IRQ routing
>    hw/ppc/pegasos2: Fix PCI interrupt routing
>    hw/audio/via-ac97: Basic implementation of audio playback
> 
> Bernhard Beschow (1):
>    hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
> 
> David Woodhouse (1):
>    hw/intc/i8259: Implement legacy LTIM Edge/Level Bank Select

Since Daniel reviewed, I'm queuing this via mips-next.

