Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147D67E5EC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:59:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLOJF-0000ad-1T; Fri, 27 Jan 2023 07:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLOJC-0000Za-Ty
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLOJA-00062t-GM
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674824297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8W8w1Z2FafTTTpApgHPqqHwOhynwCuJwq4MIQOZtnU=;
 b=C8lUXI/qc3m6TfnBNKT8iOmajcUEcKRJt3zlSlMhFoTnVhXQqPkrgAlVNvuTzKot1kP1VI
 yhqp0ksugYLin59QEEPxp4i9Gdk/rVKeuOsn7vkb5hcmsBl9U18ja5Wgzw5hCOoxlRC+TU
 lu9B2eKchE+8RFrnxwzmvsprSRkwa/o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-KRXKaMYeOcSsMFBoI0rvOw-1; Fri, 27 Jan 2023 07:58:15 -0500
X-MC-Unique: KRXKaMYeOcSsMFBoI0rvOw-1
Received: by mail-ej1-f71.google.com with SMTP id
 du14-20020a17090772ce00b0087108bbcfa6so3378714ejc.7
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 04:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8W8w1Z2FafTTTpApgHPqqHwOhynwCuJwq4MIQOZtnU=;
 b=s/n5ZjLGwU82NZEVHGro25bDst7uxKOo9qYILixDhKPXmH4nn62HaVG6bRhKPUPER9
 rKkNPHBOz8f9jVdsFl89ygjDQAAPP0lzVv9NdEwlGi4yRaTtwlp5phHaKYLXxMR49tFS
 aFPlUoRkiRIQ+pZRzWMgGUk2WrHVXjFWbX1uI4tcz4/ppv/ifTwyOfu84+9nuw6m/aC5
 HpKwtk3bAn0t5dpIBO1l6Y5K9Ddc+aE7yKgGe5iE34tlY3vg20P4M5eVUt5sv40Of3zy
 /QW2MmMtjyQ8NQsZ5hcaZAXu94dMVJqBDKyeK2kFEd9dQ0uovjosI6hpEtHNxdECefOf
 69xA==
X-Gm-Message-State: AFqh2kqPbPK09hgiKnWyYTwnKWI5WJ5+57PaHbdHik12RyM78iSklf3l
 z97qaURI/FDIjaOu/JxvhP5nkn6/asuLbcPu6uAsxPMthBsvVCmPLQGoQOqarX5CyKYgW5+UIAT
 KcPJKeH1NdrKZt34=
X-Received: by 2002:a05:6402:27cf:b0:49a:23ce:2ab4 with SMTP id
 c15-20020a05640227cf00b0049a23ce2ab4mr49941992ede.42.1674824294579; 
 Fri, 27 Jan 2023 04:58:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt0RLABPEYao/z4tjbigUIespCdOYsQnOlUXBQ0GfQUsoY5AUQM/h71Yp6zm/y0QpYOI/Rz+Q==
X-Received: by 2002:a05:6402:27cf:b0:49a:23ce:2ab4 with SMTP id
 c15-20020a05640227cf00b0049a23ce2ab4mr49941967ede.42.1674824294351; 
 Fri, 27 Jan 2023 04:58:14 -0800 (PST)
Received: from redhat.com ([2.52.137.69]) by smtp.gmail.com with ESMTPSA id
 u20-20020a50a414000000b004a08c52a2f0sm2306797edb.76.2023.01.27.04.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 04:58:13 -0800 (PST)
Date: Fri, 27 Jan 2023 07:58:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 0/7] AML Housekeeping
Message-ID: <20230127075800-mutt-send-email-mst@kernel.org>
References: <20230121151941.24120-1-shentey@gmail.com>
 <20230125175234.2984e90d@imammedo.users.ipa.redhat.com>
 <AC32E73F-22CB-4577-B985-9744AA70482D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AC32E73F-22CB-4577-B985-9744AA70482D@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 26, 2023 at 10:42:31AM +0000, Bernhard Beschow wrote:
> 
> 
> Am 25. Januar 2023 16:52:34 UTC schrieb Igor Mammedov <imammedo@redhat.com>:
> >On Sat, 21 Jan 2023 16:19:34 +0100
> >Bernhard Beschow <shentey@gmail.com> wrote:
> >
> >> This series factors out AcpiCpuAmlIfClass::madt_cpu from AcpiDeviceIfClass.
> >> By letting the (x86) CPUs implement the new interface, AML generation is
> >> delegated to the CPUs, freeing the ACPI controllers from worrying about x86 CPU
> >> specifics. The delegation to the CPUs is especially interesting for the PIIX4 PM
> >> since it is also used in MIPS only contexts where no ACPI bios is available.
> >> 
> >> Furthermore, the series introduces qbus_build_aml() which replaces
> >> isa_build_aml() and resolves some open coding.
> >
> >I'm done with this series review
> >(skipped 6-7/7, since they depend on 5/7 which seems unnecessary to me)
> 
> Thanks!
> 
> Okay, let's omit patches 5-7 for now. It makes sense to include them in a dedicated x86 cleanup series.
> 
> Michael, shall I respin a v5 with only the reviewed patches?
> 
> Best regards,
> Bernhard

No need.

> >
> >> 
> >> v4:
> >> - Squash qbus_build_aml() patches into one (Igor)
> >> - Don't use a bare function pointer for AcpiDeviceIfClass::madt_cpu (Igor)
> >> 
> >> Testing done:
> >> * `make check`
> >> * `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.2.6-220416-linux515.iso`
> >> * `qemu-system-x86_64 -M q35 -m 2G -cdrom \
> >>    manjaro-kde-21.2.6-220416-linux515.iso`
> >> 
> >> v3:
> >> - Clean up includes in AcpiDeviceIfClass::madt_cpu sub series last (Markus)
> >> - Restructure qbus_build_aml() sub series (Phil, me)
> >> 
> >> v2:
> >> - Don't inline qbus_build_aml() (Phil)
> >> - Add 'hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"'
> >> 
> >> Bernhard Beschow (7):
> >>   hw/i386/acpi-build: Remove unused attributes
> >>   hw/isa/isa-bus: Turn isa_build_aml() into qbus_build_aml()
> >>   hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"
> >>   hw/acpi/acpi_dev_interface: Remove unused parameter from
> >>     AcpiDeviceIfClass::madt_cpu
> >>   hw/acpi/acpi_dev_interface: Factor out TYPE_ACPI_CPU_AML_IF
> >>   hw/acpi/acpi_dev_interface: Remove now unused #include "hw/boards.h"
> >>   hw/i386/pc: Unexport pc_madt_cpu_entry()
> >> 
> >>  hw/acpi/hmat.h                       |  3 +-
> >>  hw/i386/acpi-common.h                |  3 +-
> >>  include/hw/acpi/acpi_aml_interface.h |  3 ++
> >>  include/hw/acpi/acpi_cpu_interface.h | 26 ++++++++++++++++
> >>  include/hw/acpi/acpi_dev_interface.h |  4 ---
> >>  include/hw/i386/pc.h                 |  6 ----
> >>  include/hw/isa/isa.h                 |  1 -
> >>  hw/acpi/acpi-x86-stub.c              |  7 -----
> >>  hw/acpi/acpi_interface.c             | 18 ++++++++++-
> >>  hw/acpi/cpu.c                        | 13 ++++----
> >>  hw/acpi/hmat.c                       |  1 +
> >>  hw/acpi/memory_hotplug.c             |  1 +
> >>  hw/acpi/piix4.c                      |  3 --
> >>  hw/i2c/smbus_ich9.c                  |  5 +--
> >>  hw/i386/acpi-build.c                 |  5 +--
> >>  hw/i386/acpi-common.c                | 42 +++----------------------
> >>  hw/i386/acpi-microvm.c               |  6 ++--
> >>  hw/i386/generic_event_device_x86.c   |  9 ------
> >>  hw/isa/isa-bus.c                     | 10 ------
> >>  hw/isa/lpc_ich9.c                    |  6 +---
> >>  hw/isa/piix3.c                       |  5 +--
> >>  monitor/qmp-cmds.c                   |  1 +
> >>  target/i386/cpu.c                    | 46 ++++++++++++++++++++++++++++
> >>  23 files changed, 117 insertions(+), 107 deletions(-)
> >>  create mode 100644 include/hw/acpi/acpi_cpu_interface.h
> >> 
> >


