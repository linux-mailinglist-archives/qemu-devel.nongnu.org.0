Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2047C150
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:18:19 +0100 (CET)
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfy6-0003eU-BA
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzfwS-0002f2-NZ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mzfwP-0007j7-4r
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640096191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J+hjbfVIWO1kJ38Exx9+2RzNb4kg9VP19XzKnB3rWr8=;
 b=A2hfTdU6061sy2JyBz+MwFssObeg8WqiV6i0Kza3e9gsMOMb8mrxLBYvrOUqeuZO29Ys6v
 ZRPvNGYCz0itC/EgdNY7Aacul98hMMlHhzTsGuXV24LFrn99S0kL1r+CXkzDxeLzFJOO00
 RBzu/SBMVujHl4MbsWMLZ6RruOb6HxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-hqJzRHS7OACO48ItEom0iw-1; Tue, 21 Dec 2021 09:16:28 -0500
X-MC-Unique: hqJzRHS7OACO48ItEom0iw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D8F18042FA;
 Tue, 21 Dec 2021 14:16:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E71374E2B6;
 Tue, 21 Dec 2021 14:15:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 74C37113865F; Tue, 21 Dec 2021 15:15:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/2] qapi/ui: introduce change-vnc-listen
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
 <20211220154418.1554279-3-vsementsov@virtuozzo.com>
Date: Tue, 21 Dec 2021 15:15:45 +0100
In-Reply-To: <20211220154418.1554279-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 20 Dec 2021 16:44:18 +0100")
Message-ID: <875yrihwmm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Add command that can change addresses where VNC server listens for new
> connections. Prior to 6.0 this functionality was available through
> 'change' qmp command which was deleted.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/about/removed-features.rst |  3 ++-
>  qapi/ui.json                    | 12 ++++++++++++
>  ui/vnc.c                        | 26 ++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index d42c3341de..20e6901a82 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -348,7 +348,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
>  ``change`` (removed in 6.0)
>  '''''''''''''''''''''''''''
>  
> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
> +Use ``blockdev-change-medium`` or ``change-vnc-password`` or
> +``change-vnc-listen`` instead.
>  
>  ``query-events`` (removed in 6.0)
>  '''''''''''''''''''''''''''''''''
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d7567ac866..14e6fe0b4c 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1304,3 +1304,15 @@
>  { 'command': 'display-reload',
>    'data': 'DisplayReloadOptions',
>    'boxed' : true }
> +
> +##
> +# @change-vnc-listen:
> +#
> +# Change set of addresses to listen for connections.

Please document the arguments:

   # @id: lorem ipsum
   #
   # @address: dolor sit amet
   #
   # @websockets: consectetur adipisici elit

> +#
> +# Since: 7.0
> +#
> +##
> +{ 'command': 'change-vnc-listen',
> +  'data': { 'id': 'str', 'addresses': ['SocketAddress'],
> +            '*websockets': ['SocketAddress'] } }

Lacks 'if': 'CONFIG_VNC'.

We already have change-vnc-password.  You add change-vnc-listen.  Is
there anything else we might want to change?

Aside: what's the difference between change-vnc-password and
set_password?

[...]


