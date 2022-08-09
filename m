Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A2058E21D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 23:50:04 +0200 (CEST)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLX6w-000661-Se
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 17:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLX1y-0002pE-1X
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 17:44:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLX1w-0003dP-Ad
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 17:44:53 -0400
Received: by mail-pf1-x42b.google.com with SMTP id k14so9945626pfh.0
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 14:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3CaougpuiT/ULDXL1MbNFO4WvxAk75A8gskseTwEqdE=;
 b=n9hrtkHFtsrWQQK9JwFx3k60cYVS5+sMKfE0/LfrUVg/Oq4iqWrSdRDGANvslyKZoZ
 8LrMGwwXkBwZpo+reMgagtDyiFHoRBWVBhlJkGFXKNoUBCEqNHIEsZHFkO5jPSGpqW/P
 tkE6DUh75N9zbDK+N2TDggr0QqU9ZoAhYupUvXxO12X4lfrsRpfk4BQMDD9F+ejwhNKd
 lFDv9Ocy/9lkQuVBgdX0EXziM1sYywd4Q9tK6+UVmOtw75LJ73X/8TWa7BV2DjBX10In
 m0beltm0WLYedRGkmMyy3gTIjuagj/MaB8fhBua0SSj2XIhfyuYQGobRSZSurLaFhG6L
 ZCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3CaougpuiT/ULDXL1MbNFO4WvxAk75A8gskseTwEqdE=;
 b=reLZA6BD/qNuMhhhEZjkTGP3Gko4JMWUia9eyknjonkGgYI5f0fIRgpkbhyB4bN3a/
 B7qGOhOsFAxSeuHYlPauIpR1FyGttGuVcfv1gs49QVKvWlJfmQ9aBXtvrIeAWmy7eR9v
 Fp2J7JA5gr+HviQUTY1/s4uzENQQTXTmDqeeTxBhurQ0Q4RphvOG+Zx46IzTo5FTk2uR
 lLDtgMZTUV9bmQqSBOmpbAhupTKgYCfkoxWHHzeCMSxwicCNiiML0GE94j8T1p+WAmho
 38PV6wklHWUWBPThyhZh1qAZbTfRk3xnE5B/Ra9BP6ash9Jx15fjrsZDnxOXuOWCFKyv
 Pf3w==
X-Gm-Message-State: ACgBeo1BKtNAHagN/CviPQ5CJDpcFBCv0eUa+AjfGgNPT2Rigk31A1Yb
 SN4IJlYr9AIOFiP9BEiPctKSAQ==
X-Google-Smtp-Source: AA6agR6mIna2gBaqo7NJrPgcpN1cxXxPcAAcaaQYZa8IO/m6xx5SaCQecMsAqFs10P3chKA+WVQn6w==
X-Received: by 2002:a63:5a4e:0:b0:41d:f6f6:4a0d with SMTP id
 k14-20020a635a4e000000b0041df6f64a0dmr70262pgm.85.1660081490214; 
 Tue, 09 Aug 2022 14:44:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:409:90e8:ee9:8fec?
 ([2602:ae:154e:e201:409:90e8:ee9:8fec])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902ea0100b0016f0d6614b8sm11331615plg.291.2022.08.09.14.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 14:44:49 -0700 (PDT)
Message-ID: <22094624-6d07-09b1-8633-c90419438d77@linaro.org>
Date: Tue, 9 Aug 2022 14:44:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/2] Trivial branch for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220809165555.2415931-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220809165555.2415931-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

On 8/9/22 09:55, Laurent Vivier wrote:
> The following changes since commit c669f22f1a47897e8d1d595d6b8a59a572f9158c:
> 
>    Merge tag 'pull-la-20220805' of https://gitlab.com/rth7680/qemu into staging (2022-08-05 12:55:53 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.1-pull-request
> 
> for you to fetch changes up to 9390da5ef29a5e0f98e5b482dceeeb287c452f17:
> 
>    xlnx_dp: drop unsupported AUXCommand in xlnx_dp_aux_set_command (2022-08-08 11:40:06 +0200)
> 
> ----------------------------------------------------------------
> Pull request trivial branch 20220809

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Markus Armbruster (1):
>    contrib/vhost-user-blk: Clean up deallocation of VuVirtqElement
> 
> Qiang Liu (1):
>    xlnx_dp: drop unsupported AUXCommand in xlnx_dp_aux_set_command
> 
>   contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
>   hw/display/xlnx_dp.c                    | 4 ++--
>   2 files changed, 5 insertions(+), 8 deletions(-)
> 


