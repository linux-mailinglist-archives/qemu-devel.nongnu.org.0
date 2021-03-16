Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB29633D1BD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:23:54 +0100 (CET)
Received: from localhost ([::1]:34238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6rh-0007oN-Os
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM6nX-0004hL-8K
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM6nU-0008C2-7Y
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615889971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6O4Fp1bO9xfK3wC+RlFxj8aGCr6vvY+UN/jQPRuJP0=;
 b=dKr2OPUp9EYteC2ieRwSUDe5+trblcsy2UX6H7ynW4mly320YF+aChz/nfACNRur0LPYB6
 1OcgHnZOXq4Kq4RTS0S0MpczW4aAMZbpBtGqQ27OrHzomQoTDcomhw0IMTaKSKDU/2rAWQ
 AKCk3wFcXZ8ko9rthOcG8mPac2DduJw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-kvUp0tfiMmqZmZ3INAfLdw-1; Tue, 16 Mar 2021 06:19:30 -0400
X-MC-Unique: kvUp0tfiMmqZmZ3INAfLdw-1
Received: by mail-wr1-f72.google.com with SMTP id p12so13849400wrn.18
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 03:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/6O4Fp1bO9xfK3wC+RlFxj8aGCr6vvY+UN/jQPRuJP0=;
 b=DnBiHDDIPD28R0uoJ0yTVqqMXuZwN40BpjpeCXcnVcMRj2MeMXsBYEdQAeK3K66k4L
 9+2KNRaQr7cKI2aaUx6N8PuRdNOMeay0rggjhxrv2hagdugERPJqsIyK/e3Sd2x852Yw
 iDTClBr8/FK+7AvqwEUQVtpZuuIBmdzbEFAtoLIb3qURLgHjFwWCqbSG5fnSWfoQSgn9
 eH4D7E9/NQK3z8vjC7LJdzI6iSdmcgANNTCIjbOJkpUhKM83g4onEd6+ZgRsjkp7JOyi
 v5SsvSLkMCvJdWu09+CVSvrvRICewAT5aaRzzEIOmWTBho29pqjHchkg3IRE2TjtvrJp
 1D8g==
X-Gm-Message-State: AOAM532jvqCPkvBvqhqyoBjzRAgnMNjejInmcodbIFTsIkaJXZdqvEas
 /wSN5FEMphWjXM8gaSzEHzqguB4wXK5rZqu4QOlkIUyTdHD68vmNzFas4Wa/09l9Dio2oHxb1qZ
 KS1ObwUkA5dL2s/9PXtyQkyV9m5mTvpEr+P1FMQYQhEwQlDK5zMVvILkcgWZyjk/+
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr3918114wmi.112.1615889968557; 
 Tue, 16 Mar 2021 03:19:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNM+kK7GKsSVLww+4d5YmsEgYxCS0ydwTLOyYHLtTOv0Iwgk1CYiihEzvGzsGMPJojVetf7A==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr3918097wmi.112.1615889968261; 
 Tue, 16 Mar 2021 03:19:28 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a5sm21816041wrs.35.2021.03.16.03.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 03:19:27 -0700 (PDT)
Subject: Re: [PATCH v3 04/13] net: tap: Pad short frames to minimum size
 before send
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
 <20210316081254.72684-5-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9c7cae15-bbe7-7146-e7b5-5739baec1830@redhat.com>
Date: Tue, 16 Mar 2021 11:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316081254.72684-5-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 9:12 AM, Bin Meng wrote:
> Do the same for tap backend as what we did for slirp.

You explained SLiRP/TAP in the previous patch. IMO these
changes could be squashed there directly (besides, same
maintainer entry).

> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v3:
> - use the pad_short_frame() helper for tap
> 
>  net/tap-win32.c | 9 +++++++++
>  net/tap.c       | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/net/tap-win32.c b/net/tap-win32.c
> index 2b5dcda36e..e044a5ca35 100644
> --- a/net/tap-win32.c
> +++ b/net/tap-win32.c
> @@ -31,6 +31,7 @@
>  
>  #include "qemu-common.h"
>  #include "clients.h"            /* net_init_tap */
> +#include "net/eth.h"
>  #include "net/net.h"
>  #include "net/tap.h"            /* tap_has_ufo, ... */
>  #include "qemu/error-report.h"
> @@ -688,9 +689,17 @@ static void tap_win32_send(void *opaque)
>      uint8_t *buf;
>      int max_size = 4096;
>      int size;
> +    uint8_t min_pkt[ETH_ZLEN];
>  
>      size = tap_win32_read(s->handle, &buf, max_size);
>      if (size > 0) {
> +        if (!s->nc.peer->do_not_pad) {
> +            if (pad_short_frame(min_pkt, buf, size)) {
> +                buf = min_pkt;
> +                size = ETH_ZLEN;
> +            }
> +        }
> +
>          qemu_send_packet(&s->nc, buf, size);
>          tap_win32_free_buffer(s->handle, buf);
>      }
> diff --git a/net/tap.c b/net/tap.c
> index b7512853f4..aa69cf1c73 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -32,6 +32,7 @@
>  #include <sys/socket.h>
>  #include <net/if.h>
>  
> +#include "net/eth.h"
>  #include "net/net.h"
>  #include "clients.h"
>  #include "monitor/monitor.h"
> @@ -189,6 +190,7 @@ static void tap_send(void *opaque)
>  
>      while (true) {
>          uint8_t *buf = s->buf;
> +        uint8_t min_pkt[ETH_ZLEN];
>  
>          size = tap_read_packet(s->fd, s->buf, sizeof(s->buf));
>          if (size <= 0) {
> @@ -200,6 +202,13 @@ static void tap_send(void *opaque)
>              size -= s->host_vnet_hdr_len;
>          }
>  
> +        if (!s->nc.peer->do_not_pad) {
> +            if (pad_short_frame(min_pkt, buf, size)) {
> +                buf = min_pkt;
> +                size = ETH_ZLEN;
> +            }
> +        }
> +
>          size = qemu_send_packet_async(&s->nc, buf, size, tap_send_completed);
>          if (size == 0) {
>              tap_read_poll(s, false);
> 


