Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF9E3C22E6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:32:33 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1okC-0004Uf-QK
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1ods-0003Q4-Ca
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1odn-000095-Bq
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625829952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHMwtNu56uzJQbfFpgiDDIi90NqsF3mCzPUr2q8cldA=;
 b=UYif+DRZG+mLPdqRCEplLgaVUwkn+70A+i6AEKHIMUFt973YwSqNZ30VvYYd//VcQh0h/S
 IotvzA9dxLGHgEwLs6a4HdEOecvGwQDXUeltzeBCjDZHJ7oEaYVJ+E3jru+UwSsbUH/3uz
 Nmf1gR21LeLtgLHdOVeg9wXtDRKl7oY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-cA-uSJHLNluImXrBUU5M6A-1; Fri, 09 Jul 2021 07:25:51 -0400
X-MC-Unique: cA-uSJHLNluImXrBUU5M6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E94380006E;
 Fri,  9 Jul 2021 11:25:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-151.ams2.redhat.com
 [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 569E810016F7;
 Fri,  9 Jul 2021 11:25:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 72BE51132B52; Fri,  9 Jul 2021 13:25:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-4-danielhb413@gmail.com>
 <87h7h56jh2.fsf@dusky.pond.sub.org>
 <20210709103913.5c938852@redhat.com>
Date: Fri, 09 Jul 2021 13:25:43 +0200
In-Reply-To: <20210709103913.5c938852@redhat.com> (Igor Mammedov's message of
 "Fri, 9 Jul 2021 10:39:13 +0200")
Message-ID: <87sg0n685k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Igor Mammedov <imammedo@redhat.com> writes:

> On Thu, 08 Jul 2021 15:08:57 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> 
>> > MEM_UNPLUG_ERROR is deprecated since the introduction of
>> > DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
>> > MEM_UNPLUG_ERROR is pending.
>> >
>> > CC: Michael S. Tsirkin <mst@redhat.com>
>> > CC: Igor Mammedov <imammedo@redhat.com>
>> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> > ---
>> >  hw/acpi/memory_hotplug.c | 13 +++++++++++--
>> >  1 file changed, 11 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
>> > index af37889423..fb9f4d2de7 100644
>> > --- a/hw/acpi/memory_hotplug.c
>> > +++ b/hw/acpi/memory_hotplug.c
>> > @@ -8,6 +8,7 @@
>> >  #include "qapi/error.h"
>> >  #include "qapi/qapi-events-acpi.h"
>> >  #include "qapi/qapi-events-machine.h"
>> > +#include "qapi/qapi-events-qdev.h"
>> >  
>> >  #define MEMORY_SLOTS_NUMBER          "MDNR"
>> >  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
>> > @@ -177,9 +178,17 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>> >              /* call pc-dimm unplug cb */
>> >              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>> >              if (local_err) {
>> > +                const char *error_pretty = error_get_pretty(local_err);
>> > +
>> >                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
>> > -                qapi_event_send_mem_unplug_error(dev->id,
>> > -                                                 error_get_pretty(local_err));
>> > +
>> > +                /*
>> > +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
>> > +                 * while the deprecation of MEM_UNPLUG_ERROR is
>> > +                 * pending.
>> > +                 */
>> > +                qapi_event_send_mem_unplug_error(dev->id, error_pretty);
>> > +                qapi_event_send_device_unplug_error(dev->id, error_pretty);
>> >                  error_free(local_err);
>> >                  break;
>> >              }  
>> 
>> Same question as for PATCH 2: can dev->id be null?
> only theoretically (if memory device were created directly without
> using device_add), which as far as I know is not the case as all
> memory devices are created using -device/device_add so far.
>
> ( for device_add case see qdev_device_add->qdev_set_id where
>   'id' is set to user provided or to generated "device[%d]" value)

Something is set to a generated value, but it's not dev->id :)

    void qdev_set_id(DeviceState *dev, const char *id)

@id is the value of id=...  It may be null.

dev->id still is null here.

    {
        if (id) {
            dev->id = id;
        }

dev->id is now the value of id=...  It may be null.

        if (dev->id) {
            object_property_add_child(qdev_get_peripheral(), dev->id,
                                      OBJECT(dev));

If the user specified id=..., add @dev as child of /peripheral.  The
child's name is the (non-null) value of id=...

        } else {
            static int anon_count;
            gchar *name = g_strdup_printf("device[%d]", anon_count++);
            object_property_add_child(qdev_get_peripheral_anon(), name,
                                      OBJECT(dev));
            g_free(name);

Else, add @dev as child of /peripheral-anon.  The child's name is made
up.


        }
    }

dev->id is still the value of id=..., i.e. it may be null.

Sure dereferencing dev->id in acpi_memory_hotplug_write() is safe?


