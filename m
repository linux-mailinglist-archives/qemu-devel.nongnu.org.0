Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA4444307C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:34:36 +0100 (CET)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhurz-0004YP-40
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mhuXK-0005S5-CC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:13:14 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:48008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mhuXF-0005BW-TP
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:13:12 -0400
Received: from vla1-a78d115f8d22.qloud-c.yandex.net
 (vla1-a78d115f8d22.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:2906:0:640:a78d:115f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 6F1C02E12A5
 for <qemu-devel@nongnu.org>; Tue,  2 Nov 2021 17:13:04 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-a78d115f8d22.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 J5vurPcbXC-D4sqUPkJ; Tue, 02 Nov 2021 17:13:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1635862384; bh=XPhsjR6riRL7H7btC01mik4++GfSu5d8T44vC0CPDvs=;
 h=In-Reply-To:Date:References:To:From:Subject:Message-ID;
 b=M9NDlD4DQ2zo8slLxE1ZC2eR5ywfBeuy+yJqsaNAWVDHb/6CMojQ6OqxHN1Qi6LXv
 o9VMCWR5cJAU9qyi1xn6lCfDUr1ULs3oJogqzjT9SGzJTkh68EUOdBGjkTXuvUREkZ
 HlovRnYFW1xe/abe9yjYAMotPU3T74HbwHD3ejy8=
Authentication-Results: vla1-a78d115f8d22.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPv6:2a02:6b8:b081:8010::1:3a] (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8010::1:3a])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 kcX3wvvB98-D4xSDZ6u; Tue, 02 Nov 2021 17:13:04 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Subject: Re: [PATCH v0] vl: flush all task from rcu queue before exiting
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20211102133901.286027-1-den-plotnikov@yandex-team.ru>
Message-ID: <01a5d04b-06c4-7e41-79cb-acbc450aa884@yandex-team.ru>
Date: Tue, 2 Nov 2021 17:13:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102133901.286027-1-den-plotnikov@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 02.11.2021 16:39, Denis Plotnikov wrote:
> The device destruction may superimpose over qemu shutdown.
> In this case some management layer, requested a device unplug and
> waiting for DEVICE_DELETED event, may never get this event.
>
> This happens because device_finalize() may never be called on qemu shutdown
> for some devices using address_space_destroy(). The later is called from
> the rcu thread.
> On qemu shutdown, not all rcu callbacks may be called because the rcu thread
> may not have enough time to converge before qemu main thread exit.
>
> To resolve this issue this patch makes rcu thread to finish all its callbacks
> explicitly by calling a new rcu intreface function right before
> qemu main thread exit.
>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>   include/qemu/rcu.h |  1 +
>   softmmu/runstate.c |  3 +++
>   util/rcu.c         | 12 ++++++++++++
>   3 files changed, 16 insertions(+)
>
> diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
> index 515d327cf11c..f7fbdc3781e5 100644
> --- a/include/qemu/rcu.h
> +++ b/include/qemu/rcu.h
> @@ -134,6 +134,7 @@ struct rcu_head {
>   
>   extern void call_rcu1(struct rcu_head *head, RCUCBFunc *func);
>   extern void drain_call_rcu(void);
> +extern void flush_rcu(void);
>   
>   /* The operands of the minus operator must have the same type,
>    * which must be the one that we specify in the cast.
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 10d9b7365aa7..28f319a97a2b 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -822,5 +822,8 @@ void qemu_cleanup(void)
actually, flush_rcu() should be here before monitor_cleanup to send 
DEVICE_DELETED
>       monitor_cleanup();
>       qemu_chr_cleanup();
>       user_creatable_cleanup();
> +
> +    /* finish all the tasks from rcu queue before exiting */
> +    flush_rcu();
>       /* TODO: unref root container, check all devices are ok */
>   }
> diff --git a/util/rcu.c b/util/rcu.c
> index 13ac0f75cb2a..f047f8ee8d16 100644
> --- a/util/rcu.c
> +++ b/util/rcu.c
> @@ -348,6 +348,18 @@ void drain_call_rcu(void)
>   
>   }
>   
> +/*
> + * This function drains rcu queue until there are no tasks to do left
> + * and aims to the cases when one needs to ensure that no work hang
> + * in rcu thread before proceeding, e.g. on qemu shutdown.
> + */
> +void flush_rcu(void)
> +{
> +    while (qatomic_read(&rcu_call_count) > 0) {
> +        drain_call_rcu();
> +    }
> +}
> +
>   void rcu_register_thread(void)
>   {
>       assert(rcu_reader.ctr == 0);

