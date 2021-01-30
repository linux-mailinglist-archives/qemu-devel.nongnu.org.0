Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ABE3092A6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 09:57:21 +0100 (CET)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5m4G-0007JR-4Q
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 03:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5m37-0006ra-Ru
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 03:56:09 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5m33-0008Iy-LG
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 03:56:09 -0500
Received: by mail-pl1-x634.google.com with SMTP id q2so6816998plk.4
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 00:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C2bOc2Bhr8hHvPh3nQ8c2KL5UniouQWMfO1ZuhuQ9bE=;
 b=SJSPwOh5SnOWniuk81S2iT+0VFjn8d/RnB+SAXdy3e39Ez/K+pjjEJ2r/KCK51CckK
 F2Y+f7K702B+Qjy+JRzP3GtbOag6v3B+kg2fZiEsxgR0rsRp/MqhybPO+ef1IWbBFXv8
 A1qRIZSYRpPQNWNvnkno8oIHL4/UH3FUKLvD6oKO3XstL/nSaur/Va/8uGZ5LIYEXq2E
 mEWEEzyd4NpJHUg8ZoFQD2XHxW1svFCtcFFPwZML4zJQxhGdAdb2Ga8FQ6ljghAjZ+MD
 Gtr6SWKydrHPeXMepGvDzQujC6KL4ih2ybE8voTp/8hpCS2wnXoJx0CFB668AWN9q6LB
 KTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C2bOc2Bhr8hHvPh3nQ8c2KL5UniouQWMfO1ZuhuQ9bE=;
 b=Xf/O71ZSCDxoq97U6AqtCwovPFUIt3J/3edAc9nNJezbX/wH1bxjuoc2qNFhs8P/t7
 YFr2UipaciHTCJ5JuP6OKrz4yOKBlacX3NYj9YcUgT0vZfS0TOdDBXiFjyFI9KEiaPX2
 5m7/S+u6koromy5PzgxEkzYUMNsTJqcy+eYAkPprjmDWkPUOWjpucdecg5/AsDYFuGz+
 nfIVBJ+GfB7AicTIvjOMYdGpI55zOTK62PTAiYFcSTiZ+Mq2UQaU3XFQlZmbVXIMqvcg
 m21mK3r2HQSIYxd/kNLz4UOerWRjfdzsYOT6DKrdAL+Fh64E+UVmsMzJRj1r3ALUGoMS
 FKQw==
X-Gm-Message-State: AOAM5305XfJVJ6XWcK2trjwmBIOf+j3TAzsEyOIFqMJkflFY7jM1ite7
 LNXZwBlsesIjkIeCnfr6ggtaTlVZMlstYa+Q
X-Google-Smtp-Source: ABdhPJzN0JeJybFAtJyhGI0os/enXgj3hZmGP4af4pzXEa+jLMGEbsk1Lr7ld7VPC6zPzGKsbKg4XQ==
X-Received: by 2002:a17:90a:65c4:: with SMTP id
 i4mr8133288pjs.132.1611996963758; 
 Sat, 30 Jan 2021 00:56:03 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 67sm10880090pfv.20.2021.01.30.00.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jan 2021 00:56:03 -0800 (PST)
Subject: Re: [PATCH v3 02/24] tcg/tci: Remove TCG_TARGET_HAS_* ifdefs
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-3-richard.henderson@linaro.org>
 <CAFEAcA-Ez=3Xv5jVei1E3noa20D17_Uz_HFOmXK5Ek_p0_dwkA@mail.gmail.com>
 <ce10459d-0dde-6a1f-2efa-5643ebf2931d@linaro.org>
 <a0bea30f-4477-14a3-2576-2e3d549e456e@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfaa96eb-df71-d8f9-5a40-91648d46c46f@linaro.org>
Date: Fri, 29 Jan 2021 22:55:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a0bea30f-4477-14a3-2576-2e3d549e456e@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 9:15 PM, Stefan Weil wrote:
> If someone decides to use TCG_TARGET_HAS_div2_i64 instead of
> TCG_TARGET_HAS_div_i64 with TCI, that lines (in addition to the implementation
> of the opcodes) would be needed again.

How can you know if those lines are even correct, when there is no
infrastructure behind them to either produce or consume?

If someone decides to implement div2, they will have to add the whole thing at
once, not build on piece-meal stuff that's been laying around for a decade.


r~



