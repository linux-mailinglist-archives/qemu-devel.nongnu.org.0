Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB134CC6F6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:16:22 +0100 (CET)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrs5-00045Y-OO
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:16:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPrqW-00036r-Lg
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPrqU-0002QS-HF
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646338481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0bk09+RXQeoJeDvv2aPq5IhCY6Jb1cK2LD8kAuLPPo=;
 b=UzEWsqFGyrj7mGr6dSHA79j2oIQCJoZwX++JVJKCwdthAWamo/tCNsCVn0kgYrt9b/gylu
 ePmF5O2ScactWLjYHaUiF18OA3oW6vg8BgqDjWf6bEzQiuFg9OzFMjVJIDZL634S9g6mnf
 0z50f4FLM9jkwrjz3+C6oljZpNbV804=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-tjyqEnM0PVKRIhQp1_idOQ-1; Thu, 03 Mar 2022 15:14:38 -0500
X-MC-Unique: tjyqEnM0PVKRIhQp1_idOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A4331091DA0;
 Thu,  3 Mar 2022 20:14:37 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F30146997;
 Thu,  3 Mar 2022 20:14:36 +0000 (UTC)
Date: Thu, 3 Mar 2022 14:14:34 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 02/12] block: pass desired TLS hostname through from
 block driver client
Message-ID: <20220303201434.gioet2wepccja7ag@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
 <20220303160330.2979753-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303160330.2979753-3-berrange@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 04:03:20PM +0000, Daniel P. Berrangé wrote:
> In
> 
>   commit a71d597b989fd701b923f09b3c20ac4fcaa55e81
>   Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>   Date:   Thu Jun 10 13:08:00 2021 +0300
> 
>     block/nbd: reuse nbd_co_do_establish_connection() in nbd_open()
> 
> the use of the 'hostname' field from the BDRVNBDState struct was
> lost, and 'nbd_connect' just hardcoded it to match the IP socket
> address. This was a harmless bug at the time since we block use
> with anything other than IP sockets.
> 
> Shortly though, We want to allow the caller to override the hostname

s/We/we/

> used in the TLS certificate checks. This is to allow for TLS
> when doing port forwarding or tunneling. Thus we need to reinstate
> the passing along of the 'hostname'.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  block/nbd.c             |  7 ++++---
>  include/block/nbd.h     |  3 ++-
>  nbd/client-connection.c | 12 +++++++++---
>  3 files changed, 15 insertions(+), 7 deletions(-)

Nice - this a great step towards fixing a longstanding annoyance of
mine that libnbd and nbdkit support TLS over Unix sockets, but qemu
didn't.

> @@ -1875,7 +1875,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>      }
>  
>      s->conn = nbd_client_connection_new(s->saddr, true, s->export,
> -                                        s->x_dirty_bitmap, s->tlscreds);
> +                                        s->x_dirty_bitmap, s->tlscreds,
> +                                        s->tlshostname);
>  
>      if (s->open_timeout) {
>          nbd_client_connection_enable_retry(s->conn);
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 78d101b774..a98eb665da 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -415,7 +415,8 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
>                                                 bool do_negotiation,
>                                                 const char *export_name,
>                                                 const char *x_dirty_bitmap,
> -                                               QCryptoTLSCreds *tlscreds);
> +                                               QCryptoTLSCreds *tlscreds,
> +                                               const char *tlshostname);

We already have a lot of parameters; does it make sense to bundle
tlshostname into the QCryptoTLSCreds struct at all?  But that would
change the QAPI (or maybe you do it later in the series), it is not a
show-stopper to this patch.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


