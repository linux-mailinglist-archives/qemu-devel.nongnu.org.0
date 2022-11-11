Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD38625636
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 10:07:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otPzN-0000AS-Na; Fri, 11 Nov 2022 04:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otPzJ-00009a-37
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:06:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otPzH-0001Zk-Hl
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668157570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Txr9ALSUUpHKpTwiy+1dKCuGvO3IIw+5/2/MMuhpjg=;
 b=ayJ0cB4L9m8GnxK5qNSALTpajMwuUsClM4CMu/2cB58YHFqMRdi8rtR5dypmB5nwV+6KtT
 qcCCe5XYCqGrAWYRrlsdBSWN2YeGgb0kEVFBWCDikZWUPaoazOKnZCbviQfnvgHuYhwS6s
 ZwUoFtljpTTBW/u24Sak53MCKBAOZTU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-9qNhJEYXMFmuQtD7oeTKyA-1; Fri, 11 Nov 2022 04:06:09 -0500
X-MC-Unique: 9qNhJEYXMFmuQtD7oeTKyA-1
Received: by mail-qk1-f200.google.com with SMTP id
 w4-20020a05620a444400b006fa24b2f394so4297081qkp.15
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 01:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Txr9ALSUUpHKpTwiy+1dKCuGvO3IIw+5/2/MMuhpjg=;
 b=HM/klSGklEH+CgxfwEuQc0Bx67zB0miatFe1nX0nIuqo6PC8IkvPFxfw+CWfksi5wm
 7vPZf1KW8mQ29UksnSPOK3G2p8REO1CrUzt936IN0AIql7DPyFhhLOR9KVl7FP6wJ8Gc
 t6HCCnUX86yDkn0K24UPI5mKtxG/4BfRboGiQhZXHvF9bmjswe58YIHxDzE2vy6oRYT1
 xTszP4YTgVBaWbW4WCr2r9xPZZNU2fKeqnP/aGT9W9NXPY6wkiYhHI5zUHjg6riXzWba
 6X7h7boRV+PhKBIFK7f3nNO4zSBtWuzbyZNaBVPQE+hjOlgskfAwWMfaoJhwH6Ar/B42
 Vjdg==
X-Gm-Message-State: ANoB5pmKbTdIEvKBhkSwLlmuaeX2Ard00IMOuVrD7S+D1656Bl4pKJYL
 JqYz6goDv7KFXRFGnP5tSdEgCnp15kfliLHtBiBZ1cn0/WtYvuMcmTwEXMgqfv2xrF9ZJTyUEZx
 jYBuSu17/xoo++WI=
X-Received: by 2002:ac8:7752:0:b0:3a5:26a5:51ee with SMTP id
 g18-20020ac87752000000b003a526a551eemr521278qtu.84.1668157569028; 
 Fri, 11 Nov 2022 01:06:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf72qx9Skl/Fpp1D9XeTI/hsjvcs6CrzfUCJSi4JPd+/XrpAz56G43pGnONKB2lFVSWupP+BWA==
X-Received: by 2002:ac8:7752:0:b0:3a5:26a5:51ee with SMTP id
 g18-20020ac87752000000b003a526a551eemr521269qtu.84.1668157568792; 
 Fri, 11 Nov 2022 01:06:08 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a249300b006fb38ff190bsm952519qkn.34.2022.11.11.01.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 01:06:08 -0800 (PST)
Message-ID: <8bd0cd78-0a69-0e0e-e764-0375ff627fd8@redhat.com>
Date: Fri, 11 Nov 2022 10:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] acpi/tests/avocado/bits: some misc fixes and spelling
 corrections
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20221111085221.1216196-1-ani@anisinha.ca>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221111085221.1216196-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 11/11/2022 09.52, Ani Sinha wrote:
> Most of the changes are cosmetic. The bits test timeout has now been increased
> to 90 seconds in order to accommodate slower systems and fewer unnecessary
> failures. One spelling correction in docs along with removal of the reference
> to non-existent README file.
> 
> CC: Thomas Huth <thuth@redhat.com>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   docs/devel/acpi-bits.rst   | 3 +--
>   tests/avocado/acpi-bits.py | 5 +++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> index c9564d871a..a9020adb2d 100644
> --- a/docs/devel/acpi-bits.rst
> +++ b/docs/devel/acpi-bits.rst
> @@ -41,7 +41,6 @@ Under ``tests/avocado/`` as the root we have:
>      │ │ ├── smbios.py2
>      │ │ ├── testacpi.py2
>      │ │ └── testcpuid.py2

That leaves the second "|" dangling around ... should those second pipe 
characters now be removed, too?

> -   │ └── README
>      ├── acpi-bits.py
>   
>   * ``tests/avocado``:
> @@ -132,7 +131,7 @@ Under ``tests/avocado/`` as the root we have:
>   
>      (a) They are python2.7 based scripts and not python 3 scripts.
>      (b) They are run from within the bios bits VM and is not subjected to QEMU
> -       build/test python script maintainance and dependency resolutions.
> +       build/test python script maintenance and dependency resolutions.

FWIW, this will also be fixed by Stefan Weil's current pending doc update patch.

>      (c) They need not be loaded by avocado framework when running tests.
>   
>   
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a76..5ebe8c14a2 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
>           self._vm.launch()
>           # biosbits has been configured to run all the specified test suites
>           # in batch mode and then automatically initiate a vm shutdown.
> -        # sleep for maximum of one minute
> -        max_sleep_time = time.monotonic() + 60
> +        # sleep for maximum of a minute and a half to accomomodate even slower

s/accomomodate/accomodate/

> +        # test setups.
> +        max_sleep_time = time.monotonic() + 90
>           while self._vm.is_running() and time.monotonic() < max_sleep_time:
>               time.sleep(1)
>   

  Thomas


