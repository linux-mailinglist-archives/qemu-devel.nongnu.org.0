Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048F322B56
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 14:22:36 +0100 (CET)
Received: from localhost ([::1]:48694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEXe6-0002P9-In
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 08:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEXcH-0001sT-2M
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:20:41 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEXcF-0005cg-Im
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:20:40 -0500
Received: by mail-ej1-x62d.google.com with SMTP id g5so34558427ejt.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ykh09GBru7ZZ6BrWYjKgB3HTxkBNYlwkxL3eZeiHtPU=;
 b=GpycF6IVxHLGqRXJqgxdGX9RtK9P4P7mOSAvbXHVQbuBC5W966bqSRESqmWPo7BKJz
 mhI9bd78HGot/NQRSY7ARdcF3TWpAlOfoiMGyHobr2RdquXmnmfSUoUFEZqSn1pgtSbN
 7S3fxWu4dAd5y8GTY4GohK+QIVEoQexgy+dcl89dfvvHh/Ql1NWTX6c06pjBmRLYiOzY
 dLwa3J8QcKBvRZbbzOVZboZuYK8MGKROazFrU1eU+opGIaudeUrWo4TcYR8tiIF8uYgy
 FPN6N7Mf2fRdpyPFxhgnV7b7kBUFJSu6RiWsjPZ4HRgvNhaUPV3e92Tqs8Ls6YscYSV2
 cyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ykh09GBru7ZZ6BrWYjKgB3HTxkBNYlwkxL3eZeiHtPU=;
 b=PnIzHpL3ufYn/Tvc8HcymehKpEiGDcE8dX0WCsYtPSjyBn8f+9xiNmwhECLrHPuv0C
 HwflSABo5Kn7gZL+/n/L/DhUO6lOygJ8w7oXvlzqzqx/Qhjnb6A3pD8d9wBD55mkbSvC
 Du28VE0r0BFT77qrl0zHyI6E9gvlBnetzpn92JMSh+xnWPLn5OpiKJGzHq1smXQhF92q
 s3BHFAwAVeJ1bWQp46B+RSzl32Y6/DSC5NKDLFMWVrWi1W1/2HSvfrAXMJdhAsJ5ZYzk
 gj59SiN7KYbx+6Gfq4f954uBZkUF0UUcTXf1PAiuS97rhuixiJLeJJoL2WRBdwvvG7Mo
 3kCQ==
X-Gm-Message-State: AOAM5310D+OkMzmCPOlQ9sj/iCQLNfiygtZo80NjbGViRSE1+VeyipSH
 GvoasOHNP+ynFYy9GtG42co=
X-Google-Smtp-Source: ABdhPJyGLpgEgolZ8/P+rfLFOcOqssDb6V8xh6qaMmWbK3W9Hwv0TvsKXSvf6j8fOiueiYUuQ3qEeQ==
X-Received: by 2002:a17:906:ca02:: with SMTP id
 jt2mr5887994ejb.312.1614086437568; 
 Tue, 23 Feb 2021 05:20:37 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d5sm14633921edu.12.2021.02.23.05.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 05:20:36 -0800 (PST)
Subject: Re: [PATCH] ui/cocoa: Replace fprintf with error_report
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20210223131106.21166-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1f082d08-ed15-24fe-832f-a37e69c23cda@amsat.org>
Date: Tue, 23 Feb 2021 14:20:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223131106.21166-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 2:11 PM, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  ui/cocoa.m | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 0ef5fdf3b7a..900bc984733 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -270,7 +270,7 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
>  static int cocoa_keycode_to_qemu(int keycode)
>  {
>      if (ARRAY_SIZE(mac_to_qkeycode_map) <= keycode) {
> -        fprintf(stderr, "(cocoa) warning unknown keycode 0x%x\n", keycode);
> +        error_report("(cocoa) warning unknown keycode 0x%x", keycode);
>          return 0;
>      }
>      return mac_to_qkeycode_map[keycode];
> @@ -1071,7 +1071,7 @@ - (id) init
>          // create a view and add it to the window
>          cocoaView = [[QemuCocoaView alloc] initWithFrame:NSMakeRect(0.0, 0.0, 640.0, 480.0)];
>          if(!cocoaView) {
> -            fprintf(stderr, "(cocoa) can't create a view\n");
> +            error_report("(cocoa) can't create a view");
>              exit(1);
>          }
>  
> @@ -1080,7 +1080,7 @@ - (id) init
>              styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskClosable
>              backing:NSBackingStoreBuffered defer:NO];
>          if(!normalWindow) {
> -            fprintf(stderr, "(cocoa) can't create window\n");
> +            error_report("(cocoa) can't create window");
>              exit(1);
>          }
>          [normalWindow setAcceptsMouseMovedEvents:YES];
> 

Alistair did this 3 years ago:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg484556.html
but it was never merged... so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

