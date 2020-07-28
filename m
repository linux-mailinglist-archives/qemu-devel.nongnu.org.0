Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E0230077
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 06:07:45 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0Gu0-0000X2-AP
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 00:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k0Gt9-0008Qu-BX
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 00:06:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40679
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k0Gt7-0001j2-Mj
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 00:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595909208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lj2so+MC0sJsN6gfSuzToKYeo5sdHJEh9CfvC0GXyaE=;
 b=dwl+tZbWsaEc824wPejJ4DkhBQhP29AFQLKvi4iSORqApdB3pvpvE7hLdjtkmygLkyOzje
 xTVciRI1FEtREk8R7gr0pdW8G+sJIsJh/zPUFcxanqdREXfhoXDq3/sf80kxk1+1xjcyR4
 YNc22fdm6vUCN7GQcZ+xuAs1kYqaQq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-rX9pWeWWPCiPvk9qyn2lmg-1; Tue, 28 Jul 2020 00:06:05 -0400
X-MC-Unique: rX9pWeWWPCiPvk9qyn2lmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AA37101C8A0;
 Tue, 28 Jul 2020 04:06:04 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00D34709E4;
 Tue, 28 Jul 2020 04:06:02 +0000 (UTC)
Subject: Re: [PATCH 1/2] hw/net/net_tx_pkt: add function to check
 pkt->max_raw_frags
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
References: <20200727170838.1101775-1-mcascell@redhat.com>
 <20200727170838.1101775-2-mcascell@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <adb52967-d2b2-cb55-87a2-38fda18a2a0a@redhat.com>
Date: Tue, 28 Jul 2020 12:06:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727170838.1101775-2-mcascell@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 00:06:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: dmitry.fleytman@gmail.com, ezrakiez@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/28 上午1:08, Mauro Matteo Cascella wrote:
> This patch introduces a new function in hw/net/net_tx_pkt.{c,h} to check the
> current data fragment against the maximum number of data fragments.


I wonder whether it's better to do the check in 
net_tx_pkt_add_raw_fragment() and fail there.

Btw, I find net_tx_pkt_add_raw_fragment() does not unmap dma when 
returning to true, is this a bug?

Thanks


>
> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>   hw/net/net_tx_pkt.c | 5 +++++
>   hw/net/net_tx_pkt.h | 8 ++++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 9560e4a49e..d035618f2c 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -400,6 +400,11 @@ bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
>       }
>   }
>   
> +bool net_tx_pkt_exceed_max_fragments(struct NetTxPkt *pkt)
> +{
> +    return pkt->raw_frags >= pkt->max_raw_frags;
> +}
> +
>   bool net_tx_pkt_has_fragments(struct NetTxPkt *pkt)
>   {
>       return pkt->raw_frags > 0;
> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
> index 4ec8bbe9bd..e2ee46ae03 100644
> --- a/hw/net/net_tx_pkt.h
> +++ b/hw/net/net_tx_pkt.h
> @@ -179,6 +179,14 @@ bool net_tx_pkt_send_loopback(struct NetTxPkt *pkt, NetClientState *nc);
>    */
>   bool net_tx_pkt_parse(struct NetTxPkt *pkt);
>   
> +/**
> +* indicates if the current data fragment exceeds max_raw_frags
> +*
> +* @pkt:            packet
> +*
> +*/
> +bool net_tx_pkt_exceed_max_fragments(struct NetTxPkt *pkt);
> +
>   /**
>   * indicates if there are data fragments held by this packet object.
>   *


