Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F931A362
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:16:53 +0100 (CET)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAc3o-0004gd-71
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAc1l-00047B-BV
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAc1i-0000Eg-BK
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613150080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DygX3bYQyrvD4K/hl8swfqSQ1BSHTGX+eC+SuxHk/o=;
 b=FMcp7je0ZzO5TyZXZj7NixWvaPOfWppAd9h2ELQJr+MqwKyoNu+o6IqVon5J6TAXLYFVgb
 i6XfPY5O680Vj5awpSM4UIkmOl2AK5+r3B/0u1gtnz7Ka+qdR9Dwey06+mPOH9i+v6BCqT
 zELW5EMWLzZFfBURMEOItZN8ojSZp9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-bguF6g5APgiYRKPK_z3n7g-1; Fri, 12 Feb 2021 12:14:37 -0500
X-MC-Unique: bguF6g5APgiYRKPK_z3n7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF978874982;
 Fri, 12 Feb 2021 17:14:35 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B60F10023AD;
 Fri, 12 Feb 2021 17:14:25 +0000 (UTC)
Subject: Re: [PATCH v2 02/10] block/nbd: implement .bdrv_cancel_in_flight
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
 <20210205163720.887197-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <57fd166e-d17f-e2f8-bbb5-b86e467af40f@redhat.com>
Date: Fri, 12 Feb 2021 11:14:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205163720.887197-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 10:37 AM, Vladimir Sementsov-Ogievskiy wrote:
> Just stop waiting for connection in existing requests.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/nbd.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index b3cbbeb4b0..c26dc5a54f 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -2458,6 +2458,18 @@ static const char *const nbd_strong_runtime_opts[] = {
>      NULL
>  };
>  
> +static void nbd_cancel_in_flight(BlockDriverState *bs)
> +{
> +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;

This cast is not necessary in C, but it doesn't hurt.

> +
> +    reconnect_delay_timer_del(s);
> +
> +    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
> +        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
> +        qemu_co_queue_restart_all(&s->free_sema);
> +    }
> +}
> +

R-b still stands

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


