Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FBE4ECDEA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 22:25:06 +0200 (CEST)
Received: from localhost ([::1]:39460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZesL-0002oY-8l
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 16:25:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZerN-00020y-HS
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 16:24:05 -0400
Received: from [2a00:1450:4864:20::42c] (port=40912
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZerM-0000El-1o
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 16:24:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d7so30885573wrb.7
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 13:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ep4xGCk4+2RA6BSWqgGP/aM/5/WsmA69kCT4NsRVhjg=;
 b=pOc9GnGWl9xdtatu/TkOCLQH3q/QcYO7mhWlFQhExTj4BfPow5U03/JJR4120V3fIK
 JTXrcWeIMvcTFCHT8rMW9gWsAG+Ja/0nynHIG1ecmoQJdPDLgzCnGhwGN9RWqMY0VpBR
 zycD1uE/rU0DToXqKRd3Z7muYbboh/JQb16LH16J1+KskJaTQ0v+l2vZcvuTfvIutVK9
 Zw4ycD6zkk279ZQStMKODOHKgMFhngZinCvhyFijI1BQyGzphZiM7suuli+NjCiYvkSB
 DVI/Ibeb5HCgx7t0xjxaWyucb84G3oNxqfXnxzvccTa5osUUvO+ZR2PCtm4InZKQ1Jx5
 ibgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ep4xGCk4+2RA6BSWqgGP/aM/5/WsmA69kCT4NsRVhjg=;
 b=aPbofVwRwJ9bvccqk6ca13naz9zrX0OW1YGMofXusSChXGNDtNgMSLZwnGh6ZgkBTW
 7uNlFOs0GZHdLkiZpeLObyFwukBnc4wgTvYR8pBATBXe3z+1/fc4nvNY+AMmH3w1x5/L
 Igt1+kcVOPeY8Ic1P2xHJ1Pkyt9nDouiJrXLOYssPzBFOvnVfRRkexJqMQaqPrN8rmBu
 PFkTNUsP9uAMd7ccOpcL+wdKBOfB5rSYAK41uBibvhvN3NAP4oqCLFBFAqBckxSJN26i
 XmqaWIZ2rWK4qaYQJcA1B51zSQPozXEtzweUz1QWRcwAwpzdINCeQTrS0UtdCbIr+BNt
 quRA==
X-Gm-Message-State: AOAM532mBl2R0JtHL6yPx6nJq3B4XZfyA8HLexYvx7Eo7yLqZWNKGr5V
 7h1zzWgRhtjOQBHvYfRKEHM=
X-Google-Smtp-Source: ABdhPJx5F4+gU+PLS1PAA/QmkDeuZ9GFj/j7U0OB8SVlNb7lQefE6WXxWSi3O+VfOuPP/tBGIzD9Og==
X-Received: by 2002:a05:6000:2a8:b0:205:a7be:c330 with SMTP id
 l8-20020a05600002a800b00205a7bec330mr1231062wry.290.1648671841711; 
 Wed, 30 Mar 2022 13:24:01 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:403e:ab57:ee68:20ea?
 ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b0038cb98076d6sm6204670wmg.10.2022.03.30.13.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 13:24:01 -0700 (PDT)
Message-ID: <b7487b9a-fda3-3576-34b3-5cf556c83de6@gmail.com>
Date: Wed, 30 Mar 2022 22:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
Content-Language: en-US
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
References: <20220330181947.68497-1-wwcohen@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330181947.68497-1-wwcohen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, fabianfranz.oss@gmail.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 keno@juliacomputing.com, reactorcontrol@icloud.com, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 30/3/22 20:19, Will Cohen wrote:
> As noted by https://gitlab.com/qemu-project/qemu/-/issues/950, within
> the patch set adding 9p functionality to darwin, the commit
> 38d7fd68b0c8775b5253ab84367419621aa032e6 introduced an issue where
> limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c, though the
> referenced constant is needed in 9p.h. This commit fixes that issue by
> moving the include to 9p.h.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950

> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>   hw/9pfs/9p.c | 5 -----
>   hw/9pfs/9p.h | 5 +++++
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index dcaa602d4c..59c531ed47 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -33,11 +33,6 @@
>   #include "migration/blocker.h"
>   #include "qemu/xxhash.h"
>   #include <math.h>
> -#ifdef CONFIG_LINUX
> -#include <linux/limits.h>
> -#else
> -#include <limits.h>
> -#endif
>   
>   int open_fd_hw;
>   int total_open_fd;
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index af2635fae9..0ce4da375c 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -9,6 +9,11 @@
>   #include "qemu/thread.h"
>   #include "qemu/coroutine.h"
>   #include "qemu/qht.h"
> +#ifdef CONFIG_LINUX
> +#include <linux/limits.h>
> +#else
> +#include <limits.h>
> +#endif

Except XATTR_SIZE_MAX, I don't see anything in 9p.h which
requires <limits.h>.

$ git grep P9_XATTR_SIZE_MAX
hw/9pfs/9p.c:3960:    if (size > P9_XATTR_SIZE_MAX) {
hw/9pfs/9p.h:484:#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
hw/9pfs/9p.h:495:#define P9_XATTR_SIZE_MAX 65536
hw/9pfs/9p.h:497:#error Missing definition for P9_XATTR_SIZE_MAX for 
this host system

Only 9p.c requires this definition, what about moving the
offending code to the .c?

Regards,

Phil.

