Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2135644A795
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:27:27 +0100 (CET)
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLXS-00020p-4A
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:27:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mkLU9-0007w3-1t
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:24:01 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:36536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mkLU4-0006Iq-BX
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:23:59 -0500
Received: from vla1-a78d115f8d22.qloud-c.yandex.net
 (vla1-a78d115f8d22.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:2906:0:640:a78d:115f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 30A262E206C;
 Tue,  9 Nov 2021 10:23:49 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-a78d115f8d22.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dZIcPlQAnm-Nms4J71D; Tue, 09 Nov 2021 10:23:49 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636442629; bh=VwxXpEM4I7U8W4bktOJOGXBQwY2Hs5oyBHHZHjpTMJ0=;
 h=In-Reply-To:Date:References:To:From:Subject:Message-ID:Cc;
 b=o33o1GgAcmTQpB1Fs7pfWEHWCNicG5FG77N7oDD0QdpX69GRSYGB63C6MjdEOXQ1P
 Qt1MtcA9m3UiJxoyoffD/2KCHOzjfHHZpTh+zhtEBF03MNF9jyg0YLwOSL79z6cDnp
 H25PgqVxKvrZKVLeNsGIsN9+0bx6IRJG5i5tHJr8=
Authentication-Results: vla1-a78d115f8d22.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPv6:2a02:6b8:b081:8008::1:15] (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8008::1:15])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 FzJetvm6B6-Nm0mVh1r; Tue, 09 Nov 2021 10:23:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Subject: [Ping][PATCH v0] vl: flush all task from rcu queue before exiting
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20211102133901.286027-1-den-plotnikov@yandex-team.ru>
Message-ID: <96bfe630-fb3d-2ac8-60b8-ae23ed7b3742@yandex-team.ru>
Date: Tue, 9 Nov 2021 10:23:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102133901.286027-1-den-plotnikov@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, yc-core@yandex-team.ru, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping ping!

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

