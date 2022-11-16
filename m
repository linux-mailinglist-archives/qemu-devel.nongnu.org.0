Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515A162B998
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 11:43:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovFsM-0003Gx-5H; Wed, 16 Nov 2022 05:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovFsK-0003Go-KR
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 05:42:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovFsJ-0001vI-40
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 05:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668595354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYDtXMw5mEoHUxjRApVo/hir59WCTqlsdZ/f5OT4j+w=;
 b=L/Rt8Z95Qfhbah8ImXXGyLxNhIYs6VqT1bLwFfGw+HucFyNMPNYToG7/Tkw160p484GNr1
 cqDgdcEFKyEB1VVZQ9Na+nsEjFf0uYVNUQvqfRa3GGn8cFYn7icvUbU/M7Uytb9hD8wo/9
 nPO/UkfCqKGUCpGBGTj4iIKzNPF8cX0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-CT9s7RYRP4OECEf-jtexUA-1; Wed, 16 Nov 2022 05:42:32 -0500
X-MC-Unique: CT9s7RYRP4OECEf-jtexUA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y18-20020a056402359200b004635f8b1bfbso12088485edc.17
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 02:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYDtXMw5mEoHUxjRApVo/hir59WCTqlsdZ/f5OT4j+w=;
 b=RCyWPjCnlt4LDe3FMPMBRgRU+iTw6xBfnshaGfpKxQM58/4xHqHNqLV4aivla/rcgS
 w6v0Nmwjnw5NjlDnitvjd7hm3XrHw2nsP7dd+bcEAjS/zkG2M/LjlAmq/EqSP4jkOPUU
 z+nj2UGFOjdO69bUD7mmszIdt+WaeK8ctlV3BXiu1wHXRqsxhROxFoCtuUgDirqYbA8J
 3hkTFZYXtIfGIy525gjb8YnI9xOrWxklI5uO+2JRw2VNE4x4h5slVcGsO2PPsQ5hQM/f
 m6xSNvX8K20FWKYxxzLzhbxjZ9mzkngU2c2e3Xn3YhwWTGtmCj2/SYG+L39gVcIyDD9F
 W+8A==
X-Gm-Message-State: ANoB5pmor/Cva8UHdyNUZGKexiaqFgqAbE0mOnUV5Uu7WHWUCNwPZqhq
 lmlWW5q7h46OETEg8604CXymi+heFLgY1IKCOep02XWZ1gKO2gycITGmAbhhRaW8y2rInZ3s3tN
 Vteq8Yl2s7J7WdGQ=
X-Received: by 2002:a17:906:7ca:b0:7ad:934e:95d3 with SMTP id
 m10-20020a17090607ca00b007ad934e95d3mr17185930ejc.393.1668595351145; 
 Wed, 16 Nov 2022 02:42:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5pyaftb3Z2LQcSQ9JQSsADXO7WzAWNZQsCVnKJDaygn0iXjPjtoQO/hfU2d8v+ZJ94G1a90g==
X-Received: by 2002:a17:906:7ca:b0:7ad:934e:95d3 with SMTP id
 m10-20020a17090607ca00b007ad934e95d3mr17185915ejc.393.1668595350916; 
 Wed, 16 Nov 2022 02:42:30 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b0078a543e9301sm6566815eja.200.2022.11.16.02.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 02:42:30 -0800 (PST)
Date: Wed, 16 Nov 2022 11:42:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PULL v4 00/83] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221116114229.58683047@imammedo.users.ipa.redhat.com>
In-Reply-To: <8ab63a14-606e-0205-508e-2d0c6003f0fe@linaro.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <8ab63a14-606e-0205-508e-2d0c6003f0fe@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Tue, 15 Nov 2022 15:01:06 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Hi,
>=20
> On 7/11/22 23:47, Michael S. Tsirkin wrote:
>=20
> > ----------------------------------------------------------------
> > pci,pc,virtio: features, tests, fixes, cleanups
> >=20
> > lots of acpi rework
> > first version of biosbits infrastructure
> > ASID support in vhost-vdpa
> > core_count2 support in smbios
> > PCIe DOE emulation
> > virtio vq reset
> > HMAT support
> > part of infrastructure for viommu support in vhost-vdpa
> > VTD PASID support
> > fixes, tests all over the place =20
> Apparently unrelated to these fixes, but going from 6295a58ad1 to
> v7.2.0-rc0 triggered rebuilding ACPI files and I now get:
>=20
>   45/510 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test=20
>            ERROR          14.73s   killed by signal 6 SIGABRT
>   74/510 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test=20
>            ERROR          12.56s   killed by signal 6 SIGABRT
>=20
> Running manually:
>=20
> $ QTEST_QEMU_BINARY=3D./qemu-system-x86_64 tests/qtest/bios-tables-test
> ...
> # starting QEMU: exec ./qemu-system-x86_64 -qtest=20
> unix:/tmp/qtest-239233.sock -qtest-log /dev/null -chardev=20
> socket,path=3D/tmp/qtest-239233.qmp,id=3Dchar0 -mon=20
> chardev=3Dchar0,mode=3Dcontrol -display none -machine pc -accel kvm -acce=
l=20
> tcg -net none -machine smm=3Doff -drive=20
> id=3Dhd0,if=3Dnone,file=3Dtests/acpi-test-disk-QmvOOR,format=3Draw -devic=
e=20
> ide-hd,drive=3Dhd0  -accel qtest
> Could not access KVM kernel module: Permission denied
> qemu-system-x86_64: -accel kvm: failed to initialize kvm: Permission deni=
ed
> acpi-test: Warning! DSDT binary file mismatch. Actual=20
> [aml:/tmp/aml-Y06RV1], Expected [aml:tests/data/acpi/pc/DSDT.nosmm].
> See source file tests/qtest/bios-tables-test.c for instructions on how=20
> to update expected files.
> to see ASL diff between mismatched files install IASL, rebuild QEMU from=
=20
> scratch and re-run tests with V=3D1 environment variable set**
> ERROR:../../tests/qtest/bios-tables-test.c:533:test_acpi_asl: assertion=20
> failed: (all_tables_match)
> Bail out! ERROR:../../tests/qtest/bios-tables-test.c:533:test_acpi_asl:=20
> assertion failed: (all_tables_match)
> Aborted
>=20
> I blew/recreated my build directory and can reproduce.

it works for me with KVM and without it on RHEL 8.7 x86 host.
It looks like stale file (though you are saying that you've recreated direc=
tory)=20

>=20
> $ uname -sm
> Linux x86_64
>=20
> Any clue?

just to be sure can you make fresh tree clone and build that?

if that won't work, make sure you have IASL installed and run test
manually with V=3D1 env var, that should print diff on failure=20


