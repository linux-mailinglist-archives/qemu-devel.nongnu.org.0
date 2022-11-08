Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D762127E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOmY-0001gZ-Rb; Tue, 08 Nov 2022 08:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1osOmW-0001fj-9I
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1osOmU-0006Qx-Oq
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667914605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+NcsWO5HOVuMnCzk2sSaIgcRHtoErnQJfGcplMNMX0=;
 b=BDWtTnewN66MAC9HTmwcub5CYw3tHH8xSTYUzGAUVCIKTdJk7mYs4VixNFpB4/fWBO2lqh
 aRQPvIXH+5hRyl6h3WYdhm/KUJzfukrdEJ+jnLvRLDr2zjNu1/AI6/FJx/xEiDqXssck98
 1rF/HggG+4C3GUpSC5wHtK79iUsbhvw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-r6gDCuirO_m71C0NwvVzJA-1; Tue, 08 Nov 2022 08:36:44 -0500
X-MC-Unique: r6gDCuirO_m71C0NwvVzJA-1
Received: by mail-ej1-f70.google.com with SMTP id
 nb1-20020a1709071c8100b007ae4083d6f5so5586255ejc.15
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+NcsWO5HOVuMnCzk2sSaIgcRHtoErnQJfGcplMNMX0=;
 b=rhzA/FdzW2Q7gqVQ/z+vygUxV4WbhfKC1uJqxfhhaJX+lKaP0KjsoAwfBE/+RNmIZn
 8KD+vmWGZ/czEQlZiMTfqe3HEIVoZtg/99soRSuJaguXciyhR3OM86J/dmlhGklPKATu
 rpidtJRa6UKlV8DIJ9F6pIeAXMRTuOyN0IOy/UrAvSbcWeoJcQnkECReV/eVBhM1M/P5
 CLmkDOxyR+685BFot1Kboduyf1dH47MR2/vQiDUqTUp5mySt5LKOuCRuEBpuYeg7hpyQ
 xJsXiqkw59CAalyFvgUgvtK6mDWAt8wzyYleiXk2mdjzjYhB7Pabw85N1K77pXMEa1TB
 8oTA==
X-Gm-Message-State: ACrzQf1uN5uhlH6NFRdK79LozRo5p0hKd77kBTft8v7A+PJGNHiGDyWv
 ZbDLILE1sX0Oock+JB0C3Ux4S3FM1ew2ZChCCYKoaBT8fJeR8EE6Hyfob1O/InKxsU/G9FvSDBR
 1rbvHUKgdZkO3RAg=
X-Received: by 2002:a17:907:6eab:b0:78d:4c16:a687 with SMTP id
 sh43-20020a1709076eab00b0078d4c16a687mr53092108ejc.392.1667914603430; 
 Tue, 08 Nov 2022 05:36:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6KngKQBRDWOpl2yyT0RYK1wy4hqClRrnl3oTl/294L9oXuwOGJEhW1jAul5GDIzDzHHrDEHw==
X-Received: by 2002:a17:907:6eab:b0:78d:4c16:a687 with SMTP id
 sh43-20020a1709076eab00b0078d4c16a687mr53092090ejc.392.1667914603215; 
 Tue, 08 Nov 2022 05:36:43 -0800 (PST)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 bm8-20020a170906c04800b0073d7bef38e3sm4667301ejb.45.2022.11.08.05.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 05:36:42 -0800 (PST)
Date: Tue, 8 Nov 2022 14:36:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Ani
 Sinha <ani@anisinha.ca>
Subject: Re: [PULL v4 45/83] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
Message-ID: <20221108143641.4bdaae6f@fedora>
In-Reply-To: <20221107224600.934080-46-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-46-mst@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Mon, 7 Nov 2022 17:51:11 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> From: Igor Mammedov <imammedo@redhat.com>
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..570b17478e 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,35 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/DSDT",
> +"tests/data/acpi/pc/DSDT.acpierst",
> +"tests/data/acpi/pc/DSDT.acpihmat",
> +"tests/data/acpi/pc/DSDT.bridge",
> +"tests/data/acpi/pc/DSDT.cphp",
> +"tests/data/acpi/pc/DSDT.dimmpxm",
> +"tests/data/acpi/pc/DSDT.hpbridge",
> +"tests/data/acpi/pc/DSDT.hpbrroot",
> +"tests/data/acpi/pc/DSDT.ipmikcs",
> +"tests/data/acpi/pc/DSDT.memhp",
> +"tests/data/acpi/pc/DSDT.nohpet",
> +"tests/data/acpi/pc/DSDT.numamem",
> +"tests/data/acpi/pc/DSDT.roothp",
> +"tests/data/acpi/q35/DSDT",
> +"tests/data/acpi/q35/DSDT.acpierst",
> +"tests/data/acpi/q35/DSDT.acpihmat",
> +"tests/data/acpi/q35/DSDT.applesmc",
> +"tests/data/acpi/q35/DSDT.bridge",
> +"tests/data/acpi/q35/DSDT.cphp",
> +"tests/data/acpi/q35/DSDT.cxl",
> +"tests/data/acpi/q35/DSDT.dimmpxm",
> +"tests/data/acpi/q35/DSDT.ipmibt",
> +"tests/data/acpi/q35/DSDT.ipmismbus",
> +"tests/data/acpi/q35/DSDT.ivrs",
> +"tests/data/acpi/q35/DSDT.memhp",
> +"tests/data/acpi/q35/DSDT.mmio64",
> +"tests/data/acpi/q35/DSDT.multi-bridge",
> +"tests/data/acpi/q35/DSDT.nohpet",
> +"tests/data/acpi/q35/DSDT.numamem",
> +"tests/data/acpi/q35/DSDT.pvpanic-isa",
> +"tests/data/acpi/q35/DSDT.tis.tpm12",
> +"tests/data/acpi/q35/DSDT.tis.tpm2",
> +"tests/data/acpi/q35/DSDT.viot",
> +"tests/data/acpi/q35/DSDT.xapic",

still missing DSDT.count2 table, likely in other updates (as well)
which should break bisection if not whole pull request.

I'll prep a tree based on your pull req, with fixups
for you to pull from.


