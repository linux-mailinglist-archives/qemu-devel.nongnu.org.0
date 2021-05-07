Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B7E376BB6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 23:26:26 +0200 (CEST)
Received: from localhost ([::1]:36402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf7zM-0001Tk-TG
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 17:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf7yY-0000nJ-MP
 for qemu-devel@nongnu.org; Fri, 07 May 2021 17:25:35 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf7yW-0008I1-Ul
 for qemu-devel@nongnu.org; Fri, 07 May 2021 17:25:34 -0400
Received: by mail-pf1-x430.google.com with SMTP id a5so1761470pfa.11
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 14:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QV66noH4ZAYh7QslZPO4nhQgeYZRL9ycXqAns2YTYW0=;
 b=zy5XXQeCvJwDIJIBQ3eRGu1FWfJ/uThcceaP/jOpx54Qb9Ht3BjRrH8xhsUIE3GRi4
 SF9DZH6KrqhYFfGUNqlb+6jkB3+QW6IXSwlpv0iHkvdgkDpJpHcyOXwsdVWLbG7NWCc0
 v+uOTRBPjxcPeUFcTAM+hqELQ2LC2MO7AuHVPH2EPxvMqwL5q3gC+7GnMXUCCo0R4bh4
 0QobjfUmZ94cHedASmZeMLHxwt8YDrFiAjIZuxXPBtJ6A66IfypWG1quUoaurYJAka1q
 eB4jhOqZS0pOYP4B8HuVn3lASKNBWjgEaL2elMVBiQZzLZfwl9upSqQM5k1kb7BynkK2
 Gnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QV66noH4ZAYh7QslZPO4nhQgeYZRL9ycXqAns2YTYW0=;
 b=bl0tUxMfKc0w6BPUcIyrjkU4K8q/z9c1VBZdvxnVd38GKs/BBPBYTwoD7IMuLF+ZDv
 p0gGdPtACavqHv4T1Z9Q2PpkT5YSJGq1ReeVn42TKcY09PWJBRB2cEFozpql7/7LmgmO
 nsHCm/vCWyi1pdi5BvJrvgNQsvyOZGK7IFuD6eufA/G2oG0I+sQsZ8RTXdba3qfJWJnT
 4yfBcLY6/v+Y96snfZZov8CAkoI2zSjgWqK3PGBiQ7UT6AY1BAqN91E6nNZvfZ5mxG+X
 xeSYAMPTZKzsJMl5qyR3BL87WV6pN35mz7Ej4+uq+9Any5i9kFt3LwEltVNWq08ScBKR
 wY+Q==
X-Gm-Message-State: AOAM533sTWw7w2r7eDRi3VifCR2/eO2twGYsNdHX093Rqt1BFf1IM72M
 XDV2nNIyQ1ZX2ff6AgfXu50pYOgQ3BcpVw==
X-Google-Smtp-Source: ABdhPJyjiTCDMRjeDHMoyCWBjrmN3koUggurzbjD8VtJoyDoUwr4WUKIVukU7SxcgvZvZRiI89MApg==
X-Received: by 2002:a63:a80b:: with SMTP id o11mr4943484pgf.162.1620422730048; 
 Fri, 07 May 2021 14:25:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id o9sm5914371pfh.217.2021.05.07.14.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 14:25:29 -0700 (PDT)
Subject: Re: [PATCH v3 18/17] tests/unit/test-char: Replace g_alloca() by
 buffer on the stack
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507171948.2062076-1-philmd@redhat.com>
 <CAJ+F1CJdbtJtHGAGALUROq0rwE0E9qRaeGoN10xTrffdkj2ODA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60643341-87a4-45a4-b7d7-cfa164327e5e@linaro.org>
Date: Fri, 7 May 2021 14:25:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJdbtJtHGAGALUROq0rwE0E9qRaeGoN10xTrffdkj2ODA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 1:44 PM, Marc-André Lureau wrote:
>     -    CharBackend *be;
>     +    CharBackend tmpbe, *be = &tmpbe;
> 
> 
> Why introduce tmpbe? to avoid some code churn? I would rather update the code 
> to use be. or &be.

There's a branch with "be = reuse_chr->be"


r~

