Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0407271DCB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 10:21:24 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKH4d-0000Uz-79
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 04:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kKH2x-0007uY-Ge
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 04:19:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26211
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kKH2u-0000rm-SX
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 04:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600676375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmzmnbPEdvlg7AX1Vyh3nnqsVmqu2FbhwV9AE+3XCes=;
 b=Paj+JtHDnUXbbsGNTIzDF4Rmn/Z6+jPzw83M1Y3yvlyAXyHdGH5mI2oUMzZwPDUP5F0CEX
 K9stTOi1qEor9+dFoH/h5qMNgess+O73kXBD0nhRWv8/b+F86BNwztqKliBtHsBA4f8v90
 nZGOjy9c1b7pSKxjGCW7Bpx+NoEgIZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-ztB3sqW_N-uJVr7DhmADug-1; Mon, 21 Sep 2020 04:19:34 -0400
X-MC-Unique: ztB3sqW_N-uJVr7DhmADug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EB721891E8C;
 Mon, 21 Sep 2020 08:19:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42D6F61177;
 Mon, 21 Sep 2020 08:19:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 727EB1132E9A; Mon, 21 Sep 2020 10:19:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] qdev: Let BusRealize() return a boolean value to
 indicate error
References: <20200920114416.353277-1-f4bug@amsat.org>
 <20200920114416.353277-3-f4bug@amsat.org>
Date: Mon, 21 Sep 2020 10:19:25 +0200
In-Reply-To: <20200920114416.353277-3-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 20 Sep 2020 13:44:16
 +0200")
Message-ID: <87eemva6eq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 03:43:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Commit 9940b2cfbc0 introduced qdev_realize() and qbus_realize()
> with the ability to return a boolean value if an error occured,
> thus the caller does not need to check if the Error* pointer is
> set.
> Provide the same ability to the BusRealize type.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/qdev-core.h | 14 +++++++++++++-
>  hw/hyperv/vmbus.c      |  5 +++--
>  hw/nubus/nubus-bus.c   |  5 +++--
>  hw/pci/pci.c           | 12 +++++++++---
>  hw/xen/xen-bus.c       |  5 +++--
>  5 files changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 02ac1c50b7f..eecfe794a71 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -32,7 +32,19 @@ typedef enum DeviceCategory {
>  typedef void (*DeviceRealize)(DeviceState *dev, Error **errp);
>  typedef void (*DeviceUnrealize)(DeviceState *dev);
>  typedef void (*DeviceReset)(DeviceState *dev);
> -typedef void (*BusRealize)(BusState *bus, Error **errp);
> +/**
> + * BusRealize: Realize @bus.
> + * @bus: bus to realize
> + * @errp: pointer to error object
> + *
> + * On success, return true.
> + * On failure, store an error through @errp and return false.
> + */
> +typedef bool (*BusRealize)(BusState *bus, Error **errp);
> +/**
> + * BusUnrealize: Unrealize @bus.
> + * @bus: bus to unrealize
> + */
>  typedef void (*BusUnrealize)(BusState *bus);
> =20
>  /**
> diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
> index 6ef895bc352..8a0452b2464 100644
> --- a/hw/hyperv/vmbus.c
> +++ b/hw/hyperv/vmbus.c
> @@ -2487,7 +2487,7 @@ static const TypeInfo vmbus_dev_type_info =3D {
>      .instance_init =3D vmbus_dev_instance_init,
>  };
> =20
> -static void vmbus_realize(BusState *bus, Error **errp)
> +static bool vmbus_realize(BusState *bus, Error **errp)
>  {
>      int ret =3D 0;
>      Error *local_err =3D NULL;
> @@ -2519,7 +2519,7 @@ static void vmbus_realize(BusState *bus, Error **er=
rp)
>          goto clear_event_notifier;
>      }
> =20
> -    return;
> +    return true;
> =20
>  clear_event_notifier:
>      event_notifier_cleanup(&vmbus->notifier);
> @@ -2528,6 +2528,7 @@ remove_msg_handler:
>  error_out:
>      qemu_mutex_destroy(&vmbus->rx_queue_lock);
>      error_propagate(errp, local_err);
> +    return false;
>  }
> =20
>  static void vmbus_unrealize(BusState *bus)
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 942a6d5342d..d20d9c0f72c 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -65,12 +65,13 @@ static const MemoryRegionOps nubus_super_slot_ops =3D=
 {
>      },
>  };
> =20
> -static void nubus_realize(BusState *bus, Error **errp)
> +static bool nubus_realize(BusState *bus, Error **errp)
>  {
>      if (!nubus_find()) {
>          error_setg(errp, "at most one %s device is permitted", TYPE_NUBU=
S_BUS);
> -        return;
> +        return false;
>      }
> +    return true;
>  }
> =20
>  static void nubus_init(Object *obj)
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index de0fae10ab9..f535ebac847 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -115,7 +115,7 @@ static void pcibus_machine_done(Notifier *notifier, v=
oid *data)
>      }
>  }
> =20
> -static void pci_bus_realize(BusState *qbus, Error **errp)
> +static bool pci_bus_realize(BusState *qbus, Error **errp)
>  {
>      PCIBus *bus =3D PCI_BUS(qbus);
> =20
> @@ -123,13 +123,17 @@ static void pci_bus_realize(BusState *qbus, Error *=
*errp)
>      qemu_add_machine_init_done_notifier(&bus->machine_done);
> =20
>      vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_pcibus, bus=
);
> +
> +    return true;
>  }
> =20
> -static void pcie_bus_realize(BusState *qbus, Error **errp)
> +static bool pcie_bus_realize(BusState *qbus, Error **errp)
>  {
>      PCIBus *bus =3D PCI_BUS(qbus);
> =20
> -    pci_bus_realize(qbus, errp);
> +    if (!pci_bus_realize(qbus, errp)) {
> +        return false;
> +    }

We now update bus->flags only when pci_bus_realize() succeeds.  Is this
a bug fix?

> =20
>      /*
>       * A PCI-E bus can support extended config space if it's the root
> @@ -144,6 +148,8 @@ static void pcie_bus_realize(BusState *qbus, Error **=
errp)
>              bus->flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;
>          }
>      }
> +
> +    return true;
>  }
> =20
>  static void pci_bus_unrealize(BusState *qbus)
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index 9ce1c9540b9..d7ef5d05e37 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -444,7 +444,7 @@ static void xen_bus_unrealize(BusState *bus)
>      }
>  }
> =20
> -static void xen_bus_realize(BusState *bus, Error **errp)
> +static bool xen_bus_realize(BusState *bus, Error **errp)
>  {
>      XenBus *xenbus =3D XEN_BUS(bus);
>      unsigned int domid;
> @@ -478,10 +478,11 @@ static void xen_bus_realize(BusState *bus, Error **=
errp)
>                            "failed to set up enumeration watch: ");
>      }
> =20
> -    return;
> +    return true;
> =20
>  fail:
>      xen_bus_unrealize(bus);
> +    return false;
>  }
> =20
>  static void xen_bus_unplug_request(HotplugHandler *hotplug,

I can't see an actual use of the new return value.  Am I blind?


