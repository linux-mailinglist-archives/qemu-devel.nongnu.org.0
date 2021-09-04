Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3BC4009E5
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 07:49:19 +0200 (CEST)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMOYI-0001cy-O2
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 01:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mMOXM-0000Sc-8a
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 01:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mMOXJ-000219-Dj
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 01:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630734496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8hRp8M0ry3uyMaz+vHwTVKodJnJrMSesJkGEZ8k0+/A=;
 b=QaxhxMfn5KQIEiiNLE4VXLh5jSBWzeO+nYcQI1D7ry19H0kiocxPo7Xnd4wcxlsKOUHQKm
 CGVSOaoGEpgxHezqpAfzulYTCMtj+hdeMY2+i/PK0KOXUdAK9+NQVvqKaaTD13awKGAai3
 m4HYUKx3pAOEcv9whsRkHt3UEnN7IBc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-f42vrriBMVWEkdWUnNaBAw-1; Sat, 04 Sep 2021 01:48:13 -0400
X-MC-Unique: f42vrriBMVWEkdWUnNaBAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so318829wma.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 22:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8hRp8M0ry3uyMaz+vHwTVKodJnJrMSesJkGEZ8k0+/A=;
 b=e/TltwrEudckdmxp3ljfYYAJCeGbmcbp1U92AVqcwMVC8BJqefB87AL2CgzaekwV7l
 tuX/xTIwAIKAq7PKYLhXruWfYYERBRFywcne724v+kLX2qpXl1HOTNhCbnV2fUFcqjpF
 ESkoo59oqcgY7QG9V0z6fY9VJ3cE6i4m8AB7gvvr1PrFZuYvQe3gUCAaB/IeUzVZy1kD
 LrD8h8jQBKl//jkkBGUM0VSU2hdS4nd64cJBnEIh40hGnJKNdvQNvo/e3C5OFP1NjtxS
 o4yOKEZuZglvQcvwhCECGzZK0Kjw3aWou1kcFkcHWOc24ZpXkEOPKLLIO/lYeAUXg+6K
 y0dQ==
X-Gm-Message-State: AOAM533UyUksLGy9B7hxmWvfRfpnZBcW4cf1xl+Vm8SVXcErPdpQIH67
 /BTOhN3qXrA6qyDaoGEi/xWNzD91UuxkPf8Rkchmfug0AnzS5ZWs6hXavaxpJiHr5dJBuZIQE77
 m4alDZLH+qie9Xhw=
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr1734210wme.16.1630734492180; 
 Fri, 03 Sep 2021 22:48:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7SbwVqlpaqBnuJovWY4OfkX5ETC5xMInXEX1AwbFf+MumwbO5ed3GRaw06ZSGAwiQHZ1+Iw==
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr1734170wme.16.1630734491803; 
 Fri, 03 Sep 2021 22:48:11 -0700 (PDT)
Received: from thuth.remote.csb (pd9575809.dip0.t-ipconnect.de. [217.87.88.9])
 by smtp.gmail.com with ESMTPSA id
 h16sm1181315wre.52.2021.09.03.22.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 22:48:11 -0700 (PDT)
Subject: Re: [PATCH v3 24/28] tests/qtest: Replace g_memdup() by g_memdup2()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-25-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <98c0ca0f-137a-7392-ebda-a8d1b7743892@redhat.com>
Date: Sat, 4 Sep 2021 07:48:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903174510.751630-25-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 19.45, Philippe Mathieu-Daudé wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>    The old API took the size of the memory to duplicate as a guint,
>    whereas most memory functions take memory sizes as a gsize. This
>    made it easy to accidentally pass a gsize to g_memdup(). For large
>    values, that would lead to a silent truncation of the size from 64
>    to 32 bits, and result in a heap area being returned which is
>    significantly smaller than what the caller expects. This can likely
>    be exploited in various modules to cause a heap buffer overflow.
> 
> Replace g_memdup() by the safer g_memdup2() wrapper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/libqos/ahci.c   | 6 +++---
>   tests/qtest/libqos/qgraph.c | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
> index fba3e7a954e..eaa2096512e 100644
> --- a/tests/qtest/libqos/ahci.c
> +++ b/tests/qtest/libqos/ahci.c
> @@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
>       AHCIOpts *opts;
>       uint64_t buffer_in;
>   
> -    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
> -                    sizeof(AHCIOpts));
> +    opts = g_memdup2((opts_in == NULL ? &default_opts : opts_in),
> +                     sizeof(AHCIOpts));
>   
>       buffer_in = opts->buffer;
>   
> @@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
>       g_assert(!props->ncq || props->lba48);
>   
>       /* Defaults and book-keeping */
> -    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
> +    cmd->props = g_memdup2(props, sizeof(AHCICommandProp));
>       cmd->name = command_name;
>       cmd->xbytes = props->size;
>       cmd->prd_size = 4096;
> diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
> index d1dc4919305..109ff04e1e8 100644
> --- a/tests/qtest/libqos/qgraph.c
> +++ b/tests/qtest/libqos/qgraph.c
> @@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
>       edge->type = type;
>       edge->dest = g_strdup(dest);
>       edge->edge_name = g_strdup(opts->edge_name ?: dest);
> -    edge->arg = g_memdup(opts->arg, opts->size_arg);
> +    edge->arg = g_memdup2(opts->arg, opts->size_arg);
>   
>       edge->before_cmd_line =
>           opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


