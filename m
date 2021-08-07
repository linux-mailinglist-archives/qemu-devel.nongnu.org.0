Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3723E359D
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 15:49:15 +0200 (CEST)
Received: from localhost ([::1]:47764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCMhN-0005L8-Jx
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 09:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMWu-0000hc-Ml
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:38:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMWq-000490-Kb
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628343498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYedsvBMPO8SddUz97UAFQo2wvSqt6y6sbZoTd3qyaU=;
 b=O4veMHDDn5+1O7Y3YSUW1vLsO2a8ZnqtBjJMlT77xcyGSz5XNojkD6HXiT2Nhj7vV7azfO
 ZNG2S7RSwnPO8IJTaism8T8GQyovaZJabDpsLj35fISiQDFWGBRIUYZnRxOJD7TTv/6uxD
 IX1rH9iIHAMTMk7Doh1dQRUz/zgGCIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-0CrH8PJPPGOiu8Yc3PKDQg-1; Sat, 07 Aug 2021 09:38:17 -0400
X-MC-Unique: 0CrH8PJPPGOiu8Yc3PKDQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A2D4107ACF5;
 Sat,  7 Aug 2021 13:38:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ADD360C13;
 Sat,  7 Aug 2021 13:38:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78D3111380A0; Sat,  7 Aug 2021 15:38:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 1/7] hw/acpi/memory_hotplug.c: avoid sending
 MEM_UNPLUG_ERROR if dev->id is NULL
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-2-danielhb413@gmail.com>
Date: Sat, 07 Aug 2021 15:38:13 +0200
In-Reply-To: <20210719200827.1507276-2-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 19 Jul 2021 17:08:21 -0300")
Message-ID: <87h7g1cr3u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I apologize for the not reviewing this promptly.

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> qapi_event_send_mem_unplug_error() deals with @device being NULL by
> replacing it with an empty string ("") when emitting the event. Aside
> from the fact that this is a side effect that can be patched someday,

I guess by "side effect" you allude to the output visitor's misfeature
to map null pointer to "".

> there's also the lack of utility that the event brings to listeners,
> e.g.  "a memory unplug error happened somewhere".

True.

> We're better of not emitting the event if dev->id is NULL.

On a green field, yes.  But is it worth an incompatible change now?  I
doubt it.

>                                                            Next patches
> will introduce a new device unplug error event that is better suited to
> deal with dev->id NULL scenarios. MEM_UNPLUG_ERROR will continue to be
> emitted to avoid breaking existing APIs, but it'll be deprecated and
> removed in the future.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/acpi/memory_hotplug.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..e37acb0367 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -177,9 +177,14 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>              /* call pc-dimm unplug cb */
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
> +                const char *error_pretty = error_get_pretty(local_err);
> +
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> -                                                 error_get_pretty(local_err));
> +
> +                if (dev->id) {
> +                    qapi_event_send_mem_unplug_error(dev->id, error_pretty);
> +                }
> +
>                  error_free(local_err);
>                  break;
>              }

Three options:

1. Make the incompatible change.  Keep this patch.  Needs a release
   note.

2. Continue to rely on the output visitor's misfeature.  Drop this
   patch.

   Relying on the misfeature is best avoided, at least in new code.

3. Make the mapping explicit here, and avoid relying on the misfeature.
   Something like the appended patch.

I don't like 1.  I think the choice between 2. and 3. depends on how it
fits with the remainder of this series.


diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index af37889423..89c411dd5c 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -178,7 +178,7 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
-                qapi_event_send_mem_unplug_error(dev->id,
+                qapi_event_send_mem_unplug_error(dev->id ?: "",
                                                  error_get_pretty(local_err));
                 error_free(local_err);
                 break;


