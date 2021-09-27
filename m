Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF461419D21
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:42:06 +0200 (CEST)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUudh-0005TU-3Y
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUuJk-0007L8-60
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUuJi-00011t-EN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632763283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYS9X0SHSir8I2bPIiTWsBxCKw8cjXE3FPvhc4DxlPc=;
 b=fIgPxp4NOmpwIoUaCT+KCPi/CxRwUV1Jis6Y3O0qg/qCUVslO80IEtsxzN1QtyslPM7xji
 0W7ajyWvFfPYOleMD/bmFuENmuDThqDu03BQ/5SiqPF+uWhG781tM6zORuwigszXpGxYiu
 c+tfcdFkka9ZQSc0cTUopukI7dfQCu8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-cgSYBjgfNa6vatFKVsBHiw-1; Mon, 27 Sep 2021 13:21:21 -0400
X-MC-Unique: cgSYBjgfNa6vatFKVsBHiw-1
Received: by mail-wr1-f70.google.com with SMTP id
 c8-20020adfef48000000b00160646ed62cso2724847wrp.18
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GYS9X0SHSir8I2bPIiTWsBxCKw8cjXE3FPvhc4DxlPc=;
 b=yEyq1WFnURvrsPuNsbhOq//BqarQxaCP1Bc63YLR8nGrl0hn1xVT7TQxEYyyu7XDIo
 gaAH2xIS9VWdkEWJBh/AtI5nwhU1B9W6dnShg/MnskHpJBZol9LcMCOg0cITnkiZqk42
 LLR2ZlU/rRfARuE6exI8XWP7ri71+/CBxkBabUElNeRPQNQSbKEsjBDQnKeNE0vzUNL1
 a6boTltaBP8wF1VHFhTGFCNpNSb9xOxRBJvcA3iOVhJwuGZtV+GRGgHvEtCXC1pyLcN1
 xDx5O+i8iBSFe/ADQjZNa8GXKjZB+CbSdYBQLaRWYdv+pH7OH5pQL0VZaVW230wXYJlJ
 0tpA==
X-Gm-Message-State: AOAM53001TUD8bregtG//cvs/UBEL6MvWq3mVz3AdsMBySpy7FBHx6LE
 tX7Ig7NiYUlRBkW6yU1kXQLuAc190iDOoYs6r1wL70gVVnCyLXDJs2FP0to5qd63D9+KaeBe6LR
 CVCQLvRH6vqhHAZE=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr1152547wrr.332.1632763280445; 
 Mon, 27 Sep 2021 10:21:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6b7BQ1mlpyuLCvccH2aVL2DbjTPWoDgL/gL9hrUgKOBiImjgBAcDFLXFWEsv/n/4s2ClQrQ==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr1152539wrr.332.1632763280299; 
 Mon, 27 Sep 2021 10:21:20 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z12sm3657523wrv.31.2021.09.27.10.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 10:21:19 -0700 (PDT)
Message-ID: <e6bc86e3-1141-9f05-fba3-3319d97583a2@redhat.com>
Date: Mon, 27 Sep 2021 19:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] tests/acceptance: Test powernv machines
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210817093036.1288791-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210817093036.1288791-1-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 11:30, Cédric Le Goater wrote:
> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
> with a simple PCI layout.
> 
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>  Since v2:
> 
>  - Change the skiboot.lid file to use the one shipped with QEMU
>  
>  tests/acceptance/boot_linux_console.py | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 5248c8097df9..59c9309c4d0b 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1176,6 +1176,41 @@ def test_ppc64_e500(self):
>          tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>          self.do_test_advcal_2018('19', tar_hash, 'uImage')
>  
> +    def do_test_ppc64_powernv(self, proc):
> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
> +
> +        kernel_url = images_url + 'zImage.epapr'
> +        kernel_hash = '0ab237df661727e5392cee97460e8674057a883c5f74381a128fa772588d45cd'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash,
> +                                       algorithm='sha256')
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', 'console=tty0 console=hvc0',
> +                         '-device', 'pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0',
> +                         '-device', 'nvme,bus=pcie.2,addr=0x0,serial=1234',
> +                         '-device', 'e1000e,bus=bridge1,addr=0x3',
> +                         '-device', 'nec-usb-xhci,bus=bridge1,addr=0x2')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern("CPU: " + proc + " generation processor")
> +        self.wait_for_console_pattern("zImage starting: loaded")
> +        self.wait_for_console_pattern("Run /init as init process")
> +        self.wait_for_console_pattern("Creating 1 MTD partitions")
> +
> +    def test_ppc_powernv8(self):
> +        """
> +        :avocado: tags=arch:ppc64
> +        :avocado: tags=machine:powernv8
> +        """
> +        self.do_test_ppc64_powernv('P8')
> +
> +    def test_ppc_powernv9(self):
> +        """
> +        :avocado: tags=arch:ppc64
> +        :avocado: tags=machine:powernv9
> +        """
> +        self.do_test_ppc64_powernv('P9')
> +
>      def test_ppc_g3beige(self):
>          """
>          :avocado: tags=arch:ppc
> 

Kinda borderline w.r.t. 90 sec timeout limit... (using --enable-debug):

JOB ID     : 5229c34e837b7b6de18c68115b07f0eebc446784
JOB LOG    :
/home/phil/avocado/job-results/job-2021-09-27T19.15-5229c34/job.log
 (1/3)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc64_e500:
PASS (6.58 s)
 (2/3)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:
PASS (80.38 s)
 (3/3)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:
PASS (89.22 s)
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 176.84 s

You might want to increase the per-test timeout.

Meanwhile,

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

and applied to my integration-testing tree.


