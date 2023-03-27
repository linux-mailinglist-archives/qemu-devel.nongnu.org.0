Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3BD6CB1E7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:44:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvYX-0004Hi-7n; Mon, 27 Mar 2023 18:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@strlen.de>)
 id 1pgvYV-0004HF-BC; Mon, 27 Mar 2023 18:43:11 -0400
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@strlen.de>)
 id 1pgvYT-0002SC-83; Mon, 27 Mar 2023 18:43:10 -0400
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
 (envelope-from <fw@strlen.de>)
 id 1pgvYJ-00005E-4W; Tue, 28 Mar 2023 00:42:59 +0200
Date: Tue, 28 Mar 2023 00:42:59 +0200
From: Florian Westphal <fw@strlen.de>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Florian Westphal <fw@strlen.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Subject: Re: [PATCH for-8.0] nbd/server: Request TCP_NODELAY
Message-ID: <20230327224259.GA25361@breakpoint.cc>
References: <20230327192947.1324372-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327192947.1324372-1-eblake@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a0a:51c0:0:237:300::1; envelope-from=fw@strlen.de;
 helo=Chamillionaire.breakpoint.cc
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Eric Blake <eblake@redhat.com> wrote:
> Nagle's algorithm adds latency in order to reduce network packet
> overhead on small packets.  But when we are already using corking to
> merge smaller packets into transactional requests, the extra delay
> from TCP defaults just gets in the way.
> 
> For reference, qemu as an NBD client already requests TCP_NODELAY (see
> nbd_connect() in nbd/client-connection.c); as does libnbd as a client
> [1], and nbdkit as a server [2].
> 
> [1] https://gitlab.com/nbdkit/libnbd/-/blob/a48a1142/generator/states-connect.c#L39
> [2] https://gitlab.com/nbdkit/nbdkit/-/blob/45b72f5b/server/sockets.c#L430
> 
> CC: Florian Westphal <fw@strlen.de>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  nbd/server.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index a4750e41880..976223860bf 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2755,6 +2755,7 @@ void nbd_client_new(QIOChannelSocket *sioc,
>      }
>      client->tlsauthz = g_strdup(tlsauthz);
>      client->sioc = sioc;
> +    qio_channel_set_delay(QIO_CHANNEL(cioc), false);

../nbd/server.c: In function 'nbd_client_new':
../nbd/server.c:2763:39: error: 'cioc' undeclared (first use in this function); did you mean 'sioc'?

Other than that this looks good to me.

