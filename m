Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619115524D3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:50:51 +0200 (CEST)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NQA-0000wK-Ci
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NM3-0006cu-Px
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:46:35 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NM2-0002TX-8P
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:46:35 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y6so10643430plg.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 12:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7AHcjGt+zIgGZf2lvdLNW41pvrEW5oxP1HGGKcOTgrU=;
 b=PmgRZ4LihN4lJpdZ6AR0a9eFcdDAtFqbzLPTrmGUOkJvPwomh6nIQCiIgq/uhD2mC3
 M/vVnSwiqYc0fIK1a9bokzHKfdJMHmJoCIbQAS7rKkhyAH9s/SmlrdBgAJ6pH3igyfH2
 nw/XjreCWHKZ2zHWWCsZHHSl4XtbqCtraaT9vtJtIi/iSJUeLx9i50NkntLVSouRuvuq
 BUKQt1gsUfj8cQ8uo4PuVtsxFJUZ5q3FyaLed0OJPObi9vC/BRNzNgxAnM8R+DLNqv8T
 RqUp4esngYPx2pQk+CoN3NSo13cGtAU6koQQSC1BI4/hImd4O1PkR3NcJrSugy7n9MAb
 If3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7AHcjGt+zIgGZf2lvdLNW41pvrEW5oxP1HGGKcOTgrU=;
 b=SXVY0my2DSq3O8l2iXyrNTihU+SuK/61+W/ilAfBdH9pPYXxITcYwEl4/nFoHuwnCD
 RSQ53ZfqvLx4hrfkf0Yb5ThllD6H7a+apvWgMHxLVgImX1y0m+Ha6Cxpk1c9fcuIFeoh
 kJc5w7YSDG1crQ5zDzm3SRbmFXJB9g2IkNXHf6v8V+i18zl1aM6gf3UE1l3PbtNyx8sM
 MPRlwuqdb7UGEqRh46uuwL+ThJkBi20NPAuYGUFmzxjbnv7cFTQ6MpUQRAUOnchUSexb
 X2BDx/A+uK5mnrIIxnWnwsDnw0pBkqqxdhGI83KJ5XBUXyCZokQWxK95ZWk+Je48KKsq
 X7lg==
X-Gm-Message-State: AJIora/9cVrAgRbL3XVwTw0kVsIACjTpTaU6HV8o9U65vlH8kBgebXxt
 K/cMy4DXqR/rNrYDQbIFEzRcfQ==
X-Google-Smtp-Source: AGRyM1slTBV2TJ0llYRqdTjsUruchg7BhVV/c6WiCzTwA64aoJEdOmH2ybZxJQ/GUshDB9IA6BRaMg==
X-Received: by 2002:a17:90a:4210:b0:1ec:b859:91a3 with SMTP id
 o16-20020a17090a421000b001ecb85991a3mr3827545pjg.164.1655754392831; 
 Mon, 20 Jun 2022 12:46:32 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b001696751796asm7847778plp.139.2022.06.20.12.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:46:32 -0700 (PDT)
Message-ID: <1a4d4c40-b588-b89c-3b90-8beaae76f58a@linaro.org>
Date: Mon, 20 Jun 2022 12:46:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] accel: Introduce current_accel_name()
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220620192242.70573-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620192242.70573-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/20/22 12:22, Alexander Graf wrote:
> We need to fetch the name of the current accelerator in flexible error
> messages more going forward. Let's create a helper that gives it to us
> without casting in the target code.
> 
> Signed-off-by: Alexander Graf<agraf@csgraf.de>
> ---
>   accel/accel-common.c | 8 ++++++++
>   include/qemu/accel.h | 1 +
>   softmmu/vl.c         | 3 +--
>   3 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

