Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24326EE3F4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 16:30:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prJff-0006EH-Aq; Tue, 25 Apr 2023 10:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJfc-0006Ci-5a
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 10:29:28 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJfZ-0005fO-Li
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 10:29:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so117239175e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682432964; x=1685024964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0UtSaUy6kTDPjr1M9TPR7k2zZAyqnW0ug7C0qLM//1s=;
 b=ZtvgX+dQs/wb6dg2HokD+hzkiXRD/TsRQgDaqaNkVWBlma4qR5uJqgp3Z6V69notbN
 EmAwkrkWyctQmHi58pZaCO7rzKUbYvQkL0nbGngMbvwG8k86SWt3bYPWKfQmU2KrxHvy
 wft063eu5TUonm+o8sqLptRONzJQCmn/wUopghvqBaXvzhwidOXk0E5EUyJmgoTepewX
 lkATyahea72RHXt9JvoGZSxRa8qaQM54AQoHnYpd60yqmR7gNFMkJrHb3NmJ2Scf4Fl4
 7V3sHQGLruzH1RTuZwlhWxCobws25jC3VirzuS+Vudt77+b3JTZwktI05A8jf5n2S21l
 AKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682432964; x=1685024964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UtSaUy6kTDPjr1M9TPR7k2zZAyqnW0ug7C0qLM//1s=;
 b=Ux3NiJclLoqvnznczdil8nee+4478ujKm3f/3Su8ZKH9N+EBiNYDgCXcqDPHCpHAHm
 fixgZZ81hl/69j/Tk4FnOVmh7EcJNV/gd+/2f+zMqdSLsMaB1ojBWJPphj6GoqPul1nW
 gUPrSLr5IUZfTizlfXJmk6Zrpu3tGjKHwd9Bl12krbuVBsLtJ31WxXyDbLZUcmbGFzfq
 YeQs9puITIVxI3o+BcjcbrrGxw902YNmJO3ZARYq7Go0CqVePbLbHZi4GKnM4QdPkjjj
 8zPoSyuoVKnryfd1R466b+IMfXk8SxQFSH+lSooW8fpZVFSV4NXSsZT6I3FoO1m3rJDw
 EJYQ==
X-Gm-Message-State: AAQBX9e030BhYGqErka/gTiB7D1oOUhX16hU1BjKzqWDNErYULUDCBrx
 fdlEX1ZPFJpPew6OBcQycZkdSA==
X-Google-Smtp-Source: AKy350ZYSrcr/Q7WZKgdYu5FP+39WINTHaFzl+h2vCAUk7K1DPPHas/kyHaU4we/q+Jl5pm8N6GNJw==
X-Received: by 2002:a7b:c441:0:b0:3f1:7364:9308 with SMTP id
 l1-20020a7bc441000000b003f173649308mr10133897wmi.2.1682432963766; 
 Tue, 25 Apr 2023 07:29:23 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003ed2c0a0f37sm15100854wmj.35.2023.04.25.07.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 07:29:23 -0700 (PDT)
Message-ID: <d4b68163-39a6-bcca-a5d2-196f8a0cb534@linaro.org>
Date: Tue, 25 Apr 2023 15:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 19/57] tcg/loongarch64: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the 2 parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st}_direct to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 55 +++++++++++++++++---------------
>   1 file changed, 30 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


