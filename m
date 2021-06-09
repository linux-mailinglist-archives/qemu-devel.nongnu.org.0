Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73D3A08A8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 02:50:49 +0200 (CEST)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqmQi-0007Ik-Bp
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 20:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmNY-0004Gf-Fs
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:47:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmNW-0004Tm-VF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:47:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so372692pjz.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 17:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1ykM6Z2utEQZ78tPW+7EqoYSum1t+Ou/k7AmrqdaySI=;
 b=zXlm4MR8dQpJ+uyZkYrp1plJi+7MnV62+6Egf7gHtlbYod+rESFPj8p692xLGpt2lo
 ursZ3IXAvRMVdhW+UCS/6xzizS/gGem62B/5vMvUV4hCBOv4t8es27oaOFiqtANkJSwP
 r72FDhIDqa14qCHb+5mWQ3ic/RD/xg3a+Nry5qACvZ38TFKMHY5YC4fYMbNd5UyfAthp
 tgElw6NqC8R6wrxT4lVetaxFZUDG+KvbudQJx1orZYb5+SxPV7UvZFZ4nFeXwja8eV9X
 /xPWoYDcWWwxajSv2/6N02K40/9eq0bi9FNFvTsvmfMg0Q1BJd8WL3NcOCoVeWMiWZF5
 HoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ykM6Z2utEQZ78tPW+7EqoYSum1t+Ou/k7AmrqdaySI=;
 b=SRtOCTuc1l0vYUgrg6DghsRFB/50Gekh5K+utVF6/AR9zS7VZCk8KoHVrwXk33op8R
 LlxeAaLk7lucTYb2ISxkgHEeNyRL6u0PMghDrPcNpa2fNxNyUxjwLOzcEeqHvaYGCksg
 OMGrtiR6nPPRZH2+T2OPGLiCydk9qabaLKCaQhfENUuA9qlgjDlXjZyya6/FYegwW+/c
 ur4wnMNX5y+s1ThS+meTWDFYjhLSM5fe+cb+xnDzfAZB6ov95zFXyCFjyNHEOcBSXCAv
 zH1mlqT1TTn1sew8nKrO/ehg/ZL8+2T2BdujQ8mjmKt8kvSTFl36D0CijUrjweXp9CYs
 PbNQ==
X-Gm-Message-State: AOAM533g5Vb6ZtwGPkLRz5cCfIBCElAQETd/ayvGFKjMXZiUyx1jgjAR
 uzAz9WQrBQhNqz9Z14trsCT+JkNzF/tj7A==
X-Google-Smtp-Source: ABdhPJyexEwmNIwNqReLh1LeNdMdLPmgz6P46Df+3niCYY60ifN1TvpM38lB1NOM35CFeaIe32JQkQ==
X-Received: by 2002:a17:902:bd87:b029:ee:e0ae:cf0a with SMTP id
 q7-20020a170902bd87b02900eee0aecf0amr2474516pls.1.1623199649629; 
 Tue, 08 Jun 2021 17:47:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x19sm11874531pgj.66.2021.06.08.17.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 17:47:29 -0700 (PDT)
Subject: Re: [PATCH 30/55] target/arm: Implement MVE VMLSLDAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5055566b-e805-c8cd-9549-66726701174e@linaro.org>
Date: Tue, 8 Jun 2021 17:47:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
> +{
> +    MVEGenDualAccOpFn *fns[4][2] = {

static const, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

