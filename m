Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C54AD834
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:16:27 +0100 (CET)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPQ2-0004h6-9x
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:16:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHOpg-0007mO-BI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:38:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHOpd-0001zE-6Z
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644320328;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SUCghDfC6HrdMvxehd+lAUpC1xz0dHHvtpzOI4qq01k=;
 b=CejuJVntES9khq27tczaCxKjIZDBf0EiE5CZP3358WKi90/WJu9rGA7Tuu2ZJs0sRBdZqJ
 JAfahvPmXZNDbuabRdzPpAfsOwCxx+Z7rDLJLZKVYyZHjrcILix/RUAnDJ0VkY8H5WQ8y2
 QDF3t9NiNLOm0XIA92GJR8Qa7ZlCYJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-uSvq0HB8OyKPnwpl6_j1Kw-1; Tue, 08 Feb 2022 06:38:44 -0500
X-MC-Unique: uSvq0HB8OyKPnwpl6_j1Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9F431091DBD;
 Tue,  8 Feb 2022 11:38:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B95D6105910C;
 Tue,  8 Feb 2022 11:38:41 +0000 (UTC)
Date: Tue, 8 Feb 2022 11:38:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Message-ID: <YgJWPzFczlDBJV/I@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 08:54:02PM +0000, Mark Cave-Ayland wrote:
> This displays detailed information about the device registers and timers to aid
> debugging problems with timers and interrupts.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hmp-commands-info.hx | 12 ++++++
>  hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index e90f20a107..4e714e79a2 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -879,3 +879,15 @@ SRST
>    ``info sgx``
>      Show intel SGX information.
>  ERST
> +
> +    {
> +        .name       = "via",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "show guest 6522 VIA devices",
> +    },
> +
> +SRST
> +  ``info via``
> +    Show guest 6522 VIA devices.
> +ERST
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index aaae195d63..cfa6a9c44b 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -30,6 +30,8 @@
>  #include "hw/misc/mos6522.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
> +#include "monitor/monitor.h"
> +#include "qapi/type-helpers.h"
>  #include "qemu/timer.h"
>  #include "qemu/cutils.h"
>  #include "qemu/log.h"
> @@ -415,6 +417,95 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>      }
>  }
>  
> +static int qmp_x_query_via_foreach(Object *obj, void *opaque)


> +
> +static HumanReadableText *qmp_x_query_via(Error **errp)
> +{
> +    g_autoptr(GString) buf = g_string_new("");
> +
> +    object_child_foreach_recursive(object_get_root(),
> +                                   qmp_x_query_via_foreach, buf);
> +
> +    return human_readable_text_from_str(buf);
> +}

This provides a code handler for a QMP command which is good,
but doesn't ever define the QMP command in the qapi/ schema.


>  static const MemoryRegionOps mos6522_ops = {
>      .read = mos6522_read,
>      .write = mos6522_write,
> @@ -547,6 +638,7 @@ static const TypeInfo mos6522_type_info = {
>  static void mos6522_register_types(void)
>  {
>      type_register_static(&mos6522_type_info);
> +    monitor_register_hmp_info_hrt("via", qmp_x_query_via);

This only registers the HMP counterpart.

The idea of the HumanReadableText handler is that it is calling
a QMP command that is exposed to apps.

>  }

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


