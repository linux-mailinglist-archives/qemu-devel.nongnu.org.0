Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE65B4005D9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:32:29 +0200 (CEST)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEvM-0003gs-Rv
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEmk-00077b-B5
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:23:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEmh-0004zr-EE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:23:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id q14so159863wrp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ldBvNt8Gk/8FMytYbcH/BX1QrHuLB0k2DNw7Jz0vniQ=;
 b=e26LbhwA8iscP6BWFZ9FFnpq1zmSGFg0wJFZ2NidkSRm0CDTWjxHJtDX6vQbCMl/2r
 qMb5gwsTNFWTrMQwcPuTvZQgldAceh6MNB21h1O8xU/IrTORcb86tBgMgS2QQOGKFf+t
 IVBukE9Ii/SABkBGbVSrGt+J2vg9k9liA5ReDsrSSFsibzdL47wIjY5XJMXufJzuj6uQ
 YeQnA8o3R6O66Af2Z/wTY5Xb89RbXDXuD9ZtVlLfYuNleM3stM7RONTyzvqu0rqIyinP
 thQN/e7Zp0dIOuOsOrVa0BXWS+Uc30k/v2dMfBZt2WIabvQ5KNnfSuVum81y8XAzDIy8
 5Smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ldBvNt8Gk/8FMytYbcH/BX1QrHuLB0k2DNw7Jz0vniQ=;
 b=gHvnWx2i1De7dJMvuivM1y2LiibQORJg5T1Y+UG6R9kqZuz+oAtHPDByJTwwi4GiGP
 PeemJ4zkhugctF+MtrsbAXnNrS8X9Jxy1XsbM/Nrqa20YIFM4jOrNmZ9Ake2gJzb9AFY
 tLeW6lYGfep56njQE3XRt36FyYf47mEr+EXNAoE9VR1JBSkU6DYvrs7FsWJ3D9dsLM3g
 L1CZeHTZfwGszmn2Fi7uc0bfnaTd09td7CCFZtCyu3TmOXNqfbqjU8Lp9OkiyeQ2g9sA
 HFMCHPeAei2Zz89ycYY8qf3A6395Up2+lRIcsDRGEV3CQqm314Czrnbhup373eWdPaaG
 a8bA==
X-Gm-Message-State: AOAM531iCvrO4/Li5+0zaIlyNrLIyy7LcaFG8H8SfzKsBzckiBBUHlDY
 lt6X7h+w5rIdSi5ny6sIfU+4sQ==
X-Google-Smtp-Source: ABdhPJwQNxucDHobXN2MxoPwF0ibBF1KAZymqJBM1BD9PVrhyD1zNdUEp4qnWAs3Rap9CwQW7NWKpw==
X-Received: by 2002:a05:6000:10:: with SMTP id h16mr687491wrx.24.1630697010062; 
 Fri, 03 Sep 2021 12:23:30 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id u8sm241594wmq.45.2021.09.03.12.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:23:29 -0700 (PDT)
Subject: Re: [PATCH 21/24] target/rx: Restrict cpu_exec_interrupt() handler to
 sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb5dc779-b21a-acf0-9be3-3003331ae330@linaro.org>
Date: Fri, 3 Sep 2021 21:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
>   target/rx/cpu.h    | 2 ++
>   target/rx/cpu.c    | 2 +-
>   target/rx/helper.c | 4 ++++
>   3 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

