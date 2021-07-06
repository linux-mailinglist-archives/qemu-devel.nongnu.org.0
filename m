Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32A43BD7E6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:39:07 +0200 (CEST)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lI3-0001gc-29
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0lGJ-0000BI-KB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0lGD-0000S8-Ee
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625578632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gw3XDlZDzB4iM2tGiaOzZyrNKe60PWQnmqbXvqEwTpc=;
 b=X9cHBCbEy8N4kNzfRDHllDiqRQh0zp4LIpx4WwHgkzaabY5uyi1LrBwkjpmZ3F4Yk8hK7F
 DBV1tJeAtMO81BSNvSZAbHOCB1oqNXAIUExyxnsgNGI5v5yrd/ZdGR/0cvgnOI9HsbiyAB
 K6VOUkJeOMreitu00nsvyoqlWDYFNYs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-rXi-1DgaPeuNE61T0wwK9A-1; Tue, 06 Jul 2021 09:36:34 -0400
X-MC-Unique: rXi-1DgaPeuNE61T0wwK9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 r5-20020a05600c35c5b029020fcaed9f61so615134wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gw3XDlZDzB4iM2tGiaOzZyrNKe60PWQnmqbXvqEwTpc=;
 b=fPuRqLBL9Ew/zNFWfNNSsRvC8PPhC5NOy3yNCAB/KMa6gB3jyDiRi+4P6E+634uTbY
 HduvGnYlSWG9OBNYkxMayP1RElHyuIAYzUZhfHv9SbGuY5alwxuqIIuRHINDdE5NKogj
 Zit6kCqrQoBUPJ4APXF5ty7SOfw7QcyDtrpOhTuOhUBbyxI9TNnov5lzkkaktU3BiooE
 mXvRPygCcuTmXcbQlonNwpzew8/TT37YGyxuvJrgWr1EiaJ/O5qVckQFpELhtVHsxDbx
 2gwMojUDC4aOgb6FBmnbub9dPIEDXV06jTMwrYTFOkXxs3YaZbdPHyv74Lo7DUWaObnm
 6yNw==
X-Gm-Message-State: AOAM532PslPK1nIaqUKloFeoBPwpuDP7pS1jXbpedQz1Hqamsxuxq7xQ
 nhrxYllp0beJIuwgH5TGVvVwmhWyBk9TX5pr3GL7Urjbu5xl2JK7MYWARwa8W/llXteQ/9w49a8
 DNW7ssiBu6vpOTuU=
X-Received: by 2002:a05:6000:10:: with SMTP id
 h16mr21621891wrx.367.1625578495309; 
 Tue, 06 Jul 2021 06:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKATTprRWu+jpVW4HNTTAbEZRXgGAkg0HXROpdiAntGEjQoH4Yt5wYP7WOJYytGTA3e+zhNg==
X-Received: by 2002:a05:6000:10:: with SMTP id
 h16mr21621879wrx.367.1625578495170; 
 Tue, 06 Jul 2021 06:34:55 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n20sm15254526wmk.12.2021.07.06.06.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:34:54 -0700 (PDT)
Subject: Re: [PATCH v5 3/4] avocado_qemu: Add SMMUv3 tests
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, crosa@redhat.com, wainersm@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-4-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc5d8c32-4014-96aa-73cd-da0c4d41a59a@redhat.com>
Date: Tue, 6 Jul 2021 15:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706131729.30749-4-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 3:17 PM, Eric Auger wrote:
> Add new tests checking the good behavior of the SMMUv3 protecting
> 2 virtio pci devices (block and net). We check the guest boots and
> we are able to install a package. Different guest configs are tested:
> standard, passthrough an strict=0. This is tested with both fedora 31 and
> 33. The former uses a 5.3 kernel without range invalidation whereas the
> latter uses a 5.8 kernel that features range invalidation.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> 
> ---
> 
> v4 -> v5:
> - Added the skipIf statement (William) and William's R-b
> - added Wainer's R-b and T-b
> ---
>  tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 tests/acceptance/smmu.py

> +    def run_and_check(self):
> +        if self.kernel_path:
> +            self.vm.add_args('-kernel', self.kernel_path,
> +                             '-append', self.kernel_params,
> +                             '-initrd', self.initrd_path)
> +        self.launch_and_wait()

IIUC above is the 'run' part and below is the 'check' part?

So the check succeed if the VM booted, right?

> +        self.ssh_command('cat /proc/cmdline')
> +        self.ssh_command('dnf -y install numactl-devel')
> +
> +
> +    # 5.3 kernel without RIL #
> +
> +    def test_smmu_noril(self):
> +        """
> +        :avocado: tags=smmu_noril
> +        :avocado: tags=smmu_noril_tests
> +        :avocado: tags=distro_version:31
> +        """
> +        self.common_vm_setup()
> +        self.run_and_check()


