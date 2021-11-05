Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91084466FE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:28:54 +0100 (CET)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj25F-0004uy-QZ
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1eT-0002ac-Au
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:01:13 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:46059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1eQ-0007UD-Qb
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:01:12 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id s9so7587263qvk.12
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A24PYcR59ZSC08jZDO/B/Avns8lFb36ZYbYW6tDcqPk=;
 b=qnC7yva+1hhFY4fGgiw1O4CaDTP3ZOygmBv0t7I2en1dgRjzoXp93DXk4Ebln1yZ/m
 aUu2KZ93Bm5UJbX3SqENLzLTkMfI/nq0Y6OynbZ7/kSbJVtxeqr5nKnPoApdPVFjlW41
 fItqfEHNHkU5rORl+OR1izph/bmdfRfpEwKb8PjGvuDjwRMA5ZITLoQOkOaXKKMPqhA/
 Q4HxKnzTN7vlQHjPqaxz3vP9u6E7zEfRMdUpSNDRLTW0zqQGZlujempKD1Yx6LR3YGIl
 aFTJ55y7PiUVjx0LeJhqzQom/2csRTS0Ki/XPF0Z1s8zOaYN+5tRelwtI2PJpaZv6h/m
 S2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A24PYcR59ZSC08jZDO/B/Avns8lFb36ZYbYW6tDcqPk=;
 b=vf+ZI7LxkbdwdQfPyAPglXJFx5nwPvwCBnxuFUnuvmQAKyZr0gJlhl3vZHCd12sqQc
 l581YKzdTJZN+3nxHe3MYxdhN8X9E5070RrULcbWzQx+EM7xKxQw0pXaShwxEJtVN/9t
 PFku2H1Te1iYuZCyXt6TibwwHFU/lGhLGhycpynWjZ5U2BhHBRGnkE0a59bi/mKImrS1
 j5pxF6rpqncs6rOFVs5V6VQ7VHX15yGf+IZU9omRoUI4nsT87jZRApeTG2dd/AXvdHdW
 aPR4l4UUaM/t3VgwogFnKf9UHiFvspFsK+2uLJTgD0VDRAXkgUQJscL+Kl49odsDGTA1
 G8gA==
X-Gm-Message-State: AOAM531JGC1HUGcxqlxmk0f2hgszVgOeHWzvM+UQFCLzjMlVVfVLgUWy
 oDsadUtlB9UDJ3KK5kH2MDvFMg==
X-Google-Smtp-Source: ABdhPJzHCRtMZg/xNHJQUiew7i3V3qsQKcHcdvgKfPtCHarawxiAVzB6Mwrb7chnez4sRXluopymHQ==
X-Received: by 2002:ad4:5eca:: with SMTP id jm10mr22837qvb.54.1636128068641;
 Fri, 05 Nov 2021 09:01:08 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id w1sm6117084qtj.28.2021.11.05.09.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:01:08 -0700 (PDT)
Subject: Re: [PATCH v4 02/36] bsd-user/freebsd: Create common
 target_os_ucontext.h file
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01d2fb99-5629-06ec-5108-ba1009878804@linaro.org>
Date: Fri, 5 Nov 2021 12:01:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:18 PM, Warner Losh wrote:
> FreeBSD has a MI ucontext structure that contains the MD mcontext
> machine state and other things that are machine independent. Create an
> include file for all the ucontext stuff. It needs to be included in the
> arch specific files after target_mcontext is defined. This is largely
> copied from sys/_ucontext.h with the comments about layout removed
> because we don't support ancient FreeBSD binaries.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_signal.h   |  3 ---
>   bsd-user/freebsd/target_os_ucontext.h | 35 +++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+), 3 deletions(-)
>   create mode 100644 bsd-user/freebsd/target_os_ucontext.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

