Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC9866DE55
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHlb6-0004Aj-1R; Tue, 17 Jan 2023 08:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHlb0-00049G-CJ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHlax-0004HB-J5
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673960502;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/chzokvyXMKxbYZfi7YeHn1+JvuXaldMWvGS7POV7iE=;
 b=Ywd0wAvyd06x2uV2T0hUanh6SD+9w3qb9Vyml3fi1OxG/Obc9qfYapk+oEjxdktksNLoDd
 8asDwWQmWsJpCMeTMynfUBW7BSbVSYDtdJvBsh+Uo9Sw4chqJOjVhrBTEHnovjkHPKcJve
 XuJSOvwm8rqiFakFBOSb1ghF3J5u0co=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-2nMrik5iPnuzgX-qOKnUHw-1; Tue, 17 Jan 2023 08:01:41 -0500
X-MC-Unique: 2nMrik5iPnuzgX-qOKnUHw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2FD6101A55E;
 Tue, 17 Jan 2023 13:01:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F41D492B00;
 Tue, 17 Jan 2023 13:01:40 +0000 (UTC)
Date: Tue, 17 Jan 2023 13:01:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierre-Yves Ritschard <pyr@spootnik.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
Message-ID: <Y8acMi/eZAYfILg3@redhat.com>
References: <20221202151202.24851-1-pyr@spootnik.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202151202.24851-1-pyr@spootnik.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 02, 2022 at 04:12:04PM +0100, Pierre-Yves Ritschard wrote:
> Hi,
> 
> The provided patch allows the VNC websocket server of a qemu process to
> be provided over AF_UNIX as it is already possible for standard TCP VNC
> servers.
> 
> Now that many clients support websocket connections, some exclusively,
> it can be useful to expose the VNC server. One such case is when a
> proxy is present on a host machine, allowing it to proxy to a
> deterministic location withouth having to keep track of port mappings.
> 
> Removing the condition as is done in the provided patch creates a 
> functional server. If there's a downside to this approach I could not
> figure it out while reading the code. My hunch was that the condition
> was there for a reason, but it did not jump at me.
> 
> Cheers,
>   - pyr
> 
> ---
>  ui/vnc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git ui/vnc.c ui/vnc.c
> index 88f55cbf3c..b01a655400 100644
> --- ui/vnc.c
> +++ ui/vnc.c
> @@ -3729,11 +3729,6 @@ static int vnc_display_get_address(const char *addrstr,
>          addr->type = SOCKET_ADDRESS_TYPE_UNIX;
>          addr->u.q_unix.path = g_strdup(addrstr + 5);
>  
> -        if (websocket) {
> -            error_setg(errp, "UNIX sockets not supported with websock");
> -            goto cleanup;
> -        }
> -

Allowing websockets is fine, but just removing this check is not
sufficient

The 'websocket=XXXX' parameter for -vnc takes two formats

   websocket=on|off

or

   websocket=portnum

In the case of on|off, the code takes the original VNC display
num and listens on   5700 + display for websockets, 590 + display
for non-websockets.

In the case of a explicit port, the code listens on that port.

Also we fail to actually handle 'off' correctly, just treating
it as a named port

$ qemu-system-x86_64  -vnc :1,websocket=off
qemu-system-x86_64: -vnc :1,websocket=off: address resolution failed for :off: Servname not supported for ai_socktype


Anyway given an argument

   -vnc  unix:/some/path,websocket=on

this cause causes QEMU to listen on a relative path 'on'. We need
to define what the semantics for websockets=on are going to be
for UNIX sockets. Should it append '.ws' to the main path ? Should
we just not allow websockets=on and document it must be an explicit
path at all times ?

We also need to document this in qemu-options.hx.

>          if (to) {
>              error_setg(errp, "Port range not support with UNIX socket");
>              goto cleanup;
> -- 
> 2.38.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


