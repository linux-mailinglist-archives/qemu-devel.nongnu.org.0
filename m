Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942945AD1BE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:46:01 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAYC-0001BX-Du
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA2t-0000nj-G8
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:13:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA2r-0006YB-Ps
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:13:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t14so3607908wrx.8
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mjtXk1Y81iZ0Vjm8T2VMELAeLhVzdGbXKvEGZeblN8M=;
 b=sMSBg8+w+jjf+4JZr708S6FZlovoIGDRqoNVGm5oT0mLBJogblErY2vBxSvytGuI+L
 Rw9qf/ARuMYlktTI9BW5H+gMlAlWjYVwoQ0Lg8pCwIRzbUW8y0HDF4bkRvBrr2wBhBwo
 dS4gB+fNKXzi/NuFvp3cEL3bybPawAIqdrWXAeDjd+8+OR1stNc8Q6zd3NUILRO5tOLH
 4u+B7KP+h1JvIpK4f1j74BxOQSHbcAq9IKJD4K2+90NxP0E42QH9YxixVVq0uqDWUcO0
 BAzOvZEN5TCOUPIFLJ0JpT2iR3x3ujH1E/TW+jSibbL2qH5V/i5REWYKe64HgkRf1oWS
 IKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mjtXk1Y81iZ0Vjm8T2VMELAeLhVzdGbXKvEGZeblN8M=;
 b=5y92ZfKbSlDXmX/YmujKcHnzKYtsSp8+5BkOa13w19FJSpgkDaUAoqVbaGFZKne+C7
 Di0et4Q6pfls1Lrw9rusnFWaiOFmRwUFku61ak8LFZztlk0EeaQP3SkkSHDlRfzWagX+
 4aXQcReuVr+Fe1U6HH9G9+4AyWm/c1rk085I2lDWzyQcgjA7985SapqLzK4XFiSdEg0Q
 4nA4lWdJ+eecfHZVIAI1hKwKCDH/s7SBUBbFZ1bgFmjnPj6gEZBXFmx1vV9gBT8/c87+
 2xtICVyen+L9J4K36ij+pRpcT0/nvXz6j67PgKkC0F+npfo+44Do2Up0fKhGsvKGf29G
 EDbQ==
X-Gm-Message-State: ACgBeo1gzjiKKdwgM33wGBS9guVtSoKohKHyNMdy/UgBu1yOmI3Usi7s
 ZX3Jfg1osKGqrIe304G1TkQJ/g==
X-Google-Smtp-Source: AA6agR4Dk8KV19iDzsjLtJIA1BOks/blz0+a69oHp+47EYByxDJ+n6aJeRzHWAvoOqLyGhViuXdUNw==
X-Received: by 2002:a5d:6987:0:b0:228:623e:2dc5 with SMTP id
 g7-20020a5d6987000000b00228623e2dc5mr5129422wru.574.1662376416162; 
 Mon, 05 Sep 2022 04:13:36 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a1c4643000000b003a673055e68sm19987039wma.0.2022.09.05.04.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:13:34 -0700 (PDT)
Message-ID: <5761d683-1ffe-961e-5c4f-a64b9d4a3988@linaro.org>
Date: Mon, 5 Sep 2022 12:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 08/20] disas/nanomips: Remove NMD class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-9-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-9-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> NMD class has been deleted. The following methods are now declared as
> static functions:
> - public NMD::Disassemble method
> - private NMD::Disassemble method
> - private NMD::extract_op_code_value helper method
> 
> Also, the implementation of the print_insn_nanomips function and
> nanomips_dis function is moved to the end of the nanomips.cpp file,
> right after the implementation of the Disassemble function.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 202 ++++++++++++++++++++++-----------------------
>   disas/nanomips.h   |  17 ----
>   2 files changed, 100 insertions(+), 119 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

