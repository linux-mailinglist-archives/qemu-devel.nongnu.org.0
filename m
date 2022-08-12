Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEBC590E6E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 11:49:54 +0200 (CEST)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMRIf-00024Q-0K
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 05:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oMRFr-0000ZZ-4b
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 05:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oMRFn-0008IR-J9
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 05:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660297613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPqKpuDdm8horqAiPo395ifaocxU3rgxcViCOoWpoy8=;
 b=CL/sCNlKa+p918zqHucD/JgyLrkMgos8ph1Gd2kiXVgIlzDu9/Y2SNhKdcqM1aC9Prsyf6
 MYSrTcj9FyuGGFp9ZT/OFjy7ztdwGHsaOYOz5rla7CiYbrmC8hKyxM7chXqV4jHVmJAuwO
 vtwQYziO2pgCkxBM/LEZhdM+2eoug3I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-Jflb8gFCMMq5pJvlB4ncRQ-1; Fri, 12 Aug 2022 05:46:52 -0400
X-MC-Unique: Jflb8gFCMMq5pJvlB4ncRQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 az42-20020a05600c602a00b003a552086ba9so4066635wmb.6
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 02:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=xPqKpuDdm8horqAiPo395ifaocxU3rgxcViCOoWpoy8=;
 b=jidBg1Pg4uCpoXcd56X++oO7/PTUmB9DuvyBSBOT0vRYlBuLnTwKTcNrBAJ/8T7U5U
 kiyhJlL4RaRt/V8HKs7aSmNATQn78EBkzNArXsyKretIICKI1cnTmMgrfZObiPWHT4BC
 CiL0oLxL7ENfmN1N5DSFD0K87qZlytxfZM5sb+tkaWdWrNvKW1Hx8X+cpf4+opJdHE1R
 8Qx66BQu/7S/7GqRqw1TAiQe+1l1bpv0zSV5x4YYZkFdMrVVh/y0mfxmX/FaVBbkRDeN
 v8uYcaSvoxwE60+qngjPC34YHzkYQa6IamntN7yqsQ6iGsGS8VKAYYWAuPgXVyHD215Z
 NmbQ==
X-Gm-Message-State: ACgBeo2kCExu/PoPxOeuCFE+9u0DlJfMqEBmSOM1KkElzs8tg85AHQGI
 dn8sMDaqycblmEfWM4EgwiTSKYA2sMx6VsLi7XR1PyIPmd1rXoi1YN4Qtq1I4oeUncK+O1FQeNO
 MlgvbOrpIEUW5CXg=
X-Received: by 2002:a05:6000:811:b0:220:6262:ac66 with SMTP id
 bt17-20020a056000081100b002206262ac66mr1533261wrb.529.1660297611403; 
 Fri, 12 Aug 2022 02:46:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4i/v1mJjCEuSsVPH0PSOHftJZKFuTysM3cWMhZGI95vFzLZDfejyeUG8qWn4zwLofNpQrYGw==
X-Received: by 2002:a05:6000:811:b0:220:6262:ac66 with SMTP id
 bt17-20020a056000081100b002206262ac66mr1533253wrb.529.1660297611181; 
 Fri, 12 Aug 2022 02:46:51 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7416:9d00:bb54:f6b1:32e:b9fc])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b003a503a64e5esm9321952wma.15.2022.08.12.02.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 02:46:50 -0700 (PDT)
Date: Fri, 12 Aug 2022 05:46:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2 0/5] hw/smbios: add core_count2 to smbios table type 4
Message-ID: <20220812054604-mutt-send-email-mst@kernel.org>
References: <20220731162141.178443-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220731162141.178443-1-jusual@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 31, 2022 at 06:21:36PM +0200, Julia Suvorova wrote:
> The SMBIOS 3.0 specification provides the ability to reflect over
> 255 cores. The 64-bit entry point has been used for a while, but
> structure type 4 has not been updated before, so the dmidecode output
> looked like this (-smp 280):
> 
>     Handle 0x0400, DMI type 4, 42 bytes
>     Processor Information
>     ...
>         Core Count: 24
>         Core Enabled: 24
>         Thread Count: 1
>     ...
> 
> Big update in the bios-tables-test as it couldn't work with SMBIOS 3.0.

Looks good to me. I tagged this but just to help make sure it's
not lost pls ping me after the release.

> v2:
>     * generate tables type 4 of different sizes based on the
>       selected smbios version
>     * use SmbiosEntryPoint* types instead of creating new constants
>     * refactor smbios_cpu_test [Igor, Ani]
>     * clarify signature check [Igor]
>     * add comments with specifications and clarification of the structure loop [Ani]
> 
> Julia Suvorova (5):
>   hw/smbios: add core_count2 to smbios table type 4
>   bios-tables-test: teach test to use smbios 3.0 tables
>   tests/acpi: allow changes for core_count2 test
>   bios-tables-test: add test for number of cores > 255
>   tests/acpi: update tables for new core count test
> 
>  hw/smbios/smbios_build.h             |   9 +-
>  include/hw/firmware/smbios.h         |  11 ++
>  hw/smbios/smbios.c                   |  18 +++-
>  tests/qtest/bios-tables-test.c       | 148 ++++++++++++++++++++-------
>  tests/data/acpi/q35/APIC.core-count2 | Bin 0 -> 2478 bytes
>  tests/data/acpi/q35/DSDT.core-count2 | Bin 0 -> 32414 bytes
>  tests/data/acpi/q35/FACP.core-count2 | Bin 0 -> 244 bytes
>  7 files changed, 144 insertions(+), 42 deletions(-)
>  create mode 100644 tests/data/acpi/q35/APIC.core-count2
>  create mode 100644 tests/data/acpi/q35/DSDT.core-count2
>  create mode 100644 tests/data/acpi/q35/FACP.core-count2
> 
> -- 
> 2.35.3


