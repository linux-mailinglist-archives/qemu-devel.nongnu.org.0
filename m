Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F96352E7D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:35:06 +0200 (CEST)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNhJ-0002Hf-8U
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNgT-0001ob-Pb
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:34:13 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNgS-0007GN-45
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:34:13 -0400
Received: by mail-pf1-x433.google.com with SMTP id g15so4010369pfq.3
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y9TA0efE4dIC2KdsGVWx1orJHns+vkITcNPPNQVm2Lg=;
 b=C62YhBQDDXDAdu0EDLirutNcwToLhC8pTf1NGoczn63C/CXrvcVus+YadFPKdutAvJ
 l9i3LzfFhJ0+oVyuK+hesUt8ddnasTRCXpzk58/BWw4dz6a2SSD0A7BJu2l5xaZND7OF
 ejhqjv6Bp2NbC7++0S2jgCj+fLV4TnUyKBuwxNHrv1rJed7iBe4SI3JK5LenMhXUfv4J
 yAU0PcauMhiYbLbpokgfPoJBqNWzNdvWgekeeKecZtPzG367Rk6Rpa8TCb7rfLBnxP7X
 oCbvrZ2DWHHDDJDHiMeFyYHrkue04mSK4Yj9yY+8nhkZqKeLMQDIP12trA3nXpAp/d69
 5xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y9TA0efE4dIC2KdsGVWx1orJHns+vkITcNPPNQVm2Lg=;
 b=jJjfkN2CHeH1RE8RGM/0oPUvS4ZcLWhdm91Xg1tnQEYL9PruCI2ErxQYOWDAifO3vq
 ImcmP2tHBwVML3IyUmgCV8VyAH1T+ri6qLZIJ+ha0a9IdUTgVlPqlXPY5UBcaud+nov5
 Jg5Q69p+F0Up+MX1J1Lo1wA8hRu9PomCgXo1mn6z+rpCi5KTIRfUr5KN0osY6s1wMcJm
 Gk7bEhqnDFwbVnfa62nC74bbQEp7QLQLzSZmJMyYX+29LLYdtYA8XE1kmmPw9aC3Pw3R
 BB4R4bWEQv7zk4oCFQsTMwGQ++1R3GCZWc5oBnHRtOrQjxVZ42emchmY5LopBr7iaPGu
 RILQ==
X-Gm-Message-State: AOAM533kvgiG55svdqyK7VHGpdo0l3zxicGWSSMwmU178W9gI08JFTVq
 /2431+i1znicVLEApcXf8RVPQA==
X-Google-Smtp-Source: ABdhPJy20mpJ+aUrxYrvWXRlT/ggOPttSi6umINZRQygfFslXS6WcrwGJQGZu+A+yToLKzhb5wNB/w==
X-Received: by 2002:a63:3ec2:: with SMTP id l185mr12802890pga.45.1617384850490; 
 Fri, 02 Apr 2021 10:34:10 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id y8sm8162671pjb.11.2021.04.02.10.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:34:09 -0700 (PDT)
Subject: Re: [PATCH v2 04/21] Hexagon (target/hexagon) properly generate TB
 end for DISAS_NORETURN
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-5-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <455e4100-df75-4035-6a1a-2930bc7ab59c@linaro.org>
Date: Fri, 2 Apr 2021 10:34:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-5-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> @@ -601,19 +612,12 @@ static void hexagon_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>           gen_exec_counters(ctx);
>           tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
>           if (ctx->base.singlestep_enabled) {
> -            gen_exception_debug();
> +            gen_exception_raw(EXCP_DEBUG);
>           } else {
>               tcg_gen_exit_tb(NULL, 0);
>           }
>           break;

Looks like you could call gen_end_tb here.  Alternately,

>      if (pkt->pkt_has_cof) {
> -        ctx->base.is_jmp = DISAS_NORETURN;
> +        gen_end_tb(ctx);
>      }

     ctx->base.is_jmp = DISAS_TOO_MANY;

which will force the exit of the translate loop and land at that case within 
tb_stop.  At which point you don't need gen_end_tb.

Either way, this is still an improvement.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

