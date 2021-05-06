Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A958C374DF7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 05:36:56 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leUop-0007gX-Po
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 23:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leUnS-0006zd-Bf
 for qemu-devel@nongnu.org; Wed, 05 May 2021 23:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leUnQ-0000kh-O3
 for qemu-devel@nongnu.org; Wed, 05 May 2021 23:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620272128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ye/m+OAnx3nFgdym8wO7lkoZoLL++4Y6gaGU0IA/0gk=;
 b=XZWqvRSh4Zlh3cYlaVpQrmwR6/GKn/hELCrSnSZv8F7P88PnYGzRSrhZl2c2I+fnbRvT7Z
 ayflfz4MHEGhmxVHUhb0bK2fDywDh02VRuZAwTRoMM9SoE6p2DeAhSjobdy4brmrB1jVgo
 vQfU156LrZ4girLyTTr/CJJ+bMiVTOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-wv6I4JstOEuFI9unMWx_8Q-1; Wed, 05 May 2021 23:35:26 -0400
X-MC-Unique: wv6I4JstOEuFI9unMWx_8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 219AC80059E;
 Thu,  6 May 2021 03:35:25 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-159.pek2.redhat.com
 [10.72.13.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA65F100164A;
 Thu,  6 May 2021 03:35:10 +0000 (UTC)
Subject: Re: [PATCH 09/23] hw/net/e1000e_core: Use definition to avoid dynamic
 stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-10-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1f629392-7e9d-48d0-bcab-fcdb4b77309b@redhat.com>
Date: Thu, 6 May 2021 11:35:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-10-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/6 上午5:10, Philippe Mathieu-Daudé 写道:
> The compiler isn't clever enough to figure 'min_buf_size'
> is a constant, so help it by using a definitions instead.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/e1000e_core.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index b75f2ab8fc1..4b1d4521a50 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -1621,15 +1621,16 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
>       }
>   }
>   
> +/* Min. octets in an ethernet frame sans FCS */
> +#define MIN_BUF_SIZE 60
> +
>   ssize_t
>   e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
>   {
>       static const int maximum_ethernet_hdr_len = (14 + 4);
> -    /* Min. octets in an ethernet frame sans FCS */
> -    static const int min_buf_size = 60;
>   
>       uint32_t n = 0;
> -    uint8_t min_buf[min_buf_size];
> +    uint8_t min_buf[MIN_BUF_SIZE];
>       struct iovec min_iov;
>       uint8_t *filter_buf;
>       size_t size, orig_size;


