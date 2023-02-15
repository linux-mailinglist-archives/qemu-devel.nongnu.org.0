Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A5769844F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNIh-0001Um-8S; Wed, 15 Feb 2023 14:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNIf-0001TN-BJ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:18:41 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNId-0002pM-Po
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:18:41 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ja21so13667006plb.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NpZkCBfUr2tX5zpsvIOd8VR3NDsFVDqLkB3iUKowwQY=;
 b=x8MgpduzqDNMzGcM/F3lr+pOTJxt4d5emrnC9/KxgNrwP7I3rv992zI36j46Taymrn
 YnwOymiGboHbImgyJcX0YMy2tF1I5FGIw8/nXdyZcoCZztFh967rn0hlqHh1ZBCVkAso
 CcFjNysrCjql7vZJWjBRIfLrys/D0hnnmCyX+HfxcmU7U7tCoUBBiUd/ZjTUQ87y3D/C
 fhqPkM7lENHUiiDP06CF3Df9BrS3Tdp3VDHqBMNn7SXsFZzSYBUddmJLz4bNaJm+91Nq
 FguyIbF/x3QFPebH4hZPVkY/r/owgksY3Fxi6IImIfamtDI3sfqY9fUgppr3Dng/RrGE
 EKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NpZkCBfUr2tX5zpsvIOd8VR3NDsFVDqLkB3iUKowwQY=;
 b=SopQIdGXhj74S9FVHe+yuMw8Yp+c+FPc8HEg8jrHhpzI5xhZblZpFc7A0Q7qfkor4R
 62JQgnDGSsdqoYJv5botw/Re6S9lTGgxQIP71KyGVhkGwpmEaZ2CnDjAcg+FQQdq+nwB
 gZyCO+z60Ag7PL11RQAmph0Btjc1XVXUjnH0Jp1wWiqyKvyZ5HxDnO1wHWztnqhVTcrn
 1YtlQqltPIPHKAWWuzdUCFMjxTCDTDLHdmtdH1/aKCnsNrjFWvSsPOFTs+mSNp016WQA
 0Uuc7Xd06Pk1Fwujui7Y+1rq0yChmo+oY5IAgRmJUR81qi3e3n8C3YhCP5w08L3MUH3/
 JhXw==
X-Gm-Message-State: AO0yUKU8qp8uaT4p/bSojE2MproQ4I/px9AWQUIYtVoHJCbg359SIdfn
 aFMxxp7FNcjm3P3/n594THEoQg==
X-Google-Smtp-Source: AK7set9ThLpPQpquGSprEEBOgPTGX9PO85ZSp3DYkdsn64x9UKUKo/zC0mDYn96tbGjDFZPBhm2hdw==
X-Received: by 2002:a17:90b:3b4c:b0:233:f7a5:9941 with SMTP id
 ot12-20020a17090b3b4c00b00233f7a59941mr3904931pjb.27.1676488717876; 
 Wed, 15 Feb 2023 11:18:37 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 gm7-20020a17090b100700b002343e59709asm1807061pjb.46.2023.02.15.11.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:18:37 -0800 (PST)
Message-ID: <17a54f22-d5c1-57c6-0508-5c07df6b6848@linaro.org>
Date: Wed, 15 Feb 2023 09:18:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 18/20] hw/ide/piix: Remove unused includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-19-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/piix.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

