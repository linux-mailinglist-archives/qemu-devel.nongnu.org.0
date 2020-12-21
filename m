Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1532E0172
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:13:20 +0100 (CET)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krRYV-00015t-Jx
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krRXW-0000eT-Ss
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:12:19 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krRXU-0004EV-Dc
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:12:18 -0500
Received: by mail-wr1-x431.google.com with SMTP id m5so12350159wrx.9
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f8V7kEJyW+5RP+UsisXpLcqd0Plo+hWJxI0DRdfyq9s=;
 b=MHazKVSjmdWptL6FHj7dRGJq+vglXokG93EysYxo5WZYtbQfkI4osPKEtAAC5SqgBw
 V0H1u62vCyJHrh0qoZjm5yCwqaZVb8JUzILQC2vnNoYIH6QL4ADCPsbRynNEZ9KE/yp7
 +13tq4oelKTB/H6kbeF9ynWZgpC3QQ9Kws/WGItTeGznb2gINpjFSjZ8HHwfZR4tnCzt
 4o0rN26F0HKPIBBb2kTGBaoZNfqjBBR3mRn/Zi+/xTM8rJWk/yodnGNXqJYglqvk7STc
 0PSpKN9V7UG9/ekdbHWtxwUHJlDs/vTp/MRpjtVeo4/tP2PXrfuryguEJwssTk7uBsHA
 KqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f8V7kEJyW+5RP+UsisXpLcqd0Plo+hWJxI0DRdfyq9s=;
 b=PhS+NHIMhOtB7+Qw5i4IxaXmNWXVSry7VmLyZu7RkPA221M6HlPZQuJlZlrdBOnJcF
 TyliNJtOBd9JWCxEwhihBDcVJW4Fg+gyKKxAbg0cu0GBSLRrXJF8JMTm7aa9eoTZ2Kyi
 3Jk+BXAImakqZeqR8ksSoem1jez8CXZjicNriDZNs5vMwN1cpt6bUuuI7fWOjGgejqkC
 JgtE9toxQl1eVE8BxTfLbwrzYIbUNOjY3QdckNOKiATyGOA7yqY3rbBXUtumkE6YD2K2
 X6BhJb+gCcnneQ3kCd2aZHY0S8RQ4XbZij5TnfVtoDSBqGnuubz6L9yfss+W9ld8f6rS
 awIw==
X-Gm-Message-State: AOAM530K3D369cRiAS7izzy78A3nWb94fhYrfBX1qrl+HiUnJN5g+EVL
 26LpYLiTIEge6etoQ1O01PM=
X-Google-Smtp-Source: ABdhPJxr5+p/+eO/7R37dcDD31D9/byKL8MCAqcEuA08NCgihikeSUbYA8F+lo+CM2xPApf/JRqTPQ==
X-Received: by 2002:adf:f684:: with SMTP id v4mr20754729wrp.387.1608581534484; 
 Mon, 21 Dec 2020 12:12:14 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id f14sm23057774wme.14.2020.12.21.12.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:12:13 -0800 (PST)
Subject: Re: [PATCH 3/5] net/tap: tap_set_sndbuf(): return status
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
 <20201221190609.93768-4-vsementsov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <30577d97-bd0b-5f07-643b-ffa8e966dee9@amsat.org>
Date: Mon, 21 Dec 2020 21:12:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221190609.93768-4-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: den@openvz.org, jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 8:06 PM, Vladimir Sementsov-Ogievskiy wrote:
> It's recommended to return a value indicating success / failure for
> functions with errp parameter (see include/qapi/error.h). Let's update
> tap_set_sndbuf().

For simple "success/failure" a bool type is enough.

Preferably using bool type:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  net/tap_int.h   | 2 +-
>  net/tap-linux.c | 5 ++++-
>  net/tap-stub.c  | 2 +-
>  net/tap.c       | 6 +++---
>  4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/net/tap_int.h b/net/tap_int.h
> index 225a49ea48..57567b9f24 100644
> --- a/net/tap_int.h
> +++ b/net/tap_int.h
> @@ -33,7 +33,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>  
>  ssize_t tap_read_packet(int tapfd, uint8_t *buf, int maxlen);
>  
> -void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
> +int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
>  int tap_probe_vnet_hdr(int fd, Error **errp);
>  int tap_probe_vnet_hdr_len(int fd, int len);
>  int tap_probe_has_ufo(int fd);
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index b0635e9e32..c51bcdc2a3 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -130,7 +130,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>   */
>  #define TAP_DEFAULT_SNDBUF 0
>  
> -void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
> +int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>  {
>      int sndbuf;
>  
> @@ -144,7 +144,10 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>  
>      if (ioctl(fd, TUNSETSNDBUF, &sndbuf) == -1 && tap->has_sndbuf) {
>          error_setg_errno(errp, errno, "TUNSETSNDBUF ioctl failed");
> +        return -1;
>      }
> +
> +    return 0;
>  }
>  
>  int tap_probe_vnet_hdr(int fd, Error **errp)
> diff --git a/net/tap-stub.c b/net/tap-stub.c
> index 6fa130758b..473d5e4afe 100644
> --- a/net/tap-stub.c
> +++ b/net/tap-stub.c
> @@ -26,7 +26,7 @@
>  #include "qapi/error.h"
>  #include "tap_int.h"
>  
> -void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
> +int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>  {
>  }
>  
> diff --git a/net/tap.c b/net/tap.c
> index 75b01d54ee..33d749c7b6 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -661,10 +661,10 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>      Error *err = NULL;
>      TAPState *s = net_tap_fd_init(peer, model, name, fd, vnet_hdr);
>      int vhostfd;
> +    int ret;
>  
> -    tap_set_sndbuf(s->fd, tap, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> +    ret = tap_set_sndbuf(s->fd, tap, errp);
> +    if (ret < 0) {
>          return;
>      }
>  
> 


