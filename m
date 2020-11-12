Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD852AFF80
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 06:52:32 +0100 (CET)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd5X4-0002b2-SD
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 00:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kd5WJ-0002C7-Kr
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 00:51:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kd5WG-0001Ub-MQ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 00:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605160298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZkQkgdKBqSF4758/WX+bD0Aa1ek2Vg9QhXr3o0kjmY=;
 b=GCMAY+7pscdeH6DXFpnIdJSz3S1XfI0JKnotcxB4gC/Ch2fqXYzk5cM9tJMfEcrk+5PJxp
 lsLIUfTLn7WIyc6GMR4P+ZOmBPbLbOPGwvQKokdH4ge6hnOYlIn9IzUJA8M3S09AOXYgzN
 vpYinTBmUtYfXChjZbwgZbsXoGy8rMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-yvqK7RhrP2i1QvqkpeArwg-1; Thu, 12 Nov 2020 00:51:37 -0500
X-MC-Unique: yvqK7RhrP2i1QvqkpeArwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DEC3802B6F;
 Thu, 12 Nov 2020 05:51:36 +0000 (UTC)
Received: from [10.72.13.122] (ovpn-13-122.pek2.redhat.com [10.72.13.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE0DD27CC6;
 Thu, 12 Nov 2020 05:51:33 +0000 (UTC)
Subject: Re: [PATCH] hw/net/e1000e: advance desc_offset in case of null
 descriptor
To: P J P <ppandit@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20201111130636.2208620-1-ppandit@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a3e03133-1266-095e-5980-f4879cacb6a2@redhat.com>
Date: Thu, 12 Nov 2020 13:51:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111130636.2208620-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:51:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Cheol-woo Myung <330cjfdn@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/11 下午9:06, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> While receiving packets via e1000e_write_packet_to_guest() routine,
> 'desc_offset' is advanced only when RX descriptor is processed. And
> RX descriptor is not processed if it has NULL buffer address.
> This may lead to an infinite loop condition. Increament 'desc_offset'
> to process next descriptor in the ring to avoid infinite loop.
>
> Reported-by: Cheol-woo Myung <330cjfdn@gmail.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>   hw/net/e1000e_core.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index bcfd46696f..3b096db3a4 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -1596,13 +1596,13 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
>                             (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
>                   }
>               }
> -            desc_offset += desc_size;
> -            if (desc_offset >= total_size) {
> -                is_last = true;
> -            }
>           } else { /* as per intel docs; skip descriptors with null buf addr */
>               trace_e1000e_rx_null_descriptor();
>           }
> +        desc_offset += desc_size;
> +        if (desc_offset >= total_size) {
> +            is_last = true;
> +        }
>   
>           e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
>                              rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);


Applied.

Thanks



