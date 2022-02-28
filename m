Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245A4C62D3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 07:14:01 +0100 (CET)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOZIG-0005vN-JA
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 01:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOZG6-0004Ny-Ix
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 01:11:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOZG3-0001Nd-Gd
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 01:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646028702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CrqjBb/AS7k7kucE06zFyEYWzakbbY7PUPAwap9wHA=;
 b=TSm5OSKBOHOyqqLxf1wQ/+WjXXGFx564hOKwvw8tWh5UjUqg9dIVZkobva6Rj+XkzffybI
 azLbu+TrGSrrd9Dd7EZuh8zxxl3Yuoa71qMO1YMKpIvjinlc9Hwc9CZQfuH+qAJNGIV8ya
 oWNUrtyiLt/DhSkVyJ5NqRvXUL7uG0g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-sWFORS8qNXWtfEeGyaNEIQ-1; Mon, 28 Feb 2022 01:11:39 -0500
X-MC-Unique: sWFORS8qNXWtfEeGyaNEIQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 o22-20020a1709061d5600b006d1aa593787so4692329ejh.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 22:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3CrqjBb/AS7k7kucE06zFyEYWzakbbY7PUPAwap9wHA=;
 b=7x9MQOyr8LE3qccPAODvwCqaBclH38Dx41mCNbCbO7HkWQfW5JMaeVhGeSzsgfVU7R
 TuqZz/4FEFKCO8Q8BUlLT0ZXipxqYHU2aokymlM+z7nU2lSpEf/jv1YjdFkNC9lWJuO4
 +ohyZ0+bw0xBj/hNVFmGHVAA6jZenRDopeuc3yJnb3bsKkSAlUAWHHR+i2tTsUyNWpBv
 TcgYZT1TuSlNrIXZBp2DuDMZOFGRmrKcTLo58hRRsH/7SwKjN3iTnw25h0XQvFGTdlcx
 WCS3Gguu+I7eB0xr1jkTp0RE/OESVEjB0CBMxao5H3R9R9H8PY33aN4ylIKMy6LPJdOi
 8PzQ==
X-Gm-Message-State: AOAM531FpPZca0E94FirRGa/gT94ggCu2/OIQA9XFu5OcTTu57Cgp6CN
 on6E26yrZqdPlSai64hIgI3jeLZNHUMU6HXZH097OkwoBZv5fmvGLsP1pAgJA6jRy5jBkjUFKyQ
 7vOJXK/kF0xVrYT8=
X-Received: by 2002:a17:907:369:b0:6cf:d106:acae with SMTP id
 rs9-20020a170907036900b006cfd106acaemr13829196ejb.456.1646028698292; 
 Sun, 27 Feb 2022 22:11:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0Xc8XQngiEJiA2Lo6adkBDeAgmR1zZkMv9kYHphudO++7cv+FQkf4j3X/az840W4BcOvM1Q==
X-Received: by 2002:a17:907:369:b0:6cf:d106:acae with SMTP id
 rs9-20020a170907036900b006cfd106acaemr13829159ejb.456.1646028698026; 
 Sun, 27 Feb 2022 22:11:38 -0800 (PST)
Received: from [192.168.8.104] (tmo-069-218.customers.d1-online.com.
 [80.187.69.218]) by smtp.gmail.com with ESMTPSA id
 j8-20020aa7c348000000b0040decce18bcsm5425569edr.98.2022.02.27.22.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 22:11:37 -0800 (PST)
Message-ID: <c7bf77e1-f803-3a99-c381-87a6cabb9a70@redhat.com>
Date: Mon, 28 Feb 2022 07:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] Avocado: bump to version 95.0
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-5-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220225210156.2032055-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/2022 22.01, Cleber Rosa wrote:
> Even though there have been a number of improvements (and some pretty
> deep internal changes) since Avocado 88.1, only one change should
> affect "make check-avocado".
> 
> With the nrunner architecture, test execution happens in parallel by
> default.  But, tests may fail due to insufficient timeouts or similar
> reasons when run under systems with limited or shared resources.  To
> avoid breakages, especially on CI, let's keep the serial execution
> until proven that it won't impact the CI jobs.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/Makefile.include | 1 +
>   tests/requirements.txt | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index e7153c8e91..676aa0d944 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -135,6 +135,7 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>               $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>   			--filter-by-tags-include-empty-key) \
>               $(AVOCADO_CMDLINE_TAGS) \
> +            --nrunner-max-parallel-tasks=1 \

Could you maybe change it so that it uses the "-jX" setting from "make" 
instead? ... that way the users could decide whether they want to run the 
tests in parallel or not.

I think you could get that value from the MAKEFLAGS env variable, see 
tests/check-block.sh :

JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')


  Thomas


