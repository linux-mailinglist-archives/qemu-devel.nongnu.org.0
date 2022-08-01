Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5ED586FA7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 19:39:18 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIZNt-0002bq-Cq
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 13:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIZ6v-0005uY-F2
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 13:21:47 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIZ6s-0007Hx-PV
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 13:21:44 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so12796548pjl.0
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/Hrt7wtqifoEUyk/E/P6a3RqcuJpAx90pya4+pQJtjo=;
 b=E9L4AQCpBgyLQSu/FKPliaWMAUsdDmAsVwl6qXp8j+DmK8MZcy2WmbkFe/enk7CxCx
 U1taUr0l4IUa5+qKtvTIxdK0cQG4DNjw6Cg3WSYM7Q6Vd+ymwDb6nyERPhUnTdYfCbwG
 +9BFv5k0wSwYRQbKULXYXuk3AqFvz/UDMI4DqGcwj4GjL3Z7tw2xb8hP8Oe7SBr55jQk
 2GXMpyB4b9rkxXRVOA98QDvXj2G2V/MsFxa5SZ/MO9sRxqTtWVc63Dtg9qN+zrxwYb01
 4TI7kX5oyA6tGimaTy2ZCFYfLEC0stuFYdf8hjWkpBjFpMjHBbqJbYLhMiQGaZhG5J87
 L8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/Hrt7wtqifoEUyk/E/P6a3RqcuJpAx90pya4+pQJtjo=;
 b=5W/yFMP804FH6C4LzJAmEi3QEO54NeAT4DDTWXSaE0KEdvFnj0iZEx02stgXLeIO7q
 7ymK72vUh2KypS+QIkZdSw8oEmDUalO2YxZz9Z3eBOKtLlnXEZAi53mgCV86n3fyLwrT
 iGKP8lr3o6hvd3+wZq/wM1p+Hb1hXAvNdgOWV3CZfnKTD0BxJrTurgOkPblwBIY5hBi7
 cpfHl7rBMd2XcZykRxy3klU0E3l9TJ5aJjOgClFF0ybKuSsH9viq969al1PkmuVRp917
 bStmbqo53QgdWEeyYMzh2ChXvQI0YDkNYgaTktPT1TEYS10ErJrWRUDgAgc+yEC+PQ1e
 Ucow==
X-Gm-Message-State: ACgBeo0jwHTf/tMjZEnGk+k8xlqDm/gaDcqa3+TRwMX6Tlu5Looyg7q9
 fWYZWLYDnA5rODKXM6fB9y7gbFQL3y0E3A==
X-Google-Smtp-Source: AA6agR65veUpzFFWkbe+ZwiO7Tu82Ijkum4mZ2fFGPiGp23YrIaI67jbLgUx/djT11zgWPqd70U4qg==
X-Received: by 2002:a17:90b:1110:b0:1f4:fc9a:be2d with SMTP id
 gi16-20020a17090b111000b001f4fc9abe2dmr7112329pjb.41.1659374501139; 
 Mon, 01 Aug 2022 10:21:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:e82c:8cfb:9ffa:3c7c?
 ([2602:ae:1549:801:e82c:8cfb:9ffa:3c7c])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a654c4f000000b003db7de758besm7889593pgr.5.2022.08.01.10.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 10:21:40 -0700 (PDT)
Message-ID: <f055ef82-3fb9-41c3-3142-f98636bf0187@linaro.org>
Date: Mon, 1 Aug 2022 10:21:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL] IPMI bug fixes
Content-Language: en-US
To: minyard@acm.org, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220801140217.GA3834@minyard.net>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220801140217.GA3834@minyard.net>
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

On 8/1/22 07:02, Corey Minyard wrote:
> Not a huge deal, but probably makes mainainers lives a little easier.
> 
> Add a change to make Coverity happy.
> 
> ----------------------------------------------------------------
> Corey Minyard (1):
>        ipmi:smbus: Add a check around a memcpy
> 
>   hw/ipmi/smbus_ipmi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> cminyard@t560:/personal/git/qemu/Z$ git request-pull master origin tags/for-qemu-2022-08-01
> The following changes since commit cc42559ab129a15554cc485ea9265e34dde7ab5b:
> 
>    Merge tag 'pull-ppc-20220728' of https://gitlab.com/danielhb/qemu into staging (2022-07-28 15:06:42 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:cminyard/qemu.git tags/for-qemu-2022-08-01
> 
> for you to fetch changes up to 3fde641e7286f9b968bdb3b4b922c6465f2a9abc:
> 
>    ipmi:smbus: Add a check around a memcpy (2022-08-01 06:40:50 -0500)
> 
> ----------------------------------------------------------------
> Add a change to make Coverity happy.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Corey Minyard (1):
>        ipmi:smbus: Add a check around a memcpy
> 
>   hw/ipmi/smbus_ipmi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> 


