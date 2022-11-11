Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F2625B75
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otUP4-0001vC-1J; Fri, 11 Nov 2022 08:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otUP1-0001ki-FK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otUOz-0002Gp-TM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668174541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=syLR1zyciTjJrOwgO3ABUDtAgzJbNH5vtuERySzP8ZQ=;
 b=DC2EA0K5YxhVw5sAKDoxXfOq3NiCrFSzeMOV1BvzLgg2ecDEm+jzPGeC0ATKWuR8fZvU6x
 9gZIG4ptyi6ElKEabEQIjEHmN7CjFIujALMA5Vx7bXCbCWSdfpMLrBMUIQqvmPzb7VWIeh
 JAfol9kG8wMmIH8SJzYOKcfLnIMv1B0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-GimeEtqjP4e9FDmSKCEaeA-1; Fri, 11 Nov 2022 08:43:20 -0500
X-MC-Unique: GimeEtqjP4e9FDmSKCEaeA-1
Received: by mail-qk1-f198.google.com with SMTP id
 bj1-20020a05620a190100b006fa12a05188so4767061qkb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 05:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=syLR1zyciTjJrOwgO3ABUDtAgzJbNH5vtuERySzP8ZQ=;
 b=J8Z/uM1jscz7YaZC1REx42AwPhKc9UeDAzdDz7+IRjnG6x2+9D72mMGN6G8Mz90tr1
 YyyiXJ0zwEO6Np23CV213Fzk6oWOQgwOdK+RNGTmebtcq7WEOvICwVNVysm0R0cGZY2z
 A/TiBMH3lARFSL6orHugOdbW7X/qqHXkpM4XH75EToqvyFuIt1wi0w4p4ZA33ToiSDfv
 fJF5mo3CSf2NqqsvRwz0UHqaO67gsXubnudrxxhMuOSCSty8LHLEIKh4WCqskFIdwcUu
 jjDjLYifo3zUOObKoXIRlNo873ncBJYUx0swFk/uDQ2EseuWFwrZzcSTNfFALKYgrg37
 CgMQ==
X-Gm-Message-State: ANoB5pmXnIPXfW0EsJcIT4xJmMGzJy8NqHZaxdauIoIYt83gCCfiRnse
 lfTxL+/mu9yBEWsj8VShes9UyZfcW7gWdoRB5Wab5HbtuZ+1MgmxNjf+6hcE1/sEY3L6atVBpYk
 EwResIHm8XdXlz1U=
X-Received: by 2002:ad4:536c:0:b0:4ad:68f8:1183 with SMTP id
 e12-20020ad4536c000000b004ad68f81183mr1892302qvv.49.1668174200255; 
 Fri, 11 Nov 2022 05:43:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4zeXw4CRGgKrb31jD+h2tdsJszXTKeOiKMJZ3Ua19AZ9P6YUUXn0I0W0Sl00kpeFuAkXQpAA==
X-Received: by 2002:ad4:536c:0:b0:4ad:68f8:1183 with SMTP id
 e12-20020ad4536c000000b004ad68f81183mr1892291qvv.49.1668174200045; 
 Fri, 11 Nov 2022 05:43:20 -0800 (PST)
Received: from [192.168.8.102] (tmo-100-234.customers.d1-online.com.
 [80.187.100.234]) by smtp.gmail.com with ESMTPSA id
 q6-20020a37f706000000b006ed61f18651sm1441797qkj.16.2022.11.11.05.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 05:43:19 -0800 (PST)
Message-ID: <7d7f6f77-63bd-2a32-19a3-6f9e09089ffd@redhat.com>
Date: Fri, 11 Nov 2022 14:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: some misc fixes
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221111123108.1231451-1-ani@anisinha.ca>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221111123108.1231451-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/11/2022 13.31, Ani Sinha wrote:
> Most of the changes are trivial. The bits test timeout has now been increased
> to 110 seconds in order to accommodate slower systems and fewer unnecessary
> failures. Removed of the reference to non-existent README file in docs.
> 
> CC: Thomas Huth <thuth@redhat.com>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   changed from v1: address Thomas' suggestions.
> 
>   docs/devel/acpi-bits.rst   | 7 +++----
>   tests/avocado/acpi-bits.py | 5 +++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> index c9564d871a..2c776ab166 100644
> --- a/docs/devel/acpi-bits.rst
> +++ b/docs/devel/acpi-bits.rst
> @@ -38,10 +38,9 @@ Under ``tests/avocado/`` as the root we have:
>      │ ├── bits-config
>      │ │ └── bits-cfg.txt
>      │ ├── bits-tests
> -   │ │ ├── smbios.py2
> -   │ │ ├── testacpi.py2
> -   │ │ └── testcpuid.py2
> -   │ └── README
> +   │   ├── smbios.py2
> +   │   ├── testacpi.py2
> +   │   └── testcpuid.py2

Thanks, that looks better now!

>      ├── acpi-bits.py
>   
>   * ``tests/avocado``:
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a76..2edc36fc26 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
>           self._vm.launch()
>           # biosbits has been configured to run all the specified test suites
>           # in batch mode and then automatically initiate a vm shutdown.
> -        # sleep for maximum of one minute
> -        max_sleep_time = time.monotonic() + 60
> +        # sleep for maximum of a minute and 50 seconds in order to accommodate
> +        # even slower test setups.
> +        max_sleep_time = time.monotonic() + 110
>           while self._vm.is_running() and time.monotonic() < max_sleep_time:
>               time.sleep(1)
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

(I sent my "misc fixes" pull request already, sorry ... I hope this can go 
via qemu-trival or another branch instead)


