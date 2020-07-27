Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA88322F699
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 19:27:32 +0200 (CEST)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k06uR-0003cT-Se
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 13:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k06tZ-0002zU-8m
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 13:26:37 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:40290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k06tX-0003rg-Of
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 13:26:36 -0400
Received: by mail-pj1-x1042.google.com with SMTP id t15so9933260pjq.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VT/MdQtKEYPw/xmFzjWR/AX2vWtx0VmdAKjsh/004wY=;
 b=J9RGv9RSnVOX/Qm8rR0cKPrcLXTW7obLN6m2yYYcS6TS2QvYbKKR7TVA6UJxmgdBxc
 6/mRNsqduqGPtPmBgOyvfPghRoU4g/OZ4KGH81jITJrLu0QdZ7Rcqr/vwZPjKg3N8vq+
 l3IpL5PtD0ejICI9wyabLqlRFfy5YQWTv5ycyI6I1g+mgeRsjabJpJUIyLBfaJ7ovsXg
 yaDbLjaRKXzPx9FcARbGvUvRBtlZA6m2Ghcljeu9tm46NDD/e/CvCoUI2nGT45yPdSgY
 q1t74NVhbBNNBxOc5PZ8LJJVsRtgip8v5dcrvGLQ9rPNHgWNdPOxc7VmAdZjEVcRHu4n
 wMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VT/MdQtKEYPw/xmFzjWR/AX2vWtx0VmdAKjsh/004wY=;
 b=RpjkHpj84fZWj5PfP7jt9GM7Dhblo+C8do1AWB+Wm5vpPqlyt1TG93Y768yLuTBm0F
 s0UcSgT/Z+D2HAwa3Cmz8OKErWDEpg7xbPT/cKmEQsjD5M1Du3xHV3ZxvjG67BcV3RVM
 0Qya7qqN5zjn4IlN5Eazq7JF0x7c757D8Md+86V+QjOgythQ5xXftnXyw6K0Cpkwc+YY
 SBya28rLYEAlcMMuX9856Xnw24wn+d7zwyK02OSzA1SjyLK2DfTY1pTnS6w3fqq9iIlF
 2SKwXbHmdJ2hZmsjs7z8NujD0zUYK18BYimIiG3shckdRI/k1mifot9b/s+XyoscLGxT
 xHbA==
X-Gm-Message-State: AOAM531CIoSh6IzfiFAcCYfkqMj9bN8tp3BPiawD3FSYy4uFWjxkbJuS
 Q6xt9yJeL6IW2Tjo8gF5eee9IQ==
X-Google-Smtp-Source: ABdhPJySGrfhwWsxCIWz6XlSXfy6PyVUHG65v+IhFwdR/xaU0np8CfBVtIgHOTd7Rc+WxULKSpJsGw==
X-Received: by 2002:a17:90a:6b02:: with SMTP id
 v2mr293498pjj.163.1595870794168; 
 Mon, 27 Jul 2020 10:26:34 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 s4sm1909247pfh.128.2020.07.27.10.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 10:26:33 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: Fix TCG leak with the evmwsmiaa instruction
To: Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20200727172114.31415-1-matthieu.bucchianeri@leostella.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <524ad0cb-0d91-70b1-9e14-55a070ca8270@linaro.org>
Date: Mon, 27 Jul 2020 10:26:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727172114.31415-1-matthieu.bucchianeri@leostella.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/20 10:21 AM, Matthieu Bucchianeri wrote:
> Fix double-call to tcg_temp_new_i64(), where a temp is allocated both at
> declaration time and further down the implementation of gen_evmwsmiaa().
> 
> Note that gen_evmwsmia() and gen_evmwsmiaa() are still not implemented
> correctly, as they invoke gen_evmwsmi() which may return early, but the
> return is not propagated. This will be fixed in my patch for bug #1888918.
> 
> Signed-off-by: Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>
> ---
>  target/ppc/translate/spe-impl.inc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

