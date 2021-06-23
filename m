Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28773B1DD0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:48:39 +0200 (CEST)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw57H-0007Za-2J
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw56I-00067R-GV
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:47:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw56A-000089-KE
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624463250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvJmD5zhu84zF/05wiypD0I7kfDEw9zK/bQ1tT/JGKA=;
 b=aIHwAJkbuybf0RzP62Nj4IBCLLwcHx7ZlocHWghMZMTBmv+qngryfbS9oGSGL1i7IUYXK4
 WPl/4c1KDlY3ynXnpgRNg/s3/SXoR/GTwZ2bohdIlRuJ88D/2AzWy/UzcYM6OrU17D/6LE
 b7aH3/kFdfLxr7ptXasfkFCXwat4xWU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-IUUIzO2INWKguFPwiohAwQ-1; Wed, 23 Jun 2021 11:47:28 -0400
X-MC-Unique: IUUIzO2INWKguFPwiohAwQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 ci22-20020a170906c356b0290492ca430d87so1133251ejb.14
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OvJmD5zhu84zF/05wiypD0I7kfDEw9zK/bQ1tT/JGKA=;
 b=LQXBk5LoA0d60QpC93Hc++3HGCmtLNpGtuKFFHWcwvKb6E0ToVNOVtrdEldEuTv3K4
 L/ElIcWaQ9f/4FvNzOvp2Qx9eIj+ATD0uIjCQ5xdk8RTrYvm/hKNbhi7/TxfNqPAs4Qa
 IC16YXw4++zSWj835ik8iUGni5F/eoVE3pr3fwHFNkanHmeQ/HafooHOvQWD6fZoN7mO
 /wIfdQzssv3NL/shJJX/kKHAezCWzQoYPvlja0VH0WHKUMWzAxEkwsC7S3UnsSGZ6t/Z
 V5vIAkKRsrvCGJd41FZPFQAw+pAC79El2nh4qAZFeJJUlfJDr6A3VPnxOoX3eKaL+Gnu
 1qsg==
X-Gm-Message-State: AOAM532Uje+IjtAuPj9MU8LssaQY3c04Kj/xGU/5ArFP+2LTi+hCAnqj
 psCxHNOoURGv/km4GUxee2VNE7xhPRCoe5XjKNvG8YfaZdcVOLtFKXWHio7BG5+F4mGPV547gZm
 SN5p79VhpBxDaBDo=
X-Received: by 2002:a17:907:1b1b:: with SMTP id
 mp27mr655375ejc.538.1624463247277; 
 Wed, 23 Jun 2021 08:47:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsJmzK1s3w0NfkFaYOX7AxRFudlbCvSbyMP+QMwtDbYONRDU6XZS/jL55evAAq/kmWZnjl3g==
X-Received: by 2002:a17:907:1b1b:: with SMTP id
 mp27mr655352ejc.538.1624463246983; 
 Wed, 23 Jun 2021 08:47:26 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 d23sm242412eds.96.2021.06.23.08.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 08:47:26 -0700 (PDT)
Subject: Re: [PATCH v4 7/7] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-8-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5be29121-b904-a990-4eda-707997004c43@redhat.com>
Date: Wed, 23 Jun 2021 17:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608131634.423904-8-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Joelle van Dyne <j@getutm.app>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.06.21 15:16, Paolo Bonzini wrote:
> From: Joelle van Dyne <j@getutm.app>
>
> iOS hosts do not have these defined so we fallback to the
> default behaviour.
>
> Co-authored-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> Message-Id: <20210315180341.31638-4-j@getutm.app>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 5821e1afed..4e2f7cf508 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2322,8 +2322,11 @@ static int64_t raw_getlength(BlockDriverState *bs)
>   again:
>   #endif
>       if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
> +        size = 0;
>   #ifdef DIOCGMEDIASIZE
> -        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
> +        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size)) {
> +            size = 0;
> +        }
>   #elif defined(DIOCGPART)
>           {
>                   struct partinfo pi;
> @@ -2332,9 +2335,7 @@ again:
>                   else
>                           size = 0;
>           }
> -        if (size == 0)
> -#endif
> -#if defined(__APPLE__) && defined(__MACH__)
> +#elif defined(DKIOCGETBLOCKCOUNT) && defined(DKIOCGETBLOCKSIZE)

In v3, I was wondering whether it’s intentional that the following 
DKIOCGETBLOCKCOUNT/SIZE block would no longer be used as a fallback if 
the DIOCGMEDIASIZE ioctl failed (which it was before this patch).  I’m 
still wondering.

Max

>           {
>               uint64_t sectors = 0;
>               uint32_t sector_size = 0;
> @@ -2342,19 +2343,15 @@ again:
>               if (ioctl(fd, DKIOCGETBLOCKCOUNT, &sectors) == 0
>                  && ioctl(fd, DKIOCGETBLOCKSIZE, &sector_size) == 0) {
>                   size = sectors * sector_size;
> -            } else {
> -                size = lseek(fd, 0LL, SEEK_END);
> -                if (size < 0) {
> -                    return -errno;
> -                }
>               }
>           }
> -#else
> -        size = lseek(fd, 0LL, SEEK_END);
> +#endif
> +        if (size == 0) {
> +            size = lseek(fd, 0LL, SEEK_END);
> +        }
>           if (size < 0) {
>               return -errno;
>           }
> -#endif
>   #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>           switch(s->type) {
>           case FTYPE_CD:


