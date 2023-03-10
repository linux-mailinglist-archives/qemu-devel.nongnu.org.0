Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BFE6B5424
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:18:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pal3M-0001th-Uk; Fri, 10 Mar 2023 17:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pal3G-0001p7-RT
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:17:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pal3E-00052V-D2
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678486643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VoGATSYAmYDYHgE0LEJldi2s67n6gZJ7XV9ethas4So=;
 b=RVZp3nYCLcAWNGh5W5Th4cMoGcjBz6Eu8BieHeKt/K12NIW7NyAMW3UjBjeIT+8tMO4q8i
 M36V15mWPh4hTMofKi4vZ+WjoN5csLOMoqvgXhbFx12IseuzzKgJkY4ponDVI4LsBcxloh
 iRd4EMPMPJLnw0cZ0DMuCchPrim/3/0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-Xp4jxYw_OdmI6YYNt0g32A-1; Fri, 10 Mar 2023 17:17:20 -0500
X-MC-Unique: Xp4jxYw_OdmI6YYNt0g32A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A14E13C0253D;
 Fri, 10 Mar 2023 22:17:19 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8E542026D4B;
 Fri, 10 Mar 2023 22:17:18 +0000 (UTC)
Date: Fri, 10 Mar 2023 16:17:17 -0600
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, vsementsov@yandex-team.ru,
 hreitz@redhat.com, kwolf@redhat.com
Subject: Re: [PATCH nbd 1/4] nbd: Add multi-conn option
Message-ID: <20230310221717.vb2b72e3tkjkpyqi@redhat.com>
References: <20230309113946.1528247-1-rjones@redhat.com>
 <20230309113946.1528247-2-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309113946.1528247-2-rjones@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 09, 2023 at 11:39:43AM +0000, Richard W.M. Jones wrote:
> Add multi-conn option to the NBD client.  This commit just adds the
> option, it is not functional.

Maybe add the phrase "until later in this patch series" ?

> 
> Setting this to a value > 1 permits multiple connections to the NBD
> server; a typical value might be 4.  The default is 1, meaning only a
> single connection is made.  If the NBD server does not advertise that
> it is safe for multi-conn then this setting is forced to 1.
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  block/nbd.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index bf2894ad5c..5ffae0b798 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -49,6 +49,7 @@
>  
>  #define EN_OPTSTR ":exportname="
>  #define MAX_NBD_REQUESTS    16
> +#define MAX_MULTI_CONN      16
>  
>  #define HANDLE_TO_INDEX(bs, handle) ((handle) ^ (uint64_t)(intptr_t)(bs))
>  #define INDEX_TO_HANDLE(bs, index)  ((index)  ^ (uint64_t)(intptr_t)(bs))
> @@ -98,6 +99,7 @@ typedef struct BDRVNBDState {
>      /* Connection parameters */
>      uint32_t reconnect_delay;
>      uint32_t open_timeout;
> +    uint32_t multi_conn;
>      SocketAddress *saddr;
>      char *export;
>      char *tlscredsid;
> @@ -1803,6 +1805,15 @@ static QemuOptsList nbd_runtime_opts = {
>                      "attempts until successful or until @open-timeout seconds "
>                      "have elapsed. Default 0",
>          },
> +        {
> +            .name = "multi-conn",
> +            .type = QEMU_OPT_NUMBER,
> +            .help = "If > 1 permit up to this number of connections to the "
> +                    "server. The server must also advertise multi-conn "
> +                    "support.  If <= 1, only a single connection is made "
> +                    "to the server even if the server advertises multi-conn. "
> +                    "Default 1",
> +        },
>          { /* end of list */ }
>      },
>  };
> @@ -1858,6 +1869,10 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
>  
>      s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
>      s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
> +    s->multi_conn = qemu_opt_get_number(opts, "multi-conn", 1);
> +    if (s->multi_conn > MAX_MULTI_CONN) {
> +        s->multi_conn = MAX_MULTI_CONN;
> +    }

This silently ignores out-of-range values (negative, greater than 16)
and treats 0 as a synonym for 1.  The latter I'm okay with, the former
I wonder if we should instead raise an error that the user is
requesting something we can't honor, instead of silently bounding it.

>  
>      ret = 0;
>  
> @@ -1912,6 +1927,15 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>  
>      nbd_client_connection_enable_retry(s->conn);
>  
> +    /*
> +     * We set s->multi_conn in nbd_process_options above, but now that
> +     * we have connected if the server doesn't advertise that it is

s/connected/connected,/

> +     * safe for multi-conn, force it to 1.
> +     */
> +    if (!(s->info.flags & NBD_FLAG_CAN_MULTI_CONN)) {
> +        s->multi_conn = 1;
> +    }
> +
>      return 0;

Is there an intended QAPI counterpart for this command?  We'll need
that if it is to be set during the command line of
qemu-storage-daemon.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


