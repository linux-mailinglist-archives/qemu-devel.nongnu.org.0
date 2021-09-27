Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39DB418D33
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 02:05:46 +0200 (CEST)
Received: from localhost ([::1]:60066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUe9R-0000hu-OV
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 20:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe5G-0005aq-Vq
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:01:27 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe5B-0004il-RX
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:01:26 -0400
Received: by mail-qk1-x72b.google.com with SMTP id 194so34677263qkj.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9yX3G5MO3WOc3sa4I0zjvA/EJRZ8ZIsiw2EFuadeA78=;
 b=XUlALkJskX8gxJN03Txn8wJWiN5VOsgDfSZyhP/ackK4xE+Lho9ZTb+QBamTFdcQRG
 hM8+CqiDBJ1g3ENNSAZNkMZvvepHx6Dc/S3fpYfAOLSRsrND07h+7Xcy7DRg6DNCqcB7
 Qq+0yjVqi2OujgDdhMRZV948syucUWhNCcW1Ybm/G0OIH8bWGO/qaXbd1sxzEpJIR4vm
 VNuGMnYIM04xF/DFTNzPuE5+w3TL208RgU/bQlPEeIxY4fN5RoaGQscWwc+weFYGmtpt
 XoKVmTTIHdFo29fBBXz2IzfaKCq37PDev928caRxeOPXeY9RPizCaGTMQd7TNieMeFGx
 Xd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9yX3G5MO3WOc3sa4I0zjvA/EJRZ8ZIsiw2EFuadeA78=;
 b=DMKNIfdDuTnFezw2toDQ7kkMjSCrujH0VqvsPKng62G+lNLqd5MMKqlCfsVJc1zmzg
 3t9mYjbwBqfSFjHOd7e7fxfgjZcmL2ziofaoZ4wJqxiSjqbwn0v0dDzmcf5zkc1EGuKo
 iOI0vrEyE8hxfCWNkMT878yAbl4cUH+UySETyk31OGkhVxsq4nwLj2EOWKqPy2hsrd+r
 lfTYXkGB4f7xJ+eyGlE6/5e2Lc8VprbaSQiSvqqR2xzNqI3yLOClO/CWjWShLZdABTvw
 8QI17fgrKR3dWKx4Zgek8PeNKr2FrHH1PSeBGAdJ9uIjAOkAZOM/FLKyrPUIlAaHMHLH
 Qw9w==
X-Gm-Message-State: AOAM530dY+LRBL4f7XP2lfGSZy1++Ukp7yl8NZLugnX2/G88qsLGF5e2
 v0bk20U450Lw4JJnjY/eGVTra2skDuod2w==
X-Google-Smtp-Source: ABdhPJy302x8bjFl6NuBN9wPsF+c2RANIaUJWx2d7undlfDdwMYoQEjg3SQOxOUFbOJ/SH/TWA8eAA==
X-Received: by 2002:a37:a051:: with SMTP id j78mr21731293qke.50.1632700880756; 
 Sun, 26 Sep 2021 17:01:20 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id h68sm11781457qkf.126.2021.09.26.17.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 17:01:20 -0700 (PDT)
Subject: Re: [PATCH v8 09/40] accel/xen: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94f4459f-2865-bc90-a66c-931d7b65700a@linaro.org>
Date: Sun, 26 Sep 2021 20:01:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.478, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> Since there is no specific Xen handling for cpu_has_work() in
> cpu_thread_is_idle(), implement Xen has_work() handler as a
> simple 'return false' code.
> 
> Acked-by: Paul Durrant<paul@xen.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/xen/xen-all.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

