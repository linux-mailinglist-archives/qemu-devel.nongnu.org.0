Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5542C7D05
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:54:20 +0100 (CET)
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZKW-0000hS-0r
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjZGr-0004gj-Nd
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:50:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjZGq-0001Fp-3i
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606704630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+67riEIT0TK/iZefP9xSHKdUN5Sw0rP+pxSw89+V+4I=;
 b=avXcpzT5aypn4Q6xvn9eaIPNJxwiHv2gcGgEA/WEMq7B5mUWhMEs6nwHFCMKkAaUV9lk+A
 ML0P7a51gaGN1ofQdCQwOdsl0kjcUxxvGBYbr5oADt7liYqZYTaShhenyHJxNN9S1aHWG+
 DyjAPzwLRvM6I8jo4QIqkcC0WXN4qdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-BWVZxf2wNAO6gDWc-Ze1XQ-1; Sun, 29 Nov 2020 21:50:28 -0500
X-MC-Unique: BWVZxf2wNAO6gDWc-Ze1XQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A86F1873168;
 Mon, 30 Nov 2020 02:50:27 +0000 (UTC)
Received: from [10.72.13.173] (ovpn-13-173.pek2.redhat.com [10.72.13.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2610E60843;
 Mon, 30 Nov 2020 02:50:13 +0000 (UTC)
Subject: Re: [RFC PATCH-for-5.2 2/2] net: Assert no packet bigger than
 NET_BUFSIZE is queued
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201127154524.1902024-1-philmd@redhat.com>
 <20201127154524.1902024-3-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ce513f68-511e-0cca-98b8-2dc68824a8df@redhat.com>
Date: Mon, 30 Nov 2020 10:50:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201127154524.1902024-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> Ensure no packet bigger then NET_BUFSIZE is queued via
> qemu_net_queue_append*() by adding assertions.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   net/queue.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/net/queue.c b/net/queue.c
> index 221a1c87961..94b98b19ef9 100644
> --- a/net/queue.c
> +++ b/net/queue.c
> @@ -102,6 +102,8 @@ static void qemu_net_queue_append(NetQueue *queue,
>       if (queue->nq_count >= queue->nq_maxlen && !sent_cb) {
>           return; /* drop if queue full and no callback */
>       }
> +
> +    assert(size <= NET_BUFSIZE);
>       packet = g_malloc(sizeof(NetPacket) + size);
>       packet->sender = sender;
>       packet->flags = flags;
> @@ -131,6 +133,7 @@ void qemu_net_queue_append_iov(NetQueue *queue,
>           max_len += iov[i].iov_len;
>       }
>   
> +    assert(max_len <= NET_BUFSIZE);
>       packet = g_malloc(sizeof(NetPacket) + max_len);
>       packet->sender = sender;
>       packet->sent_cb = sent_cb;


Anyway to avoid the assert here?

Thanks


