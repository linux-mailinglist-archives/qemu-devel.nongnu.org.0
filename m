Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E46B3F85
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 13:40:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pac1Q-00069s-BY; Fri, 10 Mar 2023 07:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pac1J-00067u-1U
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:38:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pac1H-0002Qa-H0
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:38:48 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p26so3275716wmc.4
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 04:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678451924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ntFU3BdFyxGBd20bM2b7GEbo6sy4YsABC9Wmrp+9Ao=;
 b=gCAioIWym7V+gLvRN9xe0gUUMjqlb9f0kLLSCEKlcZcjbkSc3voGgU37FWIYw0X2oq
 CssUhLw2sZ2n4S6WN52vPrUJScKolWt1SbmHQApR+l1vUareIy3xvSgeaiiCNmldpz93
 u+tztx9RMLTV7K0PjGVdECG+Hd81i0+DaL7xf8Ea9PchF7rkc448XsOhXqJ50MxfrTBD
 GvCS3c+eUn6nxsUp3br/d8r4iGwze4Q2eUs9bQoTe7OIgNJ045BlpokUVrNf428/wTsX
 cZJuQqGFSw0jTvG74bfxYRveh2l6JuesBIhXq35MHxFJlwJLEBphPXU+5p9KR/sSYVCF
 wg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678451924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ntFU3BdFyxGBd20bM2b7GEbo6sy4YsABC9Wmrp+9Ao=;
 b=4JPozGM4uUgLmv/VskERuMw1qrnfPu4KzH1zdawolVFs6TrDlE3kK3t0mRCPtMwtDo
 iUjqhU6B3v73cFIlZepqTBw3Ph48UsiyIS6HrpKxstONCVVflkOR2Nq1YcD5ZwcniX20
 Nx+WvASs1aCnkngDvYq/K+EQt/1P5w0bETCIok6zQyetbvxAf8QKyQ2y9aXNieDRqrbq
 R2dGpCyHSCxav5JXPd8fRMBcBVg/DmCh5AnfJ/2H5dX44Dtlk8JsrPlwwEaRZVZfjNKt
 1EKEV4Xq0b0Ic8niNT3gDmvQx2TfU6i7c0G51bxq75SVbeA417IlLpT8tV1BML0x5H2y
 Zwyw==
X-Gm-Message-State: AO0yUKV4mP99ve+tyULOV/4sAJZRIRHhtLZLQEnde12M8U5gSO6diiDb
 sXJrUqeHr8qNS5nRtfz9t7ZHPw==
X-Google-Smtp-Source: AK7set/pdMVn0sIzr262Yqv+y1Ge8xko/xPiGP0LoLeCVjbjfXnJnEhEWV6VQnj5RWdhCSZyUnJNHg==
X-Received: by 2002:a05:600c:3ac3:b0:3ea:ed4d:38f6 with SMTP id
 d3-20020a05600c3ac300b003eaed4d38f6mr2564948wms.4.1678451924517; 
 Fri, 10 Mar 2023 04:38:44 -0800 (PST)
Received: from [192.168.1.115] (169.red-88-28-29.dynamicip.rima-tde.net.
 [88.28.29.169]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c229200b003dc4a47605fsm2961186wmf.8.2023.03.10.04.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 04:38:43 -0800 (PST)
Message-ID: <8184e8e3-7dd3-3a12-66db-531e6a0314df@linaro.org>
Date: Fri, 10 Mar 2023 13:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310103123.2118519-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 10/3/23 11:31, Alex Bennée wrote:
> The kerneldoc processor complains about the mismatched variable name.
> Fix it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

