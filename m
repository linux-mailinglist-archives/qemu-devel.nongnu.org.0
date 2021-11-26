Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C045EBD4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 11:40:10 +0100 (CET)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqYeH-0000Ip-H5
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 05:40:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqYdN-00080F-Au
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 05:39:13 -0500
Received: from [2a00:1450:4864:20::431] (port=36687
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqYdL-0005hg-Oa
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 05:39:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id s13so17695682wrb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QgrRV3UcssClfPqWWztYp37lASt5yFPU4cLKGAsPJlU=;
 b=eiZnCVpcmsIPe45m2T4xPf5zoc8hT2JuwNHPl1xc1RWbieawvox4od+jmhljN4I+c8
 y8kVaWRQ7D4geFfUlipr8MH+new8JmeS4go0HQPiitQYMtE03E5khcuSJtYezmniSDqz
 yRNZvbhy7Zr8nKyAKcskLIXyLaQViId0SRP/ZtPiZ3ooaYUwOFFQ6LwiXBq9I56HEznn
 +VHcVMLsIc61aa8kL9FC4AOzorNbmTmp2jVBAMEqbwAHb6lvq4dBW0HRXVCkwFm8hh3O
 LtLNhoQHb/IMuOpCf74gHqdg+jKcw87N+Z7lPnierTTsKNrKgNd88gb24GKtIPRT2KM9
 JBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QgrRV3UcssClfPqWWztYp37lASt5yFPU4cLKGAsPJlU=;
 b=dxtSP7vClj+xQ4dNNsSlFwQ59VcHUWe4kjd4UsnwXykThXzTigSrXs9kuRjN+/WkoA
 XHxHH1dra4ZsZRQErQAXy5WACWgiRp+o0+5nP2yurTP1jWzF+GBITbALY5jauG6OxZLw
 TL6s2XDkbMha2gTkXeHoBILwIBY0ZF2KF0/dHy4QB1lGpwueob9qLrnT71YjM34ciF3h
 7osl6TayU2nb2BnF8Y/hUKW5L2xy+prDVtX9i0TK+5xqeE5PVgBxbkh+eLg6ReG1kEHv
 QW/5fJfmppGKrSYxRBW0A48NqlZLFOQlkKCMDAwqBNpNtsy7+UoeWg8C6k56E+0lBYjK
 piuw==
X-Gm-Message-State: AOAM533zF5NOXz/9YVRdS4zD0BIXrw/yisunlV6V118IJC6y8YwXqPrD
 CQ2/TmgLFoSqxkveXEOHBkJA7w==
X-Google-Smtp-Source: ABdhPJzMqJX4NLOS1k6HPQjPcSpYNu6HwypzDboQtQUR1Ho2wFPPgyCcarlsgNIZEzg0LuZPmv236g==
X-Received: by 2002:adf:a145:: with SMTP id r5mr12249049wrr.462.1637923149609; 
 Fri, 26 Nov 2021 02:39:09 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id e12sm6991008wrq.20.2021.11.26.02.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 02:39:09 -0800 (PST)
Subject: Re: [PATCH v2 2/7] accel/tcg: suppress IRQ check for special TBs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
 <20211125154144.2904741-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c283ce4-1583-5f40-3468-f818b909f210@linaro.org>
Date: Fri, 26 Nov 2021 11:39:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125154144.2904741-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 f4bug@amsat.org, Peter Xu <peterx@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 4:41 PM, Alex Bennée wrote:
> @@ -1738,7 +1738,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
>       if (current_tb_modified) {
>           page_collection_unlock(pages);
>           /* Force execution of one insn next time.  */
> -        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
> +        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
>           mmap_unlock();
>           cpu_loop_exit_noexc(cpu);
>       }

There's another instance in tb_invalidate_phys_page.

> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 314f8b439c..b43f92e900 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -946,7 +946,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>                   cpu_loop_exit(cpu);
>               } else {
>                   /* Force execution of one insn next time.  */
> -                cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
> +                cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ | curr_cflags(cpu);
>                   mmap_unlock();
>                   cpu_loop_exit_noexc(cpu);
>               }

And a second instance in this function.


r~

