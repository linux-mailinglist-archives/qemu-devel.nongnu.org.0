Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5842FCFDF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:18:26 +0100 (CET)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2CRM-0002Pf-UT
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2CPf-0001hu-V4
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:16:40 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2CPb-0004Jd-TD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:16:37 -0500
Received: by mail-ej1-x631.google.com with SMTP id a10so16603051ejg.10
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 04:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l09apn2+KpsWzeEMb9OSsd43COP5b6EOgkQWLfHRXQ8=;
 b=nHKUwIZcKsjH6BgEW4ix3CkG07YNGEUaXHJfvE5AIoxyaFJz7SXk3cdMFhwUTvb2yU
 LUmOIaid/deWrJW1EPs9Z1NcZOzNnctWv+K+Dg4Z6fAoYnRr0r4KVebo815czfBTjlcz
 3H9FzxqUOzcF/EXoZB5AhXa6fRoeuco9EFfopqzZ1Wan9iMi5pJMCi+Irj6BXdI51CR6
 MHEWmraWLW9WCjx45xGZ0W7dMKOOpY7En2TTAuOiJsbaem6n5DbUw+QyY27taomqFj2l
 UmLiSrAMHGwulqJcN6BtZfOM05U8quGsthw1nj7fmOfxB6Vp3o6T0jxUT1zj4lZkxXIe
 h+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l09apn2+KpsWzeEMb9OSsd43COP5b6EOgkQWLfHRXQ8=;
 b=jJX/kQWD6ELp8mwHXhXPNrbWfW7TpT77N1BdLfY9/suWzhuc2pcmWBCKXI3eEFEtg5
 kMoGRypGu2u5KTHwO/QSPgWTkQlTDOySDmXHaFp5s2tScAM690hCMl3Hm0611I3rQatQ
 PCsfKoO3pCH2Hu+pge6d3eo7O0Mbdfh68gr5lpCEsyJS+fxemk3oz/9XThoOaP77IpQG
 o0wsKiIi0JBbdX18T8YgZsQwrur8EE2tjPBKCHD5WZAwwBzwp+r4GLq6rTXFliLFE4IK
 zBfLr9Uq+sH16pOz5QSIMf6bVHazZqRV2ypkc2wLB+vC1GELaDevkW958puLFGZShoWb
 eGtg==
X-Gm-Message-State: AOAM532RC8XWe0J0t+uzyvIEk4+C2vCPAysE2Em6dwbK6MoPIwEuOOlJ
 TUFkXvItSvW/lRMsb4omkPU=
X-Google-Smtp-Source: ABdhPJyNl40/MrcuuUCzszjVUvxBPxLQK8b08YPtGRe44aIaXFAVAmt8wTPYnkKS4hRa3P7xRJR9yA==
X-Received: by 2002:a17:906:748:: with SMTP id
 z8mr5868086ejb.233.1611144993832; 
 Wed, 20 Jan 2021 04:16:33 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p16sm814954ejz.103.2021.01.20.04.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 04:16:32 -0800 (PST)
Subject: Re: [PULL 3/5] linux-user: add missing IPv6 get/setsockopt option
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210119175427.2050737-1-laurent@vivier.eu>
 <20210119175427.2050737-4-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <58abf222-2bcb-4433-7608-ebcc999a2241@amsat.org>
Date: Wed, 20 Jan 2021 13:16:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119175427.2050737-4-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.094,
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
Cc: Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 6:54 PM, Laurent Vivier wrote:
> From: Shu-Chun Weng <scw@google.com>
> 
> IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.
> 
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20201218193213.3566856-4-scw@google.com>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 969db2008104..70c61d15ebf8 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -51,6 +51,7 @@
>  #include <sys/sysinfo.h>
>  #include <sys/signalfd.h>
>  //#include <sys/user.h>
> +#include <netinet/in.h>
>  #include <netinet/ip.h>
>  #include <netinet/tcp.h>
>  #include <netinet/udp.h>
> @@ -2272,6 +2273,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>          case IPV6_RECVDSTOPTS:
>          case IPV6_2292DSTOPTS:
>          case IPV6_TCLASS:
> +        case IPV6_ADDR_PREFERENCES:
>  #ifdef IPV6_RECVPATHMTU
>          case IPV6_RECVPATHMTU:
>  #endif
> @@ -2926,6 +2928,7 @@ get_timeout:
>          case IPV6_RECVDSTOPTS:
>          case IPV6_2292DSTOPTS:
>          case IPV6_TCLASS:
> +        case IPV6_ADDR_PREFERENCES:
>  #ifdef IPV6_RECVPATHMTU
>          case IPV6_RECVPATHMTU:
>  #endif
> 

Building on Centos7:

../linux-user/syscall.c: In function 'do_setsockopt':
../linux-user/syscall.c:2276:14: error: 'IPV6_ADDR_PREFERENCES'
undeclared (first use in this function)
         case IPV6_ADDR_PREFERENCES:
              ^
../linux-user/syscall.c:2276:14: note: each undeclared identifier is
reported only once for each function it appears in
../linux-user/syscall.c: In function 'do_getsockopt':
../linux-user/syscall.c:2931:14: error: 'IPV6_ADDR_PREFERENCES'
undeclared (first use in this function)
         case IPV6_ADDR_PREFERENCES:
              ^

