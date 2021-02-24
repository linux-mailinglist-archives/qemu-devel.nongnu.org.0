Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C732373C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 07:14:47 +0100 (CET)
Received: from localhost ([::1]:40484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEnRe-0003A2-JE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 01:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lEnQP-0002jT-5Z
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 01:13:29 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:52278
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lEnQM-0006yo-D2
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 01:13:28 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id DF728DA0042;
 Wed, 24 Feb 2021 07:13:22 +0100 (CET)
Subject: Re: [PATCH 3/6] dp8393x: switch to use qemu_receive_packet() for
 loopback packet
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-4-jasowang@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <70f3456c-1f3b-8a14-8c51-a0b7dff5f048@weilnetz.de>
Date: Wed, 24 Feb 2021 07:13:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224055401.492407-4-jasowang@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.02.21 um 06:53 schrieb Jason Wang:

> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   hw/net/dp8393x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 205c0decc5..019d4fe435 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -506,7 +506,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
>               s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
>               if (nc->info->can_receive(nc)) {
>                   s->loopback_packet = 1;
> -                nc->info->receive(nc, s->tx_buffer, tx_len);
> +                qemu_receice_packet(nc, s->tx_buffer, tx_Len);


Did you test compilation of that code? It looks like a typo ...

Regards

Stefan W.



