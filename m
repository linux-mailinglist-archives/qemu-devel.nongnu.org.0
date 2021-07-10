Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC263C3357
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 08:58:58 +0200 (CEST)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m26wz-000151-SV
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 02:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m26w0-0000FS-7z
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 02:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m26vy-0007fl-An
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 02:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625900273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hdhw+gqmQimWAxe8cXT4wAFi6B+m5zBK4ynqJoMwwMY=;
 b=AUVYuR4NaqoBS9k2gjDzVTf/LQ6gEZrabl0uPDjUlZstV4PFGjo7Im6EwRfJ0ZjuZ+6gME
 FEsh/H8S4b58e381APu2Bgt1mPUTvZTy/xi5WA/H9NLQlZo8gGNkmVAdqSetG59RvunpRq
 Ly539cSCrEftptrbtaOsbU49Cjsa7Ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-N98zNlU6O5GcUEPazkktxg-1; Sat, 10 Jul 2021 02:57:51 -0400
X-MC-Unique: N98zNlU6O5GcUEPazkktxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 421F1343CD;
 Sat, 10 Jul 2021 06:57:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-151.ams2.redhat.com
 [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E91C19D9F;
 Sat, 10 Jul 2021 06:57:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B7821132B52; Sat, 10 Jul 2021 08:57:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-4-danielhb413@gmail.com>
 <87h7h56jh2.fsf@dusky.pond.sub.org>
 <20210709103913.5c938852@redhat.com>
 <87sg0n685k.fsf@dusky.pond.sub.org>
 <20210709153838.75de8813@redhat.com>
Date: Sat, 10 Jul 2021 08:57:42 +0200
In-Reply-To: <20210709153838.75de8813@redhat.com> (Igor Mammedov's message of
 "Fri, 9 Jul 2021 15:38:38 +0200")
Message-ID: <87y2ae3bbt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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

> On Fri, 09 Jul 2021 13:25:43 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Igor Mammedov <imammedo@redhat.com> writes:
>> 
>> > On Thu, 08 Jul 2021 15:08:57 +0200
>> > Markus Armbruster <armbru@redhat.com> wrote:
>> >  
>> >> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> >>   
>> >> > MEM_UNPLUG_ERROR is deprecated since the introduction of
>> >> > DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
>> >> > MEM_UNPLUG_ERROR is pending.
>> >> >
>> >> > CC: Michael S. Tsirkin <mst@redhat.com>
>> >> > CC: Igor Mammedov <imammedo@redhat.com>
>> >> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> >> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> >> > ---
>> >> >  hw/acpi/memory_hotplug.c | 13 +++++++++++--
>> >> >  1 file changed, 11 insertions(+), 2 deletions(-)
>> >> >
>> >> > diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
>> >> > index af37889423..fb9f4d2de7 100644
>> >> > --- a/hw/acpi/memory_hotplug.c
>> >> > +++ b/hw/acpi/memory_hotplug.c
>> >> > @@ -8,6 +8,7 @@
>> >> >  #include "qapi/error.h"
>> >> >  #include "qapi/qapi-events-acpi.h"
>> >> >  #include "qapi/qapi-events-machine.h"
>> >> > +#include "qapi/qapi-events-qdev.h"
>> >> >  
>> >> >  #define MEMORY_SLOTS_NUMBER          "MDNR"
>> >> >  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
>> >> > @@ -177,9 +178,17 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>> >> >              /* call pc-dimm unplug cb */
>> >> >              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>> >> >              if (local_err) {
>> >> > +                const char *error_pretty = error_get_pretty(local_err);
>> >> > +
>> >> >                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
>> >> > -                qapi_event_send_mem_unplug_error(dev->id,
>> >> > -                                                 error_get_pretty(local_err));
>> >> > +
>> >> > +                /*
>> >> > +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
>> >> > +                 * while the deprecation of MEM_UNPLUG_ERROR is
>> >> > +                 * pending.
>> >> > +                 */
>> >> > +                qapi_event_send_mem_unplug_error(dev->id, error_pretty);
>> >> > +                qapi_event_send_device_unplug_error(dev->id, error_pretty);
>> >> >                  error_free(local_err);
>> >> >                  break;
>> >> >              }    
>> >> 
>> >> Same question as for PATCH 2: can dev->id be null?  
>> > only theoretically (if memory device were created directly without
>> > using device_add), which as far as I know is not the case as all
>> > memory devices are created using -device/device_add so far.
>> >
>> > ( for device_add case see qdev_device_add->qdev_set_id where
>> >   'id' is set to user provided or to generated "device[%d]" value)  
>> 
>> Something is set to a generated value, but it's not dev->id :)
>> 
>>     void qdev_set_id(DeviceState *dev, const char *id)
>> 
>> @id is the value of id=...  It may be null.
>> 
>> dev->id still is null here.
>> 
>>     {
>>         if (id) {
>>             dev->id = id;
>>         }
>> 
>> dev->id is now the value of id=...  It may be null.
>> 
>>         if (dev->id) {
>>             object_property_add_child(qdev_get_peripheral(), dev->id,
>>                                       OBJECT(dev));
>> 
>> If the user specified id=..., add @dev as child of /peripheral.  The
>> child's name is the (non-null) value of id=...
>> 
>>         } else {
>>             static int anon_count;
>>             gchar *name = g_strdup_printf("device[%d]", anon_count++);
>>             object_property_add_child(qdev_get_peripheral_anon(), name,
>>                                       OBJECT(dev));
>>             g_free(name);
>> 
>> Else, add @dev as child of /peripheral-anon.  The child's name is made
>> up.
>> 
>> 
>>         }
>>     }
>> 
>> dev->id is still the value of id=..., i.e. it may be null.
> yep, I was wrong and confused it child name in QOM tree.
>
>> Sure dereferencing dev->id in acpi_memory_hotplug_write() is safe?
>
> it aren't safe since guest may trigger this error when
> memory-device is created without id.

Thanks!

Daniel, the issue predates your series, but your series adds instances.
We need a patch fixing the existing instances before your series, and
fix up your series.  Can you take care of that?


