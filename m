Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBFD3BA7A1
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 09:12:27 +0200 (CEST)
Received: from localhost ([::1]:40752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzZpC-0001k1-C5
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 03:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzZoR-0000zd-0p
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 03:11:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzZoN-0000F5-1T
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 03:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625296292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8IS7UeMoNtqk3uY61iRePsEuEYqLpb2nbNJj+9AKII=;
 b=P6sKBLXq3zupMQVyxljnGAyH0z3nm32/d92JHHnvVYcS+bKRgSMvtdyJ0eJDzEoHqH9B0p
 Q4gOTA9YKQLCD13p2poAaAuUf18NaI6YM6YLmY/5MR1mViy61ZSpxj2nqiwtYPYBAY8/mG
 Ua68B0AUjTSpK6ESsY8htS/QmaQ2AOQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-mrbyl9iCMy-qc-P4SX0uRA-1; Sat, 03 Jul 2021 03:11:31 -0400
X-MC-Unique: mrbyl9iCMy-qc-P4SX0uRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 u64-20020a1cdd430000b02901ed0109da5fso7417147wmg.4
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 00:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=j8IS7UeMoNtqk3uY61iRePsEuEYqLpb2nbNJj+9AKII=;
 b=sG70/jVPkAoLpQYYKSJ+hdWsjTsbFS1c1r58JDhjA0BRdUUl1S6llQfeBoiCEwcVBs
 p26k4XyxYVgc+rkX6DqZPE3mJfysCOB8d6J2Cu8COjGxP2QiyAfxl1LBtHdChcPQxPcR
 IMcsmFs+Fx54ZqTf6ZI9p8UcQalDF9Ll9nbGlbJlTg/qctRfzVN9UcEAUGJ4sjxk8S/J
 rnnKdS4vk+i1sfDWGAceIFa8e1iWQocjnEXoQKuo0XlN/XChZbFwTluc5rebqY5we6Pq
 dWQv+gJDrBQhZ52JOGCaAH8P+Ug/IiH84UOEdY6GncqrcLF04inM0lMaUqU5xkQWcAVO
 clcw==
X-Gm-Message-State: AOAM5314t3kA1HwGk77mJbeWdjGzK/gF+IbYWGd15AaB4tP6YAveO2fS
 z9P0zy7U4H+QjzjVRjaYyTe+SHRR398jw5v/RAwFOLjYsk9tDx5XKwN3KGxTM3FnuqYMPqzEJ0V
 V1wwefgYsfHifKa0=
X-Received: by 2002:a5d:5005:: with SMTP id e5mr3762520wrt.138.1625296290760; 
 Sat, 03 Jul 2021 00:11:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmiwsWHECGyf2Mz0IonxGfH5qLHjYOANiD3twmcogOze+DpaSyyAkCmpCZ36dNUGgGd9udNQ==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr3762496wrt.138.1625296290529; 
 Sat, 03 Jul 2021 00:11:30 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id c7sm5656783wrs.23.2021.07.03.00.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 00:11:29 -0700 (PDT)
Date: Sat, 3 Jul 2021 03:11:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 1/7] hw/acpi/pcihp: Enhance
 acpi_pcihp_disable_root_bus() to support Q35
Message-ID: <20210703031056-mutt-send-email-mst@kernel.org>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-2-jusual@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210617190739.3673064-2-jusual@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 09:07:33PM +0200, Julia Suvorova wrote:
> PCI Express does not allow hot-plug on pcie.0. Check for Q35 in
> acpi_pcihp_disable_root_bus() to be able to forbid hot-plug using the
> 'acpi-root-pci-hotplug' flag.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/pcihp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 4999277d57..09f531e941 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -122,13 +122,14 @@ static void acpi_set_pci_info(void)
>  static void acpi_pcihp_disable_root_bus(void)
>  {
>      static bool root_hp_disabled;
> +    Object *host = acpi_get_i386_pci_host();
>      PCIBus *bus;
>  
>      if (root_hp_disabled) {
>          return;
>      }
>  
> -    bus = find_i440fx();
> +    bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
>          qbus_set_hotplug_handler(BUS(bus), NULL);


../hw/acpi/pcihp.c: In function ‘acpi_pcihp_disable_root_bus’:
../hw/acpi/pcihp.c:125:20: error: implicit declaration of function ‘acpi_get_i386_pci_host’ [-Werror=implicit-function-declaration]
  125 |     Object *host = acpi_get_i386_pci_host();
      |                    ^~~~~~~~~~~~~~~~~~~~~~
../hw/acpi/pcihp.c:125:20: error: nested extern declaration of ‘acpi_get_i386_pci_host’ [-Werror=nested-externs]
../hw/acpi/pcihp.c:125:20: error: initialization of ‘Object *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
../hw/acpi/pcihp.c:132:11: error: implicit declaration of function ‘PCI_HOST_BRIDGE’; did you mean ‘PCI_BRIDGE’? [-Werror=implicit-function-declaration]
  132 |     bus = PCI_HOST_BRIDGE(host)->bus;
      |           ^~~~~~~~~~~~~~~
      |           PCI_BRIDGE
../hw/acpi/pcihp.c:132:11: error: nested extern declaration of ‘PCI_HOST_BRIDGE’ [-Werror=nested-externs]
../hw/acpi/pcihp.c:132:32: error: invalid type argument of ‘->’ (have ‘int’)
  132 |     bus = PCI_HOST_BRIDGE(host)->bus;
      |                                ^~
cc1: all warnings being treated as errors


since acpi_get_i386_pci_host is not defined yet in this patch.

> -- 
> 2.30.2


