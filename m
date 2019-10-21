Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5CEDF3C8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 19:06:41 +0200 (CEST)
Received: from localhost ([::1]:45700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMb8P-0002kc-Kp
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 13:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMb6l-0001GS-FC
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMb6k-0004H0-EH
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:04:39 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMb6k-0004Gd-63
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:04:38 -0400
Received: by mail-pf1-x441.google.com with SMTP id q5so8786545pfg.13
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sk2t83DjkVWnrtVbQf47uSIW5xeeBnZ573CRkaV10g0=;
 b=S0Ku+pq5NlWbBoNo2FojBvVxjVFT8KjyO0EzQ1JMqCjGJBiaOxtCYVKfj00/CDGtCL
 Ze536vX9i8Ub9XXWEcQIStEfnOAgC6GmHACwstfl94FhSkUENCiYSjH/fDgJmsTLsvYC
 lbWu/haXJqQFsa7zvliY4LI58lPWjuTsYCi/6IHSL6sb2E/C4pPXj2KSmp41tm6caG68
 WHAYktSXFRhcEb5G3SqlH7bpFFXb7EBkHeaCfVDfKwrJq+JS1XKKvaKMpV0+Y39zLnk1
 Z6RHNsjiBMNijSlizPwu9pUQXwL1qpO2ZFcuQTw+oc4TN6lJkVK+CNEg0uiuQg26qYw7
 9GCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sk2t83DjkVWnrtVbQf47uSIW5xeeBnZ573CRkaV10g0=;
 b=DJNHOX/D2TmmXfL0imnyptKiSqi9kwaTVgXwRT3o6DsewV1gCAcMhr44z3gEyN/+tq
 1YqrN0QlWXR6JFyqUkeJgoS8s6Pzg7JlQCpkCoPH1vO+C6TXXt74GmDZwTHeMFqJQ/ms
 /GhMm2cPL3wHamBFxtVzLU1a9DAXy7+rDhJS8o++jZCshMuCdVoWKdTbo1RsAWWjqqgr
 sYVpLvKpLBPhjOSpR2vp25D+WEDkhpR4fnlfUwCkBXe7yPhrZoDgV49oeBiols8qOTCm
 sOB+J+IJoXNw6rLPzVcNIc0qpz5caM/8S97xFrXuk8Z5AexqQrefkUdmMae6c9Qej70c
 xbVg==
X-Gm-Message-State: APjAAAVOWcz018CW1K5jz/z4T38gzdBCSjRHnIxWZfs8zIuEFX9Qvskh
 sZAsvJaABIt6iGl7UcR8O38Jrw==
X-Google-Smtp-Source: APXvYqxlbxQO5DONqV4XwcPtgzRUI9gs88526kuUY4KJ1RGOtY+sdrwah6fdbmQfWtH7xGtbjeN88w==
X-Received: by 2002:a65:64da:: with SMTP id t26mr26521521pgv.180.1571677476828; 
 Mon, 21 Oct 2019 10:04:36 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s3sm14619998pjq.32.2019.10.21.10.04.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:04:36 -0700 (PDT)
Subject: Re: [PATCH 06/21] hw/arm/digic4: Inline digic4_board_setup_ram()
 function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2c557278-8696-3e6b-31ef-00850f48a224@linaro.org>
Date: Mon, 21 Oct 2019 10:04:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Having the RAM creation code in a separate function is not
> very helpful. Move this code directly inside the board_init()
> function, this will later allow the board to have the QOM
> ownership of the RAM.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/digic_boards.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

