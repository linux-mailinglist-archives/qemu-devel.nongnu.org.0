Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A466E817
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 22:02:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHt5f-0004jO-2x; Tue, 17 Jan 2023 16:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHt5Z-0004iG-NG
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 16:01:49 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHt5W-0005Yd-VW
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 16:01:48 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d9so34790843pll.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eyW4/4H5m8mM04RK0Yizhzv6HDDNEjtTKtJnCwwBPDo=;
 b=Aog/OJbcF1u60+pZp2dDOGO/drykB3FyYXavhgA1pWMJAPBRVKe2wp6iQojQMbShsf
 iQD00a6koYXDtrVa68ycdgScvPX2Gb9K24SjD13qR42tWN26EodJ3EPi9E8+pd74YOqt
 kksr/z/omHrLoJ3nq41yfI1b2AcYUHuWhHII3TONnHJGITOffgA3NDici0prT5q47Xqk
 +YQy7j3DgG/AhP8Hk9Z39VUHWMazPg08fGiZWHYAlclEN05kQeTObMl53x3BYXK5086a
 eNk2b1f4YqwQXSLJy/SZAsVKLavb8atGG7/xvxhF3bwMPkBIK+BTp3gkCm38ayfYODu7
 lybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eyW4/4H5m8mM04RK0Yizhzv6HDDNEjtTKtJnCwwBPDo=;
 b=tHhNbIzQhR6yVDLm19qxW26eTgh5CAaorwyuzw/mTKUiVY5E5ZpxyUkGCeIq9WxGu9
 oPeAzrQaGsjpAZWJaHUgKxfS8iFJ9j8sxMo0A7kyZYFa8VHmVssqFtawlkXqk9cKUOx0
 pO8TrYMZ+v+HpptdgteNMfU7jUTYMAYN3/Kpz98AofiB57cS5FELRv0pAxwyKuGjy1bZ
 3eoZnw0U/+0kDySFXUkUDY5HQMNc5rhy7emJ85zb9AO3ExJlCoMx7oqg+AtQ7xvwaAYt
 rieYRnxUAnPT7np60IeIPjhAd2v3zW8BDNo25xnIMFfw+RNwN7nbofX6d7nQVcKrEWTd
 Q/DA==
X-Gm-Message-State: AFqh2kozc9XeFHTij+r39FOep/d+1sXCr0ttqQENFUwNGFDad2DBwJIf
 eiLC6mRw9ftyYQ+eKIEsXJT9sA==
X-Google-Smtp-Source: AMrXdXuPZFHVgIPP03bJWBJdgKSjErG5LnMRVjf0NKb0A7F45aKCO7l5p0tT26104qZCmweq4a+jkA==
X-Received: by 2002:a17:90b:394a:b0:219:9973:2746 with SMTP id
 oe10-20020a17090b394a00b0021999732746mr27557495pjb.0.1673989302068; 
 Tue, 17 Jan 2023 13:01:42 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 kx8-20020a17090b228800b00218d894fac3sm1976pjb.3.2023.01.17.13.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 13:01:41 -0800 (PST)
Message-ID: <6da18e97-c80e-1ac2-edca-34fb243edd81@linaro.org>
Date: Tue, 17 Jan 2023 11:01:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/tricore: Remove unused fields from CPUTriCoreState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20230117184217.83305-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230117184217.83305-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/17/23 08:42, Philippe Mathieu-Daudé wrote:
> Remove dead code:
> - unused fields in CPUTriCoreState
> - (unexisting) tricore_def_t structure
> - forward declaration of tricore_boot_info structure
>    (declared in "hw/tricore/tricore.h", used once in
>     hw/tricore/tricore_testboard.c).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Given this compiles,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

It did surprise me though, since I would have expected something to use hflags.  It turns 
out the only thing that uses TRICORE_HFLAG_* is the kernel vs user-mode bits.

Bastian, there is code missing from cpu_get_tb_cpu_state, to copy env->PSW[11:10] to 
*flags.  At present it would seem that all code effectively runs in kernel mode.


r~

