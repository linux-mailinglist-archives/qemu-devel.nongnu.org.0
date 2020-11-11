Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB692AEA44
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 08:41:17 +0100 (CET)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kckkm-0001b3-4e
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 02:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kckjH-0000xb-Fc; Wed, 11 Nov 2020 02:39:43 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kckjF-0004Be-2R; Wed, 11 Nov 2020 02:39:43 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CWGnn3SSJzhkK1;
 Wed, 11 Nov 2020 15:39:09 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Wed, 11 Nov 2020 15:39:08 +0800
Message-ID: <5FAB9512.7070200@huawei.com>
Date: Wed, 11 Nov 2020 15:38:58 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <jasowang@redhat.com>
Subject: Re: [PATCH] net/l2tpv3: Remove redundant check in net_init_l2tpv3()
References: <5F9B7E9F.8050004@huawei.com>
In-Reply-To: <5F9B7E9F.8050004@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=alex.chen@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 02:39:16
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, zhengchuan@huawei.com,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping.

On 2020/10/30 10:46, AlexChen wrote:
> The result has been checked to be NULL before, it cannot be NULL here,
> so the check is redundant. Remove it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  net/l2tpv3.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index 55fea17c0f..e4d4218db6 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -655,9 +655,8 @@ int net_init_l2tpv3(const Netdev *netdev,
>          error_setg(errp, "could not bind socket err=%i", errno);
>          goto outerr;
>      }
> -    if (result) {
> -        freeaddrinfo(result);
> -    }
> +
> +    freeaddrinfo(result);
> 
>      memset(&hints, 0, sizeof(hints));
> 
> @@ -686,9 +685,7 @@ int net_init_l2tpv3(const Netdev *netdev,
>      memcpy(s->dgram_dst, result->ai_addr, result->ai_addrlen);
>      s->dst_size = result->ai_addrlen;
> 
> -    if (result) {
> -        freeaddrinfo(result);
> -    }
> +    freeaddrinfo(result);
> 
>      if (l2tpv3->has_counter && l2tpv3->counter) {
>          s->has_counter = true;
> 


