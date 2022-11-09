Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEBC6231A0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:40:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osp35-0003qR-WD; Wed, 09 Nov 2022 12:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1osp34-0003pq-2D
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1osp31-0000v3-Rt
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668015575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eohLMAYEoj9O3R/08iLiW8ReJj/JUlQt7P3KVSPqtu4=;
 b=hZxuppk4s5g6ZbJf2cM8wWC0fkG5sYpWIYMl47Wsp5pukbPO3Xn2RoLgK68hAFAqr8B7Ts
 y7c4LEPV09sN2VOly9YnaE+m3VkzHwJmpcCTq1Pf9Y7f4aJGB6wrlK5jys23KY23hfbLiD
 yxYOX4aBj1jPOaLH4hT3tARc3q9ZpQQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-f21CICerM0W2ZoMoVxRmYA-1; Wed, 09 Nov 2022 12:39:33 -0500
X-MC-Unique: f21CICerM0W2ZoMoVxRmYA-1
Received: by mail-qv1-f70.google.com with SMTP id
 mi12-20020a056214558c00b004bb63393567so12314750qvb.21
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 09:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eohLMAYEoj9O3R/08iLiW8ReJj/JUlQt7P3KVSPqtu4=;
 b=srJ6dSTasXePDPWkgU31in/6My5qrakjZ3e6IkuTkG353lzyzUT6xKJYrF8kAYlDys
 hJXr4UT0tUpe64srhghfjLRU49eaf3DbLU0NbeROkpEx4EHS/EL5kluL5KfqaGFnVH5S
 3TI8rV7w8zbwHh9h0uG5w3lhvRNNgAJXqkHhS8dpDezpYo8V/k6sUnhbW509D7e9fo8o
 sqKaa3aW5vQF4v5Yujmok60SCS1qpzsAPm+AiL+OH8a9jpbOtjQ3yUQ7TdIIDDjINgTO
 uh2x+MRSe0LgzqzGf2BDzkGvspOS+VDoaMTvalgtJRpVULLNalohD5pBN5CDu2j9hTMk
 5jSA==
X-Gm-Message-State: ACrzQf1zjwyaSjzjQDSXYH0loF/CvbQE+nK1mRTKYACMmUhD9WKF4t2j
 QcXAP0cBeomLmeAL24nsq2WqNEh9ys0fmWTG3UTz2lRYPkZ/szZdP2YR0f6AFmFnrxW0Gv5JqL4
 VSI3eLRwlHvUUdys=
X-Received: by 2002:a37:6c02:0:b0:6ee:bbea:1ebb with SMTP id
 h2-20020a376c02000000b006eebbea1ebbmr1122556qkc.638.1668015572142; 
 Wed, 09 Nov 2022 09:39:32 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7VgQdK0yXrkDkLzldSeiVcnprrsQsezHyTid0871zUWKo4TwBcBBuPQW5B7R7+llRnhbxmDQ==
X-Received: by 2002:a37:6c02:0:b0:6ee:bbea:1ebb with SMTP id
 h2-20020a376c02000000b006eebbea1ebbmr1122552qkc.638.1668015571754; 
 Wed, 09 Nov 2022 09:39:31 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a05620a0e9b00b006fa63cc7affsm11219191qkm.34.2022.11.09.09.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 09:39:31 -0800 (PST)
Message-ID: <e491b2fe-5959-4837-fce9-a7d2cb2448e6@redhat.com>
Date: Wed, 9 Nov 2022 18:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PULL v4 44/83] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-45-mst@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20221107224600.934080-45-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

This one breaks something for me:

[3/65] Compiling C object libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o
FAILED: libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o
clang -m64 -mcx16 -Ilibhw-display-virtio-vga-gl.a.p -I. -I../../../Projects/qemu-upstream 
-Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include 
-I/usr/include/sysprof-4 -fcolor-diagnostics -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g 
-isystem /home/lvivier/Projects/qemu-upstream/linux-headers -isystem linux-headers -iquote 
. -iquote /home/lvivier/Projects/qemu-upstream -iquote 
/home/lvivier/Projects/qemu-upstream/include -iquote 
/home/lvivier/Projects/qemu-upstream/tcg/i386 -pthread -D_GNU_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef 
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv 
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self 
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined 
-Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift-negative-value 
-Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-type-limit-compare 
-Wno-psabi -Wno-gnu-variable-sized-type-not-at-end -fstack-protector-strong 
-fsanitize=address -fPIC -DBUILD_DSO -MD -MQ 
libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o -MF 
libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o.d -o 
libhw-display-virtio-vga-gl.a.p/hw_display_acpi-vga.c.o -c 
../../../Projects/qemu-upstream/hw/display/acpi-vga.c
In file included from ../../../Projects/qemu-upstream/hw/display/acpi-vga.c:4:
In file included from ../../../Projects/qemu-upstream/hw/display/vga_int.h:30:
In file included from /home/lvivier/Projects/qemu-upstream/include/ui/console.h:4:
/home/lvivier/Projects/qemu-upstream/include/ui/qemu-pixman.h:12:10: fatal error: 
'pixman.h' file not found
#include <pixman.h>
          ^~~~~~~~~~
1 error generated.
ninja: build stopped: subcommand failed.
make: *** [Makefile:165: run-ninja] Error 1
make: Leaving directory '/home/lvivier/Objects/qemu-upstream/x86_64'

Any idea?

my configure is:

configure' '--disable-docs' '--target-list=x86_64-softmmu' '--enable-modules' 
'--disable-spice' '--enable-docs'

path to pixman.h is:

/usr/include/pixman-1/pixman.h

Thanks,
Laurent

On 11/7/22 23:51, Michael S. Tsirkin wrote:
> From: Igor Mammedov <imammedo@redhat.com>
> 
> NB:
> We do not expect any functional change in any ACPI tables with this
> change. It's only a refactoring.
> 
> NB2:
> Some targets (or1k) do not support acpi and CONFIG_ACPI is off for them.
> However, modules are reused between all architectures so CONFIG_ACPI is
> on.  For those architectures, dummy stub function definitions help to
> resolve symbols.  This change uses more of these and so it adds a couple
> of dummy stub definitions so that symbols for those can be resolved.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> CC: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Message-Id: <20221107152744.868434-1-ani@anisinha.ca>
> ---
>   hw/display/vga_int.h       |  2 ++
>   hw/acpi/aml-build-stub.c   | 10 ++++++++++
>   hw/display/acpi-vga-stub.c |  7 +++++++
>   hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
>   hw/display/vga-pci.c       |  4 ++++
>   hw/i386/acpi-build.c       | 26 +-------------------------
>   hw/display/meson.build     | 17 +++++++++++++++++
>   7 files changed, 67 insertions(+), 25 deletions(-)
>   create mode 100644 hw/display/acpi-vga-stub.c
>   create mode 100644 hw/display/acpi-vga.c
> 
> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> index 305e700014..330406ad9c 100644
> --- a/hw/display/vga_int.h
> +++ b/hw/display/vga_int.h
> @@ -30,6 +30,7 @@
>   #include "ui/console.h"
>   
>   #include "hw/display/bochs-vbe.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>   
>   #define ST01_V_RETRACE      0x08
>   #define ST01_DISP_ENABLE    0x01
> @@ -195,4 +196,5 @@ void pci_std_vga_mmio_region_init(VGACommonState *s,
>                                     MemoryRegion *subs,
>                                     bool qext, bool edid);
>   
> +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope);
>   #endif
> diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
> index 8d8ad1a314..89a8fec4af 100644
> --- a/hw/acpi/aml-build-stub.c
> +++ b/hw/acpi/aml-build-stub.c
> @@ -26,6 +26,16 @@ void aml_append(Aml *parent_ctx, Aml *child)
>   {
>   }
>   
> +Aml *aml_return(Aml *val)
> +{
> +    return NULL;
> +}
> +
> +Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag)
> +{
> +    return NULL;
> +}
> +
>   Aml *aml_resource_template(void)
>   {
>       return NULL;
> diff --git a/hw/display/acpi-vga-stub.c b/hw/display/acpi-vga-stub.c
> new file mode 100644
> index 0000000000..a9b0ecf76d
> --- /dev/null
> +++ b/hw/display/acpi-vga-stub.c
> @@ -0,0 +1,7 @@
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi_aml_interface.h"
> +#include "vga_int.h"
> +
> +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
> +{
> +}
> diff --git a/hw/display/acpi-vga.c b/hw/display/acpi-vga.c
> new file mode 100644
> index 0000000000..f0e9ef1fcf
> --- /dev/null
> +++ b/hw/display/acpi-vga.c
> @@ -0,0 +1,26 @@
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi_aml_interface.h"
> +#include "hw/pci/pci.h"
> +#include "vga_int.h"
> +
> +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
> +{
> +    int s3d = 0;
> +    Aml *method;
> +
> +    if (object_dynamic_cast(OBJECT(adev), "qxl-vga")) {
> +        s3d = 3;
> +    }
> +
> +    method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(0)));
> +    aml_append(scope, method);
> +
> +    method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(0)));
> +    aml_append(scope, method);
> +
> +    method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(s3d)));
> +    aml_append(scope, method);
> +}
> diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
> index 3e5bc259f7..9a91de7ed1 100644
> --- a/hw/display/vga-pci.c
> +++ b/hw/display/vga-pci.c
> @@ -35,6 +35,7 @@
>   #include "hw/loader.h"
>   #include "hw/display/edid.h"
>   #include "qom/object.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>   
>   enum vga_pci_flags {
>       PCI_VGA_FLAG_ENABLE_MMIO = 1,
> @@ -354,11 +355,13 @@ static void vga_pci_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
>   
>       k->vendor_id = PCI_VENDOR_ID_QEMU;
>       k->device_id = PCI_DEVICE_ID_QEMU_VGA;
>       dc->vmsd = &vmstate_vga_pci;
>       set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +    adevc->build_dev_aml = build_vga_aml;
>   }
>   
>   static const TypeInfo vga_pci_type_info = {
> @@ -369,6 +372,7 @@ static const TypeInfo vga_pci_type_info = {
>       .class_init = vga_pci_class_init,
>       .interfaces = (InterfaceInfo[]) {
>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { TYPE_ACPI_DEV_AML_IF },
>           { },
>       },
>   };
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4f54b61904..26932b4e2c 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -430,7 +430,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>           bool hotpluggbale_slot = false;
>           bool bridge_in_acpi = false;
>           bool cold_plugged_bridge = false;
> -        bool is_vga = false;
>   
>           if (pdev) {
>               pc = PCI_DEVICE_GET_CLASS(pdev);
> @@ -440,8 +439,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>                   continue;
>               }
>   
> -            is_vga = pc->class_id == PCI_CLASS_DISPLAY_VGA;
> -
>               /*
>                * Cold plugged bridges aren't themselves hot-pluggable.
>                * Hotplugged bridges *are* hot-pluggable.
> @@ -489,28 +486,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>               aml_append(dev, aml_pci_device_dsm());
>           }
>   
> -        if (is_vga) {
> -            /* add VGA specific AML methods */
> -            int s3d;
> -
> -            if (object_dynamic_cast(OBJECT(pdev), "qxl-vga")) {
> -                s3d = 3;
> -            } else {
> -                s3d = 0;
> -            }
> -
> -            method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
> -            aml_append(method, aml_return(aml_int(0)));
> -            aml_append(dev, method);
> -
> -            method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
> -            aml_append(method, aml_return(aml_int(0)));
> -            aml_append(dev, method);
> -
> -            method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
> -            aml_append(method, aml_return(aml_int(s3d)));
> -            aml_append(dev, method);
> -        }
> +        call_dev_aml_func(DEVICE(pdev), dev);
>   
>           bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
>           if (bridge_in_acpi) {
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index adc53dd8b6..7a725ed80e 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -38,10 +38,21 @@ softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
>   
>   specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
>   
> +if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
> +    config_all_devices.has_key('CONFIG_VGA_PCI') or
> +    config_all_devices.has_key('CONFIG_VMWARE_VGA') or
> +    config_all_devices.has_key('CONFIG_ATI_VGA')
> +   )
> +  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +                                      if_false: files('acpi-vga-stub.c'))
> +endif
> +
>   if config_all_devices.has_key('CONFIG_QXL')
>     qxl_ss = ss.source_set()
>     qxl_ss.add(when: 'CONFIG_QXL', if_true: [files('qxl.c', 'qxl-logger.c', 'qxl-render.c'),
>                                              pixman, spice])
> +  qxl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +                                  if_false: files('acpi-vga-stub.c'))
>     hw_display_modules += {'qxl': qxl_ss}
>   endif
>   
> @@ -52,6 +63,7 @@ softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
>   
>   softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
>   
> +
>   if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
>     virtio_gpu_ss = ss.source_set()
>     virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
> @@ -87,14 +99,19 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
>                       if_true: [files('virtio-vga.c'), pixman])
>     virtio_vga_ss.add(when: 'CONFIG_VHOST_USER_VGA',
>                       if_true: files('vhost-user-vga.c'))
> +  virtio_vga_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +                                         if_false: files('acpi-vga-stub.c'))
>     hw_display_modules += {'virtio-vga': virtio_vga_ss}
>   
>     virtio_vga_gl_ss = ss.source_set()
>     virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
>                          if_true: [files('virtio-vga-gl.c'), pixman])
> +  virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +                                            if_false: files('acpi-vga-stub.c'))
>     hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
>   endif
>   
>   specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
>   
> +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
>   modules += { 'hw-display': hw_display_modules }


