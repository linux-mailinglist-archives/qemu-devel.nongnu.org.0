Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A7D6A13CE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:31:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVL3D-0003HI-Vq; Thu, 23 Feb 2023 18:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVL3B-0003GT-Vx
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:30:58 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVL37-0004z9-If
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:30:55 -0500
Received: by mail-pl1-x634.google.com with SMTP id e9so9879237plh.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LQjkpERFp1H2IIeFpMAxUZFI52xdsRjB6cK3A2FHJHM=;
 b=prbwWCCNIzhCrWwBnYIHyG3yhjsI/s2/kxhGaX41Zjv6hehEx6VeoWpWPkbVDckF6w
 kEHNJzTEECgJpnlLS2C/KDMxlTBi8fPjxLGz6XLaKyEr7hbssieRtBrM+Lw6FbeAdqYX
 AXWFAwDMR5nrE5ugVGSPMpcneXkNsQY8eSrf8CcNDnp8bezVeLBuPbzMKtGzz9DNpwo+
 CpbIG6NjfK/ibbJI4x/4ps0HHChIN2HsW5WqCj0ZJy43hqn7Ob0ec74OJftuEFuI6Gvv
 0QRIyv2V65n9EMp+Y/eVu0HIKuA1VTA4S/P8mMLUKdMQOIeDvp8Cw56BNSRzPjTxMdow
 zCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LQjkpERFp1H2IIeFpMAxUZFI52xdsRjB6cK3A2FHJHM=;
 b=ztwmxpPFZngBlqhMijVb1qpdA/6UKZqeSHFlqkFiQkAOUbz79jmLMOOycQn/FMKO3g
 FTdb7Qm7pja9V26bva3qnJFVB8UEoBwiUsnbI36tj0Hy4219xraWataOmREDotMZxqYu
 iuaKFxcvR4Zd7IDLnGV8PoVI4aYo3dAIERepiOGuFi7TFgILKfxyXrInEq9mv/8YeMY4
 ITbakRKOtpbHM7cTdzyWKW25ae28zOp19BCsXfh9torVooAOvnPviq6oJKVA+/kWcXjA
 TUJsgD02+OMlJFRqQmaGywSslfZ4b+EMi3N7dwl6BistSkUzLex2sr3vB/ZgsVcfAxon
 tD0g==
X-Gm-Message-State: AO0yUKVQ4zcOJTrYuLdxr0cnst3YbYa7WwIKfw2VgSghv4Keka/JUv5k
 bWxrv7VRD+oru0d4o5Ws/1gLxg==
X-Google-Smtp-Source: AK7set+sKlOD/z3qjrThmpiUs5Pr/UouMrJZE6EqQJrwWV14+Ni7pkr36U7hZ5JnshqAP8Wtp1nxeA==
X-Received: by 2002:a17:902:d486:b0:19a:8b3a:fad with SMTP id
 c6-20020a170902d48600b0019a8b3a0fadmr18689331plg.20.1677195052149; 
 Thu, 23 Feb 2023 15:30:52 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 6-20020a170902c24600b001946a3f4d9csm8107587plg.38.2023.02.23.15.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:30:51 -0800 (PST)
Message-ID: <cc1281d8-f333-4752-6f27-e1ae456fdb2e@linaro.org>
Date: Thu, 23 Feb 2023 13:30:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/7] dump: Replace TARGET_PAGE_SIZE ->
 qemu_target_page_size()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223231755.81633-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:17, Philippe Mathieu-Daudé wrote:
> TARGET_PAGE_SIZE is target specific. In preparation of
> making dump.c target-agnostic, replace the compile-time
> TARGET_PAGE_SIZE definition by runtime qemu_target_page_size().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   dump/dump.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

