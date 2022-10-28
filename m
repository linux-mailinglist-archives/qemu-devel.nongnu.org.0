Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C2611136
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:24:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooONl-00053Y-PK; Fri, 28 Oct 2022 08:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooONj-00050D-6z
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:22:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooNl3-0004JO-UH
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666957360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=riI/BTgiASE0+JyV1vrwokPegJYeiS0ILTBEJO+1DUk=;
 b=Rgb+X66yPSW1ASd3IREsqAzTziyG/Mcj9uDKO0aS8vOnxbRlwl/6Ow2pWKqRxW1HQ7lpQn
 3yH8CneesJCg5kJamZmApt/O6rAqhfz8n3NTYLYd/AqjD4XViQXCKWNMTwGITckrAZJegp
 NLRARp4YijUCb7OuwXjG+BOIEZmjDZQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-VaAkY5CcNmubDMPPjHMu_g-1; Fri, 28 Oct 2022 07:42:37 -0400
X-MC-Unique: VaAkY5CcNmubDMPPjHMu_g-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so4333055wme.7
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 04:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=riI/BTgiASE0+JyV1vrwokPegJYeiS0ILTBEJO+1DUk=;
 b=QKpE/NKxgzvzhswv8GiNI6swqtjri3AsHiiSR6iVxkvLn/E1FWtXKV+11I4/pwh7wo
 e6I99ZJcFAv8pT3/pcilPQoH1YvOOpJ7pvqgniiBiOeCNIXITGBM9I7NL2GTEuDAnhPF
 TYdeeOerWRIrJ9qh5stFxjTNMh+NQymtfHhmAzjrVla1eIDizLuSiZGw5YvB+YwcTIAq
 LAfV45r1TWQ3iE9UHEhDfTIr0Pkpuc0LQnylpUjKmMTE8tgu8sapWwt0eFTW76hVyWK6
 SSc4ihH7pyXqCLK0bVmpj4fl/KT+FJGlTKmIZGzigfzzRnIrj/dGlZURLHKRVYUQY9z5
 ZbnQ==
X-Gm-Message-State: ACrzQf2aLpUdlJvrlPu9DnzRjLJZlDRSkAxoSMsXOMT6tVVtwCIDDBK7
 Az9ruVkBHAXBlOpnb3qbpFK1sqQekREWJqroy3ebQDaDeWBRRuHUNjV5aSIaxNRr6bFp36Gv0XQ
 eA/1/WinGUqksdXM=
X-Received: by 2002:a05:6000:1861:b0:236:5ece:29b3 with SMTP id
 d1-20020a056000186100b002365ece29b3mr21970160wri.274.1666957356534; 
 Fri, 28 Oct 2022 04:42:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41tj2P53dPpwzuDvxgf/M717xB6ZFKETol416n+hl4NQp7rtRf5TnWwLDMcvFTZpAgUNfnWw==
X-Received: by 2002:a05:6000:1861:b0:236:5ece:29b3 with SMTP id
 d1-20020a056000186100b002365ece29b3mr21970150wri.274.1666957356320; 
 Fri, 28 Oct 2022 04:42:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 u3-20020adfdd43000000b002364c77bc96sm3498602wrm.33.2022.10.28.04.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 04:42:35 -0700 (PDT)
Message-ID: <53df074a-c938-cbe5-caca-a0c6a7cbd3e7@redhat.com>
Date: Fri, 28 Oct 2022 13:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] 9pfs: fix missing sys/mount.h include
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Bin Meng <bin.meng@windriver.com>
References: <E1ooNWu-0002oC-76@lizzy.crudebyte.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <E1ooNWu-0002oC-76@lizzy.crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 13.21, Christian Schoenebeck wrote:
> Fixes the following build error:
> 
>    fsdev/file-op-9p.h:156:56: error: declaration of 'struct statfs' will
>    not be visible outside of this function [-Werror,-Wvisibility]
>      int (*statfs)(FsContext *s, V9fsPath *path, struct statfs *stbuf);
>                                                         ^
> 
> As Windows neither has statfs, nor sys/mount.h, don't include it there.
> 
> Fixes: 684f91203439 ("tests/9p: split virtio-9p-test.c ...")
> Link: https://lore.kernel.org/all/2690108.PsDodiG1Zx@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   fsdev/file-op-9p.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> index 4997677460..700f1857b4 100644
> --- a/fsdev/file-op-9p.h
> +++ b/fsdev/file-op-9p.h
> @@ -24,6 +24,8 @@
>   #endif
>   #ifdef CONFIG_DARWIN
>   # include <sys/param.h>
> +#endif
> +#ifndef CONFIG_WIN32
>   # include <sys/mount.h>
>   #endif

Do you feel confident that this will also work on other exotic systems? 
(e.g. does it work with "make vm-build-haiku.x86_64" ?)
Otherwise it might be better to add a meson.build test for this header instead.

  Thomas


