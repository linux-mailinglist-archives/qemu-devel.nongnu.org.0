Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0078F5A0557
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 02:48:59 +0200 (CEST)
Received: from localhost ([::1]:60964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR13K-0008Nt-4J
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 20:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0zs-0006TE-Qv
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:45:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0zr-0001sl-A7
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:45:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id jm11so17115605plb.13
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 17:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Rikt/ghTiRdfzFgAc9r10hLd9MLNeQ68xGkfQVlCiDo=;
 b=mCnx2iRXhcF1PhfxkYI64GfUk6fABn7bgWYky0+BFqubyrpk/rlmoO2mBPEtFFxrRV
 c8TV7Hyx0MOFbDl+nFJ8D2cOlFvXOS2EaXd+nE68GclGdewePdpCn1Guai+AFQ3Nwa8s
 vJ26IG5pWFk/XjopN2d5Y6ia+STlUzcDja5lrn37fhFj0EBOfAoqXOTxzk078m9PuAf4
 /zXhN4JyHJ2bPz4Sd8RgdcEVU2ifjfry8FhnLAWhb1BOBYmiUvW6qh0nvE4LP2hW7A5h
 YldngixzaI3wEcIMGtspApss4pdDCJ14GcyBMXj494VFB/kARVDoy5bxF8kVsjqdBbTn
 hv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Rikt/ghTiRdfzFgAc9r10hLd9MLNeQ68xGkfQVlCiDo=;
 b=W8LkYYqAGCXHuhbhu4wQ0d+sMk4+e7Lk/RhrzKQSH1yvmqEMWkKeA3J65hG3kHeVLd
 6joqh3se7Ftv/VjJpqthg5tzNGvOrYT22P5JKlMb5Cx5VMImhOr4x8YnW4c5QxXeYV+M
 tJS89h46QRNFm8caBtLQKRGWsof4F8xmELQ2uaR5zyqSC0OcJlOKLgYxWHEgeGHFrQS8
 dLxbJo+L+256Ye6F0OT4KYinMST+CmbbXtNNNqil1Nz2pEcWnDVLfRT/VDe1B+TUEojy
 GfmAyVZzNbbfoy7gk+yn3WcAqATAR12sgTOzpyZ/HziPFjS9GUnWFV0I/eZRmbABNqGA
 OlPA==
X-Gm-Message-State: ACgBeo3bwMnO6Hm3485wlDNx8GkDSenkSVTLrjv3U9PP/SrkziobM/Pl
 ykUWW4Sp74/y+YWiRNvduYeWcg==
X-Google-Smtp-Source: AA6agR40HvX+Chf7ess3f7wITLDW3e+BCDxXZT7YS/QloDtesIe4RuxAuiq78XxGdBtO9V/j/Op1EA==
X-Received: by 2002:a17:902:e742:b0:172:fdcc:a536 with SMTP id
 p2-20020a170902e74200b00172fdcca536mr1293602plf.123.1661388320864; 
 Wed, 24 Aug 2022 17:45:20 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 y18-20020aa78f32000000b00536097dd45bsm11648268pfr.134.2022.08.24.17.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 17:45:20 -0700 (PDT)
Message-ID: <94576397-c807-7747-f923-a89b6d26d434@linaro.org>
Date: Wed, 24 Aug 2022 17:45:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/17] target/i386: introduce insn_get_addr
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824173123.232018-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 8/24/22 10:31, Paolo Bonzini wrote:
> The "O" operand type in the Intel SDM needs to load an 8- to 64-bit
> unsigned value, while insn_get is limited to 32 bits.  Extract the code
> out of disas_insn and into a separate function.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-old.c.inc | 11 +----------
>   target/i386/tcg/translate.c      | 25 +++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Especially if you wanted to sort this before the decode-old.c.inc split.


r~

