Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2485B694F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:16:34 +0200 (CEST)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY15t-0001vf-OJ
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0x5-0003nA-QF
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:07:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0x4-0000T8-93
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:07:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t7so19386504wrm.10
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1aobuY0RjQP40coRo/9GJEvFVeAla7wFy76/QMrU4RU=;
 b=VI/zmh9+a+BtGpo8XbVjOB2BO3//0FIvKSSCjwzk4DIgjCBVEnec3ZlZDx6OW1UW1K
 mYocMUSdmb5kijpWPs1GmkYHiFajuAJDD/GObFvLdm1fBzCRJYK5MkT4iRtVmx6DvY2O
 dFd1ERq3aQ5/L+aB5z9Wq78iGaBm/nhyu2OX9fqnLz+Ig7tawsI/MxO4hf+aqK2Y/410
 Epw44lewM0a0vrFcQ7uNIXj69PHc2Mf60AnSQXe3T/MfVSDL6jE0GUP2DDjhI+wVN6pT
 pu9Tk28IDeevafuifN7RUtd2GJ0mctuV/ppFK/nNqlsbYsDeP3nB9gkJObKcnpVMwe02
 s8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1aobuY0RjQP40coRo/9GJEvFVeAla7wFy76/QMrU4RU=;
 b=Scpy2TcLEcsUr2oO+LX0Zzjz7FscHbuqNaEjVc1aCBwXNHvxIF5tF/FBl35d5NOi13
 +OzNbRpXVi8xvpRhrN15xqChYNU4tl9bB6E6AlbPjY+eQbfCN3UnOTu+4AJBeYZm7gCP
 w/JOmht6bdYEYhQTaVLdVZXDrBROGcjmTd4mcu5b5YIu/HKaPmi8YzUchIzRdxKTXIbg
 FLwCsug+RQe6ndBN2zXkwrRAZji2d7p3aQ4qrhv8AZbQ3Vy059OK9tuDu8aXXZ2DKjWD
 HZHMBgpA7YufgVKDv1565BuISbEzPLV7wBw2yfeZMNsSjZcq2RAIod3+VRoQVpBzo8rp
 WdUQ==
X-Gm-Message-State: ACgBeo2SMk5G9yvv0iweTBiAZFvipAe7/f3R7eHV5SXjVwywmP3kQ6vR
 ohe4jYGLrCGaxnWBTslfE17Ypg==
X-Google-Smtp-Source: AA6agR75UzLxf0CVDDRXK8+qz9jhCO+zXBimX2kV8HqNgIkfcCmvtKR208Cxuegi8WzyJKgfexjqxw==
X-Received: by 2002:a5d:584f:0:b0:226:edcd:b467 with SMTP id
 i15-20020a5d584f000000b00226edcdb467mr16553650wrf.363.1663056444587; 
 Tue, 13 Sep 2022 01:07:24 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a5d5090000000b00228d8420f57sm9710041wrt.95.2022.09.13.01.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:07:24 -0700 (PDT)
Message-ID: <8556e124-baa4-7722-2a6b-051f88e36fac@linaro.org>
Date: Tue, 13 Sep 2022 09:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 19/24] disas/nanomips: Remove function overloading
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-20-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-20-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 13:26, Milica Lazarevic wrote:
> Disassemble function that calls the other variant of it is deleted.
> Where it is called, now we're directly calling the other implementation.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

