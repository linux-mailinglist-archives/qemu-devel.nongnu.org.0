Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C256381A20
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:22:11 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhxzO-0006vS-1A
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxyE-0005zq-4q
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:20:59 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:38727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxy4-0003Zt-LO
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:20:57 -0400
Received: by mail-qt1-x82a.google.com with SMTP id h21so1950680qtu.5
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NS4EdOOlhrcW8ppu/GnQnSaaZUpfTSbYrZEaNHxvkrI=;
 b=Q/uTDHXhDjw7FPQVV3bVJo4lm8pwVoFzXhaE1ROafHceKnLigXQIPuvy0VbeX9tQhM
 fmrZ7wLKATCBqJZWucN1IEKTMidVW8WRJgBUbRiKFkWAVXdFRhG4OmsZiUk3uLHvmBtN
 /n2RkPVsVsEyxDsEZ09BgvIVHmxbEVCaX3XsOvEqCkZDR//tZfBBfxMDPDtedv3/Lwnh
 zjkevnlnLlfcYRJlhiTI4m6BVX7FDUJF4bzjx1GxxdAqZUAWyO0uMrvNttJ+btKzYxqT
 HmaLU8VXbsmA0DNJ1cbJizRTT062LgeEk2Ha8aYxtKkJSyRjag8yKHXTBS5bHTZSgHsy
 WNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NS4EdOOlhrcW8ppu/GnQnSaaZUpfTSbYrZEaNHxvkrI=;
 b=NoPLCZRVtI+9fmhYEyKpfSsHEpTyKi6/G2YGkWpSsXQokSAa8eiBhEbjRjeIanB2wA
 KHermIvna+3D1BhwYExAPlWi2bNZh20HtNzkJo6S41+IwQST3urIg7rmLLec3abjZC1T
 e9+VqU7cSoNYGpZ01vsmvB3JOEU8tpwHu19YI4CulZYhfO6qBq9A9CSyT160/74tHmbA
 12f1FsRNlDeLnl/26FFIpU+Acuf5TBtkxLrXUBDpmm0GUddadaCTd87+5L5DcTiGETLc
 0KjNvvgVzbj1eLTQwsGTxTrMkxDAM1wB4eUxV1TLk+57L4xZ7vZW4HUMwiVfdrqxuRDP
 GKcA==
X-Gm-Message-State: AOAM533KlvDQdrv1Jh1MYoW9roQELoTLjG0HNBzgW4vR1Uyd/7i+nM3y
 /XI0FPoYN/GC7p2rnrI1Mlwr7Q==
X-Google-Smtp-Source: ABdhPJxUYVAkx5S32iFNR7nSoG9FuqKGmdgdzULlmbQBVZZBXuPdY5IpJ5IKOuAyWmiyQrMr9B5DUA==
X-Received: by 2002:ac8:5d0b:: with SMTP id f11mr50328913qtx.132.1621099245913; 
 Sat, 15 May 2021 10:20:45 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id h8sm6955587qtp.46.2021.05.15.10.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:20:45 -0700 (PDT)
Subject: Re: [PATCH v6 77/82] target/arm: Fix decode for VDOT (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-78-richard.henderson@linaro.org>
 <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac0e196d-6435-8a6e-f777-47628dd88fd1@linaro.org>
Date: Sat, 15 May 2021 12:20:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 2:25 PM, Peter Maydell wrote:
>> +static bool do_neon_ddda(DisasContext *s, int q, int vd, int vn, int vm,
>> +                         int data, gen_helper_gvec_4 *fn_gvec)
> 
> This patch seems to be doing more than its commit message suggests.
> If we want to share code between trans_VDOT and trans_VDOT_scalar
> can we do that refactoring in its own patch, please ?

It appears as if a rebasing error squashed two patches together
(git commit --amend vs git rebase --continue after conflicts).

I nearly made the identical mistake while splitting this apart again just now.  :-P


r~

