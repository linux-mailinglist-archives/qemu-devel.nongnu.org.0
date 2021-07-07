Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF53BE336
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 08:37:08 +0200 (CEST)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m11BD-0003ZP-7F
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 02:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m119a-0001yc-D9
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 02:35:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m119V-0004CO-PH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 02:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625639719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntcv5fyXKuU2+pVKGqYkhlhRW/NOqddNpOo9H8/gjBg=;
 b=BfN5fbbUYv6k1SAlGIRv6AkBto42XKeFJ3tN/70e61PD3DxOnkv5QEJoSo+WbbY5gWb10u
 rU44+CrS2cIiVF6RkNRIf69vQbPTXltBxgCog89b/7Iyb1UTdh/D6zJB0gRCpRlTu38gmF
 fW/U+cNkqqXCYrWeTWmXVWdhTaYiTSQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-DzI3R0hpO3Ctf_XKUQCqJw-1; Wed, 07 Jul 2021 02:35:17 -0400
X-MC-Unique: DzI3R0hpO3Ctf_XKUQCqJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l3-20020a05600c1d03b029021076e2b2f6so1710078wms.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 23:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ntcv5fyXKuU2+pVKGqYkhlhRW/NOqddNpOo9H8/gjBg=;
 b=ugkLY+gFCApjI34srE2AZg8MmGgMgBt7SHWzF8gHyy+uCn/wMjFVjFYthzqRwJ2w4f
 5XdSKUMzmJYGjRcNDWdHX2QdEgV8GCsfnjPgjwVHU3kFLTJk3D0owOEFBHsncMMll5RJ
 8Xrvkt0sPGNm9eLT+fgCKv3PWHriOyGgWpellVWv437mzy8eGJv7eYdXNyW01EOUtUoG
 o9xtH/ix135zbaUhhVPL3f1w0vd9Bmt+33/rBnw0eAwqQuRzceUaK8j4FijU1eJNX623
 SJIAlNJqQ90mxJiHNwaedVLD105E2S9N49cFDg0ozEATNFCbJ7B/gZjvfyfE9BLrtS1T
 SVng==
X-Gm-Message-State: AOAM532pDYXUWVhJUMSiQQHLFUehDqeH6uSXmPdvqB0ygUEh+krFa493
 ZFnqFtGv05Narcv4h+VhNcRbFXcgkgW1M/GQ9sZA+IOrcFrxJ91gLSM89gilgnCOzuVa05/yRIy
 +reo6wymB8pzTbkU=
X-Received: by 2002:a05:600c:5105:: with SMTP id
 o5mr13418074wms.42.1625639716555; 
 Tue, 06 Jul 2021 23:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+vIoeVuFxqq/UelwEEMWRB1/117anVUkSUk6T7gC0hdQaARkbPVJqUABVlZcifRzfTEaY4Q==
X-Received: by 2002:a05:600c:5105:: with SMTP id
 o5mr13418047wms.42.1625639716298; 
 Tue, 06 Jul 2021 23:35:16 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ead.dip0.t-ipconnect.de.
 [217.87.94.173])
 by smtp.gmail.com with ESMTPSA id l9sm19372697wrp.14.2021.07.06.23.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 23:35:15 -0700 (PDT)
Subject: Re: [PATCH] Fix libdaxctl option
To: Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
References: <20210707063124.81954-1-mrezanin@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <66a2e508-462b-a19f-3d04-1a55077aba89@redhat.com>
Date: Wed, 7 Jul 2021 08:35:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707063124.81954-1-mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2021 08.31, Miroslav Rezanina wrote:
> For some reason, libdaxctl option setting was set to work in an opposite
> way (--enable-libdaxctl disabled it and vice versa). Fixing this so
> configuration works properly.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   configure | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 650d9c0735..4f51528a77 100755
> --- a/configure
> +++ b/configure
> @@ -1531,9 +1531,9 @@ for opt do
>     ;;
>     --disable-keyring) secret_keyring="no"
>     ;;
> -  --enable-libdaxctl) libdaxctl=disabled
> +  --enable-libdaxctl) libdaxctl="enabled"
>     ;;
> -  --disable-libdaxctl) libdaxctl=enabled
> +  --disable-libdaxctl) libdaxctl="disabled"
>     ;;
>     --enable-fuse) fuse="enabled"
>     ;;
> 

Fixes: 83ef16821a ("configure, meson: convert libdaxctl detection to meson")

Reviewed-by: Thomas Huth <thuth@redhat.com>


