Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D9620A20
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 08:25:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osIyk-0003kS-Ju; Tue, 08 Nov 2022 02:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osIyZ-0003hF-R4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:24:52 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osIyY-0005Xd-Az
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:24:51 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 78so12645415pgb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 23:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/J+xtLaXJ2YkhX7dAx11FsXE+IEtNH8YMuY4DMy9FKg=;
 b=GGgo6T5vwkfKxQAWPdbS+XMsKOPkrr2y+PnTXOPSAtmxTgmWEuoNJFtc1cW2FuILyc
 5aPI+iPEPdg52RpcB2WTGyi8LTtKUMKKf+3GHB7eKFpokLbDKYqWd+06/IKaRTbtpBr0
 I5E//IhWtys7b+RGAWl9tNImto/8SPlBzy6qlW6iAcMMPjr6aZvHHod8IxbftxiVqEYP
 NyLhbxorgQpo90I/pHIG2MQUSUdSrJlH+x8qYBFfBeV4Y+9rrLo3cuSqV5vqRNkye5NZ
 YNi+KrBpgd3/4RYTgK23P2AvOiDbjZeEnnrqHVTOzjHKwiFFZu5vzK4f0BAn2hVwo2hE
 FIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/J+xtLaXJ2YkhX7dAx11FsXE+IEtNH8YMuY4DMy9FKg=;
 b=urqJut0hryyc9WlTKNKvUjpL/tdot5kLlfhwQ93kV3dUcD6QC/5xN7GTgy4zvEBMcp
 chtDHkBIE+Ua4SGvaTzH1isKmFgBmqAwgDp0KOjfZGln72DaKxMfgMd0uot0B3LbVUzy
 VErzSc+z2wrLzNsMscW/IjQDXgbRp0VMwF4dX458y4G6aTNkeXtyjPr8+hdxxvqv/FNq
 1ra8pb6qihpLIQMBAfiFxVdxK1gK0IfxqDdEjaSm+ZbBRNgMwL2kSGSYpuNixfm5Lhey
 gXCwQEQn/fEuk/Lpm0/+PUN52GXnk98ItdVGtka7umC3PC9pHbk6BUGa2443rb4TYjLy
 xCOA==
X-Gm-Message-State: ACrzQf0sZpuiSWkxz9qVr0iSndeLDxmnaYlsujeEbyRsk2ZK83cqu0wn
 wGwprctyFDpmmizMjeHQLxus5A==
X-Google-Smtp-Source: AMsMyM6paPAXwuga8oGzPeNMoqQmx3LEHdm8dZkbIBYELt16/RyXPdZo4KifZjxpVgoSMU3/uHb6aw==
X-Received: by 2002:a63:565b:0:b0:470:3fc0:7d9c with SMTP id
 g27-20020a63565b000000b004703fc07d9cmr17550428pgm.398.1667892288181; 
 Mon, 07 Nov 2022 23:24:48 -0800 (PST)
Received: from ?IPV6:2001:8003:d918:7a00:2588:8f43:55e5:fca3?
 ([2001:8003:d918:7a00:2588:8f43:55e5:fca3])
 by smtp.gmail.com with ESMTPSA id
 97-20020a17090a09ea00b0020d45a155d9sm7220157pjo.35.2022.11.07.23.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 23:24:47 -0800 (PST)
Message-ID: <56eccfad-12a7-d854-7e62-d6ec865424f0@linaro.org>
Date: Tue, 8 Nov 2022 18:24:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221108040552.22175-1-tsimpson@quicinc.com>
 <20221108040552.22175-11-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221108040552.22175-11-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 11/8/22 15:05, Taylor Simpson wrote:
>   static void hexagon_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>   {
> +    DisasContext *ctx = container_of(db, DisasContext, base);
> +    ctx->branch_cond = TCG_COND_NEVER;
>   }

Typically this would go in hexagon_tr_init_disas_context as well, but I don't suppose it 
really matters.


r~

