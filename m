Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06FE4048AA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:43:25 +0200 (CEST)
Received: from localhost ([::1]:34232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHWe-0002b7-J5
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOHTm-00080F-AZ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:40:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOHTg-0008MZ-6P
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631184018;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oL33Aa6CtkK/7ZX9sUngGFwqhn1cvVQ/PE0/Nntta0Q=;
 b=CBBpD3RPJbz64EG4V2nqxguOM82RQYoUfSpmWVhJHkt7Ix7tFzcsd8zj9KUyEp2Lreuun5
 iERGQunj15NpwKQsUsoH6oL4YbFhccp/wK9zp7y1+QAZCa3PVbVcZnmp8FUZG7LzqEo1nC
 2A6AbWLly2/W9JPwAA0JF7IExBWCjpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-P32uXViMPg6xrcmBrVASwA-1; Thu, 09 Sep 2021 06:40:17 -0400
X-MC-Unique: P32uXViMPg6xrcmBrVASwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F11D802929;
 Thu,  9 Sep 2021 10:40:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C0DC61156;
 Thu,  9 Sep 2021 10:40:09 +0000 (UTC)
Date: Thu, 9 Sep 2021 11:40:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 03/10] block: Use qemu_security_policy_taint() API
Message-ID: <YTnkhxWbm3NvGo/T@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-4-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 01:20:17AM +0200, Philippe Mathieu-Daudé wrote:
> Add the BlockDriver::bdrv_taints_security_policy() handler.
> Drivers implementing it might taint the global QEMU security
> policy.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/block/block_int.h | 6 +++++-
>  block.c                   | 6 ++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index f1a54db0f8c..0ec0a5c06e9 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -169,7 +169,11 @@ struct BlockDriver {
>      int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
>                            Error **errp);
>      void (*bdrv_close)(BlockDriverState *bs);
> -
> +    /*
> +     * Return %true if the driver is withing QEMU security policy boundary,
> +     * %false otherwise. See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool (*bdrv_taints_security_policy)(BlockDriverState *bs);
>  
>      int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
>                                         Error **errp);
> diff --git a/block.c b/block.c
> index b2b66263f9a..696ba486001 100644
> --- a/block.c
> +++ b/block.c
> @@ -49,6 +49,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/cutils.h"
>  #include "qemu/id.h"
> +#include "qemu-common.h"
>  #include "block/coroutines.h"
>  
>  #ifdef CONFIG_BSD
> @@ -1587,6 +1588,11 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
>          }
>      }
>  
> +    if (drv->bdrv_taints_security_policy) {
> +        qemu_security_policy_taint(drv->bdrv_taints_security_policy(bs),
> +                                   "Block protocol '%s'", drv->format_name);
> +    }
> +
>      return 0;
>  open_failed:
>      bs->drv = NULL;

Again we need a way to report this via QAPI, but we don't have a natural
place is hang this off for introspection before starting a guest.

The best we can do is report the information after a block backend has
been instantiated. eg  Modify "BlockInfo" struct to gain

   '*secure': 'bool'

Note I made this an optional field, since unless we mark every single
block driver impl straight away, we'll need to cope with the absence
of information.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


