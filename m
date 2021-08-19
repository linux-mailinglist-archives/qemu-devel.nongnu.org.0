Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C03F206B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:14:54 +0200 (CEST)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnV7-0007TQ-GV
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGnUK-0006nW-4f
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:14:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGnUI-0000JF-4b
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:14:03 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so7827383pje.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5ilzx3MjeQ/haLiinSc/sPL0k+60PPb97aLVAhGzQcI=;
 b=VNo2+YWAQdneMD2XQnt+AoEUzpVutoSUxCUT7WKy1o897bzngB60oVp1eG7Hk8f3SF
 t5EmM6jKqOSMI/nJ8xeIimEtAOFDiOS0f8d9dWlvXi14DTvbPiBhH0glNE+f//0Lw0Ub
 1sJnVwCLdCSr8STwCpRlPbwwF5YmZ7NF5dDxNHnEt7p9imJSh0R3PklTm5q3ZA0JQGlo
 KtlbsArA+f+FRIGC9qsZUxLw3JFRaXMhdc6BlEFNXoxQgtam30sKKX69tNwZT/GotCq+
 u7OlJZUXlfmcIZLo7xGy3DiYsc3WGaDW/fnF7RBMAMQzQXTVqeEDd5BS3Ph0f+Vwjwov
 MbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5ilzx3MjeQ/haLiinSc/sPL0k+60PPb97aLVAhGzQcI=;
 b=BTu1QMDx7s7Ps6Z5q4hMhZxo+1TJ0XWSE0RD+eAXwySFogUBq3ONF2wZ9Nu/fVAiGv
 u25RXXL7hpaVXaksfNTw7ZYOTt0vAVdwP0Ua9qStrUj5hd8G63o73qB0RHMeOcj07q/B
 mZTZmcRGp6en8RkOFVlXtCVuXDXjMhzGtBi713X6LvwjUWDmRxlDjKN4RW4gdBkjVjuM
 AW7U6ISLhIwEVjWnU/PPZ+ZIurCeXxq/rAOYVM7l8A06xYi5SWqliuLjgmMD3+m+rIRw
 D2UMMK2D7o9y5Xm6iQ8pCn5UOEEw5v1KLb6gwOVqAb6leM193vrJgH39XUtlFPjBIccJ
 TxlA==
X-Gm-Message-State: AOAM531yjGS2q8L/bqJwu6ffF0M/BDMj/jX9VFTIZ5LUFqGdZs2U1PgH
 rfMQyN10sDqZdYiqbwwiztKg1b51uMkxbg==
X-Google-Smtp-Source: ABdhPJwx3HlwQMAuVJH8RucnKhw+v0C1JbIprih99rAg4SXkafUnoILh+XiC6HTOrIA6TzoQwU3Vmw==
X-Received: by 2002:a17:903:2303:b0:12d:d5d8:7497 with SMTP id
 d3-20020a170903230300b0012dd5d87497mr11858544plh.60.1629400440278; 
 Thu, 19 Aug 2021 12:14:00 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l10sm4106454pjg.11.2021.08.19.12.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 12:13:59 -0700 (PDT)
Subject: Re: [PATCH v3 09/66] target/ppc: Move SPR_DSISR setting to
 powerpc_excp
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-10-richard.henderson@linaro.org>
 <CAFEAcA9K6zHfPU0pFYUhcUmDt1mbKduj=K+4DYFV8_+5fam27Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ff71398-0563-1b87-b549-4b30d850ae4c@linaro.org>
Date: Thu, 19 Aug 2021 09:13:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9K6zHfPU0pFYUhcUmDt1mbKduj=K+4DYFV8_+5fam27Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 5:39 AM, Peter Maydell wrote:
> cpu_ldl_code() in the unaligned-access handler is strictly speaking
> bogus, because the page might have been unmapped after translation
> but before we got round to actually running it. Better would be to
> stash the relevant bits of info from the insn in the insn_start param,
> the way Arm does with the syndrome info.

Yep.  That was more than I was prepared to do here.


r~

