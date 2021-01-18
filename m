Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279C92F9C01
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:47:02 +0100 (CET)
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1R7l-0008Sp-7N
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R5f-0007Aj-2n
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:44:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1R5a-0008AY-Pj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610963086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAONhQbmSqOCe8hn+4JsxsZxXyg8mQaj+oFgmJ4RXBE=;
 b=XgwsaXazVHwCIGh6Rf7Qi6BBpSxs8AXd2AZB9lIWHMEaZnI11lJYRlseIi/PPG3eDjwGvS
 55dSLbgWupUQh4N6JKny0H3p+Z8Ki9GZOHSSDFSuikl5V2bAhV2BVNpjXOP+Sc/h3+hsJc
 urjLcL2EH8Y7fxK4pLfIn4/rpEVfvug=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-Zd1O0V7OO-6G_AeQmduqPA-1; Mon, 18 Jan 2021 04:44:42 -0500
X-MC-Unique: Zd1O0V7OO-6G_AeQmduqPA-1
Received: by mail-wm1-f72.google.com with SMTP id 184so871486wmb.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAONhQbmSqOCe8hn+4JsxsZxXyg8mQaj+oFgmJ4RXBE=;
 b=DfzPTt2bLWjKE5yYLBxGyZJTcgUxco3GCEVKaTlZEoIzqXfw1Jrw4MpEW9HXozOqye
 kNJvYU3svUNs3J0xyfA50V5HZ/FCvOBvYAE4mefBJaF39p3/s4ptzzzODCBu5Pm49v3d
 64v+cdi9DJ4BI3s6vh7roDSXXkwsFzjv10vooVEWYke7up0YXKhBwOxR6IpRdu4kx9P1
 iJu3CaagT/11MiWom/toIMVeX7jTHCljiAs1W+HSmANYmjnV+H7r3QNlj9fb7ohQt0kX
 quP21PL538c+kRUa1VSWEU7+etTlFA95ysP0K8Hko115Kw+0FMK3i97MZ7SIs/Ezmp5H
 jl/w==
X-Gm-Message-State: AOAM531zyLpnJk6QY57WV+pm3c14kXcMFt1u7zZd46cVmN6EBE0bLwNk
 bVO/yaCv4wv9nqvoplfv9akkz926PuIKTQ4eZcGeJWApEWMCc1+Qo1aq4wqgoZHmKaCWfGplyxD
 YH11n/JmnU9WTJEY=
X-Received: by 2002:a05:600c:3548:: with SMTP id
 i8mr8770118wmq.104.1610963081184; 
 Mon, 18 Jan 2021 01:44:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7qSMLoq4mU9xFHzzMGoFXyEQqEz2C7ZbPkHAG5obBC4EeRcnldzTEyMRJoN3CmG9ZQpq8Sw==
X-Received: by 2002:a05:600c:3548:: with SMTP id
 i8mr8770104wmq.104.1610963081058; 
 Mon, 18 Jan 2021 01:44:41 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j13sm24136418wmi.36.2021.01.18.01.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:44:40 -0800 (PST)
Subject: Re: [PATCH v2 5/9] elf2dmp: Rename PAGE_SIZE to ELF2DMP_PAGE_SIZE
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-6-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7c6c2afa-d432-da7d-5c6f-d26bcfce4087@redhat.com>
Date: Mon, 18 Jan 2021 10:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118063808.12471-6-jiaxun.yang@flygoat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 7:38 AM, Jiaxun Yang wrote:
> As per POSIX specification of limits.h [1], OS libc may define
> PAGE_SIZE in limits.h.
> 
> To prevent collosion of definition, we rename PAGE_SIZE here.
> 
> [1]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/limits.h.html
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  contrib/elf2dmp/addrspace.h |  6 +++---
>  contrib/elf2dmp/addrspace.c |  4 ++--
>  contrib/elf2dmp/main.c      | 18 +++++++++---------
>  3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/contrib/elf2dmp/addrspace.h b/contrib/elf2dmp/addrspace.h
> index d87f6a18c6..00b44c1218 100644
> --- a/contrib/elf2dmp/addrspace.h
> +++ b/contrib/elf2dmp/addrspace.h
> @@ -10,9 +10,9 @@
>  
>  #include "qemu_elf.h"
>  
> -#define PAGE_BITS 12
> -#define PAGE_SIZE (1ULL << PAGE_BITS)
> -#define PFN_MASK (~(PAGE_SIZE - 1))
> +#define ELF2DMP_PAGE_BITS 12
> +#define ELF2DMP_PAGE_SIZE (1ULL << ELF2DMP_PAGE_BITS)
> +#define ELF2DMP_PFN_MASK (~(ELF2DMP_PAGE_SIZE - 1))

Here you renamed all definitions, better.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


