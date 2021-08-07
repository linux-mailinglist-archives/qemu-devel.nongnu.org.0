Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B03E3594
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 15:42:04 +0200 (CEST)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCMaR-0000ek-C6
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 09:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMXV-0002ZC-Su
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCMXU-0004YJ-8T
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 09:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628343539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzHo4SyjJw26jN58CMb4079cSIhuApI+MruXQoeic60=;
 b=GaehlQjpO9+gS4dTKB+95RcicuM1TlRT33ygz4X6prFT8VWSE3c8nRB8M7x3N/B1FQZOTI
 XoxbjroAhTOX/jX/KInKrRX2pEzqBYz+Einsz4GjjLwhJMGX8pnsFy5VWzApcI9Df3WwML
 iUaU02Uqy55DvyVRs1chDBCnWPxWRmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-vK-tGz_UOciC-s-6udDziA-1; Sat, 07 Aug 2021 09:38:56 -0400
X-MC-Unique: vK-tGz_UOciC-s-6udDziA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3619C10066E8;
 Sat,  7 Aug 2021 13:38:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04AAF5D6A8;
 Sat,  7 Aug 2021 13:38:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1092011380A0; Sat,  7 Aug 2021 15:38:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 2/7] spapr.c: avoid sending MEM_UNPLUG_ERROR
 if dev->id is NULL
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-3-danielhb413@gmail.com>
Date: Sat, 07 Aug 2021 15:38:53 +0200
In-Reply-To: <20210719200827.1507276-3-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 19 Jul 2021 17:08:22 -0300")
Message-ID: <87czqpcr2q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: armbru@redhat.com, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> As done in hw/acpi/memory_hotplug.c, avoid sending
> qapi_event_send_mem_unplug_error() if dev->id is NULL.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 81699d4f8b..1611d7ab05 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3688,9 +3688,11 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
>       * Tell QAPI that something happened and the memory
>       * hotunplug wasn't successful.
>       */
> -    qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
> -                                 "for device %s", dev->id);
> -    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
> +    if (dev->id) {
> +        qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
> +                                     "for device %s", dev->id);
> +        qapi_event_send_mem_unplug_error(dev->id, qapi_error);
> +    }
>  }
>  
>  /* Callback to be called during DRC release. */

My review of PATCH 1 applies.


