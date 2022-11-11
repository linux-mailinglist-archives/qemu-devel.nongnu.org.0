Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F9625D2A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otV8P-0006Td-GK; Fri, 11 Nov 2022 09:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otV8L-0006Rl-Ps
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otV8J-0002Lg-Vh
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668177351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsmCv2BbGsN+hnWYT5US87KLmw0xJJ+vOk8xhTGZwWY=;
 b=UJ5aN8qwII7ZytqmRvRsY0AbwnjZ2vXz7kAVVkNiZULQjjuLGnPxXlWEt847h8mWI5yKml
 sb9LTekKK0boKJAA+OSI+8SvIwsfgoDmEUHVD7bYOdSqsP/ntMLQZs7WuCqclr0BNn5Gqo
 Z1/C0g0mZZloUuAPk786Fc98N9FRizk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-sCGanKq4NJeYsr7Lfml-kg-1; Fri, 11 Nov 2022 09:35:49 -0500
X-MC-Unique: sCGanKq4NJeYsr7Lfml-kg-1
Received: by mail-wr1-f70.google.com with SMTP id
 j25-20020adfa559000000b0023d5d7f95a2so1070682wrb.21
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tsmCv2BbGsN+hnWYT5US87KLmw0xJJ+vOk8xhTGZwWY=;
 b=h1N9BztLtEhxGD2LlGaiGIOQYCYrj5Gh5muRppoLBlVXCilLaJRsvVcnPdSKpEnkqH
 sccd96y8C18sj/6bbGJub8cbhJGV6aJTvUZ0LluDIxBJ7WzxlYEym49lbqRwNY6WKBkC
 7jJuIe+XmhPtDT98gMCJf+vpXVU1J70HOnEUQz8V70+I/yxdfRfEdPARQOGZX4FIz+mw
 MEnKUiAS06XByk3n3QhRXiJx+e35OSnM/hRmXO6XSYpdEYSc4hqhSN9VS+lxSKaHG1U1
 GTBxFE1fKdwoIFvQnKEjiRfnXUzLLqdmjLP05vJKlYfXamkjZ/ecch9XimRIBQdHMr7a
 0BCQ==
X-Gm-Message-State: ANoB5pl05MVzrbGo0lMF5gM/+HmqQITawVkQ6XKNKHSTO+1jUHDZd/Kg
 jd3y7QJdRx+D9orbgXI9a8TF26VaW5Qw3nfaB32Zsswel3sUPRd/slpWRaovRtIW33i0rIUv+t3
 Jp/k2yvPTPaxNQ2w=
X-Received: by 2002:a5d:61c7:0:b0:22e:39c9:a4a6 with SMTP id
 q7-20020a5d61c7000000b0022e39c9a4a6mr1445622wrv.170.1668177348766; 
 Fri, 11 Nov 2022 06:35:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf49JD7w5BvVoyuGTTkI3cyOM1Hy/ohchJ4P7Ia/LW+HRWPHJpCr6ft6UQ9NfwZaFhdQ1y9rag==
X-Received: by 2002:a5d:61c7:0:b0:22e:39c9:a4a6 with SMTP id
 q7-20020a5d61c7000000b0022e39c9a4a6mr1445610wrv.170.1668177348562; 
 Fri, 11 Nov 2022 06:35:48 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b0023660f6cecfsm2057721wrv.80.2022.11.11.06.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:35:48 -0800 (PST)
Date: Fri, 11 Nov 2022 09:35:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: some misc fixes
Message-ID: <20221111093255-mutt-send-email-mst@kernel.org>
References: <20221111123108.1231451-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221111123108.1231451-1-ani@anisinha.ca>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Nov 11, 2022 at 06:01:08PM +0530, Ani Sinha wrote:
> Most of the changes are trivial. The bits test timeout has now been increased
> to 110 seconds in order to accommodate slower systems and fewer unnecessary
> failures. Removed of the reference to non-existent README file in docs.
> 
> CC: Thomas Huth <thuth@redhat.com>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

You need to pick a tree through which work on these
will be merged.
If it's my pc/pci tree you need to add that to MAINTAINERS
so I get to see the patches.


> ---
>  changed from v1: address Thomas' suggestions.
> 
>  docs/devel/acpi-bits.rst   | 7 +++----
>  tests/avocado/acpi-bits.py | 5 +++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> index c9564d871a..2c776ab166 100644
> --- a/docs/devel/acpi-bits.rst
> +++ b/docs/devel/acpi-bits.rst
> @@ -38,10 +38,9 @@ Under ``tests/avocado/`` as the root we have:
>     │ ├── bits-config
>     │ │ └── bits-cfg.txt
>     │ ├── bits-tests
> -   │ │ ├── smbios.py2
> -   │ │ ├── testacpi.py2
> -   │ │ └── testcpuid.py2
> -   │ └── README
> +   │   ├── smbios.py2
> +   │   ├── testacpi.py2
> +   │   └── testcpuid.py2
>     ├── acpi-bits.py
>  
>  * ``tests/avocado``:
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a76..2edc36fc26 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
>          self._vm.launch()
>          # biosbits has been configured to run all the specified test suites
>          # in batch mode and then automatically initiate a vm shutdown.
> -        # sleep for maximum of one minute
> -        max_sleep_time = time.monotonic() + 60
> +        # sleep for maximum of a minute and 50 seconds in order to accommodate
> +        # even slower test setups.
> +        max_sleep_time = time.monotonic() + 110
>          while self._vm.is_running() and time.monotonic() < max_sleep_time:
>              time.sleep(1)
>  
> -- 
> 2.34.1
> 
> 
> 


