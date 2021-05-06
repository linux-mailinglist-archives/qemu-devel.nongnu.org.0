Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481243759EA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:00:08 +0200 (CEST)
Received: from localhost ([::1]:43554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leiI5-0002bw-UJ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lei9h-0006V2-47
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:51:21 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lei9f-0004zd-BF
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:51:20 -0400
Received: by mail-pl1-x62b.google.com with SMTP id b21so3831058plz.0
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t+/Vnip+VqPwioVu+i+21c+s3tmDH69yCVfjv9A1iAI=;
 b=DDuwr7g/zWzKtbU1M6H2+oBNV391uOF3fHdtJSqaSspUoaD5nZGnmjsDio9nhoXhoJ
 cYEsjAEqHx6eY5kKVHVET6GZzBB2BNBHR3PPWg00W1sLhR8Ra8QUgJXXNUz3t3Tw6C8d
 TLjCN6cu1wssI6G+d2eG/Odc8+Smu20JISakjD1o0JztxA6b63xiPdyWVQK7K8sv52F9
 loabWJzVtnj/FoAIforlxVGUeyMEMjnJTepEa6zz8tX7JIcw3LEmVY3up0r9yFjgQyts
 SSFnvqT6yPkYN/jzBgwj0qBDhO/OPzcp6NaWzA19nPCOY237wGzWFkvHtyX4l7WrXVZK
 Jdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t+/Vnip+VqPwioVu+i+21c+s3tmDH69yCVfjv9A1iAI=;
 b=YawVCh8XxksjXUwbJc2NndtKerEnfs0u9XWOEkyE1S+3vwn4rjeuFjgaF2XNguWnj6
 krqh9z31QkZBQ9rUCn02B+vNONA2n+d8ob57QkO32AzDuVXM58RC/v1IZ18IsufEA/7S
 dQ+eiKgxtTmzfe/RRRWHyB8cG61jbP/NS94HlesQmDXIGfjHwB2M08euW/0E6bH8XJDI
 NY0q5HD+fK/nbOuNYnGMorOGswNv/WdI0CpS8BDDDXrbCIWjfXIA1LQZHCPQGe6Bd7F5
 Z8rEwxZoMPW6CS+ymKf2W8gqpAJWms5zUdv3+lUCBbQhVzGsApx25n15OuS9ojSgZbaN
 3itA==
X-Gm-Message-State: AOAM531iy7b4ZJKq5XusV63rajDDCfR2i/Y5pq9CFbhSVCoaHflqN4fL
 7jVS7AkQNp1JtmHevpem8BfWEQ==
X-Google-Smtp-Source: ABdhPJxrnv1M4DvmaWuOhyhLpsT3dVeF2DX3B5vF0NewUVcuZe/lu+MeRiva2WSXcVeXMCZkuil0/A==
X-Received: by 2002:a17:902:dccc:b029:ed:32ed:e7d0 with SMTP id
 t12-20020a170902dcccb02900ed32ede7d0mr5612994pll.79.1620323477250; 
 Thu, 06 May 2021 10:51:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id a16sm2679043pfc.37.2021.05.06.10.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 10:51:16 -0700 (PDT)
Subject: Re: [PATCH v2] tcg: Use correct trap number for page faults on *BSD
 systems
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210506173826.72832-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8db526d-cb19-c633-1327-2282333c7fe3@linaro.org>
Date: Thu, 6 May 2021 10:51:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210506173826.72832-1-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Riku Voipio <riku.voipio@iki.fi>,
 Mark Johnston <markj@FreeBSD.org>, Juergen Lock <nox@FreeBSD.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 10:38 AM, Warner Losh wrote:
> The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe is
> used by Linux and represents the intel hardware trap vector. The BSD kernels,
> however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14, etc fault
> handlers. This is true for i386 and x86_64, though the name of the trap hanlder
> can very on the flavor of BSD. As far as I can tell, Linux doesn't provide a
> define for this value. Invent a new one (PAGE_FAULT_TRAP) and use it instead to
> avoid uglier ifdefs.
> 
> Signed-off-by: Mark Johnston<markj@FreeBSD.org>
> Signed-off-by: Juergen Lock<nox@FreeBSD.org>
> [ Rework to avoid ifdefs and expand it to i386 ]
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   accel/tcg/user-exec.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)

Queued to tcg-next, thanks.

Looks like this area could use a bit of cleanup...


r~

