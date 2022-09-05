Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E55AD1A4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:37:17 +0200 (CEST)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAPf-0002z9-00
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9vy-0008CI-Ai
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:06:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9vw-0004Ua-6g
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:06:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id b5so10871902wrr.5
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=KHGjXT6veYmkUwnU+dXdWjg6FlMkGyJVhwy/Eo9nmdM=;
 b=LqBvCNBJDxZ0SA57rVWuDJMfYAfTrVoxcpb4k4GKLtTdOolj2es1az4Vxr5gSlRwkh
 X6XCIOKQTp2rffHwiFGdWpCM/BzmmqtyHe+oAby6oW1l7NmoXOA8XTFefgRI+90kJNbN
 DH9OAaY4YW5oneqMFF0OoS/jFn8DTKcb9+Q9afuPaoorKIBJ3E67vE+EiIGSqXND6Tiu
 qI/KmIWPbvKVvnI6WO9z6n3WSNV14H48cX52VopY79JAk1KYyPpwrCCAtuXLO2E/5xmq
 Q2rGMkuJ0fj1banprgaEulBvwqCFhqe826GuHP4H4Brna7BLGv0a+uhxDFnfuRGdhofZ
 Nn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KHGjXT6veYmkUwnU+dXdWjg6FlMkGyJVhwy/Eo9nmdM=;
 b=3L0QPtS5njBF9Q4BR4Gldptak18/rVh/uwogNqtmeJS4T1N4+9cq1N4MMux2d5sPAa
 IiIbGpSEkAglPxUkbu/LDPuEc7jFbpVcVVxf7PxpeWcZeVY4/9kqhJ1X4tU/AgzM+XwY
 wmfV9KNsunTxPiskvRZZ00gN4IhEdFOJQWKRrF9bFQrpmkSELvpBbEAIVnezWqOXPKUi
 G6YD9a66lLBHf0qelZJxpK/IY3VgieuJ0OFv/AGIJt0ZadH2Gzla+aSZ98QuKqm/0EPD
 Ve1mmy3bdPzCWkSK0+lN1hzQkJyEQWvvlR5AoSwRw87nFyG9lYfpAEYrJM62J7GPX0Go
 //vA==
X-Gm-Message-State: ACgBeo3qUnSeMQdfTF2gQVRmOckSb8Nvxm2tE0Qt/Iwtw1ZFEQCKdGuf
 NPX2GoIgX15WLpOc9e1NJMv5VQ==
X-Google-Smtp-Source: AA6agR5b4D/8oxJ/ZXJ8gGA41tLNa4eWBOK0zh6DHAl+F38yKeYvrsJLhWNOjcSbv27TFAce77gSpQ==
X-Received: by 2002:a5d:67ca:0:b0:228:7ad5:768f with SMTP id
 n10-20020a5d67ca000000b002287ad5768fmr2865416wrw.163.1662375985770; 
 Mon, 05 Sep 2022 04:06:25 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d654f000000b002211fc70174sm10132144wrv.99.2022.09.05.04.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:06:25 -0700 (PDT)
Message-ID: <7cb1616f-0e93-e7ad-5661-f6b237646a04@linaro.org>
Date: Mon, 5 Sep 2022 12:06:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/20] disas/nanomips: Remove __cond methods from class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-6-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-6-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> NMD class methods with the conditional_function type like
> NMD::ADDIU_32__cond, NMD::ADDIU_RS5__cond, etc. are removed from the NMD
> class. They're now declared global static functions. Therefore, typedef
> of the function pointer, conditional_function is defined outside of the
> class.
> 
> Now that conditional_function type functions are not part of the NMD
> class we can't access them using the this pointer. Thus, the use of
> the this pointer has been deleted.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   disas/nanomips.cpp | 42 +++++++++++++++++++++---------------------
>   disas/nanomips.h   | 14 ++------------
>   2 files changed, 23 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

