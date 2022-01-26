Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4549C9BD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 13:32:55 +0100 (CET)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nChTq-0000Rd-Ct
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 07:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nChRV-0007Ji-KL
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:30:29 -0500
Received: from [2a00:1450:4864:20::630] (port=35827
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nChRT-0003sH-8O
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:30:29 -0500
Received: by mail-ej1-x630.google.com with SMTP id s5so38603200ejx.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 04:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7vGCzUobSetru7RGXX/4Zwru6QRMwWkcRcEYx4djq7Q=;
 b=XjOKkR5bFQff5CnWxnKwLQU/ryEUXW7gwipCw7oxYXnwdtHDAOZqVRAc+r13lRZ02R
 nXxnB82Jz7XzS97MGkCtaufLCeaKc+bp/ViHI2rso0JZCrLMxeDH42ofPIOsBJtiaAio
 ao8P0l4TL4MNd6vRlOXlw+irnNuTD2s57SzCmD0ComcW/kCic2QtggF4qlB/KydS/w5q
 NrlVM7/ZPq+Ad9/gZ/zd7c6Jax4dYWT95kgeB1CGS11M4Ki3O4NcF89y5u/0TnFDjTQn
 9Eib8JljdNcekLE6mWEFCvXM/LClZyl1Mw3k8JNX0GfLkBkJmOc4EkCdQbIILhVXtiNt
 p1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7vGCzUobSetru7RGXX/4Zwru6QRMwWkcRcEYx4djq7Q=;
 b=Dy7h5L9tlctBmfWj1RYE1Nz9OLWj8xJScJDx/NdVJzRQmaIb38hz7rKd2bLnmoFjl/
 O1T46L6lU2lMOgZf8xuszMkihRY3bR6bL6ImB3NJi8ippJ8yTjmAGzhs7HRhzolF6qhs
 Jf6qTCpVoWEv3uiZ4s+m3ciKNR7LFRgbjkbJ1OsPgeeqB8vwrpAQIqqukqnyaLzpT+Wo
 2Gva8+24uH7wK8EYV3pVKLqHGzqe/8psEGVLV3IBk+v0qoB31cNEWfOyswPOhOKyy4jy
 F8+yoFKw7WuSz79Wc0Vv26OtwsllgUBfDZMipOxyF0mYVkXpak9cujnNu1hH2tCsUuAy
 Yk+Q==
X-Gm-Message-State: AOAM533UfCps1uxpXgQCn7OraebFYSMJ5VN0Kv1IXeSojdJQgwpGTFBX
 hTxpOawuMza5NcHaLjoIxNEsHA==
X-Google-Smtp-Source: ABdhPJwjmPoBp6/sIRkU8gkVpcXeK0RDtYnX9fLvwkViDPEMua8MaU7sxGcEqJC/uAphRfG1/kALTw==
X-Received: by 2002:a17:907:a41f:: with SMTP id
 sg31mr11483690ejc.472.1643200221864; 
 Wed, 26 Jan 2022 04:30:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k4sm9270052edo.55.2022.01.26.04.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 04:30:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC3B71FFB7;
 Wed, 26 Jan 2022 12:30:19 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-32-Jonathan.Cameron@huawei.com>
 <87o83zd99r.fsf@linaro.org> <20220125181313.0000209c@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Paolo Bonzini
 <bonzini@gnu.org>
Subject: Re: [PATCH v4 31/42] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Date: Wed, 26 Jan 2022 12:24:02 +0000
In-reply-to: <20220125181313.0000209c@huawei.com>
Message-ID: <87fspad6hw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> On Tue, 25 Jan 2022 17:15:58 +0000
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>>=20
>> > This adds code to instantiate the slightly extended ACPI root port
>> > description in DSDT as per the CXL 2.0 specification.
>> >
>> > Basically a cut and paste job from the i386/pc code.=20=20
>>=20
>> This fails to build on all machines:
>>=20
>>   FAILED: qemu-system-mips64el=20
>>   c++ -m64 -mcx16 -o qemu-system-mips64el
<snip>
>> /usr/lib/x86_64-linux-gnu/libssh.so -lstdc++ -Wl,--end-group
>>   /usr/bin/ld: /lib/x86_64-linux-gnu/libtirpc.so.3: warning: common of `=
rpc_createerr@@GLIBC_2.2.5' overridden by definition from /lib/x86_64-linux=
-gnu/libc.so.6
>>   /usr/bin/ld: libcommon.fa.p/hw_pci-host_gpex-acpi.c.o: in function `ac=
pi_dsdt_add_gpex':
>>   /home/alex/lsrc/qemu.git/builds/all/../../hw/pci-host/gpex-acpi.c:191:=
 undefined reference to `build_cxl_osc_method'
>>   collect2: error: ld returned 1 exit status
>>   [1600/2203] Linking target qemu-system-or1k
<snip>
>> > @@ -175,7 +187,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXCo=
nfig *cfg)
>> >                              cfg->pio.base, 0, 0, 0);
>> >              aml_append(dev, aml_name_decl("_CRS", crs));
>> >=20=20
>> > -            acpi_dsdt_add_pci_osc(dev);
>> > +            if (is_cxl) {
>> > +                build_cxl_osc_method(dev);=20=20
>>=20
>> Either we need an #ifdef gate on CONFIG_ACPI_CXL
>
>  error: attempt to use poisoned "CONFIG_ACPI_CXL"

Hmm I'm not sure why that happened. We generally poison symbols to stop
making configuration changes objects that are shared between binaries. I
guess softmmu_ss must be shared then. Paolo?

>
>> or possibly a stub
>> implementation (with a g_assert_not_reached()).
> That works.
>
> Turns out I was too lazy thinking riscv was enough to exercise the
> not CXL support case.
>
> Lesson learned - mips64el now in my standard config :)
> I'd not realized there were ACPI supporting MIPS machines...

It's worth making sure your gitlab account is setup to run the CI loop
because it's the first thing I do when I review a series ;-)

  https://gitlab.com/stsquad/qemu/-/pipelines/456700583

--=20
Alex Benn=C3=A9e

