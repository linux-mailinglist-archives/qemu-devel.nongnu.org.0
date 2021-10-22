Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9719943806E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 00:57:13 +0200 (CEST)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me3TM-0007rR-O1
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 18:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me3Qc-00069Z-8W
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:54:22 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me3Qa-0007LP-Q3
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:54:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id s1so3727437plg.12
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 15:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aOvgC4UQJyI1x26uOvElX+3+5hJLNJ9EEslyDVc+LOQ=;
 b=f7zBxUUC5s4BrLJOhsdFUDm72DKoV+rUgFTUlHgw3s8vYYQxT/VRos2SNyuzYDxp4v
 Nl5UcA9p2pyNuUGaOGOUnWChjCjKopY7Z9pvQVgVUfnkLtXASB5AqLWJeipjq7QZMv0/
 jrHz97sYEW+WsoXTKwwPDJke6+++3IMHy8Sw54g/GXJQQkinm3/xlfEWUeAsiRDdk79c
 AB/UVWYMkwLaou2T59Misb4PfsRk1dBRgvyatS+ohU1DKtMwJ1wn5KZ1GHctasCPMUIF
 lQw+ZZZa1DAydYirrk7mSK0XwFq4dzfj0ADA25Nn2asexTI0jj5GBKeJbgLP47Lkah8V
 wslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aOvgC4UQJyI1x26uOvElX+3+5hJLNJ9EEslyDVc+LOQ=;
 b=3YTH6Jx+XUzheYTUsqDvjxbGGOfHKOabSqXiH/RTSJpMy52kI22mCaR+cyxUf97jjM
 SBNWG6ZpxQKLKEi30pO32qheJUmxXTEGvTa5CNR0Gr9M++uxob2RUO+NVA87o6Gp8xrB
 eDcFUs+Lr+XvksZklE70l9v1YjwMCDx/HNLU/jCVLwsGXV4Rm0tOzE17AIWWCTCATwG8
 1nfpVqCNA1x9f529BNQQ9BMtvH3swkgV74w394/QcvnYr3S5m1qoPZhUW7Q59/Wqd3G2
 redXHQLNZjWZycNtzsDdlMVf8YJN9i/Ai1AWdK38hUt5rnoRfRH9LXaBKHJqnGqwifHB
 AIeg==
X-Gm-Message-State: AOAM533gL3wxakYF5y1gPJbHe3WkxpN4VAaybftMK1DCPKP49p/Q+LQk
 woSwjt8NNpWChm1Vus/h+Tjn2VP5YI9kCw==
X-Google-Smtp-Source: ABdhPJzmaY09g81qfmhK1pwgV6hbLVcASQHk2LP8daYvEXwW12R6esg1zbvd9XtjknAOeqRxprhEeQ==
X-Received: by 2002:a17:90b:4a49:: with SMTP id
 lb9mr2998711pjb.85.1634943259485; 
 Fri, 22 Oct 2021 15:54:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g16sm5931005pfv.192.2021.10.22.15.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 15:54:18 -0700 (PDT)
Subject: Re: [PATCH 06/33] target/ppc: Implement PLQ and PSTQ
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-7-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba2532fb-792e-a4dd-102f-1f842e35d8fb@linaro.org>
Date: Fri, 22 Oct 2021 15:54:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn64.decode                   |  4 ++++
>   target/ppc/translate/fixedpoint-impl.c.inc | 12 ++++++++++++
>   2 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

