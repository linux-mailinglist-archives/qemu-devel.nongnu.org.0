Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C3F414892
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:15:06 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT19V-0000UJ-QG
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mT15s-00064Y-2V
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mT15q-0007vV-7c
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632312677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4D5cn61n7U3H0g70SUqau7FZhZ9cVDsWdf3yUDRffzA=;
 b=RlKy06WjBQa+ZpYhwConlIxwtt1ahHGpJvL8DoMnVvuT8cKfCVxzunR9sXwgYAZ1z1ZKlk
 PQsJssuVK52Dt/dfooqmvC3qwFT4vDEkK16UF/XeH4UiSDymNHSJH+MIpBvapzT14OvkIp
 hl8Js3MiCWfTaCFerpKTnwPNgsuoVsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-8pY17FztO9WjB9ZOKPZefA-1; Wed, 22 Sep 2021 08:11:16 -0400
X-MC-Unique: 8pY17FztO9WjB9ZOKPZefA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C96880A1BC
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:11:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F9D5C3DF;
 Wed, 22 Sep 2021 12:11:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 03D7D113865F; Wed, 22 Sep 2021 14:11:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] monitor: Consider "id" when rate-limiting
 MEMORY_DEVICE_SIZE_CHANGE qapi events
References: <20210921102434.24273-1-david@redhat.com>
Date: Wed, 22 Sep 2021 14:11:13 +0200
In-Reply-To: <20210921102434.24273-1-david@redhat.com> (David Hildenbrand's
 message of "Tue, 21 Sep 2021 12:24:34 +0200")
Message-ID: <878rzolsim.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> We have to consider the device id, otherwise we'll lose some events for
> unrelated devices. If the device does not have a device id (very unlikely),
> the target of the notifications has to update the size of all devices
> manually either way.
>
> This was noticed by starting a VM with two virtio-mem devices that each
> have a requested size > 0. The Linux guest will initialize both devices
> in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
> one of the devices.

Fascinating.

Event rate limiting works as follows.

An event is rate-limited when monitor_qapi_event_conf[event].rate != 0.

When such an event arrives, it is held in a bucket until a timer
associated with the bucket expires.  Putting an event in an empty bucket
starts its timer.  Putting an event in a non-empty bucket replaces its
old contents.

The bucket to use for an event depends on its event type, and for some
events also on certain event arguments.

This patch solves the "MEMORY_DEVICE_SIZE_CHANGE events from different
devices eat each other" by splitting the event's bucket.

The split is imperfect: each device with a qdev ID gets its own bucket,
all devices without ID have to share a bucket.

This is actually a flaw in the event's design: you can't distinguish
events from different devices without IDs.

To fix that flaw, add the QOM path to the event.

You can then get a perfect bucket split: use the QOM path instead of
the qdev ID.

Related: [PATCH v8 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR
QAPI event
Message-Id: <20210907004755.424931-6-danielhb413@gmail.com>
This deprecates MEM_UNPLUG_ERROR, which only provides a qdev ID in
favour of DEVICE_UNPLUG_GUEST_ERROR, which has a wider scope, and also
provides a QOM path.

Different tack: perhaps the rate limiting is too simplistic and overly
aggressive.  Its purpose is to avoid a flood.  Two events are not a
flood, even when one follows the other quickly.  Heck, even a dozen
aren't.

>
> Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Human Monitor (HMP))
> Cc: Markus Armbruster <armbru@redhat.com> (supporter:QMP)
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  monitor/monitor.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 46a171bca6..05c0b32b67 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -474,6 +474,11 @@ static unsigned int qapi_event_throttle_hash(const void *key)
>          hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
>      }
>  
> +    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE &&
> +        qdict_get(evstate->data, "id")) {
> +        hash += g_str_hash(qdict_get_str(evstate->data, "id"));
> +    }
> +
>      return hash;
>  }
>  
> @@ -496,6 +501,20 @@ static gboolean qapi_event_throttle_equal(const void *a, const void *b)
>                         qdict_get_str(evb->data, "node-name"));
>      }
>  
> +    if (eva->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
> +        const bool id_a = qdict_get(eva->data, "id");
> +        const bool id_b = qdict_get(evb->data, "id");
> +
> +        if (!id_a && !id_b) {
> +            return TRUE;
> +        } else if (id_a ^ id_b) {
> +            return FALSE;
> +        }
> +
> +        return !strcmp(qdict_get_str(eva->data, "id"),
> +                       qdict_get_str(evb->data, "id"));
> +    }
> +
>      return TRUE;
>  }

Patch looks sane, but I recommend to first add the QOM path to the
event, then use it instead of the qdev ID.


