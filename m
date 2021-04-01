Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB4235157C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:04:27 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxvu-00058g-6Q
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lRxrC-0002la-Oq
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lRxrA-0006Xd-VH
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617285572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XR5g5vhM9W2FEoIpiFF8veF1bMOl/CCGPqvBtv0790U=;
 b=Hq+rPuHdW8cg8Fb9oVgPqViBWA6HAFlwoJdfJn6jXBY2R4baA9ftiPYnAD2j2KpCLCT8YG
 iyp+JW+vGdyI63uwe30en+EkFirypckPiRkBlyM0aOtrr5HRu0IgoCHco9ppylr7LLiD49
 Eym+7PQVax3rK7DLHJvVxKQbCiGJrk4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-38tGyCPyN3WJFbCtW67x5w-1; Thu, 01 Apr 2021 09:59:30 -0400
X-MC-Unique: 38tGyCPyN3WJFbCtW67x5w-1
Received: by mail-wr1-f72.google.com with SMTP id i5so2801927wrp.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 06:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XR5g5vhM9W2FEoIpiFF8veF1bMOl/CCGPqvBtv0790U=;
 b=oQUfJ5TrkaFRnknAUPNofFs4Gi3WPCu51HQvczc15Yr1lFZjvhH/uA2BNUXw8CTZtd
 8pbrEIsAFplH29+JxQq0Zrh8B6EUkbjxYdfBqW1iWzVPLUBHYxrt18yyVUNcfu8m+oJ7
 00ili2nIjBKZng74JvhOEui6pOeGtad8SjCvDndcXa+0a9nNR8snql+9hk0iClwDQPdQ
 b/SQ56vwYHuQgPoCrUtV5MVCru1vVVZMLuZpnsJxI2OxoP44hVRZsoKYC+CHbyJ26D8E
 UHtKgnK/XRy7W5j0DHiG3LtLA+UuncDUHGRTyMtT0N2NPUmXJWa65U4iz6kUXV32xMeV
 iWKA==
X-Gm-Message-State: AOAM530p2m/nrWngonQ+lhwftVFWXatgxvq9Bidnq4lofof/Y2qiyAyI
 Srbt6a+8ddAdGYxydOir91XPG3zQAjPUXH0t9CQ6XqfhH2J/TqpXYe02mm7DKZ3wFF+BlWGnewl
 GhD72F+qIagpdJUg=
X-Received: by 2002:adf:c641:: with SMTP id u1mr9880646wrg.332.1617285569662; 
 Thu, 01 Apr 2021 06:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy46sBASFbzy4SqJ2HwXsuH8APvjNjh36q+58KuQyfAIrG6Eg8durN5VEIdVsEJLtcpGzIS0Q==
X-Received: by 2002:adf:c641:: with SMTP id u1mr9880621wrg.332.1617285569424; 
 Thu, 01 Apr 2021 06:59:29 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id b65sm8387776wmh.4.2021.04.01.06.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 06:59:29 -0700 (PDT)
Date: Thu, 1 Apr 2021 09:59:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v2 2/2] hw/smbios: retrieve PCI address from specified
 device for Type 41
Message-ID: <20210401095725-mutt-send-email-mst@kernel.org>
References: <20210401082544.16522-1-vincent@bernat.ch>
 <20210401082544.16522-2-vincent@bernat.ch>
MIME-Version: 1.0
In-Reply-To: <20210401082544.16522-2-vincent@bernat.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 10:25:44AM +0200, Vincent Bernat wrote:
> Instead of specifying the PCI address manually, the device can be
> specified by ID:
> 
>     $QEMU -netdev user,id=internet
>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev
> 
> The PCI segment is assumed to be 0. This should hold true for most
> cases.
> 
>     $ dmidecode -t 41
>     # dmidecode 3.3
>     Getting SMBIOS data from sysfs.
>     SMBIOS 2.8 present.
> 
>     Handle 0x2900, DMI type 41, 11 bytes
>     Onboard Device
>             Reference Designation: Onboard LAN
>             Type: Ethernet
>             Status: Enabled
>             Type Instance: 1
>             Bus Address: 0000:00:09.0
> 
>     $ ip -brief a
>     lo               UNKNOWN        127.0.0.1/8 ::1/128
>     eno1             UP             10.0.2.14/24 fec0::5254:ff:fe00:42/64 fe80::5254:ff:fe00:42/64
> 
> Signed-off-by: Vincent Bernat <vincent@bernat.ch>
> ---
>  hw/smbios/smbios.c | 47 +++++++++++++++++++++-------------------------
>  qemu-options.hx    |  2 +-
>  2 files changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 46a08652dff4..0f390e03453c 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -27,6 +27,7 @@
>  #include "hw/firmware/smbios.h"
>  #include "hw/loader.h"
>  #include "hw/boards.h"
> +#include "hw/pci/pci.h"
>  #include "smbios_build.h"
>  
>  /* legacy structures and constants for <= 2.0 machines */
> @@ -134,12 +135,8 @@ static QEnumLookup type41_kind_lookup = {
>      .size = 10
>  };
>  struct type41_instance {
> -    const char *designation;
> +    const char *designation, *pcidev;
>      uint8_t instance, kind;
> -    struct {
> -        uint16_t segment;
> -        uint8_t bus, device;
> -    } pci;
>      QTAILQ_ENTRY(type41_instance) next;
>  };
>  static QTAILQ_HEAD(, type41_instance) type41 = QTAILQ_HEAD_INITIALIZER(type41);
> @@ -403,10 +400,9 @@ static const QemuOptDesc qemu_smbios_type41_opts[] = {
>          .type = QEMU_OPT_NUMBER,
>          .help = "device type instance",
>      },{
> -        .name = "pci",
> +        .name = "pcidev",
>          .type = QEMU_OPT_STRING,
>          .help = "PCI device",
> -        .def_value_str = "0:0.0",
>      },
>      { /* end of list */ }
>  };
> @@ -837,9 +833,23 @@ static void smbios_build_type_41_table(void)
>          SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
>          t->device_type = t41->kind;
>          t->device_type_instance = t41->instance;
> -        t->segment_group_number = cpu_to_le16(t41->pci.segment);
> -        t->bus_number = t41->pci.bus;
> -        t->device_number = t41->pci.device;
> +
> +        if (t41->pcidev) {
> +            PCIDevice *pdev = NULL;
> +            int rc = pci_qdev_find_device(t41->pcidev, &pdev);
> +            if (rc == 0) {
> +                /*
> +                 * TODO: Extract the appropriate value. Most of the
> +                 * time, this will be 0.
> +                 */
> +                t->segment_group_number = cpu_to_le16(0);
> +                t->bus_number = pci_dev_bus_num(pdev);
> +                t->device_number = pdev->devfn;

Problem is, for devices behind bridges for example, bus is only
configured by guest, after pci has been enumerated.

So I suspect this either
- needs to be limited to only work for the root bus
- needs to be re-evaluted on guest access, like we do
  with ACPI

Thoughts?



> +            } else {
> +                fprintf(stderr, "%s: cannot find PCI device %s\n",
> +                        __func__, t41->pcidev);
> +            }
> +        }
>  
>          SMBIOS_BUILD_TABLE_POST;
>          instance++;
> @@ -1301,7 +1311,6 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>          case 41: {
>              struct type41_instance *t;
>              Error *local_err = NULL;
> -            int pseg, pbus, pdevice, pfunction;
>  
>              if (!qemu_opts_validate(opts, qemu_smbios_type41_opts, errp)) {
>                  return;
> @@ -1324,21 +1333,7 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>                  return;
>              }
>              t->instance = qemu_opt_get_number(opts, "instance", 1);
> -            if (sscanf(qemu_opt_get(opts, "pci"), "%x:%x:%x.%x",
> -                       &pseg,
> -                       &pbus,
> -                       &pdevice,
> -                       &pfunction) != 4) {
> -                error_setg(errp, "unable to parse %s: %s",
> -                           qemu_opt_get(opts, "pci"),
> -                           g_strerror(errno));
> -                free(t);
> -                return;
> -            }
> -            t->pci.segment = pseg;
> -            t->pci.bus = pbus;
> -            t->pci.device = ((uint8_t)pdevice << 3) +
> -                ((uint8_t)pfunction & 0x7);
> +            save_opt(&t->pcidev, opts, "pcidev");
>  
>              QTAILQ_INSERT_TAIL(&type41, t, next);
>              return;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index eb2de7c372c7..e6e54f9bd1f3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2371,7 +2371,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
>      "               [,asset=str][,part=str][,speed=%d]\n"
>      "                specify SMBIOS type 17 fields\n"
> -    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pci=%x:%x:%x.%x]\n"
> +    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
>      "                specify SMBIOS type 41 fields\n",
>      QEMU_ARCH_I386 | QEMU_ARCH_ARM)
>  SRST
> -- 
> 2.31.0


