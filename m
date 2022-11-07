Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE0B61F3C3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:53:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1bx-0000rx-3V; Mon, 07 Nov 2022 07:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os1bu-0000n5-MO
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:52:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os1bi-0002oo-7E
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667825524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Ah/iJ/kXDsEHvhYfE/Y1LLlqoupaNyfc+PzSLyC5Z0=;
 b=ZB8oSYk1BJKjMa7wsCLhkWg0PbpscHiPkKwkpW2X2D0wJrcp+B8itpnuGxmj77lN+v5rCy
 GicHY5Wj9N4yJWL/vI3cuClwHj8dhmRXu5DoDNVfD7T2o/4FWymrUiDyNcKPspVzM9Somz
 qOomxrAbcodfjHRpJigWboNeRR8OMio=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-XL3gDSFVPn2VvKw6qej2WQ-1; Mon, 07 Nov 2022 07:52:03 -0500
X-MC-Unique: XL3gDSFVPn2VvKw6qej2WQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so2750944wra.22
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 04:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Ah/iJ/kXDsEHvhYfE/Y1LLlqoupaNyfc+PzSLyC5Z0=;
 b=WSGzJ/K3uywoe54RT+HS7glhoj0iOnIVkOjruZaETxm2h0GEx5ijZL6W2Co1lxhcwQ
 a+dlgUXeu8EQlcKgWhWy31PfHHA/Q4aw2+TxyVBb3TIoPB5ZyRCG0A+G7gzvYFqqNpy6
 JUXIH9tt/KfC1kzunb3A3xTghpBgPFTZIAM9Kuewp+3UfS3SyupXBmCaiskxdpQAlrDa
 LTP0srDDtL3M5q4tJGE/xYvkoPwawNbURSs4t4eAhzhUReynLEeyFuHBT4FfN5eGOkiG
 DSro2BqLwklbzI6yJ2VTWlMmHKiTs8uQ5uu043/bS27M7sgkWX79YWDZsLm1WoH5tbP3
 4nhA==
X-Gm-Message-State: ACrzQf1pVL7DptBzMCxmYIUfMPwhkScKyFT8A3V1rPT7WMu3Vq99j0vq
 dWG+5M/kdZZvpiOfwOnYu7iPDcsXfC1fP5yWbFBnfItO4jXi9jDqQMAcjtVsB8cqHs6f0GPWzHc
 B+Bj6tx6Dkg52BVg=
X-Received: by 2002:adf:d226:0:b0:235:d9ae:1de9 with SMTP id
 k6-20020adfd226000000b00235d9ae1de9mr32288741wrh.599.1667825521960; 
 Mon, 07 Nov 2022 04:52:01 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5xkF5Ee9Wli3Yz1G8FMazNx3NGIlJPf+oLpEOswVGe1N2tuNdy1H+3eya8Pb5wxIFjcrS7jg==
X-Received: by 2002:adf:d226:0:b0:235:d9ae:1de9 with SMTP id
 k6-20020adfd226000000b00235d9ae1de9mr32288728wrh.599.1667825521626; 
 Mon, 07 Nov 2022 04:52:01 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 s12-20020adfeb0c000000b0023657e1b980sm7348571wrn.53.2022.11.07.04.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 04:52:00 -0800 (PST)
Date: Mon, 7 Nov 2022 07:51:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL v3 50/81] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
Message-ID: <20221107075038-mutt-send-email-mst@kernel.org>
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-51-mst@redhat.com>
 <CAG4p6K64=LmX75NP4mYX7OFrSqKxsh3nVBzguOj3GvxbH1NwuQ@mail.gmail.com>
 <CAARzgwzau9EjyMmxX6AZG+Z+DT5oOaKBAH0QgZVJtu5LTM3nEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwzau9EjyMmxX6AZG+Z+DT5oOaKBAH0QgZVJtu5LTM3nEg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Nov 07, 2022 at 02:06:23PM +0530, Ani Sinha wrote:
> On Mon, Nov 7, 2022 at 3:18 AM Bernhard Beschow <shentey@gmail.com> wrote:
> >
> >
> >
> > On Sat, Nov 5, 2022 at 6:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>
> >> From: Igor Mammedov <imammedo@redhat.com>
> >>
> >> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >> Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
> >> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >> ---
> >>  tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
> >>  1 file changed, 34 insertions(+)
> >>
> >> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> >> index dfb8523c8b..570b17478e 100644
> >> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> >> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> >> @@ -1 +1,35 @@
> >>  /* List of comma-separated changed AML files to ignore */
> >> +"tests/data/acpi/pc/DSDT",
> >> +"tests/data/acpi/pc/DSDT.acpierst",
> >> +"tests/data/acpi/pc/DSDT.acpihmat",
> >> +"tests/data/acpi/pc/DSDT.bridge",
> >> +"tests/data/acpi/pc/DSDT.cphp",
> >> +"tests/data/acpi/pc/DSDT.dimmpxm",
> >> +"tests/data/acpi/pc/DSDT.hpbridge",
> >> +"tests/data/acpi/pc/DSDT.hpbrroot",
> >> +"tests/data/acpi/pc/DSDT.ipmikcs",
> >> +"tests/data/acpi/pc/DSDT.memhp",
> >> +"tests/data/acpi/pc/DSDT.nohpet",
> >> +"tests/data/acpi/pc/DSDT.numamem",
> >> +"tests/data/acpi/pc/DSDT.roothp",
> >> +"tests/data/acpi/q35/DSDT",
> >> +"tests/data/acpi/q35/DSDT.acpierst",
> >> +"tests/data/acpi/q35/DSDT.acpihmat",
> >> +"tests/data/acpi/q35/DSDT.applesmc",
> >> +"tests/data/acpi/q35/DSDT.bridge",
> >
> >
> > +"tests/data/acpi/q35/DSDT.core-count2"
> >
> > ... and probably in more patches down the road.
> 
> Yes I am seeing this failure too:
> 
> 68/600 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test
>                    ERROR          39.95s   killed by signal 6 SIGABRT
> >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon MALLOC_PERTURB_=138 G_TEST_DBUS_DAEMON=/home/anisinha/workspace/qemu-ani/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-x86_64 /home/anisinha/workspace/qemu-ani/build/tests/qtest/bios-tables-test --tap -k
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> ✀  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> acpi-test: Warning! DSDT binary file mismatch. Actual
> [aml:/tmp/aml-ARFCV1], Expected
> [aml:tests/data/acpi/q35/DSDT.core-count2].
> See source file tests/qtest/bios-tables-test.c for instructions on how
> to update expected files.
> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-NTFCV1.dsl,
> aml:/tmp/aml-ARFCV1], Expected [asl:/tmp/asl-15QEV1.dsl,
> aml:tests/data/acpi/q35/DSDT.core-count2].
> **
> ERROR:../tests/qtest/bios-tables-test.c:533:test_acpi_asl: assertion
> failed: (all_tables_match)



My bad. BTW we should probably teach checkpatch that if
an expected file is modified then it has to be dropped
from allowed diff list in the same patch.


> 
> 
> >
> > Best regards,
> > Bernhard
> >
> >> +"tests/data/acpi/q35/DSDT.cphp",
> >> +"tests/data/acpi/q35/DSDT.cxl",
> >> +"tests/data/acpi/q35/DSDT.dimmpxm",
> >> +"tests/data/acpi/q35/DSDT.ipmibt",
> >> +"tests/data/acpi/q35/DSDT.ipmismbus",
> >> +"tests/data/acpi/q35/DSDT.ivrs",
> >> +"tests/data/acpi/q35/DSDT.memhp",
> >> +"tests/data/acpi/q35/DSDT.mmio64",
> >> +"tests/data/acpi/q35/DSDT.multi-bridge",
> >> +"tests/data/acpi/q35/DSDT.nohpet",
> >> +"tests/data/acpi/q35/DSDT.numamem",
> >> +"tests/data/acpi/q35/DSDT.pvpanic-isa",
> >> +"tests/data/acpi/q35/DSDT.tis.tpm12",
> >> +"tests/data/acpi/q35/DSDT.tis.tpm2",
> >> +"tests/data/acpi/q35/DSDT.viot",
> >> +"tests/data/acpi/q35/DSDT.xapic",
> >> --
> >> MST
> >>
> >>


