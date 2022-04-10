Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D416E4FAC38
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:07:40 +0200 (CEST)
Received: from localhost ([::1]:50502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQjb-0001ZS-Uu
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQcI-0004yV-MW
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 02:00:06 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQcH-0003Cx-0r
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 02:00:06 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso1333262pjf.5
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 23:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uqlD7vpOwIv3HePbIrDPCLq1/jBCRurC+YjZXj0TuNg=;
 b=WY0ryGAJ6TrpczJyBFrIwZs0rZpD7DomeP8gSwrxzkVrnmfT09dqTzpA8FrAWnpSJn
 Qy3/SiTkNZHs9+V7PPr9VpYCJbVLdwnSw+dQ4SHGzXsG5jigo/EAfOXe6BXJaHQWqZAI
 X0RExo9znAuVlSGAiLWdDf1og1uYNSKiLESEfNjqGlZMMp1nXLAtQFYR/pquc/xlUQnx
 E99D9NfEJvom/GES2hKK6chgdODyLgo/FKvRRPNHqmjI61HAdKjEDWdU6kUsDNLw+u7J
 njo5YDCxyP/w+2pOx93435MCTuhuCYUkYD3p9oGAgfnALO+JyI/aNWZRqIE/uLCv8n6L
 UoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uqlD7vpOwIv3HePbIrDPCLq1/jBCRurC+YjZXj0TuNg=;
 b=Bz3JMUibAIsfkV7u+UWoitQmUJ53RXb7iqIViMfC7HKcrbfiepDpKByZunrBPATuJU
 n9RyMe35Ou3vEqIDQA/HYk+v8gJU1HO8GU2PLatjC0ywwXqLewt0OeymT+fPEAibDZ40
 3bU3rAyx0OKUk4c9nyfWiy85Qb8vJM5EBevXdWG1NPq5ybhWkYVxkk2pXXY7sAj33XzE
 CdV0chocubHTOk+KA9Pqsa4vrYcXa/jw/+v9BtsexTwqOP3096dUAxja+T5uDrBF/bu5
 oGHrCGkRqge6ijzj74t1gbohf/1GiKefhlnUIkf3fbP0wIVECdK+tPp3cS6CUJgdyl90
 ZKaQ==
X-Gm-Message-State: AOAM533AXhKrF4NxgD2MVgJuOAI0CcxKdhreYz73QeQqo+75Kn5mTmSL
 vO50ejLJzVCsS964aKBUxqbnJXmUxKVssA==
X-Google-Smtp-Source: ABdhPJxyokg3rnTfRr/KqIxa3i0NNODLM+ydD+9VLEZtl4iaZp6ObK54BZq6m0nnZN/b7j0Az2c+hA==
X-Received: by 2002:a17:902:e549:b0:154:b1f8:cc82 with SMTP id
 n9-20020a170902e54900b00154b1f8cc82mr26707209plf.82.1649570403693; 
 Sat, 09 Apr 2022 23:00:03 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 75-20020a62174e000000b0050579f94ed2sm7540768pfx.96.2022.04.09.23.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 23:00:03 -0700 (PDT)
Message-ID: <c05d3c19-73d0-b16d-d1f1-dbb2fd817200@linaro.org>
Date: Sat, 9 Apr 2022 23:00:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] migration/dirtyrate: check malloc() return
Content-Language: en-US
To: jianchunfu <jianchunfu@cmss.chinamobile.com>, quintela@redhat.com,
 dgilbert@redhat.com
References: <20220410035854.97056-1-jianchunfu@cmss.chinamobile.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220410035854.97056-1-jianchunfu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/22 20:58, jianchunfu wrote:
> Handling potential memory allocation failures in dirtyrate.
> 
> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
> ---
>   migration/dirtyrate.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index aace12a787..5dd40f32c8 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -523,9 +523,17 @@ static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
>       }
>   
>       dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
> +    if (!dirty_pages) {
> +        error_report("malloc dirty pages for vcpus failed.");
> +        exit(1);
> +    }
>   
>       DirtyStat.dirty_ring.nvcpu = nvcpu;
>       DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
> +    if (!DirtyStat.dirty_ring.rates) {
> +        error_report("malloc dirty rates for vcpu ring failed.");
> +        exit(1);
> +    }

You might as well use g_new(), which handles the sizeof and multiplication, and error 
reporting.


r~

