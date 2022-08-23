Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A17059CE46
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 04:07:36 +0200 (CEST)
Received: from localhost ([::1]:58696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQJKJ-0001jJ-FG
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 22:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQJIX-0007pc-Jh
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 22:05:45 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQJIU-0006C6-Qy
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 22:05:44 -0400
Received: by mail-pl1-x634.google.com with SMTP id p18so11543439plr.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 19:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Csm6qPvzSc9FEFucxj21IX4xZzfJGM2tbe9MlCN1Pqs=;
 b=pkdL4Zbvv8DV24ZsDbGVAdG8UGBt48Rqho5WPo6N5Z0j1IMOFe+7ekcmqtlDfko2OA
 Ds36Gh8GbvMdqlmgZpOAL3uDRZdnjoD1MIhDDWsefFJgOD1IJXgoi/tG1PfEBv/nAwDf
 oXb67NCTcWn++9M7kM5syEuniWdBjxNLpdSRsFR3RZi6eEU6HUR4T4AEfZgP88GQp3vO
 Bta0Tp2vG5JYb1lxNYya6ESbHAPXmFpPT6kaYvNphN1kAdesmNRQnwGOM1ZnXIXOsoZs
 7dRJbFBfGptXtkOO1vpZDi3+h+Tvzr6W0dIrLjvhJ1N1T0OW+BiXNgiL+OXw7UbUoykW
 Rd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Csm6qPvzSc9FEFucxj21IX4xZzfJGM2tbe9MlCN1Pqs=;
 b=VwCeqxM54yXY+W7TZT7HoYy1qE5RVw4sW/vL1WjeU+F155fywsndBcGnXDwlkSTaUU
 ICIXUreYJZDEBsTEdFFfLoisTTui88VJ9DPeKHzGNbV+6l3jVSwG5u3VnfvXASgPv0Pe
 7U8MjxxP6ix3kKDXxgLTBQkDT0fZnPkVktxuJqSrfOjV32kGciqVAQtdo+1GOAc4QfFI
 +WFiU6qp2/05QtkG8DmZaXZKY8ml4aj5hCfTT25i0DEq/Tg/n8AkVYM5WQ7PTWtTarDV
 r0ZM3t9rMd0uNSdYOpaiSjAwYNxIuk4cot7AgvNKg92MrsGtEOnTeUgsNOnIQA1ci5aM
 FzOw==
X-Gm-Message-State: ACgBeo1NkvPycf6VfyPUatHDq4OmLz9KxJ2Iu9WcHlziUKp5KyOe1dxe
 fM8GtVFrPImIqy5t90tZD8/Q7yBkaqQo0g==
X-Google-Smtp-Source: AA6agR4YUZ+5sbVTf3vHSUFqvxZMDsqqcWzQjDy8aqSFIzBK3jMZ+yJi4zfdfvWABvOtXOCXj5Eltg==
X-Received: by 2002:a17:902:d491:b0:172:f654:ac3b with SMTP id
 c17-20020a170902d49100b00172f654ac3bmr4293453plg.49.1661220341231; 
 Mon, 22 Aug 2022 19:05:41 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:c3f1:b74f:5edd:63af?
 ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 o185-20020a625ac2000000b0052b7f0ff197sm9313440pfb.49.2022.08.22.19.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 19:05:40 -0700 (PDT)
Message-ID: <dc381141-63c9-7856-d55e-71bda488d643@linaro.org>
Date: Mon, 22 Aug 2022 19:05:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/14] target/i386: Use atomic operations for pte updates
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 8/22/22 16:57, Richard Henderson wrote:
> This patch set does two things:
> 
> (1) Remove assert(!probe) from the x86 tlb_fill
> 
>      It turns out that this is a prerequisite for
>      [PATCH v6 00/21] linux-user: Fix siginfo_t contents when jumping
>      to non-readable pages
> 
>      because of a new use of probe_access(..., nonfault)
>      when comparing TBs that cross a page boundary.

Turns out this was a bug in the v6 patch set. We don't require nonfault probes on 
PROT_EXEC at all; v7 will fix this.

But it's still nice that non-faulting probes now work...


r~

