Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB4D3CC823
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:54:56 +0200 (CEST)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51dY-0005N4-27
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51cO-0004fX-6H
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:53:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51cM-0006R9-KE
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:53:43 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso8463770wmj.4
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nSMZyzlDb6j39rJLM1+5tlhOgBKv9VN3MO966aMMI30=;
 b=YvMqhGhboT0ME/kV8VDFej6uWFTZBMDIwxGwcNj92a5HKgaQwYG56UzIiQFDHk0no6
 mRJ6FY+tigf5f9l6PzpUpn3gNLdQPmAyeTkYzydCw3tvuOI/9TDP5ki5RZnFIOn+Uzt2
 JWkvB/B7/T1NryN3Yccb7Qxur4LQZVZcGSCJEUaArGyUKPKCKw26coVyOD9Cu4wluo8P
 XYdfQEgX9OAb7nMDNXoCN0coJlDWjR1r+dERho6WrjNBLL31/mQQDoz9w/RfFPw91oqC
 hcUskivKjWpOXu+axSNv2lMY29/FjsKm0ECEVvd0VEP4Em+kv3wrTNu8Ii/28HCQ/flS
 W/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nSMZyzlDb6j39rJLM1+5tlhOgBKv9VN3MO966aMMI30=;
 b=FIbOqQUwGqcK6QRVOREa1Jp9ghr0oUqHRJk2vKYUXSFSGHMF/8WcNRvO0LLYN2l1Tm
 p+oe4UmcAYPfyZz6PXSHQQghySjzq1I58PphwcQ1Ahq4GrTe0ixxUfIXF2XBWEBNbpFw
 oTQGcmZBalk74f01v4+ItjhGfCnAEaj6nMpRBjKyzvAlCFiGJKbQagOgEAPL2s2eUVQ/
 2WqOh0mJ4V3E0PI6rXTFpBCgMgCUd4O+LTAacRdHtFgL624HGvEybHeI2vxeogat05Yb
 z7qUuoiwTcb81l5Yo1V04bcYVKRWEjIANNlPYx433BUNtws3jqL2VPs7a4SuiTBNh16f
 312w==
X-Gm-Message-State: AOAM531wX9ihkt+LnfCcY9HsaV27DtIj3m4dmqMmP6isRe1aYz0078U9
 QerwBi+v8G2Ypq24WsvE/VM=
X-Google-Smtp-Source: ABdhPJxNdcEaEne9nnYmeJEzV3kyPOUkVOeIkE1ZhKoXX9Kuo1N8VPCoHZKNttv2Mn3xlLGb4Ag6CA==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr26371961wmd.68.1626594821189; 
 Sun, 18 Jul 2021 00:53:41 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id p5sm12641644wme.2.2021.07.18.00.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 00:53:40 -0700 (PDT)
Subject: Re: [PATCH v3 09/13] target/mips: Reduce mips_tr_breakpoint_check pc
 advance to 2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3c9829ba-6632-c273-8310-1bcce1726bdb@amsat.org>
Date: Sun, 18 Jul 2021 09:53:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717221851.2124573-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 12:18 AM, Richard Henderson wrote:
> The actual number of bytes advanced need not be 100% exact,
> but we should not cross a page when the insn would not.
> 
> If mips16 or mips32e are enabled, the minimum insn size is 2.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

