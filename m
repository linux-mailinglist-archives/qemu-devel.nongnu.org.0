Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F274510C9F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:24:31 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUXm-0006DL-Iz
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUPE-0000od-EK
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:15:40 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUP8-0001O2-8p; Tue, 26 Apr 2022 19:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=AGxPvLePzGKfeCGsYSLvHJOSa22lzVnQe7C7OY/6OiM=; b=sUVgdKIuZDfwRJhhG7Pa
 ybC3etXulhoAmNyKyoPe/akCT3gZ4kC1srYKEGApfaPnXpbn8ivmpLP2NTHrB++4zatQtORBQfCze
 HfQ0H0Et1+th7Xu/zon5gClzGAHtWLEpAKxbQYrd6nqnXFvhDbNnW/UnMkabRybmUpj+gu/pxxPzh
 QKlKXSWraEClJIHWk6f4hdUS/E622En0R1eKohTMHa1yvG4YrapfsM1Gy0kXHQcRxcMPZhgrNHxhm
 Aw5aG1lHVilAGcYa23wvv13PnymkO9pJF0hJWXW9rylXrebvbaw2nQy+UJlTov8vdDGcDLdhqviQc
 fE797G8zUuzoyA==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=47980 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUP7-0007Az-TN; Tue, 26 Apr 2022 19:15:34 -0400
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1njUP6-002ApJ-Pt;
 Wed, 27 Apr 2022 01:15:32 +0200
Date: Wed, 27 Apr 2022 01:15:32 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 3/4] net: slirp: add support for CFI-friendly timer API
Message-ID: <20220426231532.lmevyvnk3vye4yiu@begin>
References: <20220412121337.207203-1-pbonzini@redhat.com>
 <20220412121337.207203-4-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220412121337.207203-4-pbonzini@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini, le mar. 12 avril 2022 14:13:36 +0200, a ecrit:
> libslirp 4.7 introduces a CFI-friendly version of the .timer_new callback.
> The new callback replaces the function pointer with an enum; invoking the
> callback is done with a new function slirp_handle_timer.
> 
> Support the new API so that CFI can be made compatible with using a system
> libslirp.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  net/slirp.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index b3a92d6e38..57af42299d 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -184,10 +184,43 @@ static int64_t net_slirp_clock_get_ns(void *opaque)
>      return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>  }
>  
> +typedef struct SlirpTimer SlirpTimer;
>  struct SlirpTimer {
>      QEMUTimer timer;
> +#if SLIRP_CHECK_VERSION(4,7,0)
> +    Slirp *slirp;
> +    SlirpTimerId id;
> +    void *cb_opaque;
> +#endif
> +};
> +
> +#if SLIRP_CHECK_VERSION(4,7,0)
> +static void net_slirp_init_completed(Slirp *slirp, void *opaque)
> +{
> +    SlirpState *s = opaque;
> +    s->slirp = slirp;
>  }
>  
> +static void net_slirp_timer_cb(void *opaque)
> +{
> +    SlirpTimer *t = opaque;
> +    slirp_handle_timer(t->slirp, t->id, t->cb_opaque);
> +}
> +
> +static void *net_slirp_timer_new_opaque(SlirpTimerId id,
> +                                        void *cb_opaque, void *opaque)
> +{
> +    SlirpState *s = opaque;
> +    SlirpTimer *t = g_new(SlirpTimer, 1);
> +    t->slirp = s->slirp;
> +    t->id = id;
> +    t->cb_opaque = cb_opaque;
> +    timer_init_full(&t->timer, NULL, QEMU_CLOCK_VIRTUAL,
> +                    SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
> +                    net_slirp_timer_cb, t);
> +    return t;
> +}
> +#else
>  static void *net_slirp_timer_new(SlirpTimerCb cb,
>                                   void *cb_opaque, void *opaque)
>  {
> @@ -197,6 +230,7 @@ static void *net_slirp_timer_new(SlirpTimerCb cb,
>                      cb, cb_opaque);
>      return t;
>  }
> +#endif
>  
>  static void net_slirp_timer_free(void *timer, void *opaque)
>  {
> @@ -231,7 +265,12 @@ static const SlirpCb slirp_cb = {
>      .send_packet = net_slirp_send_packet,
>      .guest_error = net_slirp_guest_error,
>      .clock_get_ns = net_slirp_clock_get_ns,
> +#if SLIRP_CHECK_VERSION(4,7,0)
> +    .init_completed = net_slirp_init_completed,
> +    .timer_new_opaque = net_slirp_timer_new_opaque,
> +#else
>      .timer_new = net_slirp_timer_new,
> +#endif
>      .timer_free = net_slirp_timer_free,
>      .timer_mod = net_slirp_timer_mod,
>      .register_poll_fd = net_slirp_register_poll_fd,
> @@ -578,7 +617,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>  
>      s = DO_UPCAST(SlirpState, nc, nc);
>  
> -    cfg.version = 3;
> +    cfg.version = SLIRP_CHECK_VERSION(4,7,0) ? 4 : 3;
>      cfg.restricted = restricted;
>      cfg.in_enabled = ipv4;
>      cfg.vnetwork = net;
> -- 
> 2.35.1
> 
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

