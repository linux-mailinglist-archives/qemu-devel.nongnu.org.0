Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC3010E424
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 02:13:12 +0100 (CET)
Received: from localhost ([::1]:57458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibaH1-0004u8-Hc
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 20:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibaFi-0004Rr-DL
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibaFh-0004B3-7x
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:11:50 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38481)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibaFh-00049o-1k
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:11:49 -0500
Received: by mail-pg1-x544.google.com with SMTP id t3so17064934pgl.5
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2019 17:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KbjuFww7zuB3fL/Fbz84eOXxjpPoBRs5MDedHKSbw8k=;
 b=EUU2rUlLoAeaAb+/YYMuyfE4Cqv3AGJgn197qYGt6DUrXacuKb7nqx3qt226FteO1o
 2w77f60ZNSml5VrltHjhVf07C31J9OoAvnV/JjnEysgV9//Rot/OjaAxellv5s7g2y0N
 V6Phneh7JzVu9Y4HJihnbjvpCMaL6tGJ/la0yxq0+qiOv1Klg2J9RSybyLnaD8YwMPJB
 zWjocISgqukUmecpN3B56pznnOetAPNxdO8/QpBvjDOMvt1NVD0zCyx8AuTGx4wUGLsK
 1Mu7nXqMNF4IEumFwB8bhrOmcvVd6rMFigMuc4hxn/BP4i7K9VKrvWdDHY3ZLPnuU9cO
 lJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KbjuFww7zuB3fL/Fbz84eOXxjpPoBRs5MDedHKSbw8k=;
 b=l9LiZTnd/Q9TODXKqLg/IzxeXTCo7/kPcBDZ1BogJWOfllnIL4i1Ymcrhg0nY26UpU
 96cJcz0B5GWIOTpPQ28tZT1PA6pYDMak9ahYLFlO8nyvAIZTAUB3AxKMNyukDCIA1PlX
 E65UWPQ2SkdBENCJ/iuHCMFpZCn5HufylkDyz4DVdLpsysNJXe+Xz+bM3peK7Y8FXubg
 9W4H12LDmaPhGv9jBoqLrSw1uiEqCPdH8o37iTJRvl6oWde5JOh8FLNU3zFbBXQ1R1iF
 4r1ArX1Qb9K7h7u2FA+rEYMC1CPLw0B/hjDAWvlaThCqXUoKp8sfH6Py0jY5NglCGB+t
 UORw==
X-Gm-Message-State: APjAAAWZO+YATsFikHV4u1FHlMnctOnihJi5VK3mDJumgw3/FMUhul0C
 5EYhcrwWscIC+P9BV4V2QIdjuQ==
X-Google-Smtp-Source: APXvYqyfYAIJ2LAM+luSBSP2bOMpGmqFbLF77MBF0kXztokUWrUYtAyzpEWhQDp6/JQFWR5AJ2g9ZQ==
X-Received: by 2002:a63:214e:: with SMTP id s14mr2257930pgm.428.1575249107496; 
 Sun, 01 Dec 2019 17:11:47 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id in19sm12012715pjb.11.2019.12.01.17.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2019 17:11:46 -0800 (PST)
Subject: Re: [PATCH v1 2/5] linux-user: convert target_mmap debug to tracepoint
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191128194603.24818-1-alex.bennee@linaro.org>
 <20191128194603.24818-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44a30f10-a215-daa7-a8a4-0b0a1564a65e@linaro.org>
Date: Sun, 1 Dec 2019 17:11:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128194603.24818-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/28/19 7:46 PM, Alex Bennée wrote:
> +    if (TRACE_TARGET_MMAP_ENABLED) {
> +        char prot_str[4];
> +        g_autoptr(GString) flag_str = g_string_new(NULL);
> +
> +        pp_prot(&prot_str, prot);
> +
> +        if (flags & MAP_FIXED) {
> +            g_string_append(flag_str, "MAP_FIXED ");
> +        }
> +        if (flags & MAP_ANONYMOUS) {
> +            g_string_append(flag_str, "MAP_ANON ");
> +        }
> +
> +        switch (flags & MAP_TYPE) {
>          case MAP_PRIVATE:
> -            printf("MAP_PRIVATE ");
> +            g_string_append(flag_str, "MAP_PRIVATE ");
>              break;
>          case MAP_SHARED:
> -            printf("MAP_SHARED ");
> +            g_string_append(flag_str, "MAP_SHARED ");
>              break;
>          default:
> -            printf("[MAP_TYPE=0x%x] ", flags & MAP_TYPE);
> +            g_string_append_printf(flag_str, "[MAP_TYPE=0x%x] ",
> +                                   flags & MAP_TYPE);
>              break;
>          }
> -        printf("fd=%d offset=" TARGET_ABI_FMT_lx "\n", fd, offset);
> +        trace_target_mmap(start, len, prot_str, flag_str->str, fd, offset);
>      }

I don't think that you need to re-create -strace output.
There are also quite a lot of MAP_* flags that are not
being printed, without any indication that they are left out.

Again, I think we should just print the hex value.


r~

