Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD9631921
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 05:18:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owyEr-0004I4-As; Sun, 20 Nov 2022 23:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1owyEf-0004HI-SK
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 23:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1owyEe-0004sx-A0
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 23:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669004192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p53jWUyphAoh5RvzjnZj4+adPWzUqXjz73NrUwU4dHw=;
 b=X6vzsYhrmC11SVae0ihOapRlaby0qOeN6NUyPTwf0UE2LvWbhYi0SlEhli+pOfc+9Zo91l
 o2Ek+8H9Ru3lVeS71BAb68qRYPQ5+LETXU+2JbJIw6qKTgswGCmyRW2hYWaQ6dpOYvxDnw
 oY5t13x7JlD6B3f9KK26FPitHgy0bco=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-5XURX3tGPJKthGySiT_A9Q-1; Sun, 20 Nov 2022 23:16:30 -0500
X-MC-Unique: 5XURX3tGPJKthGySiT_A9Q-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13b88262940so5038639fac.15
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 20:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p53jWUyphAoh5RvzjnZj4+adPWzUqXjz73NrUwU4dHw=;
 b=1fUIqRAMw9Y7Y1g325gsrTM0PLVZon6rRzwTfL4V46B467d1vMLV9lM/BAW3kfO7nM
 dPN7eJOzVa+65qqNj0HMKDQz3lPf3gGpWR6CkSCzhSB3n98raVzy3uOutFYPcjJAyLg0
 N4QjzEAi2gKfz5R7fbUvQg3+BnSO82ZJdCwrqOWuaR0QaAX54xHVxNqAOfK1YYQistoe
 f4JS/rU1I2HgG2/e3UwxNmz3sagOWAnNWJRoPPzmiq2oqK9SqYTE8QppK4wtY7BQdQ3i
 N8aY7Et1woFrP576wwEfDeLHE2f4cTCTT7Bfcxmz2GMBrZudiiDvmAbJfVRYk5h2Z5sj
 6S7Q==
X-Gm-Message-State: ANoB5pmRHlV40JwX0EsrDFTvE71wkR8QnbyuI52wkN5N/8HfxkxgJE3a
 K5vi9L7p6Hu6/d43UsP66dmiHsx4KI1ivYILebaKSSCwZtsuZYGZSD9oNYq7VmsSrHbgiBKNYOE
 /dVNGWuJgyw0qtyS/agqA0PrBXIIki64=
X-Received: by 2002:a05:6870:75c3:b0:142:f59e:e509 with SMTP id
 de3-20020a05687075c300b00142f59ee509mr292693oab.280.1669004189330; 
 Sun, 20 Nov 2022 20:16:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5uHXij6DpaHHhFMVAD+coxGJ1eKmYldG7btNEoWqHX+iE3yVroN3iWMINOvAzNDPK0jWZN/m4LY3anxpAcB1A=
X-Received: by 2002:a05:6870:75c3:b0:142:f59e:e509 with SMTP id
 de3-20020a05687075c300b00142f59ee509mr292683oab.280.1669004189170; Sun, 20
 Nov 2022 20:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-3-stefanha@redhat.com>
In-Reply-To: <20221117165554.1773409-3-stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Nov 2022 12:16:18 +0800
Message-ID: <CACGkMEsn68Nzv00wF00=FrLsgTuur9duLrZ5V=1ociKrjcnpWg@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v3 2/3] rtl8139: keep Tx command mode 0 and 1
 separate
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Tobias Fiebig <tobias+git@fiebig.nl>,
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Nov 18, 2022 at 12:56 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> There are two Tx Descriptor formats called mode 0 and mode 1. The mode
> is determined by the Large Send bit.
>
> CP_TX_IPCS (bit 18) is defined in mode 1 but the code checks the bit
> unconditionally. In mode 0 bit 18 is part of the Large Send MSS value.
>
> Explicitly check the Large Send bit to distinguish Tx command modes.
> This avoids bugs where modes are confused. Note that I didn't find any
> actual bugs aside from needlessly computing the IP checksum when the
> Large Send bit is enabled.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/net/rtl8139.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index ffef3789b5..6dd7a8e6e0 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -2135,7 +2135,7 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>              }
>              ip_data_len -= hlen;
>
> -            if (txdw0 & CP_TX_IPCS)
> +            if (!(txdw0 & CP_TX_LGSEN) && (txdw0 & CP_TX_IPCS))
>              {
>                  DPRINTF("+++ C+ mode need IP checksum\n");
>
> @@ -2268,7 +2268,7 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                  /* Stop sending this frame */
>                  saved_size = 0;
>              }
> -            else if (txdw0 & (CP_TX_TCPCS|CP_TX_UDPCS))
> +            else if (!(txdw0 & CP_TX_LGSEN) && (txdw0 & (CP_TX_TCPCS|CP_TX_UDPCS)))
>              {
>                  DPRINTF("+++ C+ mode need TCP or UDP checksum\n");
>
> --
> 2.38.1
>


