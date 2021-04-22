Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD6367773
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 04:26:32 +0200 (CEST)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZP31-0007Z7-O2
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 22:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZP28-00078p-LH
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 22:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZP26-0007qW-Ca
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 22:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619058332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpOQ9PTctyZXgZPBxTU9FJMxtJhsCCudnTdCGcl3HkQ=;
 b=QCMsbk6EP20wK9RGY0+tK1MpAiaE2QqBs8xm4wv2ux3zrF/Y2hvD0FzEbcKwktQaoR3MAz
 NzXguDSr2soBVfssqY9FjDzCNHBpSUQvUb3hKfxcBv/MaUGj7ok8xI3jVbgtus1yq8cTbx
 CMvkS4ZX81kgFvktCHGPVChXNGdS4rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-07biNDEfNFqDXJ_yEbvItQ-1; Wed, 21 Apr 2021 22:25:30 -0400
X-MC-Unique: 07biNDEfNFqDXJ_yEbvItQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CD261006C83;
 Thu, 22 Apr 2021 02:25:29 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-214.pek2.redhat.com
 [10.72.13.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B5AF5C1B4;
 Thu, 22 Apr 2021 02:25:27 +0000 (UTC)
Subject: Re: [PATCH-for-6.0] net: tap: fix crash on hotplug
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <32dd3af8-365c-91ba-6a1e-d24cb60e9e35@redhat.com>
Date: Thu, 22 Apr 2021 10:25:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/21 ÏÂÎç11:22, Cole Robinson Ð´µÀ:
> Attempting to hotplug a tap nic with libvirt will crash qemu:
>
> $ sudo virsh attach-interface f32 network default
> error: Failed to attach interface
> error: Unable to read from monitor: Connection reset by peer
>
> 0x000055875b7f3a99 in tap_send (opaque=0x55875e39eae0) at ../net/tap.c:206
> 206	        if (!s->nc.peer->do_not_pad) {
> gdb$ bt
>
> s->nc.peer may not be set at this point. This seems to be an
> expected case, as qemu_send_packet_* explicitly checks for NULL
> s->nc.peer later.
>
> Fix it by checking for s->nc.peer here too. Padding is applied if
> s->nc.peer is not set.
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1949786
> Fixes: 969e50b61a2
>
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
> * Or should we skip padding if nc.peer is unset?


I think so, the padding is for the peer.


> I didn't dig into it
> * tap-win3.c and slirp.c may need a similar fix, but the slirp case
>    didn't crash in a simple test.


Yes, the reason is because there's no packet go through slirp I think.

Thanks.


>
>   net/tap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/tap.c b/net/tap.c
> index dd42ac6134..937559dbb8 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -203,7 +203,7 @@ static void tap_send(void *opaque)
>               size -= s->host_vnet_hdr_len;
>           }
>   
> -        if (!s->nc.peer->do_not_pad) {
> +        if (!s->nc.peer || !s->nc.peer->do_not_pad) {
>               if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
>                   buf = min_pkt;
>                   size = min_pktsz;


