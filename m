Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0364F272
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 21:38:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6HSb-0007Gg-Ik; Fri, 16 Dec 2022 15:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6HSZ-0007GT-Ek
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:37:35 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6HSX-0001gO-N1
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:37:35 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so7264807pjj.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M8HRv9H6JnIsFYo5Bd1nHzDavRHCsgBdK6r0wX12jJY=;
 b=N8qiPxAvV55XfX0IOgCnNnrjFgq+eLT9nZpr4q05PV9SB4d71l8BgvkfbrGNqdHVhz
 BbjVG7Hy4EI/NMYlxqKmhdJcO52WkH1GYiGDHhHGbscC3Ixw7/ySvZmgQ5timAsOyaX+
 jfRUKC+Pp5pKcN76HuiNEwEfLPgnrbFzh9I9v+LqOkyP3G592t8q5otdwm/J+f2cYMKu
 04GZzdd8DhnX50VoPdJ6D6YcSqPjFiv1kJS3dVc3JhFDvb/fbWjgjUCNlhbtibckpPzT
 MipF0VnGE7HahAiuHsxbhs0ez+wzWWufOWQUCGTtyRl+x6alnSJfo9aayZ9aeM3r1Yyw
 /ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M8HRv9H6JnIsFYo5Bd1nHzDavRHCsgBdK6r0wX12jJY=;
 b=MJFvbBtw/cB8UqZ7kDENjatwRV7cUVSxUHSvjKTCy0b68KVZ0nww365/vTWa+Jdk/l
 1quSDm9ibS8v0OfzgOgS89UdHHY+NuDwM/CCjmHY56ptTzpBBNpwZyeb2DArqqErim06
 yVgtvlqhJC20lCp5tTSBW2y/WDVfMUgZwMMEzv4XNYAjQ461uHrjM8UFEBk7hFDJnZlk
 ZEtdSs4wcTjgOgk4l7wig0BG+uwzFJlIPCSOalsO3HdjgGIcB4hTaDK9KfCEWKWBlvtq
 IB1WyLVt0oH+jbathHHosx5kXPjkZNwDdEEQpclUTHP/h1WUYv6E0eNs4zfGcb8v2m66
 P3Hg==
X-Gm-Message-State: ANoB5pkBOgj0TQbmbsei+kVtQjN+AEJXhkKabPS/vADhpkvUdxmn3OVU
 icWpdwtoW6C4tq7ui0eyJq9ldw==
X-Google-Smtp-Source: AA0mqf57S8fzhWc864KrdfRFgojwuvvnKEsarKonZaQvcA/6SigmtpZvS5ELQQTNXfPGRL8e+PqASw==
X-Received: by 2002:a17:902:b198:b0:189:fa12:c98a with SMTP id
 s24-20020a170902b19800b00189fa12c98amr38944143plr.66.1671223052070; 
 Fri, 16 Dec 2022 12:37:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a17090322c400b00189ac5a2340sm2044821plg.124.2022.12.16.12.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 12:37:31 -0800 (PST)
Message-ID: <4818b1e7-1d50-26e3-e582-b2ffdc007173@linaro.org>
Date: Fri, 16 Dec 2022 12:37:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 07/10] includes: add new gdbstub include directory
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216112206.3171578-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 03:22, Alex Bennée wrote:
> To avoid having a messy set of include files containing system and
> user APIs lets prepare for a cleaner layout.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/gdbstub/common.h | 14 ++++++++++++++
>   include/gdbstub/user.h   | 14 ++++++++++++++
>   MAINTAINERS              |  1 +
>   3 files changed, 29 insertions(+)
>   create mode 100644 include/gdbstub/common.h
>   create mode 100644 include/gdbstub/user.h
> 
> diff --git a/include/gdbstub/common.h b/include/gdbstub/common.h
> new file mode 100644
> index 0000000000..f928dbc487
> --- /dev/null
> +++ b/include/gdbstub/common.h
> @@ -0,0 +1,14 @@
> +/*
> + * gdbstub common APIs
> + *
> + * Copyright (c) 2022 Linaro Ltd
> + *
> + * SPDX-License-Identifier: LGPL-2.0+
> + */
> +
> +#ifndef GDBSTUB_COMMON_H
> +#define GDBSTUB_COMMON_H
> +
> +
> +
> +#endif /* GDBSTUB_COMMON_H */

I don't see any point in creating these headers separately from the patch that populates them.

Not keen on the name "common".  From the later patch, I think it may be at least 3 
separate headers: gdb syscalls, start/stop, xml.


r~

