Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C48A3D5735
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:14:51 +0200 (CEST)
Received: from localhost ([::1]:55976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xdK-00022X-3R
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7xcL-0000g0-F3
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7xcJ-0001MO-TU
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627294427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TrDj71d1S8hdFfSWouGFk54UdPgQrETSZ+wcfyUoj3c=;
 b=PIoP4EMJdGWEn1ekwgOgb/DO0NOt+ABK19FF4rh965Pbme+OmjiXyMvFmdhIww61pqVVVF
 4zQTsXJcLEQDRLzL9/ypvCY6vANQLlHHJbuvuG0YT0UD4nOqwn9V539qTAYq2n+qkKEGI5
 dXeVTvxG61gu2qsMX7Tqvi3t+PfwKNs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-U8eVkszoP_SSPLD6T2ZTNg-1; Mon, 26 Jul 2021 06:13:46 -0400
X-MC-Unique: U8eVkszoP_SSPLD6T2ZTNg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfc3cd0000b02901531b0b7c89so4005316wrg.23
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrDj71d1S8hdFfSWouGFk54UdPgQrETSZ+wcfyUoj3c=;
 b=q81NyVBVxQajFixPHRPZTedDdoQfii3R8rRI9akVLA4HBGUGf/WHuWKAGvxfNdj1wJ
 ovW9UU5zxB9ux55WFAvTLqYpQbiD+txPDWuMAxO8xw9awxgvD8sSJd7+rWlYVugsZlv9
 VTNXjcM31CqpQpwrKBoK4u4taGwTJEveC+pQebrxghK1yDDpFzyNmfCaMcscu1XSFv9h
 zp252SE+7CPfgi9KrRxLevC+HTeBq8qih2BKjLbu//ec8Y1qxU5Ob4IZ2yB1k012M3V8
 ii+z/JMKFV5vGlWiKc45GNNB2J59Q9lP21Z85WzSFrnnrlxlJcKCdj8r6/KGz41Kbxx8
 7DiQ==
X-Gm-Message-State: AOAM533umjxLNuwe2iBP3s6wTBAjVrXaEHfHG4CTuO2WqiTNsFpt+ymT
 Z2MQpmO0q7qK0KrdOAYodBy8iZ2hiXgy661hiGwqEXKc6zj8QxSRhbtU4c93liwVEPhMJAYbDcy
 f9Os08MGSDcIYcWI=
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr13581968wme.112.1627294424934; 
 Mon, 26 Jul 2021 03:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNUfFIgtcWsoj2u+Y9cHfP9zUWRclxlOnfE+pCdvLUJ+KFaiYRPrwBofZ9YMpBTrQdqP3wng==
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr13581944wme.112.1627294424714; 
 Mon, 26 Jul 2021 03:13:44 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o18sm15173366wmh.0.2021.07.26.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 03:13:44 -0700 (PDT)
Date: Mon, 26 Jul 2021 12:13:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 05/10] ACPI ERST: support for ACPI ERST feature
Message-ID: <20210726121343.5322ba60@redhat.com>
In-Reply-To: <9c400686-e304-a8ec-6ba2-4edc62db16e4@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
 <20210720141704.381734cc@redhat.com>
 <9c400686-e304-a8ec-6ba2-4edc62db16e4@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 12:36:20 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/20/21 7:17 AM, Igor Mammedov wrote:
> > On Wed, 30 Jun 2021 15:07:16 -0400
> > Eric DeVolder <eric.devolder@oracle.com> wrote:  
> >> +
> >> +static const TypeInfo erst_type_info = {
> >> +    .name          = TYPE_ACPI_ERST,
> >> +    .parent        = TYPE_PCI_DEVICE,
> >> +    .class_init    = erst_class_init,
> >> +    .instance_size = sizeof(ERSTDeviceState),
> >> +    .interfaces = (InterfaceInfo[]) {
> >> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },  
> > what is this for here?  
> 
> Without this, at run-time, I obtain:
> qemu-system-x86_64: ../hw/pci/pci.c:2673: pci_device_class_base_init: Asse
> rtion `conventional || pcie' failed.

Michael,
should we make it PCI or PCIE device?
Potential users are arm-virt/q35/microvm machines (PCIE capable)
and the old 'pc' machine (PCI).

> >   
> >> +        { }
> >> +    }
> >> +};
> >> +
> >> +static void erst_register_types(void)
> >> +{
> >> +    type_register_static(&erst_type_info);
> >> +}
> >> +
> >> +type_init(erst_register_types)
> >> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> >> index dd69577..262a8ee 100644
> >> --- a/hw/acpi/meson.build
> >> +++ b/hw/acpi/meson.build
> >> @@ -4,6 +4,7 @@ acpi_ss.add(files(
> >>     'aml-build.c',
> >>     'bios-linker-loader.c',
> >>     'utils.c',
> >> +  'erst.c',
> >>   ))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))  
> >   
> 


