Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E63CB6A7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:21:43 +0200 (CEST)
Received: from localhost ([::1]:48376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4LuY-00032q-Bn
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4LtJ-0001hN-GM
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:20:25 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:42802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4LtG-00032E-Qh
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:20:24 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485--UlXHkT_OyK1UxRqKOhO6A-1; Fri, 16 Jul 2021 07:20:10 -0400
X-MC-Unique: -UlXHkT_OyK1UxRqKOhO6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC91A1084F55;
 Fri, 16 Jul 2021 11:20:08 +0000 (UTC)
Received: from bahia.lan (ovpn-112-127.ams2.redhat.com [10.36.112.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 043EA17B73;
 Fri, 16 Jul 2021 11:20:06 +0000 (UTC)
Date: Fri, 16 Jul 2021 13:20:05 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 1/7] hw/acpi/memory_hotplug.c: avoid sending
 MEM_UNPLUG_ERROR if dev->id is NULL
Message-ID: <20210716132005.39a8c4c5@bahia.lan>
In-Reply-To: <20210712194339.813152-2-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
 <20210712194339.813152-2-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 16:43:33 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> qapi_event_send_device_unplug_error() deals with @device being NULL

s/qapi_event_send_device_unplug_error/qapi_event_send_mem_unplug_error ?

since I only see qapi_event_send_mem_unplug_error() in the diff.

> by replacing it with an empty string ("") when emitting the event. Aside
> from the fact that this is a side effect that can be patched someday,
> there's also the lack of utility that the event brings to listeners, e.g.
> "a memory unplug error happened somewhere".
>=20
> We're better of not emitting the event if dev->id is NULL. Next patches
> will introduce a new device unplug error event that is better suited to
> deal with dev->id NULL scenarios. MEM_UNPLUG_ERROR will continue to be
> emitted to avoid breaking existing APIs, but it'll be deprecated and
> removed in the future.
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Appart from the nit in the changelog,

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/acpi/memory_hotplug.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..e37acb0367 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -177,9 +177,14 @@ static void acpi_memory_hotplug_write(void *opaque, =
hwaddr addr, uint64_t data,
>              /* call pc-dimm unplug cb */
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
> +                const char *error_pretty =3D error_get_pretty(local_err)=
;
> +
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> -                                                 error_get_pretty(local_=
err));
> +
> +                if (dev->id) {
> +                    qapi_event_send_mem_unplug_error(dev->id, error_pret=
ty);
> +                }
> +
>                  error_free(local_err);
>                  break;
>              }


