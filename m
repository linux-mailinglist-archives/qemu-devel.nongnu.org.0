Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A33AA416
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:14:49 +0200 (CEST)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltazw-0003Rt-Vb
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaxO-0001El-Dx
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:12:10 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaxM-0006rD-06
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:12:09 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e20so2834476pgg.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A76pZePU9iOOe9OQIbfwWF+/MsmZGsNUJaYBetfiFjw=;
 b=XKRUGKE5/xa4UEyM9RCOxK9JK+sEePqDBgKJhpndixlz1qi8o68agUDrbbiiS8x8go
 ps4zJ5X9Y88SDjQNYWNvWheSO2APQmVJX9i8iFx1Pq8dv0IgpYcxX0wdJZDIXSWlBBQz
 90nXmrJB8Mdp+60Fd4T7tYoHHBm9lNcGw7S987JVzLyAsbBtu0Z9473NSvXsVKPpL6FV
 0Z6td7gVn+RJSmB7pTUUw4TX/xJFUMdbGF9Owk1vTJTdsmH87ns7ajB0dbPY0B1HZdtF
 Fby5Oa6zwdFIkVM2kp/yyY3SN75XqFozj7PoJP/iT+amnZ8+z2LYtG5iFruG1xapDw6m
 txJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A76pZePU9iOOe9OQIbfwWF+/MsmZGsNUJaYBetfiFjw=;
 b=SPTpLsMe2OWtws96mCiETpbFdOQ+R9TjvpRazW3UB0/QDZWc+LDu9uIVz9kTrY2E0R
 D3Mb2SJAur3TmPHzX4NVP9OeWwxbxCf3yaakZ64UEWXKonNLj6Dnmpwj4j44xhPqwTms
 +OwAQjjCbGE3OPXpLEyGnT/CS84nA6OMwdV3jhH/JFomUhukyV/YzutR+flDI9UnfQ46
 oXewursgnVVidhdY8s1PmlWCwFZkfoKTq9+xh3XbWcdwnR9czPZMgu4PzfJHV/16+s0/
 ZyL4pLEQaOiPrNccRKMclRSt6pSR9k2bJHFhdqeHiliCLOffh8rrlm9MZZKaiUvxOh/T
 cO2Q==
X-Gm-Message-State: AOAM5329rMZKym5qS93gp1UXQwB33hQxlJr++a2bApIibGZut6RFdhK1
 PpqoQcZ5LWr7h+/whn2tmcO1Jw==
X-Google-Smtp-Source: ABdhPJwOJacXF9nV50lxrrYXhbrBEXbya9p/5aEAZvirVx2RNQDpigaEN+HdBlVnP9cMH+7ySPjmrA==
X-Received: by 2002:a63:6284:: with SMTP id w126mr1138265pgb.284.1623870726626; 
 Wed, 16 Jun 2021 12:12:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w15sm2677210pjg.32.2021.06.16.12.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:12:06 -0700 (PDT)
Subject: Re: [PATCH v4 5/7] crypto/tlssession: Introduce
 qcrypto_tls_creds_check_endpoint() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55c03d12-3359-858e-8e71-7ba7a6fddad4@linaro.org>
Date: Wed, 16 Jun 2021 12:12:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616162225.2517463-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:22 AM, Philippe Mathieu-Daudé wrote:
> Introduce the qcrypto_tls_creds_check_endpoint() helper
> to avoid accessing QCryptoTLSCreds internal 'endpoint' field
> directly.

I don't understand this one.  Comment ...

> +bool qcrypto_tls_session_check_role(QCryptoTLSCreds *creds,
> +                                    QCryptoTLSCredsEndpoint endpoint,
> +                                    Error **errp)
> +{
> +    return qcrypto_tls_creds_check_endpoint(creds, endpoint, errp);
> +}

... doesn't match the function.

The new function is a pure forwarder, and begs the question of why the caller isn't using 
qcrypto_tls_creds_check_endpoint directly.


r~


