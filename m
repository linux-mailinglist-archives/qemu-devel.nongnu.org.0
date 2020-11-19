Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F9A2B9D8A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:21:35 +0100 (CET)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsJ4-0004WZ-MR
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfsG4-00035L-FE; Thu, 19 Nov 2020 17:18:28 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfsG2-00036D-US; Thu, 19 Nov 2020 17:18:28 -0500
Received: by mail-wr1-x441.google.com with SMTP id s8so8007636wrw.10;
 Thu, 19 Nov 2020 14:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4kkr3tnTm0U2+luc9jZqIeiQYxn+vc7mrbDaEPZb6Vw=;
 b=vE+3RniXtdMj4AmcYXmfP3nZrFeazBHkxv130qOKqLnqClbe3i//Xgvuc5/8F+S2jD
 3Zqq9abx0djh0PiQIgv3wFk2n2XFbFbEE05irCR2gKIDZgIjSweamWT5clEyIMtcTxNK
 y9WrG5porUDeqjWYpEDOXhUvhdk/Zubl2ZRpw0tSDm6Miq5V1oyWb617jVHPBoX5srKu
 8BFTYd4nrTsI8/tYOGXYpFHTwxdXl3DvNe8S0x1SfyhjfHtq7k9K7ffR/7qzM6eWtood
 JwGj1di2M+MTxGloQeUOT8R5NUuMy+GA2kJOyB7gfI2xZ7tIcP5sRMu6IInTSAGEAA1m
 TLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4kkr3tnTm0U2+luc9jZqIeiQYxn+vc7mrbDaEPZb6Vw=;
 b=rJRe1+mPIZ5DQZQ3tuEY1cT+7HzUhencRHYYvMcS0slh0fStf//wA1NSYRgHY4dnQT
 E69fZzUzho6C6mrxgge91M0EY6GeFjkC5gVCL/U2T0gyINTmhgAZD79duomqyW8ammXI
 OuEisO7C7Rjb4aR7WId1UTEDUD+jVrdDU/NRTnpskBNf3mMCbNxmH+MxF7hv73uBT44i
 SDUukfR6d+LB2t6rdWit/7kfI0v/6txAhqz8E5JAD4TA/1uQbVQ/3HiN4nBQIYxSksRK
 0phi5bpJ2fN+S4CCI+I2pCJVR2vp695t7kU/qRfnkffLYJW2PdwpI916zQEdABrgGXyH
 xWZQ==
X-Gm-Message-State: AOAM530dU0Bk3ttWWL4cuFiNi/Nharh0gsxDdaKElwQ0tlO+Qq6H6Nbo
 eHpulNsQg/Y9Qr1qD2h4vzxkehBdwI4=
X-Google-Smtp-Source: ABdhPJyfq4UrLI/s/zaeW4ozC9lBk4Yfnj+QC35WpQtzmichx8P1qLht/WmfyQvnldj4DFbywG1csg==
X-Received: by 2002:adf:9144:: with SMTP id j62mr13159014wrj.419.1605824304715; 
 Thu, 19 Nov 2020 14:18:24 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id c2sm2213921wrf.68.2020.11.19.14.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:18:23 -0800 (PST)
Subject: Re: [PATCH v2 12/28] target/arm: Factor out preserve-fp-state from
 full_vfp_access_check()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b3b220a2-5469-41bf-4d65-5446613ac1ff@amsat.org>
Date: Thu, 19 Nov 2020 23:18:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 10:56 PM, Peter Maydell wrote:
> Factor out the code which handles M-profile lazy FP state preservation
> from full_vfp_access_check(); accesses to the FPCXT_NS register are
> a special case which need to do just this part (corresponding in the
> pseudocode to the PreserveFPState() function), and not the full
> set of actions matching the pseudocode ExecuteFPCheck() which
> normal FP instructions need to do.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 45 ++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

