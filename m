Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44A6EA36A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:04:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjrO-0005o1-53; Fri, 21 Apr 2023 02:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppjr6-0005ni-QZ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:02:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppjr5-0008JC-2b
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:02:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f17e5fe8bbso13917975e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682056963; x=1684648963;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ra40AOHZGkQL8lSsV7oSRIbJxRHun5b2eVlsD+9dNGc=;
 b=VDkUfK78gAYmvtsqiKrEexzoBmc3DHQ5i30A8IIcFyD8q87WXc8hFgn+ToL2kL6ygH
 W6EfEZNQvRNTXnVHGJqaCdDWNlAvohiurglp/jdYdB/Ntp5VJDlYxoATFGt1epvrGMpb
 7F/iDsqjZoEcaLiLO3vLJ3FeuHEgTzI+XkiuyeZ2zBvTn0/SUTe0dsy7mS/nAnerq+pD
 8p3QZbYGQdZJcnkMDNkEnVPrp0lis5MnTij1OzXM1LeNARJzpkjfM7eSSwhwwExvlCwS
 m//4Wv6Gera4ZkTiKPrEjS2b7fCb5xzuQ04GknfdYLPaHllevEMuKd/7MlTA1wKUQ0Zm
 zTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682056963; x=1684648963;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ra40AOHZGkQL8lSsV7oSRIbJxRHun5b2eVlsD+9dNGc=;
 b=bcFMP/knBvDaMJjWqJSBiCHEAvld+RtwXVS0xuu+kAZyC24IYi9M257DIkiZBJ0IAm
 O+zHZGfwiyxRYkJcq9p6HYO3irHXAiuYG13Ri8m6e/ulRvniXoSUXT/MCj1F4S+M/MeX
 iUxXEn97wPrj95l3ekxm0Oj+qC/Hru3PCc+CnnPGNIhGgJtRwK9ND0AkoezLRaNqt2Z7
 fBgDfuNOhWaFcXh26MdDXK2SIzd9U0F8CC1htNmkhIdBVxCGGkMgqjVoOhAwij2eW6Zh
 gLvMKKv3J4lw7e0H6NZ8+41BEI+UaW0TnZDlDOwh4H435YYPvdJuwi7WWaAHs+PcyZ89
 9+jQ==
X-Gm-Message-State: AAQBX9cffzb9fwVdJCvguIeslriXa2VYJ1oRUF4uzmUJqXIS54onUko2
 cwNIs9BGsWwHcGHFK9rnC0TrJA==
X-Google-Smtp-Source: AKy350b9ZG5k5gWkIdhO+sOxkfzHqGlS0/MXyUT9wFHhcrBIhDq5yTpzCbCzeWS+Yf1UtuDjqrjLHg==
X-Received: by 2002:a05:600c:d6:b0:3f1:75b0:dc47 with SMTP id
 u22-20020a05600c00d600b003f175b0dc47mr872417wmm.15.1682056963430; 
 Thu, 20 Apr 2023 23:02:43 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm3597967wrz.75.2023.04.20.23.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:02:43 -0700 (PDT)
Message-ID: <bea4b7b0-8654-bf3c-df72-dd8323c38430@linaro.org>
Date: Fri, 21 Apr 2023 08:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
 <20230421042322.684093-3-kconsul@linux.vnet.ibm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230421042322.684093-3-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/4/23 06:23, Kautuk Consul wrote:
> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for ppc
> decreased by around 2%. As per the discussion on
> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> was mentioned that the baseline test for ppc64 could be modified
> to make up this 2% code coverage. This patch attempts to achieve
> this 2% code coverage by adding various device command line
> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> test-case.
> 
> The code coverage report with boot_linux.py, without it and finally
> with these tuxrun_baselines.py changes is as follows:
> 
> With boot_linux.py
> ------------------
>    lines......: 13.8% (58006 of 420997 lines)
>    functions..: 20.7% (7675 of 36993 functions)
>    branches...: 9.2% (22146 of 240611 branches)
> Without boot_linux.py (without this patch changes)
> --------------------------------------------------
>    lines......: 11.9% (50174 of 420997 lines)
>    functions..: 18.8% (6947 of 36993 functions)
>    branches...: 7.4% (17580 of 239017 branches)
> Without boot_linux.py (with this patch changes)
> -----------------------------------------------
>    lines......: 13.8% (58287 of 420997 lines)
>    functions..: 20.7% (7640 of 36993 functions)
>    branches...: 8.4% (20223 of 240611 branches)
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 68 +++++++++++++++++++++++++++++--
>   1 file changed, 64 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


