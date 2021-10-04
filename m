Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E342242048B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 02:39:46 +0200 (CEST)
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXC1B-0003Sb-FL
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 20:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXC0D-0002m8-NR
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 20:38:45 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:41526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXC0C-00088z-90
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 20:38:45 -0400
Received: by mail-qv1-xf30.google.com with SMTP id d20so2054869qvm.8
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 17:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hQrxjRzosdihSUbQ8JsGR7Wa7mhv7JAQcV9EkzzV4jI=;
 b=WpeWAhyGKmxpMR3oHYHfWJYsb8GoiL0F4sja37PhQEEi16vkAxUq0W3eVa3gBuqMFw
 w0yjKVId8pms8F6aY3+Bo82gTWAM4WUZP/AbTntFo0ptSHH8oWMtprzpYg9ooG/1MoK+
 nzt+SblFKe//mMveJZwkSoGS1xT9QyDmmGIFnQlBJVP7FId86lDX0qO9bBsTa9dSgkXC
 rurwM/MQdrrQs1C4vAdkZ31AXajJ/yyO+aFgX2fgzUd0qF4YdZ1FBJF+vODcs1uiyhf+
 eix9kyTnaNBfFsQGSDUrY7P8ya8lXqZQ1mrA7nJ57h7AcFMk6Prk37RzpJmnhQp5lSHH
 xLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hQrxjRzosdihSUbQ8JsGR7Wa7mhv7JAQcV9EkzzV4jI=;
 b=pmd0pmo/volM2O26smWnswj3et4wGjTvtJUy7QenZmb/CWo2631FIGdqqvQ9DIrATo
 U7pLSendFjqrrScPs+s20aFo8B5GXN9ToC1zDotFNxiv0LN9NZoJqy+e4ui69RuAgFPL
 qVmXlGFYSipUFHycqO0It/H2UEMmRB69NhNUYtGg2aICSt9GiyovJK9rSPy4gv5dc0xi
 YqHiSRpixyTBffNqCuPKsMTuz2VRz8xSK8OtCw1Q+1wMhTcuACO+lSG9lhUQfQiISpjS
 JAO6dxOluWYxZIdj2Y3L3MR8zXakcThbv+cbciJfkZyBjLif5F2dJ8SwNcOb2Jr6mmuQ
 Zoig==
X-Gm-Message-State: AOAM531GYrbxPrapUQw//oz9mVCCce8gd81WUNh2H6/Sa4Az9jc4Sc43
 fs9AxmWpG0tH0azzeQ9vFuDD2Uto3QVbAA==
X-Google-Smtp-Source: ABdhPJxMWizxR79bPQe9YV86QjUbuV7AG+Kkx1KVcsoKItYmwpGSl7Du6y80L4ADA4SgeXLeLIPwRw==
X-Received: by 2002:a05:6214:11a8:: with SMTP id
 u8mr4850358qvv.14.1633307921763; 
 Sun, 03 Oct 2021 17:38:41 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id p201sm7022340qke.27.2021.10.03.17.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 17:38:40 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] tcg: add dup_const_tl wrapper
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cf0729e-dabb-0e29-d481-78186dd03681@linaro.org>
Date: Sun, 3 Oct 2021 20:38:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 5:42 PM, Philipp Tomsich wrote:
> dup_const always generates a uint64_t, which may exceed the size of a
> target_long (generating warnings with recent-enough compilers).
> 
> To ensure that we can use dup_const both for 64bit and 32bit targets,
> this adds dup_const_tl, which either maps back to dup_const (for 64bit
> targets) or provides a similar implementation using 32bit constants.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> 
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

