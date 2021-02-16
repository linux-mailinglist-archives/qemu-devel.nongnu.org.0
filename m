Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0F31CCDD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:25:26 +0100 (CET)
Received: from localhost ([::1]:45518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2E9-0000Yv-Ep
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC2Bx-0007bS-Ce; Tue, 16 Feb 2021 10:23:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC2Bv-0008Nv-1p; Tue, 16 Feb 2021 10:23:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id w4so9416064wmi.4;
 Tue, 16 Feb 2021 07:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Uvp0YJqe6swKIinp6H5lcVQioEW7pHnMTKuvCBzS6nc=;
 b=uVZhn1SnGBgI+QAd8iJ8dUYqBy76nfJMV8WGCFQ0ShB7Vn5xdyXEeOBDUGFiTxR6d7
 bqYC6jV5nBpwHRFfd+8Ss+h2tNnSa6ZNgjtUHF580H3h1SaHd8eMI6uL8Qp/FIKWKMtE
 JY+bW32n1thoEzG5LRiLZ79qeely5GwyCNAaJT6nNR04IyeqnAWu+f+ysikABZd90WVj
 zOHahRw2sVQJSz3UUgDIiwv54sbGrOXE9eqfbwpO/r7UNfdZXXm2HtX3YVbAj4b4XoTU
 PHRh2Gzzv9kmXGJXV+yAxEi+dIGGwjDKJ+6MXEzad011cjqS1hxHHwZ39b8qi5fodc6I
 fwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uvp0YJqe6swKIinp6H5lcVQioEW7pHnMTKuvCBzS6nc=;
 b=bIOtRC032Rp10Hqq6ZcusMNRyB+COKW6T0uST95X+OuuPLOFfNCcDQaUdWUJula+5g
 hr4DoSX7tCcKzrttNJXbX7IiEJJyw3WXLXAbne2DfSiWXR1r1EqNZKAt+unKXY9SVf4I
 YTWGYSHyW+39g1edMAjF0jKWdd8pUcAX49qJ7lEEANW7PCGj/gPCUMl68ajO2Gk/X64f
 v5hdGzRKxRXaNF4na0t4dDkiRae6F1nG6MrzalcIsLVQ25trq4Ce9X6DCexCj0UteLSW
 pGKR/lbtC0I0ocbl9vGnzVLEO230hK0CvhJwTr8Y3y4JdCsIVEQq4i80sBx1DOTBf7OX
 HQXg==
X-Gm-Message-State: AOAM532Ut0076cPXrcOlSHmuCa8s5fTK/Spk+OiFDZrmKutWuhsTBc1M
 B5dfHb0fxY7WjQAMpjlJR4c=
X-Google-Smtp-Source: ABdhPJwSgiHhQpFRa9nb58D6g2x8YEd8l14F/m7AMbUKPyF9qZGrnijirKL2Ea/Bqy2B5qWr45l7Uw==
X-Received: by 2002:a05:600c:4f56:: with SMTP id
 m22mr3793671wmq.143.1613488985122; 
 Tue, 16 Feb 2021 07:23:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o18sm3680729wmp.19.2021.02.16.07.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:23:04 -0800 (PST)
Subject: Re: [PATCH v2 8/8] hw/sd: sd: Bypass the RCA check for CMD13 in SPI
 mode
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
 <20210216150225.27996-9-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e9328f47-62ff-771b-bbd8-ccdcbb692632@amsat.org>
Date: Tue, 16 Feb 2021 16:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150225.27996-9-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:02 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Unlike SD mode, when SD card is working in SPI mode, the argument
> of CMD13 is stuff bits. Hence we should bypass the RCA check.
> 
> See "Physical Layer Specification Version 8.00", chapter 7.3.1.3
> Detailed Command Description (SPI mode):
> 
>   "The card shall ignore stuff bits and reserved bits in an argument"
> 
> and Table 7-3 Commands and Arguments (SPI mode):
> 
>   "CMD13 Argument [31:0] stuff bits"
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - update commit message to include the reference in the spec
> 
>  hw/sd/sd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


