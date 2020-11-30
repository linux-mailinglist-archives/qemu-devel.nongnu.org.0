Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C32C7CFC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:49:20 +0100 (CET)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZFf-0001Bs-Q7
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjZ3W-0002DH-OT
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjZ3O-00050l-IM
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606703795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXPbF801HI8B5XFFmhOLNv3JkqELVrm3HEdjQIXK4NE=;
 b=ZaOUwgz6RwdH54dxDkRAWuGmRwLqFFUiMhTJHu19ckpj0eZioKlNf04LNn1EUCJNnRdtyj
 XdWtLiOozoYHQuviFwhf7kQ0veQOdgLosXCvjImce2EujaBhBmCAVEhvwgyjCYqk+A3lxX
 kSIaZclh5EwiKvjHgLuQdIfuqY5+xOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-7Ul0asueNYG9YK99IA4HMQ-1; Sun, 29 Nov 2020 21:36:33 -0500
X-MC-Unique: 7Ul0asueNYG9YK99IA4HMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 834F8100C604;
 Mon, 30 Nov 2020 02:36:32 +0000 (UTC)
Received: from [10.72.13.173] (ovpn-13-173.pek2.redhat.com [10.72.13.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2157646;
 Mon, 30 Nov 2020 02:36:19 +0000 (UTC)
Subject: Re: [RFC PATCH-for-5.2 1/2] net: Do not accept packets bigger then
 NET_BUFSIZE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201127154524.1902024-1-philmd@redhat.com>
 <20201127154524.1902024-2-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <733cc7a3-bbf8-7462-cbeb-34dd1229532e@redhat.com>
Date: Mon, 30 Nov 2020 10:36:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201127154524.1902024-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/27 下午11:45, Philippe Mathieu-Daudé wrote:
> Do not allow qemu_send_packet*() and qemu_net_queue_send()
> functions to accept packets bigger then NET_BUFSIZE.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> We have to put a limit somewhere. NET_BUFSIZE is defined as:
>
>   /* Maximum GSO packet size (64k) plus plenty of room for
>    * the ethernet and virtio_net headers
>    */
>   #define NET_BUFSIZE (4096 + 65536)
>
> If we do want to accept bigger packets (i.e. multiple GSO packets
> in a IOV), we could use INT32_MAX as limit...


This looks like a complaint for:

commit 25c01bd19d0e4b66f357618aeefda1ef7a41e21a
Author: Jason Wang <jasowang@redhat.com>
Date:   Tue Dec 4 11:53:43 2018 +0800

     net: drop too large packet early

which only fixes the iov version of the function.

If you don't see any real bug, I suggest to merge the fix in next release.

Thanks


> ---
>   net/net.c   | 4 ++++
>   net/queue.c | 4 ++++
>   2 files changed, 8 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index 6a2c3d95670..f29bfac2b11 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -644,6 +644,10 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>       qemu_hexdump(stdout, "net", buf, size);
>   #endif
>   
> +    if (size > NET_BUFSIZE) {
> +        return -1;
> +    }
> +
>       if (sender->link_down || !sender->peer) {
>           return size;
>       }
> diff --git a/net/queue.c b/net/queue.c
> index 19e32c80fda..221a1c87961 100644
> --- a/net/queue.c
> +++ b/net/queue.c
> @@ -191,6 +191,10 @@ ssize_t qemu_net_queue_send(NetQueue *queue,
>   {
>       ssize_t ret;
>   
> +    if (size > NET_BUFSIZE) {
> +        return -1;
> +    }
> +
>       if (queue->delivering || !qemu_can_send_packet(sender)) {
>           qemu_net_queue_append(queue, sender, flags, data, size, sent_cb);
>           return 0;


