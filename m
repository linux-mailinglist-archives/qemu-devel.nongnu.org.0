Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB66066B1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:06:58 +0200 (CEST)
Received: from localhost ([::1]:55916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ0M-0006xG-Aj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:06:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYpV-0002sP-IE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXrv-00010m-7z
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:54:03 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXrt-0006Bh-JK
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:54:02 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f11so35284070wrm.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KDdSDbbNRT2zw6tSBO6RxGyaDb/VLKpCflhQeLmEePI=;
 b=tbqB2DCm32Z5o0w3nMKVRZB21/YwRht8xNliNkWQR3JYr7+tIMxO6A8ysGnSxbafM2
 LSLI8IftPHskzKF6h/CvQXVGztOV8lWrm8m2jT31gywXnmVQqFo+o1btp1jVMgAYOqS0
 8HPSJ5WjsxPZVU7rAHyKwNHZQ/VKnkTiVROWAAc57zrR5Ouv/zI5/mvzWb0hWva4sz44
 AJQR3N9zLhlqD9EYnA361YAaHRQYY81eD9KH0z0Xpkr3SLcumWQbdsC0h508hgVUnzHK
 qKarg9hGKSkHNqUa2z3VMnLrOYbxnilS0KAxxokIT9GFGnuBBDwWYGHrl8ca4qgOZuqb
 cmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KDdSDbbNRT2zw6tSBO6RxGyaDb/VLKpCflhQeLmEePI=;
 b=Q7l8ogyGsRAZCcvXBAF39Cz9wFltYGAEpYA8hSswMNRjKAf6fok26vMbOk43umiAJs
 GZBe3EmHNmvQkC38heohwacrg4SMrLWm6bLHtkTXtIQUCC7N2IuW9G3P6LcvR+/jNFi8
 AQ7iVLbF5kIY+SGcJhCeNloNhx/PLq4yPrdSg3qxIpET7FxUQaRX5ok1gubrJugcHnQS
 5+qRSm5vxabdsXiCoHDXmbs8922ek2TjjYdZT4lu+MPt46wWRDYcZvDGowV6yORk651D
 jR+BzCq3TqKu/9yYywweqUiMYhIH4mPfGHlz3QWgFiYyF6O1nh7mHgH3I5F44a9vXQnU
 6B6w==
X-Gm-Message-State: ACrzQf3CBH8NC3gR9PXdp4S2CV6OxOrWiuGZEjH2dv007DNT2klq5J13
 qH+MBP1XOcln1Fq8wjUF9F+Ejg==
X-Google-Smtp-Source: AMsMyM63qo4ywS3WNgePv8ZdtR7CWnJeRYMe/2ps57ioHeFu3Pr7ISij7+imJcCNf+Kyw1lZpPwirg==
X-Received: by 2002:adf:e610:0:b0:235:597e:bba0 with SMTP id
 p16-20020adfe610000000b00235597ebba0mr3447694wrm.650.1666281239995; 
 Thu, 20 Oct 2022 08:53:59 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003c6b70a4d69sm116737wmj.42.2022.10.20.08.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:53:58 -0700 (PDT)
Message-ID: <8aac5ee6-8e45-7bc1-eedc-27db14c964c2@linaro.org>
Date: Thu, 20 Oct 2022 17:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 09/26] semihosting/arm-compat-semi: Avoid using
 hardcoded /tmp
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Bin Meng <bin.meng@windriver.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/10/22 13:51, Alex Bennée wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Use g_get_tmp_dir() to get the directory to use for temporary files.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221006151927.2079583-2-bmeng.cn@gmail.com>
> ---
>   semihosting/arm-compat-semi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


