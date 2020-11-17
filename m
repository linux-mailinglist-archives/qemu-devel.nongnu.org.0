Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294782B6EFE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:44:06 +0100 (CET)
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6tZ-00026d-6q
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6sC-00013g-FS
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:42:40 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:50435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6s8-0000zA-6Q
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:42:40 -0500
Received: by mail-pj1-x1041.google.com with SMTP id js21so1036208pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yI5JqCPS5RgKI64igo2ind3oyCXfj1mIIYdDl5pk/IQ=;
 b=sMZqbHlbBhDs086yU+2SP0ID9jvYbMqZTMRZxve8NXzO1HtUe7AXvm13MxPu8aB0Yy
 XftNAkLXn0QItOTeTq7wJ5aJIjR7Lx2c9K/llyOKAZhteHHf1SQeXXiZQ++uonsk/z6J
 vIMTe5xtvUgeZK8xMk5PGwHjwTaal5JBSKYEZWGhFOLOyaEgxk5M5wb1Oh6lgKp8rStH
 cwoXOX2gEyLR/PGDpSR1+HdezfMJ9KZ7SdVAMeR/ih5wqDD7Oe96G3bIw41wcjuMZspO
 V/2d27v+QSMELjpObTSEAP/0KRye/E61OadyTChgNPjOEKum3s+6YVA+8Xu6QnaYayXW
 Ax9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yI5JqCPS5RgKI64igo2ind3oyCXfj1mIIYdDl5pk/IQ=;
 b=Lk+UOwGJueGrWdISlzDXPP+MqqyQzzicPKyETJDWdRw8X/K8ClTTbNYfjLYKNXfQ73
 aptZi3yLBRqZDhrsIhpS1mCyJnQ3sy+0PpmYmwM/0C4/5skdP0aGh11qwg714fDmHcfD
 +paRZuXW210dpzCrCQv4XlW7/yzMVlYJePk3/aSpHt/y4GTO2x/qnz87vIrL8lY514yr
 hmfNgr0ecehnfa93jgwYootjsKl5BBgr9+XOBjN2PXAfsJfVIO5tmKHiN2Vu8yEKCL0c
 aM55e6rf80MFtinYgMtaKp8rVm8J+ucX6n7iT6zxQtWbBiASFgIMjpbfpxcRk9aeZCgZ
 mvOA==
X-Gm-Message-State: AOAM5331WXY3Np9yeUpWIjDaf4KY2d/tCuzQxbr0baKtsj0CJFE++a+W
 Hxc2z8wA0UCOp4bgV4qNxE4gm1NLvdflGQ==
X-Google-Smtp-Source: ABdhPJyH5bLTyQcWdcJWcGgrPzQ9Rd7/mpTlaZ2TM3QcR+b1I1BHVPS/3fy5FJ9v5jVQZcJHSEFz0w==
X-Received: by 2002:a17:90a:7343:: with SMTP id j3mr621656pjs.51.1605642153996; 
 Tue, 17 Nov 2020 11:42:33 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a18sm15240699pfa.151.2020.11.17.11.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:42:33 -0800 (PST)
Subject: Re: [PATCH 06/15] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d5cf2b31-0eb5-8147-2104-93b0c4c54b9b@linaro.org>
Date: Tue, 17 Nov 2020 11:42:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:08 AM, Peter Maydell wrote:
> -        if (a->rt == 15 && (!a->l || a->reg != ARM_VFP_FPSCR)) {
> +        if (a->reg != ARM_VFP_FPSCR) {
> +            return false;
> +        }
> +        if (a->rt == 15 && !a->l) {

Alternately, the parenthesis are just off:

  if ((a->rt == 15 && !a->l) || a->reg != ARM_VFP_FPSCR)

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

