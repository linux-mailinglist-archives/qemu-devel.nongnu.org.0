Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC075374FD6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:11:58 +0200 (CEST)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYAv-0007Rb-Oa
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leY91-0006XU-5k
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:09:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leY8z-0004gZ-JB
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620284997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IXCxjGNXmxgBVPkD/OoePpuq8FfPWdrJ/i9/Sse9/C0=;
 b=ZMfl4LP+oJT0w/US2PluQJJOzmVT6rUG1EQmXc6Wflog9GgQZEyn5g3vwErm1NIGmEFgsQ
 t4MY6WZMPy3kkyE91hYtMk1UWCyszLqKWMFhoo0ofZ3gPpz+7nOqvUlYAf/wCEBqsKf79l
 ljFL7QcF/r9GREJAIgmnLC5xMUPwlA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-u6-07uouPeOMleDbumcX6g-1; Thu, 06 May 2021 03:09:53 -0400
X-MC-Unique: u6-07uouPeOMleDbumcX6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B1984BA0F;
 Thu,  6 May 2021 07:09:52 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-3.pek2.redhat.com
 [10.72.13.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B054D5B4B6;
 Thu,  6 May 2021 07:09:40 +0000 (UTC)
Subject: Re: [PATCH 15/23] net: Avoid dynamic stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-16-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b661b2bd-4ad8-4f29-a278-db214534ec19@redhat.com>
Date: Thu, 6 May 2021 15:09:39 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-16-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Jiri Pirko <jiri@resnulli.us>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/6 上午5:10, Philippe Mathieu-Daudé 写道:
> Use autofree heap allocation instead of variable-length
> array on the stack.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/fsl_etsec/rings.c      | 9 ++++-----
>   hw/net/rocker/rocker_of_dpa.c | 2 +-
>   net/dump.c                    | 2 +-
>   net/tap.c                     | 2 +-
>   4 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 8f084464155..1abdcb5a29c 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -381,8 +381,6 @@ static void fill_rx_bd(eTSEC          *etsec,
>       uint16_t to_write;
>       hwaddr   bufptr = bd->bufptr +
>           ((hwaddr)(etsec->regs[TBDBPH].value & 0xF) << 32);
> -    uint8_t  padd[etsec->rx_padding];
> -    uint8_t  rem;
>   
>       RING_DEBUG("eTSEC fill Rx buffer @ 0x%016" HWADDR_PRIx
>                  " size:%zu(padding + crc:%u) + fcb:%u\n",
> @@ -423,11 +421,12 @@ static void fill_rx_bd(eTSEC          *etsec,
>           /* The remaining bytes are only for padding which is not actually
>            * allocated in the data buffer.
>            */
> -
> -        rem = MIN(etsec->regs[MRBLR].value - bd->length, etsec->rx_padding);
> +        uint8_t  rem = MIN(etsec->regs[MRBLR].value - bd->length,
> +                           etsec->rx_padding);
>   
>           if (rem > 0) {
> -            memset(padd, 0x0, sizeof(padd));
> +            g_autofree uint8_t *padd = g_malloc0(etsec->rx_padding);
> +
>               etsec->rx_padding -= rem;
>               *size             -= rem;
>               bd->length        += rem;
> diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
> index b3b8c5bb6d4..3e400ceaef7 100644
> --- a/hw/net/rocker/rocker_of_dpa.c
> +++ b/hw/net/rocker/rocker_of_dpa.c
> @@ -1043,7 +1043,7 @@ static void of_dpa_flow_ig_tbl(OfDpaFlowContext *fc, uint32_t tbl_id)
>   static ssize_t of_dpa_ig(World *world, uint32_t pport,
>                            const struct iovec *iov, int iovcnt)
>   {
> -    struct iovec iov_copy[iovcnt + 2];
> +    g_autofree struct iovec *iov_copy = g_new(struct iovec, iovcnt + 2);
>       OfDpaFlowContext fc = {
>           .of_dpa = world_private(world),
>           .in_pport = pport,
> diff --git a/net/dump.c b/net/dump.c
> index 4d538d82a69..b830302e27d 100644
> --- a/net/dump.c
> +++ b/net/dump.c
> @@ -68,7 +68,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
>       int64_t ts;
>       int caplen;
>       size_t size = iov_size(iov, cnt);
> -    struct iovec dumpiov[cnt + 1];
> +    g_autofree struct iovec *dumpiov = g_new(struct iovec, cnt + 1);
>   
>       /* Early return in case of previous error. */
>       if (s->fd < 0) {
> diff --git a/net/tap.c b/net/tap.c
> index bae895e2874..2b9ed8a2cd8 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -120,7 +120,7 @@ static ssize_t tap_receive_iov(NetClientState *nc, const struct iovec *iov,
>   {
>       TAPState *s = DO_UPCAST(TAPState, nc, nc);
>       const struct iovec *iovp = iov;
> -    struct iovec iov_copy[iovcnt + 1];
> +    g_autofree struct iovec *iov_copy = g_new(struct iovec, iovcnt + 1);
>       struct virtio_net_hdr_mrg_rxbuf hdr = { };
>   
>       if (s->host_vnet_hdr_len && !s->using_vnet_hdr) {


