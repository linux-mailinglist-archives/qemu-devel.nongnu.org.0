Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B86E5A1F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 09:09:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pofSc-0002QH-W8; Tue, 18 Apr 2023 03:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pofSZ-0002Pj-7s
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:09:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pofSX-0000gi-3o
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 03:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681801739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22dpBZ/es5dYLRuL3XTv1UeK13/Glq2y5Hey+BLej6Y=;
 b=dNVSc8EyiXhEMHKRoGjAaMkitU5hoZtR21trfIb1vHaD/wqJCsHNwaqtREdGNR2+bLrJGJ
 UQSBGqIBLx2F/sczuB3z33f4030dGDVOry+cOQknzg8RjlO/9ebLO4n2KItBKEkHXZQTtj
 BuFMeBHYIGDNhHgeNbqppRhTafdmZAU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-pJeKyghzOCG9b1toRzb4_w-1; Tue, 18 Apr 2023 03:08:01 -0400
X-MC-Unique: pJeKyghzOCG9b1toRzb4_w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2efbab2e7ffso653568f8f.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 00:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681801675; x=1684393675;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=22dpBZ/es5dYLRuL3XTv1UeK13/Glq2y5Hey+BLej6Y=;
 b=b4Z3o+F+YWCrN61mmeaSaHKW/cp7v+hv9asY4kU+sgrYA9KCAQsaR8GfGZTMM+Jta1
 sKdQZ3qWf4bDEJjFXm0t4K/xzFEIiCkZ64kj7VFYgXQHBqKcQMwFjHCBRzcVWbpfGR0T
 SM5vL+jHtdDGQLKBlKpBGxwPq2FmIltBCESf/NHhqySMPSV7sBhnFMjR4gd6LkEVo/V8
 ylmweBmia/wQqbhpKL+tTjefVgtqXv14wClcGwKtTX31jDMMm9FZ1q40HQCc/Nko9kK0
 G1bVWYl5iGGO0UyJHoYkKhmWGgS06lWDtqjUMuBbgaraD8e0EOyFjNUplTOZvP9DiZiS
 xj+g==
X-Gm-Message-State: AAQBX9eMkigCkxJ7vFrwYOuKF8z4/GDobmS+pQ/ak80+GwB71BaSZ6h8
 emPT46hNjQdJhC4Q21C8TFwc4AEHvF4KsxE7+eUyVZXCTsNEXT/NJx1nFgWg6boX7Gdv+PVMHrf
 5aUbx3+ozWwumiag=
X-Received: by 2002:adf:fa01:0:b0:2f7:30d0:8f5b with SMTP id
 m1-20020adffa01000000b002f730d08f5bmr888751wrr.71.1681801675741; 
 Tue, 18 Apr 2023 00:07:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZeAjyOHgSYXg3/tnApklDwQUMljOjXqpx2bvCv6c8U748K0Q86oQ3TSR49cI74jpZ2oybxVA==
X-Received: by 2002:adf:fa01:0:b0:2f7:30d0:8f5b with SMTP id
 m1-20020adffa01000000b002f730d08f5bmr888738wrr.71.1681801675461; 
 Tue, 18 Apr 2023 00:07:55 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 s9-20020a5d6a89000000b002cf1c435afcsm12322946wru.11.2023.04.18.00.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 00:07:54 -0700 (PDT)
Message-ID: <78ed2ee0-8e80-c73c-1d4d-81215d8c3e6a@redhat.com>
Date: Tue, 18 Apr 2023 09:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230418055333.126623-1-kconsul@linux.vnet.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/avocado/tuxrun_baselines.py: improve code coverage
 for ppc64
In-Reply-To: <20230418055333.126623-1-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 18/04/2023 07.53, Kautuk Consul wrote:
> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for ppc
> decreased by around 2%. As per the discussion on
> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> was mentioned that the baseline test for ppc64 could be modified
> to make up this 2% code coverage. This patch attempts to achieve
> this 2% code coverage by adding various device command line
> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> test-case.
> 
> The code coverage report with boot_linux.py, without it and finally
> with these tuxrun_baselines.py changes is as follows:
> 
> With boot_linux.py
> ------------------
>    lines......: 13.8% (58006 of 420997 lines)
>    functions..: 20.7% (7675 of 36993 functions)
>    branches...: 9.2% (22146 of 240611 branches)
> Without boot_linux.py (without this patch changes)
> --------------------------------------------------
>    lines......: 11.9% (50174 of 420997 lines)
>    functions..: 18.8% (6947 of 36993 functions)
>    branches...: 7.4% (17580 of 239017 branches)
> Without boot_linux.py (with this patch changes)
> -----------------------------------------------
>    lines......: 13.8% (58287 of 420997 lines)
>    functions..: 20.7% (7640 of 36993 functions)
>    branches...: 8.4% (20223 of 240611 branches)
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 98 ++++++++++++++++++++++++++++++-
>   1 file changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> index d343376faa..cb17602c94 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -308,7 +308,7 @@ def test_ppc64(self):
>           """
>           :avocado: tags=arch:ppc64
>           :avocado: tags=machine:pseries
> -        :avocado: tags=cpu:POWER8
> +        :avocado: tags=cpu:POWER10
>           :avocado: tags=endian:big
>           :avocado: tags=console:hvc0
>           :avocado: tags=tuxboot:ppc64
> @@ -316,19 +316,113 @@ def test_ppc64(self):
>           :avocado: tags=extradev:driver=spapr-vscsi
>           :avocado: tags=root:sda
>           """
> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
> +                         '-device', 'virtio-net,netdev=vnet')
> +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> +                         '-device', '{"driver":"virtio-net-pci","netdev":'
> +                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'

The patch looks already fine to me as it is, but in case you'd want to 
increase test coverage even a little bit more, you could add some lines that 
reads out the MAC address again from the /sys fs in the guest to check that 
it matches the one that has been specified here. See 
tests/avocado/machine_s390_ccw_virtio.py as an example, we're doing it for 
the s390x machine there already.

 > +        process.run('./qemu-img create -f qcow2'
 > +                    '/tmp/tuxrun_baselines_ppc64le.qcow2 1G')

Please clean up temporary files after the test has finished.
Also it might be necessary to randomize the file name to make it possible 
that multiple instances of the test can be run in parallel.

  Thomas


