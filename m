Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14D408DB1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:27:34 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlzh-0001xU-G3
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPlbc-0001Ov-65
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:02:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPlba-0007ca-9I
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631538157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abQIS/pKvoj39XzCG0tZ/lFw6ecHzjY4BKCdtVLYAxo=;
 b=iH/U6tckLsCWrhlEww+JXj9TCaDIPjQcn/i1bfp8uXETd88xzJEKukJejjcQ0RTLvvZam3
 OLXfzSeXLxgkZFcWc2BcTw2qTpGzOObY9xpQdVFsELe6GuSThueROE4Tg2hlSpsP3JoRHF
 E1LXpJyCTx//Wk2hiRTIJVdBUji//PI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-sEvXt6lHMKSvmwLPgVONJQ-1; Mon, 13 Sep 2021 09:02:33 -0400
X-MC-Unique: sEvXt6lHMKSvmwLPgVONJQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z17-20020a05640240d100b003cac681f4f4so4864287edb.21
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=abQIS/pKvoj39XzCG0tZ/lFw6ecHzjY4BKCdtVLYAxo=;
 b=nS+lfZZ4E1wbvZv/vWjVppTrzU3FzIsaYN/UNwRNd1Ic5bqxrsDVWv05AZc452s2+o
 N36HKOL9Y+W3BPpkldoxmRHIPmq3lopPp2rBikNVJc4M5/VItOJlzwCTdGOIHNJwDBxt
 DWESpur5j1PlYAdPQVgCzK5e1hUzNTuyOre/uDNY7221upMh1xBtXRJjT5Ez3EHwi0tK
 tm09Grdx7nH2Tugj/DuXS0pOn4vUd8l5V6PyyJ3JeQ3VLMp7Mp6XocReAKR0G+Bhfwhz
 +/1RKmamiuQUXRnLlBOP6EIa604Ohjl67U25WMgqanrbxPsY/qfNDqGHFDtnfIaIbY5Q
 bzZA==
X-Gm-Message-State: AOAM531y2a3WkDmzD1o9Do51bTZMxU8p72+RlBmt9AxRhw7rNmd9r2Hz
 hpkM6CzRUczLz/mRJyERmEpEjn1llZuOBbAA1iGrFFTFnIiJI56wLeTPH1FYSGUyaCf7l5ZMIq1
 u8P4XNMQHiPDxqgk=
X-Received: by 2002:a50:fe96:: with SMTP id d22mr10557717edt.198.1631538152664; 
 Mon, 13 Sep 2021 06:02:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0bgtXqzrJn0dHoykl0AuUfMO9j7xUK41pD/qN13+FQUq+7zPpLaX1KjkFV7wnZ8xjrrJL2w==
X-Received: by 2002:a50:fe96:: with SMTP id d22mr10557704edt.198.1631538152442; 
 Mon, 13 Sep 2021 06:02:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d25sm3889226edt.33.2021.09.13.06.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 06:02:31 -0700 (PDT)
Subject: Re: [RFC v3 02/32] build-sys: add HAVE_IPPROTO_MPTCP
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-3-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50b16dfb-f625-1bf3-00bb-6bae9fb392cf@redhat.com>
Date: Mon, 13 Sep 2021 15:02:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907121943.3498701-3-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: berrange@redhat.com, armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 14:19, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The QAPI schema shouldn't rely on C system headers #define, but on
> configure-time project #define, so we can express the build condition in
> a C-independent way.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build         | 2 ++
>   qapi/sockets.json   | 2 +-
>   io/dns-resolver.c   | 2 +-
>   util/qemu-sockets.c | 6 +++---
>   4 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 9e43c9b311..6e871af4d0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1367,6 +1367,8 @@ config_host_data.set('HAVE_OPTRESET',
>                        cc.has_header_symbol('getopt.h', 'optreset'))
>   config_host_data.set('HAVE_UTMPX',
>                        cc.has_header_symbol('utmpx.h', 'struct utmpx'))
> +config_host_data.set('HAVE_IPPROTO_MPTCP',
> +                     cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
>   
>   # has_member
>   config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
> diff --git a/qapi/sockets.json b/qapi/sockets.json
> index 7866dc27d6..c9101f937f 100644
> --- a/qapi/sockets.json
> +++ b/qapi/sockets.json
> @@ -69,7 +69,7 @@
>       '*ipv4': 'bool',
>       '*ipv6': 'bool',
>       '*keep-alive': 'bool',
> -    '*mptcp': { 'type': 'bool', 'if': 'IPPROTO_MPTCP' } } }
> +    '*mptcp': { 'type': 'bool', 'if': 'HAVE_IPPROTO_MPTCP' } } }
>   
>   ##
>   # @UnixSocketAddress:
> diff --git a/io/dns-resolver.c b/io/dns-resolver.c
> index a5946a93bf..53b0e8407a 100644
> --- a/io/dns-resolver.c
> +++ b/io/dns-resolver.c
> @@ -122,7 +122,7 @@ static int qio_dns_resolver_lookup_sync_inet(QIODNSResolver *resolver,
>               .ipv4 = iaddr->ipv4,
>               .has_ipv6 = iaddr->has_ipv6,
>               .ipv6 = iaddr->ipv6,
> -#ifdef IPPROTO_MPTCP
> +#ifdef HAVE_IPPROTO_MPTCP
>               .has_mptcp = iaddr->has_mptcp,
>               .mptcp = iaddr->mptcp,
>   #endif
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..02eb2f3d34 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -278,7 +278,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
>   
>       /* create socket + bind/listen */
>       for (e = res; e != NULL; e = e->ai_next) {
> -#ifdef IPPROTO_MPTCP
> +#ifdef HAVE_IPPROTO_MPTCP
>           if (saddr->has_mptcp && saddr->mptcp) {
>               e->ai_protocol = IPPROTO_MPTCP;
>           }
> @@ -462,7 +462,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
>           error_free(local_err);
>           local_err = NULL;
>   
> -#ifdef IPPROTO_MPTCP
> +#ifdef HAVE_IPPROTO_MPTCP
>           if (saddr->has_mptcp && saddr->mptcp) {
>               e->ai_protocol = IPPROTO_MPTCP;
>           }
> @@ -699,7 +699,7 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
>           }
>           addr->has_keep_alive = true;
>       }
> -#ifdef IPPROTO_MPTCP
> +#ifdef HAVE_IPPROTO_MPTCP
>       begin = strstr(optstr, ",mptcp");
>       if (begin) {
>           if (inet_parse_flag("mptcp", begin + strlen(",mptcp"),
> 

Queued, thanks.

Paolo


