Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED05C624150
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:24:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5eF-000225-VM; Thu, 10 Nov 2022 06:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ot5dd-00020s-Pj
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ot5da-0007qT-4Y
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668079344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I///ZYK2kxkI50izJRjHTyUsRl5uqGaYyhNCOWP0SRA=;
 b=ToHP0bXJpozP+fl7desl7hn/G3st9li0rkxOwKgLqZvxU448CC8H0Bva42Vnr+nyqZsByU
 yRtkQYRE9vSZAK7cqW/DmYmpADlbFKHIt6LZFrLcf/vr6ySIcGmJEvzn7euld0vadc/aRa
 KsSNzusUakEru2+8ZR1B0psIwrL8vcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-f102uLhvOTi1DAMPsW4ORA-1; Thu, 10 Nov 2022 06:22:23 -0500
X-MC-Unique: f102uLhvOTi1DAMPsW4ORA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 078D1101AA45
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 11:22:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D67CE20290AE;
 Thu, 10 Nov 2022 11:22:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 75FE921E6921; Thu, 10 Nov 2022 12:22:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Jason Wang <jasowang@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH] net: stream: add a new option to automatically reconnect
References: <20221110073400.968475-1-lvivier@redhat.com>
Date: Thu, 10 Nov 2022 12:22:21 +0100
In-Reply-To: <20221110073400.968475-1-lvivier@redhat.com> (Laurent Vivier's
 message of "Thu, 10 Nov 2022 08:34:00 +0100")
Message-ID: <87v8nnhx5e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Laurent Vivier <lvivier@redhat.com> writes:

> In stream mode, if the server shuts down there is currently
> no way to reconnect the client to a new server without removing
> the NIC device and the netdev backend (or to reboot).
>
> This patch introduces a reconnect option that specifies a delay
> to try to reconnect with the same parameters.
>
> Add a new test in qtest to test the reconnect option and the
> connect/disconnect events.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index 522ac582edeb..5b72c936b3ac 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -585,6 +585,9 @@
>  # @addr: socket address to listen on (server=true)
>  #        or connect to (server=false)
>  # @server: create server socket (default: false)
> +# @reconnect: For a client socket, if a socket is disconnected,
> +#             then attempt a reconnect after the given number of seconds.
> +#             Setting this to zero disables this function. (default: 0)

Double-checking: it attempts to reconnect *once*.  Correct?

Are we sure multiples of seconds will be fine?

"For a client socket": what happens for a server socket?

>  #
>  # Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
>  #
> @@ -593,7 +596,8 @@
>  { 'struct': 'NetdevStreamOptions',
>    'data': {
>      'addr':   'SocketAddress',
> -    '*server': 'bool' } }
> +    '*server': 'bool',
> +    '*reconnect': 'uint32' } }
>  
>  ##
>  # @NetdevDgramOptions:

[...]


