Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F061F361
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1Jp-0005ph-Ah; Mon, 07 Nov 2022 07:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os1JP-0005nJ-Df
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os1JN-0004uh-TH
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667824388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qXQ66Gr8tY2SOTEHfKbPW93rZmJegTN7u4FmfKYGPw=;
 b=GfMrpUWEejok2trDaYtnI23RNNNuJc5fTiJVPZH8+GuHMkOeHCex57SguvYWAjzYZ5NgTx
 YFoF1jJOtfK0L2nssazesdudL7v+RyrPEB83PFccgwbAfcFrRzZZTVSoqzEHB17/te4vei
 HNlCkZGQkdZqJ9zhBfgU3IsageB6UFc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-q0MSwcTWOPOyhGFTwYpRjA-1; Mon, 07 Nov 2022 07:33:05 -0500
X-MC-Unique: q0MSwcTWOPOyhGFTwYpRjA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso2720196wrb.18
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 04:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3qXQ66Gr8tY2SOTEHfKbPW93rZmJegTN7u4FmfKYGPw=;
 b=XzE7JoKPfhkaW4h3iTj7QZ27Ifxur1KsHLu0aUU+wJ3FBCFSqzEyLL30B+atSisQ4B
 /taadeDmMW6jsG8+C5G4HYdfc/AP0Gi/nfLay3su9j9jlCMXTvGZnTCdgv40NtrcywTL
 pB2Mge9uutNGHaZhs+10hMagatAtKgzYCUAHzXHQLMngbBgrX5UsQJETbu3UBn5c3kW8
 Az+yWaJ97QAq0l+9M2mIjCD5rrdmzxbNoA5C6y2nBNuTxRu869xhxdUiyPI66G9EUj2x
 9mRr0iZsxVYN5thkKqf327xKC735P/XFrC/xHLAOKwUGeGHB/A7swXC2kvtVzh3Dd4Tf
 6e1g==
X-Gm-Message-State: ACrzQf1HD6nkyVL5Sj+FE4xda8PZmaTcRo9zzbM3d4KtclV24L+7picq
 LHrBBN/sql5LRZC2cG8ece9mNMYc+W7gDPB3hJ7c9qptC0OJPchsauHFzx5NAV4feBIFI0cMlPF
 +61MGyHDWFn7WDUE=
X-Received: by 2002:a5d:5257:0:b0:236:8a38:4e08 with SMTP id
 k23-20020a5d5257000000b002368a384e08mr31073427wrc.118.1667824384556; 
 Mon, 07 Nov 2022 04:33:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM63WGrnWWPz8tf20PUMrcLbmG+5QMXOh3HOUAaiKDWuJ5H9KaGylAiFUMVSgoz5xV0s5VCF/A==
X-Received: by 2002:a5d:5257:0:b0:236:8a38:4e08 with SMTP id
 k23-20020a5d5257000000b002368a384e08mr31073411wrc.118.1667824384295; 
 Mon, 07 Nov 2022 04:33:04 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 b10-20020a05600c4e0a00b003cf6a55d8e8sm8315305wmq.7.2022.11.07.04.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 04:33:03 -0800 (PST)
Date: Mon, 7 Nov 2022 07:32:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PULL v3 49/81] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
Message-ID: <20221107073158-mutt-send-email-mst@kernel.org>
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-50-mst@redhat.com>
 <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
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

On Sun, Nov 06, 2022 at 10:16:41PM +0100, Bernhard Beschow wrote:
> 
> 
> On Sat, Nov 5, 2022 at 6:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     From: Igor Mammedov <imammedo@redhat.com>
> 
>     Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>     Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>     NB: we do not expect any functional change in
>     any ACPI tables with this change. It's only a refactoring.
> 
>     Reviewed-by: Ani Sinha <ani@anisinha.ca>
>     ---
>      hw/display/vga_int.h       |  2 ++
>      hw/display/acpi-vga-stub.c |  7 +++++++
>      hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
>      hw/display/vga-pci.c       |  4 ++++
>      hw/i386/acpi-build.c       | 26 +-------------------------
>      hw/display/meson.build     | 17 +++++++++++++++++
>      6 files changed, 57 insertions(+), 25 deletions(-)
>      create mode 100644 hw/display/acpi-vga-stub.c
>      create mode 100644 hw/display/acpi-vga.c
> 
> 
> With this "qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test" fails due to
> the symbol "aml_return" being undefined:
> 
> # starting QEMU: exec ./qemu-system-hppa -qtest unix:/tmp/qtest-515650.sock
> -qtest-log /dev/null -chardev socket,path=/tmp/qtest-515650.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -vga none -device virtio-vga -accel
> qtest
> ----------------------------------- stderr -----------------------------------
> Failed to open module: qemu/build/qemu-bundle/usr/lib/qemu/
> hw-display-virtio-vga.so: undefined symbol: aml_return
> qemu-system-hppa: -device virtio-vga: 'virtio-vga' is not a valid device model
> name
> Broken pipe
> ../src/tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process
> but encountered exit status 1 (expected 0)
> 
> (test program exited with status code -6)
> 
> Best regards,
> Bernhard

It's unfortunate that it doesn't reproduce for me :(
what's the system config look like?

-- 
MST


