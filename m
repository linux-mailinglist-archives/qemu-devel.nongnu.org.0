Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352023F765D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:52:18 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItKD-0004bO-7J
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mItGH-0000cm-UT
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:48:13 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:27658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mItGG-0002Fi-EV
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:48:13 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-AD8npnrNMtCd5McdznWiRg-1; Wed, 25 Aug 2021 09:47:57 -0400
X-MC-Unique: AD8npnrNMtCd5McdznWiRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE77195D569;
 Wed, 25 Aug 2021 13:47:55 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.194.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69EA360657;
 Wed, 25 Aug 2021 13:47:54 +0000 (UTC)
Date: Wed, 25 Aug 2021 15:47:52 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 1/7] memory_hotplug.c: handle dev->id = NULL in
 acpi_memory_hotplug_write()
Message-ID: <20210825154752.19bd9f4f@bahia.lan>
In-Reply-To: <20210825004835.472919-2-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-2-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 21:48:29 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> qapi_event_send_mem_unplug_error() deals with @device being NULL by
> replacing it with an empty string ("") when emitting the event. Aside
> from the fact that this behavior (qapi visitor mapping NULL pointer to
> "") can be patched/changed someday, there's also the lack of utility
> that the event brings to listeners, e.g. "a memory unplug error happened
> somewhere".
>=20
> In theory we should just avoit emitting this event at all if dev->id is
> NULL, but this would be an incompatible change to existing guests.
> Instead, let's make the forementioned behavior explicit: if dev->id is
> NULL, pass an empty string to qapi_event_send_mem_unplug_error().
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/acpi/memory_hotplug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..6a71de408b 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -178,7 +178,7 @@ static void acpi_memory_hotplug_write(void *opaque, h=
waddr addr, uint64_t data,
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> +                qapi_event_send_mem_unplug_error(dev->id ? : "",
>                                                   error_get_pretty(local_=
err));
>                  error_free(local_err);
>                  break;


