Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478B3C2515
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:40:17 +0200 (CEST)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qjn-0001ul-Th
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1qiT-0008VY-2i
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1qiP-0006ga-52
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625837928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJkiC9UfcAgiTQQpFHzoWg8h9+zrlPewDLEgMHbvXsM=;
 b=QCIUeLpHTeVl3CbgTSpCxgMyRlTggxmgpAu9Sgr/wq0RpLJTkflyuH55zEzc/ABnFmb6JE
 RXi02YTlD6g4GIEDIyktKbcE6NtlfQrkKha1kHxzwhK0U+ILKY9h/JjRqPM3USO3ZAuQAu
 J7aptGhk+a0xVVhHgoGU1OnTp2iVH2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-kOdYgBdtM9SZevfIOGh0KA-1; Fri, 09 Jul 2021 09:38:47 -0400
X-MC-Unique: kOdYgBdtM9SZevfIOGh0KA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D68298042FE;
 Fri,  9 Jul 2021 13:38:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B54015DF21;
 Fri,  9 Jul 2021 13:38:39 +0000 (UTC)
Date: Fri, 9 Jul 2021 15:38:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
Message-ID: <20210709153838.75de8813@redhat.com>
In-Reply-To: <87sg0n685k.fsf@dusky.pond.sub.org>
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-4-danielhb413@gmail.com>
 <87h7h56jh2.fsf@dusky.pond.sub.org>
 <20210709103913.5c938852@redhat.com>
 <87sg0n685k.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 09 Jul 2021 13:25:43 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Thu, 08 Jul 2021 15:08:57 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >  
> >> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> >>   
> >> > MEM_UNPLUG_ERROR is deprecated since the introduction of
> >> > DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> >> > MEM_UNPLUG_ERROR is pending.
> >> >
> >> > CC: Michael S. Tsirkin <mst@redhat.com>
> >> > CC: Igor Mammedov <imammedo@redhat.com>
> >> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> >> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >> > ---
> >> >  hw/acpi/memory_hotplug.c | 13 +++++++++++--
> >> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> >> > index af37889423..fb9f4d2de7 100644
> >> > --- a/hw/acpi/memory_hotplug.c
> >> > +++ b/hw/acpi/memory_hotplug.c
> >> > @@ -8,6 +8,7 @@
> >> >  #include "qapi/error.h"
> >> >  #include "qapi/qapi-events-acpi.h"
> >> >  #include "qapi/qapi-events-machine.h"
> >> > +#include "qapi/qapi-events-qdev.h"
> >> >  
> >> >  #define MEMORY_SLOTS_NUMBER          "MDNR"
> >> >  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> >> > @@ -177,9 +178,17 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
> >> >              /* call pc-dimm unplug cb */
> >> >              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
> >> >              if (local_err) {
> >> > +                const char *error_pretty = error_get_pretty(local_err);
> >> > +
> >> >                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> >> > -                qapi_event_send_mem_unplug_error(dev->id,
> >> > -                                                 error_get_pretty(local_err));
> >> > +
> >> > +                /*
> >> > +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> >> > +                 * while the deprecation of MEM_UNPLUG_ERROR is
> >> > +                 * pending.
> >> > +                 */
> >> > +                qapi_event_send_mem_unplug_error(dev->id, error_pretty);
> >> > +                qapi_event_send_device_unplug_error(dev->id, error_pretty);
> >> >                  error_free(local_err);
> >> >                  break;
> >> >              }    
> >> 
> >> Same question as for PATCH 2: can dev->id be null?  
> > only theoretically (if memory device were created directly without
> > using device_add), which as far as I know is not the case as all
> > memory devices are created using -device/device_add so far.
> >
> > ( for device_add case see qdev_device_add->qdev_set_id where
> >   'id' is set to user provided or to generated "device[%d]" value)  
> 
> Something is set to a generated value, but it's not dev->id :)
> 
>     void qdev_set_id(DeviceState *dev, const char *id)
> 
> @id is the value of id=...  It may be null.
> 
> dev->id still is null here.
> 
>     {
>         if (id) {
>             dev->id = id;
>         }
> 
> dev->id is now the value of id=...  It may be null.
> 
>         if (dev->id) {
>             object_property_add_child(qdev_get_peripheral(), dev->id,
>                                       OBJECT(dev));
> 
> If the user specified id=..., add @dev as child of /peripheral.  The
> child's name is the (non-null) value of id=...
> 
>         } else {
>             static int anon_count;
>             gchar *name = g_strdup_printf("device[%d]", anon_count++);
>             object_property_add_child(qdev_get_peripheral_anon(), name,
>                                       OBJECT(dev));
>             g_free(name);
> 
> Else, add @dev as child of /peripheral-anon.  The child's name is made
> up.
> 
> 
>         }
>     }
> 
> dev->id is still the value of id=..., i.e. it may be null.
yep, I was wrong and confused it child name in QOM tree.

> Sure dereferencing dev->id in acpi_memory_hotplug_write() is safe?

it aren't safe since guest may trigger this error when
memory-device is created without id.


