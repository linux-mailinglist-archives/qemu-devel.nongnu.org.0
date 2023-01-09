Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E806662AE9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:11:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEujS-0003P4-Ic; Mon, 09 Jan 2023 11:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEujO-0003NE-Bs
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:10:38 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEujJ-0002Qf-TG
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:10:38 -0500
Received: by mail-pl1-x62e.google.com with SMTP id w3so10020031ply.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WXWtiELz+9v87ReMcNR5qnXsLmL0CPSMu48poXSrAqI=;
 b=O9Eya10NgLm4WhB+L4M0l3ZW1afO7rRvMiANZzYFlWbQF2R8d5iVzt/hs5Ha1EzBZW
 6zLuN75rcjA7YicPN4O8zOXqQPrd5Nb9rcDfxqG8SRzmjSb88QT/BiMF4oh4ho/zNvRA
 OCnO9n8WF1g7IeEzgsApGX3gzmG51Im+BjclH3WmQQppDvMp0+K5qwYfOKLLBtKyT+Cg
 IyhQexsOp6YbamiA/LC1Yr1GmP5R7hNjWEucaKcvViH0NZpfwar0G7YFB3HZuMFAD/sN
 J34AKmhWR4VcaDg9Hu+Aw3FwkyVXYgZ7uHKK7eFyqfJ2g7RrmygCOx4hYKgnLJ7kErJH
 UZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WXWtiELz+9v87ReMcNR5qnXsLmL0CPSMu48poXSrAqI=;
 b=ztyN66qE95dlC1UURiBAEg0dyOYwO6ghurcGi1MvIvGO1WE47JN+NqEwWSQaM0dcxp
 y+lwZGksAgygNZNiyTIphQ+pvkO9Zj87TceQOA8Cc/zpMeY4gjiyv8ePvMAesODT4rKp
 sCsh0dieFPYFyceE3YFtS5DimQ8EA0zbSt6Qp6nCv6+E0cgL/ggAkcXix9ZOA7lS4umX
 c3NMMLEoJ8EjIsxnz9Iiymee84pEBpCXa8RXVjVmICS1abFvLnC1FdEOAWaeNdeScVBP
 pL0DsnZ5dH1I/8kQvnzXMWoca/IKlF5oYcicGzuHoqAdadJpLv1VnQzZeyPG+3HIEnJd
 FBlA==
X-Gm-Message-State: AFqh2krBtV18qub0ESEpGreWTmRpSK78sX9suDEts3fXRkvzvtovb+k6
 9lrUsLzFhCexVr9wyikxslyx1Q==
X-Google-Smtp-Source: AMrXdXuWNuJ/p+OWHMB7vZ3urpgn5akTAxP0zwI3zpuwTW2UvClCjcMiul32xLkzMG9x+Q3CHwfWpA==
X-Received: by 2002:a17:902:f791:b0:192:5ec4:6656 with SMTP id
 q17-20020a170902f79100b001925ec46656mr66901294pln.3.1673280632126; 
 Mon, 09 Jan 2023 08:10:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170902f7c500b0019337bf957dsm1699570plw.296.2023.01.09.08.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:10:31 -0800 (PST)
Message-ID: <dee15a77-3fd6-4368-6c1a-c65e8d1da2e1@linaro.org>
Date: Mon, 9 Jan 2023 08:10:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Convert the remaining DPRINTF debug macro uses to tracepoints.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/bitbang_i2c.c | 18 ++++++------------
>   hw/i2c/trace-events  |  4 ++++
>   2 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

