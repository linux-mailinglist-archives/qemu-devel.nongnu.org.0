Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C065078F0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:33:06 +0200 (CEST)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsev-0007ON-J9
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngscH-0006Mf-Uq
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:30:22 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngscG-0000XO-CW
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:30:21 -0400
Received: by mail-pf1-x42b.google.com with SMTP id j17so9119412pfi.9
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GFKEvO7IhBefAgGGFG4bq7L8PrGB0rGkrH5eG2ixNj0=;
 b=XVBIvDrHEU++XzbS3JSjcCdGwCpbbaMKRNomcRB/Qt2xqdU079fqBJ4pwVZ5M6dAJu
 Shj2X5YiqCFKjws1LLYCnVxy1FnSnyn3G0Rk7oyMOPEL96FrQ/VgPBj1Ujj7iJyCF0Lp
 8oc3kBHCGkrzizT44SXsTrpKhlwzipkyJ3caudiE0c/5bRaPyDZx7mbn2w2GjLL3Agnr
 h0LVtEZRO8wJUdI8dA/tjtNHLveUe90U9VtzFJUDQDyDAqZdk51GRKOvz7Nykju4G3E6
 xKURVPAe3q2S2mkPZhQ5eOlNsVpm/yR6Qz9L9bzZL9+IE9OMdShNUQbEzPdttpvNihw3
 /sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GFKEvO7IhBefAgGGFG4bq7L8PrGB0rGkrH5eG2ixNj0=;
 b=XCrddFS20LR4Acb3XmZ8XOf9NkdT6saHUiwkQEyFWpitMuUnKgsA1Q5CGl+GW2/sBp
 jXiBautUhWNJd9/T0vHO2X7606pSY4wjKhQwQHCDc8tNnFvDIu6EyMwEPI5+/Mhio58F
 Sf/ML5E5O03vA+lyoLKTmDvtEAh//vGQyYOIu8g33NYMJ0ina3wvoNrLIHvPMp7zH3Yp
 9FbYkeXMnX4TG8F1GSeaBqXHN5XWHT7I+rBCXfMfRFB6UfWkGQi3o7fRyRK7E6y0zcx9
 xx6YJREtC+dUeGHRcLHxCT35o5DAxYhBUnwNE8hPeFBoxOMm0453iBvXHSjDWuaj69yl
 PniA==
X-Gm-Message-State: AOAM531vEVXa11uzPqmrmtm6vsjf87FfpVvVc8T2fhWMs7m3jmY0Bs+s
 7G2aSVOf96Uoxq+D15zJ2HpXWA==
X-Google-Smtp-Source: ABdhPJzEHiGQxWM3qABCp/SkTmZvXsKzFZkWJqHTnsAkhFCRvOr9Ao6aRhHPiUxIx9VX81kZlXt4Mw==
X-Received: by 2002:a63:6401:0:b0:3aa:5639:1884 with SMTP id
 y1-20020a636401000000b003aa56391884mr1031995pgb.71.1650393017631; 
 Tue, 19 Apr 2022 11:30:17 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090aaa9600b001ca7a005620sm16572073pjq.49.2022.04.19.11.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:30:16 -0700 (PDT)
Message-ID: <a811d30d-3eb9-86a0-25eb-63e37e83a2c6@linaro.org>
Date: Tue, 19 Apr 2022 11:30:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 02/25] docs/devel: add some notes on the
 binfmt-image-debian targets
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:09, Alex Bennée wrote:
> We document some of this on the wiki but lets move it into our
> official developer notes documentation.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> 
> ---
> v2
>    - fix some trailing ws
> ---
>   docs/devel/testing.rst | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

