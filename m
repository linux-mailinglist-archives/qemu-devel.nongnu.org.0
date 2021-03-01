Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D0D32781F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:16:26 +0100 (CET)
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGcn3-00030H-4D
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGclj-0002U6-4x
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGclg-00073A-K4
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614582899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tT3PXQJnFyAHHnhDWsrZ5B7UcIwm4De+Li14hk2VNGI=;
 b=CAViaWJpMcf0FPHdFXMSAhhWlpCjFEsye5lxUgc52/Z0MwDshqrJoUzEv9YBh5bJs5NWTA
 7ln6p1vc+POdP9jxnmATpRWBrNY/RUuIJq/XuiZq9eiQzddwibcqVLs6f4NCD9OMuQf0i8
 EDNwLx9WR7bTekTEA2arEItpajrMS4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-xL4Oovl_OJ-au2W2Blljkg-1; Mon, 01 Mar 2021 02:14:55 -0500
X-MC-Unique: xL4Oovl_OJ-au2W2Blljkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDC62835E21;
 Mon,  1 Mar 2021 07:14:54 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-252.pek2.redhat.com
 [10.72.12.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A8A85D9CA;
 Mon,  1 Mar 2021 07:14:53 +0000 (UTC)
Subject: Re: [PATCH] rtl8193: switch to use qemu_receive_packet() for loopback
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210226184753.230037-1-alxndr@bu.edu>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1b9c555d-e271-b826-7f7f-1b0344abc35d@redhat.com>
Date: Mon, 1 Mar 2021 15:14:51 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210226184753.230037-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/27 2:47 上午, Alexander Bulekov wrote:
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1910826
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>
> Although it's not a nc->info->receive() call, maybe this can also go in
> this series?
>
> -Alex


Yes, I will add this in this series.

Thanks


>
>   hw/net/rtl8139.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index 4675ac878e..90b4fc63ce 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -1795,7 +1795,7 @@ static void rtl8139_transfer_frame(RTL8139State *s, uint8_t *buf, int size,
>           }
>   
>           DPRINTF("+++ transmit loopback mode\n");
> -        rtl8139_do_receive(qemu_get_queue(s->nic), buf, size, do_interrupt);
> +        qemu_receive_packet(qemu_get_queue(s->nic), buf, size);
>   
>           if (iov) {
>               g_free(buf2);


