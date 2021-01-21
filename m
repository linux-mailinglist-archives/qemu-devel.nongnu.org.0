Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A92FDEF9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 02:47:20 +0100 (CET)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2P4B-00087m-0G
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 20:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2P1m-0007aL-Ky
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:44:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2P1h-0002sm-FR
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611193483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKX7smhTgkTsQnn3vOurPwHX+KF4Gx8Hu6H16+i6yXU=;
 b=J1KJ+cpxnTVXLSe96EzA3sAx35NK7WimgIKJZmdR2xyobdTtBBlh+m5PP2SuZdBCLYAdxE
 8zzEk8gnK9mouppmf+e27psxJ0sszf0hI4M3lhnQsxGICjK60/XSpFIKtpYA57wcymoVU6
 W7uoeB+5s9Ma58O0s23AX+8HKlUmtJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-ijJwaQp0O5aL1AQEVx-WKw-1; Wed, 20 Jan 2021 20:44:40 -0500
X-MC-Unique: ijJwaQp0O5aL1AQEVx-WKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CDB78030A0;
 Thu, 21 Jan 2021 01:44:39 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D6375D9C2;
 Thu, 21 Jan 2021 01:44:38 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
 <20201130134024.19212-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 2/8] nbd: allow reconnect on open, with corresponding
 new options
Message-ID: <eaa152c3-5bb0-aff0-1dfe-526069f94ff7@redhat.com>
Date: Wed, 20 Jan 2021 19:44:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201130134024.19212-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 7:40 AM, Vladimir Sementsov-Ogievskiy wrote:
> Note: currently, using new option with long timeout in qmp command
> blockdev-add is not good idea, as qmp interface is blocking, so,
> don't add it now, let's add it later after
> "monitor: Optionally run handlers in coroutines" series merged.

If I'm not mistaken, that landed as of eb94b81a94.  Is it just the
commit message that needs an update, or does this patch need a respin?

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 115 +++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 92 insertions(+), 23 deletions(-)
> 

> @@ -474,6 +484,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>      s->wait_connect = true;
>      qemu_coroutine_yield();
>  
> +    if (!s->connect_thread) {
> +        error_setg(errp, "Connection attempt cancelled by other operation");
> +        return NULL;
> +    }

Does this need to use atomics for proper access to s->connect_thread
across threads?  Or are all the operations done by other coroutines but
within the same thread, so we are safe?


> @@ -624,10 +645,15 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>      bdrv_inc_in_flight(s->bs);
>  
>  out:
> -    s->connect_status = ret;
> -    error_free(s->connect_err);
> -    s->connect_err = NULL;
> -    error_propagate(&s->connect_err, local_err);
> +    if (s->connect_status == -ETIMEDOUT) {
> +        /* Don't rewrite timeout error by following cancel-provoked error */

Maybe:

/* Don't propagate a timeout error caused by a job cancellation. */


> +static void open_timer_cb(void *opaque)
> +{
> +    BDRVNBDState *s = opaque;
> +
> +    if (!s->connect_status) {
> +        /* First attempt was not finished. We should set an error */
> +        s->connect_status = -ETIMEDOUT;
> +        error_setg(&s->connect_err, "First connection attempt is cancelled by "
> +                   "timeout");
> +    }
> +
> +    nbd_teardown_connection_async(s->bs);
> +    open_timer_del(s);
> +}
> +
> +static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
> +{
> +    assert(!s->open_timer && s->state == NBD_CLIENT_OPENING);
> +    s->open_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
> +                                  QEMU_CLOCK_REALTIME,
> +                                  SCALE_NS,
> +                                  open_timer_cb, s);
> +    timer_mod(s->open_timer, expire_time_ns);
> +}
> +


> @@ -2180,6 +2235,14 @@ static QemuOptsList nbd_runtime_opts = {
>                      "future requests before a successful reconnect will "
>                      "immediately fail. Default 0",
>          },
> +        {
> +            .name = "open-timeout",
> +            .type = QEMU_OPT_NUMBER,
> +            .help = "In seconds. If zero, nbd driver tries to establish "
> +                    "connection only once, on fail open fails. If non-zero, "

If zero, the nbd driver tries the connection only once, and fails to
open if the connection fails.

> +                    "nbd driver may do several attempts until success or "
> +                    "@open-timeout seconds passed. Default 0",

If non-zero, the nbd driver will repeat connection attempts until
successful or until @open-timeout seconds have elapsed.

> +        },

Where is the QMP counterpart for setting this option?

>          { /* end of list */ }
>      },
>  };
> @@ -2235,6 +2298,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
>      }
>  
>      s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
> +    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
>  
>      ret = 0;
>  
> @@ -2268,6 +2332,11 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>      bdrv_inc_in_flight(bs);
>      aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
>  
> +    if (s->open_timeout) {
> +        open_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
> +                        s->open_timeout * NANOSECONDS_PER_SECOND);
> +    }
> +
>      if (qemu_in_coroutine()) {
>          s->open_co = qemu_coroutine_self();
>          qemu_coroutine_yield();
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


