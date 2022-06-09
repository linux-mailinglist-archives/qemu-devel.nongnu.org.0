Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F4545117
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:42:28 +0200 (CEST)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKIl-00081d-PQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIxI-00054m-4w
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:16:13 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIxG-0002Hw-8I
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:16:11 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so26817663pjo.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vSlrE/+0zbFsRq4FDYKwVMpBwc/ORg6zCFPMkF9xVGE=;
 b=JrVzxZueTFm4Diruq+Hx/jo31TblmninxPpT5oEhsBj8bIZoeHXIpuxjE/y+LJ7da0
 KXgNgm0FNUfbQAk6HXD0VhiPM+0BnnnwrnCEhA9otVSgaI/6b0ac/dIDzg0+o3cqChgn
 /9PJrXiLENIsijUmuymp56HZQHkai2gktNGlTEWI4nq947g9n5kEy7DOhqBEUwPRVgPT
 LcMc45JfIDMZhBBu2QbEfPI5oFteHLXxJzpHlzPtAbRc8fR0EOYnsqDWQpE6ilcxZyVd
 8DO1CHEjIq4zuZX/GnNjXELhnErdwVEFCiAQRtzMjl44itE2qvsDjRPsCkIAvRpgIXJ3
 pbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vSlrE/+0zbFsRq4FDYKwVMpBwc/ORg6zCFPMkF9xVGE=;
 b=u5Oem2sQbeZ0DuPMcq4v9FqcNg2o+OUCblNB2FnbDJnnb65IW1hDh3lpvfBQ0cNN6z
 ACRjVhbOWwAciXXYelh1f/wi4LpFN7xdyjzdPmnJOK9IT+puG9oyrAf8sU+X0g+FnMHP
 1Ipr9wtEf5E5sEfjNw2ks43ZcPYlk2btTBVB8pQ3B1I85a8mO8JtgNGwS3Pf2x2vwZDh
 Jz4LRJWH/T1WcPjAfcRSc7Exk85INnpOSWg4R7T5YYWna5ko7JVl+MuyHryCeinh+q4W
 D5kk/lNLR0GzFjwh7V8eLjrItjCCWb0RmCq8O9LAEK8m9Q2Iz9iekscw9jAPkK/JO993
 G9+g==
X-Gm-Message-State: AOAM531L35ogklrdaqejL8sOmXs692cfWdRcd05SMvbs5FVx1zAFJFkA
 AdZu6TpqFlzIFUj90KLt1g9bhg==
X-Google-Smtp-Source: ABdhPJzx6TVWwzNZz1ANPnceaIifPjXvhAuz+EzKZ21lYYDZPdKVvjujDgERtVffWaJFN8YY6gjojg==
X-Received: by 2002:a17:902:d650:b0:168:b027:1a58 with SMTP id
 y16-20020a170902d65000b00168b0271a58mr1609466plh.60.1654784168698; 
 Thu, 09 Jun 2022 07:16:08 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 c143-20020a621c95000000b005187c4d53c9sm17207137pfc.160.2022.06.09.07.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 07:16:08 -0700 (PDT)
Message-ID: <78bae634-18c7-a8bb-fb6c-9b86d80e6be4@linaro.org>
Date: Thu, 9 Jun 2022 07:16:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 0/6] bsd-user upstreaming: read, write and exit
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@freebsd.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>
References: <20220608211711.56158-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220608211711.56158-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/22 14:17, Warner Losh wrote:
> Warner Losh (6):
>    bsd-user/freebsd/os-syscall.c: lock_iovec
>    bsd-user/freebsd/os-syscall.c: unlock_iovec
>    bsd-user/freebsd/os-syscall.c: Tracing and error boilerplate
>    bsd-user/bsd-file.h: Add implementations for read, pread, readv and
>      preadv
>    bsd-user/bsd-file.h: Meat of the write system calls
>    bsd-user/freebsd/os-syscall.c: Implement exit
> 
>   bsd-user/bsd-file.h           | 163 +++++++++++++++++++++++++
>   bsd-user/bsd-proc.h           |  43 +++++++
>   bsd-user/freebsd/os-syscall.c | 217 +++++++++++++++++++++++++++++++++-
>   3 files changed, 419 insertions(+), 4 deletions(-)
>   create mode 100644 bsd-user/bsd-proc.h
> 

Series,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

