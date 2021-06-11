Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE353A4405
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:26:46 +0200 (CEST)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lri7R-0001aa-9W
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lri6g-0000p7-U3
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:25:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lri6Z-00004w-PS
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623421550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TmBmbLMKEABG7/gPeFq7paZ54ha64pLP8aSAnsN+LZU=;
 b=QFJwAYC9BtmKZSCq2UIsUzx6593HAzySesWDwzTCklawqjVc4/OS4nvq20JbIGMnRiBMdO
 SZp2t4JTZSVkCHF/VtQ1XB1TybDq2whFFvEZskiQJmsye5ph65kDAj4/APGVvfcK6Ylcq+
 GEK6cTMvA95RqbbsF/49H/HAZqpX5AE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-IFH0jTtrNn2i4wctTqacvw-1; Fri, 11 Jun 2021 10:25:47 -0400
X-MC-Unique: IFH0jTtrNn2i4wctTqacvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68DEF100CA88;
 Fri, 11 Jun 2021 14:25:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C93D260E3A;
 Fri, 11 Jun 2021 14:25:45 +0000 (UTC)
Date: Fri, 11 Jun 2021 09:25:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 11/32] block/nbd: drop thr->state
Message-ID: <20210611142544.7tgwkripjtdygetk@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-12-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210610100802.5888-12-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 01:07:41PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We don't need all these states. The code refactored to use two boolean
> variables looks simpler.
> 
> While moving the comment in nbd_co_establish_connection() rework it to
> give better information. Also, we are going to move the connection code
> to separate file and mentioning drained section would be confusing.
> 
> Improve also the comment in NBDConnectThread, while dropping removed
> state names from it.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 139 +++++++++++++++++-----------------------------------
>  1 file changed, 44 insertions(+), 95 deletions(-)
> 

>  typedef struct NBDConnectThread {
>      /* Initialization constants */
>      SocketAddress *saddr; /* address to connect to */
>  
> +    QemuMutex mutex;
> +
>      /*
> -     * Result of last attempt. Valid in FAIL and SUCCESS states.
> -     * If you want to steal error, don't forget to set pointer to NULL.
> +     * @sioc and @err present a result of connection attempt.
> +     * While running is true, they are used only by thread, mutex locking is not
> +     * needed. When thread is finished nbd_co_establish_connection steal these
> +     * pointers under mutex.

@sioc and @err represent a connection attempt.  While running is true,
they are only used by the connection thread, and mutex locking is not
needed.  Once the thread finishes, nbd_co_establish_connection then
steals these pointers under mutex.

>       */
>      QIOChannelSocket *sioc;
>      Error *err;
>  
> -    QemuMutex mutex;
> -    /* All further fields are protected by mutex */
> -    NBDConnectThreadState state; /* current state of the thread */
> +    /* All further fields are accessed only under mutex */
> +    bool running; /* thread is running now */
> +    bool detached; /* thread is detached and should cleanup the state */
>

Okay, I'm understanding this better than I did in v3.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


