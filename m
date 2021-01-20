Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C0C2FDC90
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 23:29:15 +0100 (CET)
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2LyU-0000cO-6u
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 17:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Lwr-00088Q-Ds
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 17:27:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Lwp-00042b-3P
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 17:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611181649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUsgNCar3wjbMyE2yxuR5PFUG41zPQy28/TIqkk/JlQ=;
 b=Xg7PslbjboYbN3sE6OAowKiN+zSRhX3Ju9y8hGMg4zp6nxxoIVbyI5jHS2o+XWEcNk4uH6
 20G31ZemY/573y5OIEEuq6tAfkLZo15j9ZXC+tyU/vPprL17InjDssCiJPgrYqQEcedH5+
 cde3afVCxesBvR1NkpCpo0PCcr+3/Yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264--ChfdzMoNQyx_0AQOxAMQQ-1; Wed, 20 Jan 2021 17:27:26 -0500
X-MC-Unique: -ChfdzMoNQyx_0AQOxAMQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFBB21005513;
 Wed, 20 Jan 2021 22:27:24 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D55860C74;
 Wed, 20 Jan 2021 22:27:21 +0000 (UTC)
Subject: Re: [PATCH 01/11] block: add new BlockDriver handler:
 bdrv_cancel_in_flight
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f23ca1d2-b90e-d9f5-5c3a-493ef259e994@redhat.com>
Date: Wed, 20 Jan 2021 16:27:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201118180433.11931-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
> It will be used to stop retrying NBD requests on mirror cancel.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block.h     |  3 +++
>  include/block/block_int.h |  9 +++++++++
>  block/io.c                | 11 +++++++++++
>  3 files changed, 23 insertions(+)
> 

How does this relate to the recent addition of the QMP yank command?


> +++ b/include/block/block_int.h
> @@ -344,6 +344,15 @@ struct BlockDriver {
>          bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
>          int64_t *map, BlockDriverState **file);
>  
> +    /*
> +     * This informs the driver that we are not more interested in in-flight

that we are no longer interested in the result of in-flight requests, so

> +     * requests results, so don't waste the time if possible.
> +     *
> +     * The example usage is to not wait for nbd target nodedreconnect timeout on
> +     * job-cancel.

One example usage is to avoid waiting for an nbd target node reconnect
timeout during job-cancel.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


