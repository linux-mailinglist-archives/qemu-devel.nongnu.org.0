Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0416ED241
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:16:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyqI-00089i-1G; Mon, 24 Apr 2023 12:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyqB-00088Y-Qo
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:14:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyq9-0002PK-9p
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:14:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso2800932f8f.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682352895; x=1684944895;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HqpiAGFoQ27GKUXUrbOfJxR4H1Y45/gN+5wutktt7xk=;
 b=e7RjGR+rDdM9+k02As/KIMJN3tvKCPIBLuCr8KxIZnxHYzZNNL7cp64wKbBcqIhBYX
 zq74sdQUtqTXj12jw80tWMEkWy+p6jMh6vbkOuUCwI5n5FRNJenZTcLeCVjG6eUw9e6t
 iswwryODIVIgCwiECqEcsZod0jMvhXhSjm2GoziJAWgISVbCnTKV8Y3Q+MAIsW8Kj+ui
 TORPJYY7d0aZiQaceUWP/XP8seQuoeH659C1eSVqBVqtJDpspD++/7PyJyYjoUuLOFzL
 Iitb5DC2xdlklzsFVgQO6ndS8TdUgsI0ZZf+fl+Bj9zpOdE9ar74nioY8YciwTLTfF5H
 HF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682352895; x=1684944895;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HqpiAGFoQ27GKUXUrbOfJxR4H1Y45/gN+5wutktt7xk=;
 b=g5/R17YFLfwIIHJnRNlg9SfUjGou9CmGzODKcBuKQnGTBJyR2iAGAF/52Eed4TLJG9
 GY6lsNrcgfjgY66catJxA7tDTEO5e/MF4aMbOXkDzxii7e6xjsPfr1mBKU43FYh8GLds
 assLR/c2UDDKLf0AJx+mMSB5WdNS4sVdTMqV/a23sHqabGmJhXPvYvasD0wG2Q06Yo8w
 3nwuxQXRq0nI5EvK3WqzqfXWYCIl42py+NbiMFm2gtv7+MFlZ9qRtD59YdkS83N39Plo
 qRgqbzMfweGcLqPcrKL2lHsRXFFgZJBfZ1yZ2Y9wCP9oMcfWI5y8GH0zCG6vBg62piAL
 bacA==
X-Gm-Message-State: AAQBX9ckViQop7CzqDErKzKMLy9EA4neIHBFfhNk249tZeWbxJn1CK+t
 pYcQrC2BK5heFYkFHmzRsOKE3Q==
X-Google-Smtp-Source: AKy350bOjbEO1Rfp5F4Eqg431A2y0gwUeC+iUPs9z6C7gm0OwQQctfxngrnS3Xlk151PZgTnrOvCKw==
X-Received: by 2002:a05:6000:1290:b0:2f9:1224:2474 with SMTP id
 f16-20020a056000129000b002f912242474mr9805126wrx.23.1682352895650; 
 Mon, 24 Apr 2023 09:14:55 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b002f53fa16239sm11051666wrx.103.2023.04.24.09.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:14:55 -0700 (PDT)
Message-ID: <f984781b-40c5-eda0-d31c-118f311cd77b@linaro.org>
Date: Mon, 24 Apr 2023 17:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] target/arm: Add compile time asserts to
 load/store_cpu_field macros
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230424153909.1419369-1-peter.maydell@linaro.org>
 <20230424153909.1419369-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230424153909.1419369-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/24/23 16:39, Peter Maydell wrote:
> +        QEMU_BUILD_BUG_ON(sizeof(typeof_field(CPUARMState, name)) != 4); \

Similarly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

