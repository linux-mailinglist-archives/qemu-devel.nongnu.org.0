Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9981E1D4E0A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 14:48:29 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZZlM-0005bE-IR
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 08:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jZZiK-0001bv-Qc
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jZZiI-0001y5-Tw
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H87g0Tj+TOSKAiDl3QcQhSylCj8jOchmaFTlfTy2Rvk=;
 b=DikEfFCQwqLxwV/LeFroS2tLCf0YGQI+gBHgY9d+syXYdvEiea8Gtnut55uYYKzU4BHNXY
 AVIGsTNl8+HIy5dJlslKziPdWzbgxclTq9KTwVYOPU5y+O1i5rw8YLKxhaUYfkjKwTa/Ub
 4sXpF5zASwYDrJ7uyfubiVIbAsVG1oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-bBH6pIYQNVWvADNZeh7MPA-1; Fri, 15 May 2020 08:45:13 -0400
X-MC-Unique: bBH6pIYQNVWvADNZeh7MPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D5F19200DD;
 Fri, 15 May 2020 12:45:12 +0000 (UTC)
Received: from work-vm (ovpn-114-149.ams2.redhat.com [10.36.114.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DA5E2E16D;
 Fri, 15 May 2020 12:45:03 +0000 (UTC)
Date: Fri, 15 May 2020 13:45:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 07/17] migration/rdma: Use
 ram_block_discard_set_broken()
Message-ID: <20200515124501.GE2954@work-vm>
References: <20200506094948.76388-1-david@redhat.com>
 <20200506094948.76388-8-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506094948.76388-8-david@redhat.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_HK_NAME_DR=0.01 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> RDMA will pin all guest memory (as documented in docs/rdma.txt). We want
> to mark RAM block discards to be broken - however, to keep it simple
> use ram_block_discard_is_required() instead of inhibiting.

Should this be dependent on whether rdma->pin_all is set?
Even with !pin_all some will be pinned at any given time
(when it's registered with the rdma stack).

Dave

> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/rdma.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index f61587891b..029adbb950 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -29,6 +29,7 @@
>  #include "qemu/sockets.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/coroutine.h"
> +#include "exec/memory.h"
>  #include <sys/socket.h>
>  #include <netdb.h>
>  #include <arpa/inet.h>
> @@ -4017,8 +4018,14 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>      Error *local_err = NULL;
>  
>      trace_rdma_start_incoming_migration();
> -    rdma = qemu_rdma_data_init(host_port, &local_err);
>  
> +    /* Avoid ram_block_discard_set_broken(), cannot change during migration. */
> +    if (ram_block_discard_is_required()) {
> +        error_setg(errp, "RDMA: cannot set discarding of RAM broken");
> +        return;
> +    }
> +
> +    rdma = qemu_rdma_data_init(host_port, &local_err);
>      if (rdma == NULL) {
>          goto err;
>      }
> @@ -4064,10 +4071,17 @@ void rdma_start_outgoing_migration(void *opaque,
>                              const char *host_port, Error **errp)
>  {
>      MigrationState *s = opaque;
> -    RDMAContext *rdma = qemu_rdma_data_init(host_port, errp);
>      RDMAContext *rdma_return_path = NULL;
> +    RDMAContext *rdma;
>      int ret = 0;
>  
> +    /* Avoid ram_block_discard_set_broken(), cannot change during migration. */
> +    if (ram_block_discard_is_required()) {
> +        error_setg(errp, "RDMA: cannot set discarding of RAM broken");
> +        return;
> +    }
> +
> +    rdma = qemu_rdma_data_init(host_port, errp);
>      if (rdma == NULL) {
>          goto err;
>      }
> -- 
> 2.25.3
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


