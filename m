Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CF6603C8F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 10:50:12 +0200 (CEST)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol4mB-0001fY-G7
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 04:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ol4ZS-0001VV-5l
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 04:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ol4ZP-0002nC-Fx
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 04:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666168617;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKK2DF5ogYhvDGgcDkjaqGenhLWkH/RXXLW5oajLjTc=;
 b=ILsjcDSqIC4T4pkqyzHGOa0FKhP25EsCAFJAHLjeWA4lpukJchl/KWo8rtrb4SViUiiFBY
 BNslh32nwLXhTw+/ctzke618yjm5o66CSVYex8myxBuK5bZ5N5BBrc6sDSv6S8bpdyDh+3
 +xyaiwhPStWHqHyXNbyj8Rwj6DW44Wo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-xilpxe_JMRmYv3sSsfWzRA-1; Wed, 19 Oct 2022 04:36:54 -0400
X-MC-Unique: xilpxe_JMRmYv3sSsfWzRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFFE229DD9BC;
 Wed, 19 Oct 2022 08:36:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6755340B40C9;
 Wed, 19 Oct 2022 08:36:32 +0000 (UTC)
Date: Wed, 19 Oct 2022 09:36:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 3/3] util/aio-win32: Correct the event array size in
 aio_poll()
Message-ID: <Y0+3DnYl1cEeweZU@redhat.com>
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <20220824085231.1630804-3-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824085231.1630804-3-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 24, 2022 at 04:52:31PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
> object handles. Correct the event array size in aio_poll() and
> add a assert() to ensure it does not cause out of bound access.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - change 'count' to unsigned
> 
>  util/aio-win32.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/util/aio-win32.c b/util/aio-win32.c
> index 44003d645e..80cfe012ad 100644
> --- a/util/aio-win32.c
> +++ b/util/aio-win32.c
> @@ -326,9 +326,9 @@ void aio_dispatch(AioContext *ctx)
>  bool aio_poll(AioContext *ctx, bool blocking)
>  {
>      AioHandler *node;
> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];

Interestingly, the orignial + 1 was entirely pointless, since
the aio_poll impl has no bounds checking at all, until your
new assert.

>      bool progress, have_select_revents, first;
> -    int count;
> +    unsigned count;
>      int timeout;
>  
>      /*
> @@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
>      QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
>          if (!node->deleted && node->io_notify
>              && aio_node_check(ctx, node->is_external)) {
> +            assert(count < MAXIMUM_WAIT_OBJECTS);
>              events[count++] = event_notifier_get_handle(node->e);
>          }
>      }

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


