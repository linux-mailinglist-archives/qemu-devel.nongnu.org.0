Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE73BE42C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:15:47 +0200 (CEST)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12ig-0000a6-SC
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12hj-00082O-87
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12hh-0004A2-Mn
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625645685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Js0coJ1O2izW87BLUxYCaya8pqQQ3um2Z6xdq+RcEpo=;
 b=X9iG0JcZnTOz49kYoKxIsDrfQlwyNl9HIUXLlavaw9jz4Fq1YG37EP0kThykQIhwgLF2K4
 3vhwGT3JL8wIhEbnkuddObRCgqzjFNXhx3NS6RYJzaod6UwB0zZYC/z2zWSHEqSP6IXhrf
 Vv74qOY+jrsiUKTa1ckJN7RSQanHnx8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-f6BqimiGPu6HVYB0olArfg-1; Wed, 07 Jul 2021 04:14:43 -0400
X-MC-Unique: f6BqimiGPu6HVYB0olArfg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n5-20020a05600c3b85b02902152e9caa1dso511604wms.3
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 01:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Js0coJ1O2izW87BLUxYCaya8pqQQ3um2Z6xdq+RcEpo=;
 b=knU2hMPb8mH6QJhFqk8qqm0Qkug4cqrT0k37nmLJ/MH0we/m8kjTjcPmF48gm+QUBN
 uNybvST+mO8xqtceavcCW9vMiUzRwxTLyC2B7OmVVMTenzKSKyXju65mqZW4dQlbD2Hl
 TdfjtoTj0fKNXX27dRV2d9bsvEcNoKhGJ1CjhiwQ9EvEbFcAYTMyCr2Jv+8HmKANd+kk
 3x2WS3XwTX1gY0BW0HVOVZ4jeW3TwzKWw9Nsl88NXnh3NNl/vOnCbLbo6cW8x1XecESI
 1nHXdVcrx8YAoyKdT6Jlax6unjVR6kzy8J0S7edygVUpRc33ZdgcGahXBro/6r1kI/2a
 9kbQ==
X-Gm-Message-State: AOAM5317QVrMWtWho/2zEM/XYogTuX1c/fXe8WHrVxaguBRXSNTesl2Y
 BhzFSlQXlMU5Gq27S61G/F/mYf0wG6pgWezlOUgTNbANp0cC/xE36iC1IHC4OPFWnlU2Vrvj2TS
 Kf4DiH2S0n0emUjE=
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr25814045wrz.188.1625645682874; 
 Wed, 07 Jul 2021 01:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWkEWgDdc+WujrN3xvJxsfZyRd28o0rXbJmDvJyRBAISgBlEhcIVgGAApmddV7EVnCa7CyEw==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr25814037wrz.188.1625645682774; 
 Wed, 07 Jul 2021 01:14:42 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s1sm5324557wmj.8.2021.07.07.01.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:14:42 -0700 (PDT)
Subject: Re: [PATCH] Fix libpmem configuration option
To: Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
References: <20210707075144.82717-1-mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d1282db6-cd8c-b32a-d699-183374ee78b9@redhat.com>
Date: Wed, 7 Jul 2021 10:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707075144.82717-1-mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 9:51 AM, Miroslav Rezanina wrote:
> For some reason, libpmem option setting was set to work in an opposite
> way (--enable-libpmem disabled it and vice versa). Fixing this so
> configuration works properly.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 7994bdee92..ffa93cc5fd 100755
> --- a/configure
> +++ b/configure
> @@ -1501,9 +1501,9 @@ for opt do
>    ;;
>    --disable-debug-mutex) debug_mutex=no
>    ;;
> -  --enable-libpmem) libpmem=disabled
> +  --enable-libpmem) libpmem="enabled"
>    ;;
> -  --disable-libpmem) libpmem=enabled
> +  --disable-libpmem) libpmem="disabled"
>    ;;
>    --enable-xkbcommon) xkbcommon="enabled"
>    ;;
> 

Fixes: e36e8c70f6d ("configure, meson: convert libpmem detection to meson")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


