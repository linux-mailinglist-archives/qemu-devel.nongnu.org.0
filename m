Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D330A85B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:11:22 +0100 (CET)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YzB-0004uk-1l
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ywb-0003R4-NA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:08:41 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6YwZ-0003aQ-68
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:08:40 -0500
Received: by mail-ej1-x630.google.com with SMTP id y9so2667864ejp.10
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y4kRp1O9NSMOYw470pZIHLMK+3nXsZMTt27NrvtPWBY=;
 b=ovTBQDzeS7zCx9tL7P7Xk3plyacF02rVpLFtCjZKWXJUBgmWY1oXR1tK6yi8ng40B5
 55ReqthCZais7QcdQGliDXTtSW6Ve6qAy21SGP3iZLIqSkZTlNYMSah1Bi46dayCHdjK
 b/cnTE77BDbBU4Cuor5oDH5bVMY+xi2Ixvg68G869jB0CKYCl4JQxA3tN8Yn3vd+0bzg
 /QsHl38bVof4umYD9LFZ2nQA9bBtcN00LME5YrZqFoUSoTnq05PcaRVzNL4/kH3pz4uU
 ocMtSZAuWY/JDke64T1h2LghIsMaEvWqgFTo2hFw91zvc1iSDT6SaLVAS5i5m4xJOVLR
 QVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y4kRp1O9NSMOYw470pZIHLMK+3nXsZMTt27NrvtPWBY=;
 b=cdefp/w86waexe8Mb3txEw9QMfLvHbe7UIlpvBHj0Qk384vdzs87Xf1lnajvHDE7Vi
 DhEzyMFvtn6dIHjA6CoyOj3IQUwux7a2vcE55dXY2+22jdj+JLFq5fk/mArIYOGEdfZQ
 vD2Bk99w9BNy7Itf5CwR4JrFIv5l70swAJ+lG5Gun6qNvO8RGJrvrgIoBGCZM0kbr0+6
 qyCc0tTh+ZWimcQsDy9z4doybOXdcYCxGxcy8UVtN00Hy6OuH/kz/5wUpcxlHF8t2Dx9
 Ip25/iSaiQKYtJT2oEPgbqGjaQF/AeolRJBGuUONzixUaDc62zz0mgP7ONQIWKbnwMVA
 8LIg==
X-Gm-Message-State: AOAM532WKU6fC8NzTd8RspqtN5h3T0Wy2a6qniLjhRMhK70YilBUhqDX
 4KALnH0frv/RThZy1JcxknY=
X-Google-Smtp-Source: ABdhPJwTwiao55AEZH/q4YO3I6ip3slYCuygRAACBsntgWTgI4+6twqi5ufD5XR1Cd/PPfzw3vKE4w==
X-Received: by 2002:a17:906:4d8f:: with SMTP id
 s15mr17815981eju.389.1612184917083; 
 Mon, 01 Feb 2021 05:08:37 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r26sm9134948edc.95.2021.02.01.05.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 05:08:36 -0800 (PST)
Subject: Re: [PATCH v3 3/7] accel/xen: Incorporate xen-mapcache.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210201112905.545144-1-f4bug@amsat.org>
 <20210201112905.545144-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8c7281bb-5688-5ef4-4841-3181bdb02bfc@amsat.org>
Date: Mon, 1 Feb 2021 14:08:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201112905.545144-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 12:29 PM, Philippe Mathieu-Daudé wrote:
> xen-mapcache.c contains accelerator related routines,
> not particular to the X86 HVM machine. Move this file
> to accel/xen/ (adapting the buildsys machinery).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  meson.build                           |  3 +++
>  accel/xen/trace.h                     |  1 +
>  {hw/i386 => accel}/xen/xen-mapcache.c |  0
>  hw/i386/xen/xen-hvm.c                 |  1 -
>  accel/xen/meson.build                 |  5 ++++-
>  accel/xen/trace-events                | 10 ++++++++++
>  hw/i386/xen/meson.build               |  1 -
>  hw/i386/xen/trace-events              |  6 ------
>  8 files changed, 18 insertions(+), 9 deletions(-)
>  create mode 100644 accel/xen/trace.h
>  rename {hw/i386 => accel}/xen/xen-mapcache.c (100%)
>  create mode 100644 accel/xen/trace-events
...
> diff --git a/accel/xen/trace-events b/accel/xen/trace-events
> new file mode 100644
> index 00000000000..30bf4f42283
> --- /dev/null
> +++ b/accel/xen/trace-events
> @@ -0,0 +1,10 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# xen-hvm.c
> +xen_ram_alloc(unsigned long ram_addr, unsigned long size) "requested: 0x%lx, size 0x%lx"

Self-Nack, this should not be here ^

> +
> +# xen-mapcache.c
> +xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> +xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> +xen_map_cache_return(void* ptr) "%p"

