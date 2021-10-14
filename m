Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A5A42E2D4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 22:33:21 +0200 (CEST)
Received: from localhost ([::1]:38610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb7Pk-0001aG-G1
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 16:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mb7OY-0000oh-DY
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 16:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mb7OS-00010F-Gs
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 16:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634243519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kdsd56cTUXL7sAg4EZPKSeulZSaRnVW4niSxCsHqPtc=;
 b=WjFjZ4qPjo9NFEL1eiBUYvlc0pzs7OF+mN/CGWbtYxtifAwf9ssJCDwCIh34sXkOd/K2bo
 Gi7Um/t1gLzZLNDqPYTAJNhDpKq2BOSiVEdnebeSGwzF1R0pvp8NyiaUNlp1TJxn7QNm4F
 Ut+o5lgYXlnTZdGrviK2FvrVdngEGro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-a0_DqoltP7u0HL0KTeYAgA-1; Thu, 14 Oct 2021 16:31:53 -0400
X-MC-Unique: a0_DqoltP7u0HL0KTeYAgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F969362FB;
 Thu, 14 Oct 2021 20:31:51 +0000 (UTC)
Received: from redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CF565DEFA;
 Thu, 14 Oct 2021 20:31:31 +0000 (UTC)
Date: Thu, 14 Oct 2021 15:31:30 -0500
From: Eric Blake <eblake@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 02/25] include/block/block: split header into I/O and
 global state API
Message-ID: <20211014203130.7ez223436cdrg6zs@redhat.com>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012084906.2060507-3-eesposit@redhat.com>
User-Agent: NeoMutt/20210205-854-613e2c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 04:48:43AM -0400, Emanuele Giuseppe Esposito wrote:
> block.h currently contains a mix of functions:
> some of them run under the BQL and modify the block layer graph,
> others are instead thread-safe and perform I/O in iothreads.
> It is not easy to understand which function is part of which
> group (I/O vs GS), and this patch aims to clarify it.
> 
> The "GS" functions need the BQL, and often use
> aio_context_acquire/release and/or drain to be sure they
> can modify the graph safely.
> The I/O function are instead thread safe, and can run in
> any AioContext.
> 
> By splitting the header in two files, block-io.h
> and block-global-state.h we have a clearer view on what
> needs what kind of protection. block-common.h
> instead contains common structures shared by both headers.

s/instead //

> 
> block.h is left there for legacy and to avoid changing
> all includes in all c files that use the block APIs.
> 
> Assertions are added in the next patch.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---

> diff --git a/include/block/block-common.h b/include/block/block-common.h
> new file mode 100644
> index 0000000000..4f1fd8de21
> --- /dev/null
> +++ b/include/block/block-common.h
> @@ -0,0 +1,389 @@
> +#ifndef BLOCK_COMMON_H
> +#define BLOCK_COMMON_H

As a new file, it probably deserves a copyright/license blurb copied
from the file it is split out of.

> diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
> new file mode 100644
> index 0000000000..b57e275da9
> --- /dev/null
> +++ b/include/block/block-global-state.h
> @@ -0,0 +1,263 @@
> +#ifndef BLOCK_GLOBAL_STATE_H
> +#define BLOCK_GLOBAL_STATE_H

Likewise, here and in all other newly-split files in your series.

> +++ b/include/block/block.h
> @@ -1,864 +1,9 @@
>  #ifndef BLOCK_H
>  #define BLOCK_H

Oh. There wasn't one to copy from :( Well, now's as good a time to fix
that as any.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


