Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077F3F766E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:52:31 +0200 (CEST)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItKQ-0005JA-3H
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mItJF-0003cc-CO
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:51:17 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:42513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mItJE-0003fb-1L
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:51:17 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379--VQZVp4HP6uhSbphaaTP6g-1; Wed, 25 Aug 2021 09:51:12 -0400
X-MC-Unique: -VQZVp4HP6uhSbphaaTP6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0317185302B;
 Wed, 25 Aug 2021 13:51:10 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.194.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7312160657;
 Wed, 25 Aug 2021 13:51:09 +0000 (UTC)
Date: Wed, 25 Aug 2021 15:51:08 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 2/7] spapr.c: handle dev->id in
 spapr_memory_unplug_rollback()
Message-ID: <20210825155108.71391e72@bahia.lan>
In-Reply-To: <20210825004835.472919-3-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-3-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Tue, 24 Aug 2021 21:48:30 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> As done in hw/acpi/memory_hotplug.c, pass an empty string if dev->id
> is NULL to qapi_event_send_mem_unplug_error() to avoid relying on
> a behavior that can be changed in the future.
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 81699d4f8b..4f1ee90e9e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3690,7 +3690,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState=
 *spapr, DeviceState *dev)
>       */
>      qapi_error =3D g_strdup_printf("Memory hotunplug rejected by the gue=
st "
>                                   "for device %s", dev->id);
> -    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
> +    qapi_event_send_mem_unplug_error(dev->id ? : "", qapi_error);
>  }
> =20
>  /* Callback to be called during DRC release. */


