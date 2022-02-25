Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8C4C4F69
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:19:14 +0100 (CET)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNh3Z-00011I-41
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:19:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNh1b-0007Ls-H0
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:17:11 -0500
Received: from [2607:f8b0:4864:20::1029] (port=40510
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNh1a-0000V8-36
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:17:11 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so9372457pjb.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9p9V2RSKBVgapCkSAo6CtYOf0BmOVZeqZKO/lWtgy90=;
 b=Fi00LnSFGSw5Rd8I+PEMiCFBagza5F25q0uOW2jI9rPX60VLHJBLfPx01yqEkX55zY
 BO8LPVFW7bIeu3PagDX9Y0JjHqtAWguKyYQVr0PA/Jd9mK/R6DWn1xbBIw1Es0CL4qU9
 861l1+hEiTPWAa+WKPG9wYubvaH6ynFDbe3A10zf2v8EzZS5ftzpAN/eiHybDWczYWpx
 fmB8d0WUw/CN8ErJf7lsX3Vbn7aq2KjzPLiggiRaeOW3wBgcUGC4imd/sdpEQ+l0FIlE
 tDosExpxfrlsZ8yvq6TyfZlekfDqQ3qjR9UhTdYCByJq45SxGDy4jcDpmyQ0WcP225J9
 4x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9p9V2RSKBVgapCkSAo6CtYOf0BmOVZeqZKO/lWtgy90=;
 b=qZcc6KWDgLbAiImU5Eq8gmMQ/mJXXoM+NC/8tiR3oli80pa95rdR3QK7ljMbKgWHMy
 QRVZcLc3Io3tISuFxjUZcf7KJ9r2qxDiFX3gZnN5EP93r0zaSImnIsPBrDLNPIwgmfNL
 5w5vHEBNjXOdXjS8L5xdtXiZZUUAhT0ji6CvaXfIJH4UDz4SPdfy5KfNRCjUA7FxJjVJ
 JGxP8KhgBtIHWcU7OcBmQ9vvLAtCQ3eUNPXZdptuxpJRSKZj2p/m5OENXxdfXIEVPNQH
 iQ3+NanJP0oKf5tySiafEwwSyV4ou30O+RTILswyqIP1S/y27pIdsIdTTIAJkL0crfB1
 ojRQ==
X-Gm-Message-State: AOAM532xkheX/ZSKi7Q+6Z4ywVuhSyOWM1ctyoirWypHv/uZ+/AT+HUT
 LFAk5n1Y6+cdOwuGeKq10MjV0Q==
X-Google-Smtp-Source: ABdhPJyf87uLXefkMDYyJUi0QKRymJkQRpm1Cm7VoM8/tXrEXO1vH5iI8jIawBJ6H0ickmh5C1t2AQ==
X-Received: by 2002:a17:902:7283:b0:150:b5b:5375 with SMTP id
 d3-20020a170902728300b001500b5b5375mr8962769pll.90.1645820228633; 
 Fri, 25 Feb 2022 12:17:08 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 nn15-20020a17090b38cf00b001b90c745188sm3185614pjb.25.2022.02.25.12.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:17:08 -0800 (PST)
Message-ID: <53691082-9201-ee72-b9c5-02f7a0727397@linaro.org>
Date: Fri, 25 Feb 2022 10:17:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/18] scripts/ci: add build env rules for aarch32 on
 aarch64
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2/25/22 07:20, Alex Bennée wrote:
> At least the current crop of Aarch64 HW can support running 32 bit EL0
> code. Before we can build and test we need a minimal set of packages
> installed. We can't use "apt build-dep" because it currently gets
> confused trying to keep two sets of build-deps installed at once.
> Instead we install a minimal set of libraries that will allow us to
> continue.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220211160309.335014-7-alex.bennee@linaro.org>
> ---
>   scripts/ci/setup/build-environment.yml | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

