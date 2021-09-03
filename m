Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCD4005D0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:27:50 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEqr-0004nm-Cm
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEik-0006RD-8G
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:19:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEif-0001P9-Qp
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:19:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id g18so114445wrc.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B2g8xr6ORMvXj7zL/agIvKeijRHqKaWp1feA3q2tJ2Q=;
 b=HTZJSYdCYVcWzWgpyaFzoRVqlWweDFYNI8v7LCQcNqDS1sIkwWVt46k9HdpR3nk4eu
 rppyZnEWib3ZC0lKRXOPUT84wDV28zkhITv/lhlnWQiVfCHU5RkFOK8wZ6WAk3wzdm1A
 0SqF/+JuYO4p49YxOG2YaOJUWiFPMvHCtziFalpeh/5jAjapqXZUwhnAIeWICAAjY/ny
 znSJwKCfOY4inkfaoPxWYg+eezoW1OEcMADSyEuY4T9m8mpLTHJ9+t+sby4eIKiwwHmo
 jlvThXw4jqfGyNOyY39Gtxh5festXfctGOpfiJcbKnQaoVdRonpRgJS+L7fxoS6DuZvs
 nqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B2g8xr6ORMvXj7zL/agIvKeijRHqKaWp1feA3q2tJ2Q=;
 b=o3WLwhclrEHGdxcvo0dJCyDnQr8tMblnX8d/USRC6MfZqby9evOQ74J2Y5OPBRYrCc
 +ScGrUdhrwNm6qzMUYgxnPH/zsothBsxalRSi/XApOG5/dSw+wYpiJCnqA0OPcjm25S5
 gdMtfZPQQ0mOhbWRAjsuyNmONUiHG3jwAz+YH6Odr0dA42fK8GeJL1eNoP0dx9kwXUdk
 huBzpgyCsaSGWWDtsI3xF9VYuAwn9WwDCw8MYM16tGqdqY8x1APyRDdBGd3CyDCVxAWQ
 +jIxV61QUjJxeXjTX2fZNZ9zL+oEq7CBq6dhNrynXs+5z+fGeQVYXJqzI76Zg09hx5SK
 dviQ==
X-Gm-Message-State: AOAM531rLZEjsn7Wf7nK9TT3gkz6Anu3dLGfjWZ4HrHvutoThDhR5KfK
 YE8Y/Rx3WH0NfA7dCOiajhqVfw==
X-Google-Smtp-Source: ABdhPJwN9dPGN2NgBxf/WtDjfoLoXxP+BDjGEicwTxo0YfqAqkxnp3Gq1RQkyfW1p36ht1QAi2Ah9Q==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr642363wru.80.1630696760130;
 Fri, 03 Sep 2021 12:19:20 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r25sm122511wra.12.2021.09.03.12.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:19:19 -0700 (PDT)
Subject: Re: [PATCH 17/24] target/ppc: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42c8e86b-64fd-05d0-cbdd-c47558986b64@linaro.org>
Date: Fri, 3 Sep 2021 21:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu.h         |  4 ++--
>   target/ppc/cpu_init.c    |  2 +-
>   target/ppc/excp_helper.c | 21 +++------------------
>   3 files changed, 6 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

