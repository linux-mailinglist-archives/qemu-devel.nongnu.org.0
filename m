Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84E4005BC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:20:45 +0200 (CEST)
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEk0-0006IV-6x
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEce-0001Hk-Jk
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:13:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEcb-0004eG-Aa
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:13:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g18so94504wrc.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aOkvcPJKs8rTvClyB83d3CzbFnqZ47KXj4HC+vkTlPg=;
 b=LoH3SZAbqBL+HjISumhau6zEbkRisn1HiOqzt7p1WJlXbRE7/9JNoggqVqEQKo9pAo
 0InoMKaODj4VI4sAhiuPLkDccmDyLr//EQR0PCn/Gh7AgsofiNsufm5FAYs+xU1RYxZM
 KNSOnBfsmCFOjaBtzgFF/s6bRFkfmNPEiutCD4kGoEIGL2E/xgyMBR8BhpVUmz3psDzD
 JNpgMunm54z1k//vIgSsUxS/1Wb6iumw6KP17oM14OKC6etzuE5FeG+Z0dIV5Ew+V63/
 9MLDCG8H28ejFsV5Xf5qeIu5LUjjRWSua/JPDTXFxK5Y6zsrYkdlBugFKjc6uUBFES/2
 RQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aOkvcPJKs8rTvClyB83d3CzbFnqZ47KXj4HC+vkTlPg=;
 b=n2TggVAYJBok6bmGYAeIRZMeldfYXM6sLQt+dETb6W//z1fiq/dcvfYsBQ92j8+gUu
 pifJxbriT6YV7Q5KtCxfI/e7aT38XMzcVGbkOj6o9t/ptFvgP7tIwmxzsTzNej0UWPhh
 u7d9hj4zk6HAEvFk1acO4rvgNrDCAnVJU7NLL24BMORycNoQIn1VsYeRXSD4Xh3CdQrY
 97oxU7PJXvcx65Sm3g7aKek547bFmzZrBWuPOheTU1NbA+EOGyJVIdhxsDaTcmv0/6Nd
 4hK/GUevHtvJGTY8Si2lJJshQvz0Fq+z5e16etxvosMi0Tl9oqLqfSSQLFo9hHix8kYt
 Cl1Q==
X-Gm-Message-State: AOAM532rub49kOJtLwPrOAmso+YeQPW3X8ekF9hqXhcIkGYeLRkUqF6n
 a64roiNc3mx6DtwVq3cn/6BOpw==
X-Google-Smtp-Source: ABdhPJwU80sWdkTRmCJKkqciFLW1rBMrv9ismljl00TOqyOS+d2q43fIHb1y/YOR3UUndafDUD6GNg==
X-Received: by 2002:adf:9f4d:: with SMTP id f13mr585024wrg.169.1630696383359; 
 Fri, 03 Sep 2021 12:13:03 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s12sm101369wru.41.2021.09.03.12.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:13:02 -0700 (PDT)
Subject: Re: [PATCH 09/24] target/cris: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60569544-417e-9652-7a88-7ccbdfbc9696@linaro.org>
Date: Fri, 3 Sep 2021 21:12:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
>   target/cris/cpu.h    |  2 +-
>   target/cris/cpu.c    |  4 ++--
>   target/cris/helper.c | 17 ++---------------
>   3 files changed, 5 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

