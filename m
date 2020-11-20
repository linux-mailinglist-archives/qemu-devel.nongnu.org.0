Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D322BA77C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:33:20 +0100 (CET)
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3jD-0006jT-D6
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg3iC-00060U-Un; Fri, 20 Nov 2020 05:32:16 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg3iB-0004KK-BZ; Fri, 20 Nov 2020 05:32:16 -0500
Received: by mail-wr1-x444.google.com with SMTP id j7so9529441wrp.3;
 Fri, 20 Nov 2020 02:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZRP+sxzCQLZJyEyKB114Lz8ugX5VZhUOjzr4bb4XVJc=;
 b=MRXpqJhNNzXpctqblZGCBzAKk4fFvUA09a51//BKwXO91K2eIbeqpVYH/Ybm1ACCGx
 b8KOsJcxR7/QqoHkIeCfHkuQgoTjkK1aJ6lJ+wID1dPpvSLTOMccpRATpOKK0MOZdARU
 ycbRJDwdGNH7Ec6TvZR6QBqdscYaHQkLN264a3kvOpQ+JAefQNKGXKy6jtbQDVsPKGxM
 lCx57YZNoS1b2cKb9pP8V6Iy51epKZIckQxGrgmHxuCtdtuQ18LMc1GMsbxCwZpxNmZZ
 f31UGRsKy+4yTRhYeePil1klGGWRs0f2mqZk195VKgSzBRGo8EhQeoycJJMM0VUUJqGR
 yQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZRP+sxzCQLZJyEyKB114Lz8ugX5VZhUOjzr4bb4XVJc=;
 b=qvtUO9cYhM1yAwV6TZchv+7F1EgZQTIgq+2Vm3eBmDm/hWfa8km2EFgBo9klpdS1jQ
 2/GAI1puzdjPZScDQxVounoJVfI/tKLcqLvxajopgVYmcZl/liCgBmWQDyxNtFr/bEkJ
 JYHv9N2wnCKm+6ENCYonSnsB63r7jlwAGpkFpLN3JxRhQPXiguL0b20iwXW49jWxdqa7
 DIDU/Ag2z3Q9cpcysEU6vRuB8hFD1zRuOPxA35+W8I4aoCsDyUvWtvm7ensn2YlHVc74
 kkBgpjWTZKY6sH/4MsL5qJXcvu7G9pzNjpK2Nu0HQVJrjbOiW5W6+kOfRT52gn+Cnwkd
 dczg==
X-Gm-Message-State: AOAM532F3S/vW+0twwiDBXtUWYZRNGptxJ325uoPJ9SX+LJ9C90NHHFh
 JGYvAEh8X9TuwPhsGTJLRa8=
X-Google-Smtp-Source: ABdhPJz3EK5IyJJcndt7e7dPhWkHUArCszHuWaqaSYBGzNSQl8vY+2fU3EOUI9w6EB9WN718MJ/l8Q==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr15857105wrm.188.1605868333450; 
 Fri, 20 Nov 2020 02:32:13 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d16sm4492730wrw.17.2020.11.20.02.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 02:32:12 -0800 (PST)
Subject: Re: [PATCH v5 7/7] block: check availablity for preadv/pwritev on mac
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-8-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <abb6c2d9-d375-1963-e0a0-627636643860@amsat.org>
Date: Fri, 20 Nov 2020 11:32:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201108232425.1705-8-j@getutm.app>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 12:24 AM, Joelle van Dyne wrote:
> macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
> will succeed with CONFIG_PREADV even when targeting a lower OS version. We
> therefore need to check at run time if we can actually use these APIs.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  block/file-posix.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index d83219df55..a9d69746a0 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1394,12 +1394,24 @@ static bool preadv_present = true;
>  static ssize_t
>  qemu_preadv(int fd, const struct iovec *iov, int nr_iov, off_t offset)
>  {
> +#ifdef CONFIG_DARWIN /* preadv introduced in macOS 11 */
> +    if (!__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)) {

Can we change the CONFIG_PREADV ifdef'ry to run this check once
on macOS 11?

> +        preadv_present = false;
> +        return -ENOSYS;
> +    } else
> +#endif
>      return preadv(fd, iov, nr_iov, offset);
>  }
>  
>  static ssize_t
>  qemu_pwritev(int fd, const struct iovec *iov, int nr_iov, off_t offset)
>  {
> +#ifdef CONFIG_DARWIN /* pwritev introduced in macOS 11 */
> +    if (!__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)) {
> +        preadv_present = false;
> +        return -ENOSYS;
> +    } else
> +#endif
>      return pwritev(fd, iov, nr_iov, offset);
>  }
>  
> 


