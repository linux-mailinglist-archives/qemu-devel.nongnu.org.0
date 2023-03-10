Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04096B50F5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:31:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiSQ-0003kK-BZ; Fri, 10 Mar 2023 14:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiSO-0003jd-Fw
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:31:12 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiSL-00005p-Qz
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:31:12 -0500
Received: by mail-pl1-x635.google.com with SMTP id i10so6722436plr.9
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476667;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hm++FZt9fcr7gu5bmqbbg1Zj5ZupqAeTGTvOkT/XE/I=;
 b=hXnU3EUlgoZYWSIIpH8H8tUtQDL0rOCYHfOZxjfXnd8m6kRzU8N3IspP/WX61jT2q7
 Pq6SXNPdwEuLJSyNf+A4LhRuL5AQ8p5SVww6hCJw64NkGPRcXathkw6GHDC/QsTLxk0t
 oSU84cUrCCLLemYvrUjnr53RQ2Wt7Wg211eFLYFSQDHdC6rBuqC61hLrZXdd1EmB1e39
 H6+JoOVbjQtybFIRYKDW/PwwuXSrV0uVFzlPORm8hrKSkLW2OoDZCD+cYn14WRpA2s4F
 CqJkI6oE/vGqp+WP3CkDgcLbIf5QSlUsvDXbPzJLu+75eNG+ZFjkmA7qd5B6vEprus3e
 yJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476667;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hm++FZt9fcr7gu5bmqbbg1Zj5ZupqAeTGTvOkT/XE/I=;
 b=gXP3iZ6PTWy8DIf8PGNwVfMMqroty/oaFHEZ88eUvKKVizzJoDDDrPKlMQVDsryZo4
 Ct24hnjdgiNafdkg3rSFCQbSLSCyuC0LGcTH99xUk2rsHTAEPmkGiK6qp8YGO2hQ8GHE
 37rAbMQ1+cSUPMzOnEZYbrZ4sHiKEPsQreBlJjV4msOzM7cXgYco0aFA4QqCXWImTJjM
 lCXITwWU9QmPyJA1WxEOVXeYKOMpM3n+BFzIrbVk2VY46ok7ymwKiYBvpuKWVYArYmUa
 qSaGNmpjVitfdlLQwe/vRRkAVxCIsqPO7rk6lDdL2FotfA+Gxg8cdTdRMEvoDHjCtv7H
 wAxA==
X-Gm-Message-State: AO0yUKV9tIaBJjP+9ym55+O/g4XxEice6yABpmvG8N1ozalmaAQlRD82
 pgdlLxbFlxQsev3jYj2yCWX21A==
X-Google-Smtp-Source: AK7set+plVxtMmmLzsgdDuRu+gaGw2VqSaAiaEixrTVtM9F9R+BZ8NC0bMMQfOhuVh2XgpyWDVKchQ==
X-Received: by 2002:a17:903:1d2:b0:19d:19fb:55fd with SMTP id
 e18-20020a17090301d200b0019d19fb55fdmr6607026plh.20.1678476667095; 
 Fri, 10 Mar 2023 11:31:07 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 kc6-20020a17090333c600b0019ede2dd547sm381236plb.67.2023.03.10.11.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:31:06 -0800 (PST)
Message-ID: <3a6833fa-4a61-a92e-6af3-e35844b2f40c@linaro.org>
Date: Fri, 10 Mar 2023 11:31:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/12] target/s390x: Handle EXECUTE of odd addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> Generate a specification exception in the helper before trying to fetch
> the instruction.
> 
> Reported-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/mem_helper.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

