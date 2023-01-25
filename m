Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8017167B75F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 17:53:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKj0t-0000qm-CC; Wed, 25 Jan 2023 11:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKj0s-0000qe-5q
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:52:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKj0q-00083X-MW
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674665560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSFmnHFGif7dgrE59zWYMnyVoDjL3xoXVax/u2hth6o=;
 b=KZ1H3CIPgsj9DxTSry+zZR0nAOyUCv2MkFXOz9DipeaHc4Cym+tVLL3eikriZs13jf4Crw
 dAx13PQ0iCbnMcQ479QDsO+j/VBeb4DMfxxWmVEQFTi5dNBGxgPk30tBx1hDK0gNcOvK+6
 gaD88vH6pPhaGx/3y5zVaDXWmS93F6s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-y3r51WaNPy2dud6Hd-uDgA-1; Wed, 25 Jan 2023 11:52:38 -0500
X-MC-Unique: y3r51WaNPy2dud6Hd-uDgA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z18-20020a05640235d200b0049d84165065so13389581edc.18
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 08:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSFmnHFGif7dgrE59zWYMnyVoDjL3xoXVax/u2hth6o=;
 b=nKPMcN+wxKR3DMShBq2OdGeDf+bNqh/1yC0OqYkXtytejX7wt/cJSq/K2agbFOv8ln
 s9E9XHg6Ok12wa6O9rGUEc0Yn189L/AyFPs5UK0MtNyhJByZdW2sh2JjL3FtHYnkOi47
 e7FXRCLe+++sNhRAoLNwGRHk1Q4AoSOkajEWMMtPCXHy4DeKxZFjIwu0LxuIw+R/nNa+
 GECPPhzHE/mGEUquw0RiTxOzFKB00o13qcmHuyhykqOMAt4/HegC5WNAfJs+fXHyaiEt
 /V+J2djLTbG/WvqmNXJnLMfghn9GM8p4MMNOwYPtDA8VM5G0VU8m/ADlR6XuM7bW+sdM
 WvmA==
X-Gm-Message-State: AFqh2kqx9sOCbRYMQsQL8Zx0lRx0CDBhDg6iEIyBw4i48U5D8e+HZUf+
 a6qUOuZMMBrxJx6fsWIxUYdprRO5OcfT1lVPzAM+Rn2Jsd9LVfEzBZDv1wDDEFZj7l+P05wRcpd
 o5zaKyaLi/eBDEls=
X-Received: by 2002:a17:907:1b0f:b0:86b:93ea:3366 with SMTP id
 mp15-20020a1709071b0f00b0086b93ea3366mr46888771ejc.3.1674665557621; 
 Wed, 25 Jan 2023 08:52:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvwKNwkk7b3j/FZhpfOtszP+AtX5qfK2YHT1FcgIQM8YqPEaJM3dgNzMET184mrHeMz/9Mng==
X-Received: by 2002:a17:907:1b0f:b0:86b:93ea:3366 with SMTP id
 mp15-20020a1709071b0f00b0086b93ea3366mr46888754ejc.3.1674665557480; 
 Wed, 25 Jan 2023 08:52:37 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 bp12-20020a170907918c00b007c0d6b34d54sm2561901ejb.129.2023.01.25.08.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:52:35 -0800 (PST)
Date: Wed, 25 Jan 2023 17:52:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Eduardo
 Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>, "Michael S.
 Tsirkin" <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 0/7] AML Housekeeping
Message-ID: <20230125175234.2984e90d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 21 Jan 2023 16:19:34 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> This series factors out AcpiCpuAmlIfClass::madt_cpu from AcpiDeviceIfClass.
> By letting the (x86) CPUs implement the new interface, AML generation is
> delegated to the CPUs, freeing the ACPI controllers from worrying about x86 CPU
> specifics. The delegation to the CPUs is especially interesting for the PIIX4 PM
> since it is also used in MIPS only contexts where no ACPI bios is available.
> 
> Furthermore, the series introduces qbus_build_aml() which replaces
> isa_build_aml() and resolves some open coding.

I'm done with this series review
(skipped 6-7/7, since they depend on 5/7 which seems unnecessary to me)

> 
> v4:
> - Squash qbus_build_aml() patches into one (Igor)
> - Don't use a bare function pointer for AcpiDeviceIfClass::madt_cpu (Igor)
> 
> Testing done:
> * `make check`
> * `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.2.6-220416-linux515.iso`
> * `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>    manjaro-kde-21.2.6-220416-linux515.iso`
> 
> v3:
> - Clean up includes in AcpiDeviceIfClass::madt_cpu sub series last (Markus)
> - Restructure qbus_build_aml() sub series (Phil, me)
> 
> v2:
> - Don't inline qbus_build_aml() (Phil)
> - Add 'hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"'
> 
> Bernhard Beschow (7):
>   hw/i386/acpi-build: Remove unused attributes
>   hw/isa/isa-bus: Turn isa_build_aml() into qbus_build_aml()
>   hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"
>   hw/acpi/acpi_dev_interface: Remove unused parameter from
>     AcpiDeviceIfClass::madt_cpu
>   hw/acpi/acpi_dev_interface: Factor out TYPE_ACPI_CPU_AML_IF
>   hw/acpi/acpi_dev_interface: Remove now unused #include "hw/boards.h"
>   hw/i386/pc: Unexport pc_madt_cpu_entry()
> 
>  hw/acpi/hmat.h                       |  3 +-
>  hw/i386/acpi-common.h                |  3 +-
>  include/hw/acpi/acpi_aml_interface.h |  3 ++
>  include/hw/acpi/acpi_cpu_interface.h | 26 ++++++++++++++++
>  include/hw/acpi/acpi_dev_interface.h |  4 ---
>  include/hw/i386/pc.h                 |  6 ----
>  include/hw/isa/isa.h                 |  1 -
>  hw/acpi/acpi-x86-stub.c              |  7 -----
>  hw/acpi/acpi_interface.c             | 18 ++++++++++-
>  hw/acpi/cpu.c                        | 13 ++++----
>  hw/acpi/hmat.c                       |  1 +
>  hw/acpi/memory_hotplug.c             |  1 +
>  hw/acpi/piix4.c                      |  3 --
>  hw/i2c/smbus_ich9.c                  |  5 +--
>  hw/i386/acpi-build.c                 |  5 +--
>  hw/i386/acpi-common.c                | 42 +++----------------------
>  hw/i386/acpi-microvm.c               |  6 ++--
>  hw/i386/generic_event_device_x86.c   |  9 ------
>  hw/isa/isa-bus.c                     | 10 ------
>  hw/isa/lpc_ich9.c                    |  6 +---
>  hw/isa/piix3.c                       |  5 +--
>  monitor/qmp-cmds.c                   |  1 +
>  target/i386/cpu.c                    | 46 ++++++++++++++++++++++++++++
>  23 files changed, 117 insertions(+), 107 deletions(-)
>  create mode 100644 include/hw/acpi/acpi_cpu_interface.h
> 


