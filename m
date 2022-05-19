Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0AA52D356
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:57:48 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfit-0008Fi-MS
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrffq-0005jr-GV
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrffo-0008JH-Jr
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652964876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdV0MLNvfcYTlJ9EiavGP/WmtrfOneUYxC3sXtYXn98=;
 b=YsZlfMDdmgp3T21ACxX72YK+c/WAMgqfktru7lq78jVcmTA46SwJ2Xvh2OyxixePFg3V8h
 P456RECf+YClDgbNmSh5oR/3+yXCiCoIDEi6QkAdIRA09DI+J1wgXjYvAmQd3d4P6RW8PR
 4O/XtcAacOpdpFkWWZKgBzjQu5etJbc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-byb9eMHWNHmy7qZCWdyN5w-1; Thu, 19 May 2022 08:54:34 -0400
X-MC-Unique: byb9eMHWNHmy7qZCWdyN5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso2014525wma.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 05:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdV0MLNvfcYTlJ9EiavGP/WmtrfOneUYxC3sXtYXn98=;
 b=m8UjxmcDvziJfli+PhxsgzeAe/pE5/BOkHUbyOGtbLsKBnzvC9V7QAdsKH7+JEuaKw
 kkqk9Uky4xOc7qKICpFd1nE9StcIDKAqUoEHiplV7j3HA1S1VbG+TNRc+FHDl13g7WKo
 GIvbJqT20V7ojjBXdJB9c4aVsNcOzE+bTaFl0MkNTDPxDaopHb7Os5BOCbqxbdKutsEG
 fxlfdfVIGZNREGqt4fynUuU3g0DQFut5goCRKuPcQSrFVf0PjqgjsaOrtRWByCyct14g
 88zHCfm6FmKjKN+KxBKKr3l1hraz+zI0D+9u3wBWDiVU/oQ+DRn83jT75cpvCjFTa8iJ
 NRew==
X-Gm-Message-State: AOAM533c65gjNr0Uua8YM+erxtoCIGOexY0PBpF8oUx1bIhaXcvQJl0A
 k9Gn0Vd30cdb+llX9e7vqLkRtdcNfH21GypSJ3PtJs5aBHOpy7PmlP5o2Quiy13Y8ReR/Cxwxoa
 is6yS67CIAB167wk=
X-Received: by 2002:a5d:47c8:0:b0:20c:630f:7df5 with SMTP id
 o8-20020a5d47c8000000b0020c630f7df5mr3845914wrc.689.1652964873126; 
 Thu, 19 May 2022 05:54:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3NSUbJPVi0E5J6TKtFKxP01yInc5LKi/hQu0Mo8JhisKgXZ8F7OmVQfCFM66nND+nvECr0g==
X-Received: by 2002:a5d:47c8:0:b0:20c:630f:7df5 with SMTP id
 o8-20020a5d47c8000000b0020c630f7df5mr3845897wrc.689.1652964872928; 
 Thu, 19 May 2022 05:54:32 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05600c229600b003970b2fa72dsm6615963wmf.22.2022.05.19.05.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 05:54:32 -0700 (PDT)
Date: Thu, 19 May 2022 14:54:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH 01/35] acpi: add interface to build device specific AML
Message-ID: <20220519145431.366d77d3@redhat.com>
In-Reply-To: <CAARzgwxhiJZtXQ=tPaJxxbOPL6LRB4QBu7UhuZSWBMkE-93iVg@mail.gmail.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-2-imammedo@redhat.com>
 <CAARzgwxhiJZtXQ=tPaJxxbOPL6LRB4QBu7UhuZSWBMkE-93iVg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Wed, 18 May 2022 15:30:07 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, May 16, 2022 at 8:56 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > There is already ISADeviceClass::build_aml() callback which
> > builds device specific AML blob for some ISA devices.
> > To extend the same idea to other devices, add TYPE_ACPI_DEV_AML_IF
> > Interface that will provide a more generic callback which
> > will be used not only for ISA but other devices. It will
> > allow get rid of some data-mining and ad-hoc AML building,
> > by asking device(s) to generate its own AML blob like it's
> > done for ISA devices.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  include/hw/acpi/acpi_aml_interface.h | 40 ++++++++++++++++++++++++++++
> >  hw/acpi/acpi_interface.c             |  8 ++++++
> >  hw/acpi/meson.build                  |  2 +-
> >  3 files changed, 49 insertions(+), 1 deletion(-)
> >  create mode 100644 include/hw/acpi/acpi_aml_interface.h
> >
> > diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
> > new file mode 100644
> > index 0000000000..ab76f0e55d
> > --- /dev/null
> > +++ b/include/hw/acpi/acpi_aml_interface.h
> > @@ -0,0 +1,40 @@
> > +#ifndef ACPI_AML_INTERFACE_H
> > +#define ACPI_AML_INTERFACE_H
> > +
> > +#include "qom/object.h"
> > +#include "hw/acpi/aml-build.h"
> > +
> > +#define TYPE_ACPI_DEV_AML_IF "acpi-dev-aml-interface"
> > +typedef struct AcpiDevAmlIfClass AcpiDevAmlIfClass;
> > +DECLARE_CLASS_CHECKERS(AcpiDevAmlIfClass, ACPI_DEV_AML_IF, TYPE_ACPI_DEV_AML_IF)
> > +#define ACPI_DEV_AML_IF(obj) \
> > +     INTERFACE_CHECK(AcpiDevAmlIf, (obj), TYPE_ACPI_DEV_AML_IF)
> > +
> > +typedef struct AcpiDevAmlIf AcpiDevAmlIf;  
> 
> I do not see where struct AcpiDevAmlIf is defined. I guess this is
> through the macro magic.

it's used for type checking only of opaque pointer
(Interfaces are not supposed to have any state)

> > +typedef void (*dev_aml_fn)(AcpiDevAmlIf *adev, Aml *scope);
> > +
> > +/**
> > + * AcpiDevAmlIfClass:
> > + *
> > + * build_dev_aml: adds device specific AML blob to provided scope
> > + *
> > + * Interface is designed for providing generic callback that builds device
> > + * specific AML blob.
> > + */
> > +struct AcpiDevAmlIfClass {
> > +    /* <private> */
> > +    InterfaceClass parent_class;
> > +
> > +    /* <public> */
> > +    dev_aml_fn build_dev_aml;
> > +};
> > +
> > +static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
> > +{
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_ACPI_DEV_AML_IF)) {
> > +        AcpiDevAmlIfClass *klass = ACPI_DEV_AML_IF_GET_CLASS(dev);
> > +        klass->build_dev_aml(ACPI_DEV_AML_IF(dev), scope);
> > +    }
> > +}
> > +
> > +#endif
> > diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
> > index 6583917b8e..c668d361f6 100644
> > --- a/hw/acpi/acpi_interface.c
> > +++ b/hw/acpi/acpi_interface.c
> > @@ -1,5 +1,6 @@
> >  #include "qemu/osdep.h"
> >  #include "hw/acpi/acpi_dev_interface.h"
> > +#include "hw/acpi/acpi_aml_interface.h"
> >  #include "qemu/module.h"
> >
> >  void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
> > @@ -18,8 +19,15 @@ static void register_types(void)
> >          .parent        = TYPE_INTERFACE,
> >          .class_size = sizeof(AcpiDeviceIfClass),
> >      };
> > +    static const TypeInfo acpi_dev_aml_if_info = {
> > +        .name          = TYPE_ACPI_DEV_AML_IF,
> > +        .parent        = TYPE_INTERFACE,
> > +        .class_size = sizeof(AcpiDevAmlIfClass),
> > +    };
> > +
> >
> >      type_register_static(&acpi_dev_if_info);
> > +    type_register_static(&acpi_dev_aml_if_info);
> >  }
> >
> >  type_init(register_types)
> > diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> > index 8bea2e6933..9504f5ce09 100644
> > --- a/hw/acpi/meson.build
> > +++ b/hw/acpi/meson.build
> > @@ -28,7 +28,7 @@ acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
> >  if have_tpm
> >    acpi_ss.add(files('tpm.c'))
> >  endif
> > -softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
> > +softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))  
> 
> This is wrong. It should be the stub file not the real thing.

I can put type definition into acpi-stub.c, but will be exact duplicate
(i.e. you can't stub QOM type definition), hence acpi_interface.c (which is
mostly QOM type definitions) is being included in non acpi build to avoid
duplication.

> 
> >  softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
> >  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
> >                                                    'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
> > --
> > 2.31.1
> >  
> 


