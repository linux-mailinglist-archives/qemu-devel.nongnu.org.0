Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8B3B94BF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 18:38:53 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyziG-00022I-7G
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 12:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzfY-0007L3-Oq
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:36:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzfX-0003Rg-Fe
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:36:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id f14so8668465wrs.6
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8uK+uYqa+TcsnCmIqev5MkA25KCszcqIIgvSWpWSquQ=;
 b=uTQx5BHZivnyJOApGSodMKdEKkPnpSFsC0Ie6veJmdOVZZSMxgDWWy/PguKpA9UVzM
 EDzMDCJd39jpLX85m0QVGIRDFi+pDQGgDc83MCaHERIlJuqyKQagPZUm8g7aV7IEZYXB
 G6QED7LyslYvCCmKPFZzsGEtDyYiQnNPlePyMg7qf1w754ge9+hBHsN3IsLwD/zyxugZ
 Hqa8QHSo2Wqq4iHQHM5c+TK9VFkNGsPU0RuyWGY2bTHusV5Bl7vHaOILoNRVhC9bemMV
 iMaCAkDKFaUt7cXJZUQGqikKV95ADd+NRj3c3Y677VxUpAZcjZPKUf4iT7oITm66SgdC
 QD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8uK+uYqa+TcsnCmIqev5MkA25KCszcqIIgvSWpWSquQ=;
 b=IjqOICon4hFpGsJ0gB6E23l+4viVfHbEq3sfBXJ5W4Ax9ZElMRbcxcCVzJvCR0Ibvy
 yngoRFjh2ZvA+9tNdL2HRq6J8whN2suiM9Etl3DmZQEOtQSx15d3Lhgef9kdzQuLMWsr
 o+4vMtoJZHU8Hcy51xnAfnojaDF0/zZgSXHOQ7HnoTZ2Nl0v4s4ZCHixvbMZQr9PlvnD
 nAzj1QJ0z22wZ7wB1puBNSeB86kxX76T2vcEKoNRaAzoGDvG4PHMmhgDMrdbayNB4jwL
 JDLVuQT8X2SYULco3bMHZYU3Zeh969CbFC5hgWtW4yfw9ZqFQKWb0mt7NXiTHqzZd2oT
 vprQ==
X-Gm-Message-State: AOAM533SwSSSkBQVaCoKgPkcPX150J9l6uOOexP1UZbNLIwbk5qkKX1i
 SOQ/8g497oZdgwZa3P96+Fo=
X-Google-Smtp-Source: ABdhPJwxPAIDPCXmTR8+nktRmgai4PCf13LDYgcle9s9Whr9U80XJnTH/5VsA5onAbmnRQyLgqMvOQ==
X-Received: by 2002:a5d:4482:: with SMTP id j2mr631152wrq.117.1625157361781;
 Thu, 01 Jul 2021 09:36:01 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id o14sm2856224wmq.1.2021.07.01.09.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 09:36:01 -0700 (PDT)
Subject: Re: [PATCH 05/17] accel/tcg: Log tb->cflags with -d exec
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
 <20210701152537.3330420-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0be67c7e-052a-aa71-cc2f-351946f12e26@amsat.org>
Date: Thu, 1 Jul 2021 18:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701152537.3330420-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

On 7/1/21 5:25 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

