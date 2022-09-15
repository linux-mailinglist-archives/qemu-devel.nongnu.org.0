Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22545B968B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:44:57 +0200 (CEST)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkUS-0002h5-No
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk8I-0001HP-GO
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:22:10 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk8G-0008Bo-UT
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:22:02 -0400
Received: by mail-io1-xd30.google.com with SMTP id v128so14283704ioe.12
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=AUSPE1e3OIAAIrMz5kPGTwFU+Xzz2ZEQgZK3GhAzdu0=;
 b=zw3TT633n0rq0mryP5uJAgZqo2VZ7RFYFOOJMdq+ZVHs4CP6waRy13ser/1/Sw+0aK
 /OIpA4CNMNMowqRpgtHLiC1WQMG6NIU77eftaIGSp5AgeIT0bQnrOYh+hy/yURjgtAW7
 6rLlsx6oN6KWIV4/ajmamzuQHTHvj1gDDeGIJLjq2++VARj5Ung6ETTzGLFutn0Ni0ax
 mNEnpU5z5/jJIuIDdX5yP+aXjlktzH3WtgbW0tA2SM7hkMee67haJ2APuowAQkM31R0m
 KSVWUuzWIn+4GhjuikvAv0afN1nE5UasD4wm+V2Hv1botm4hMRjOK/cGyKIHpL6UMiX9
 9GVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AUSPE1e3OIAAIrMz5kPGTwFU+Xzz2ZEQgZK3GhAzdu0=;
 b=jHExUFLtvDmwIn3i2YVNmxeDycUYetw9jUZNptEAB7tLi8NninKSHp5IwhZuUA8nPA
 vBuPavEN+VmKnD7IBlmCsyWml9tkSOCHkPzNqgKXsu+r4lyf5Y/SrBuhvjbhN9qDvRbl
 gvsKbPHBH9LOY3T+Uw7TW6G4HraPtRBTV3+drmalhbeaXWZ/dk1pZbJLY3Cw4jkqOjvW
 qt0bBsTW0UO7DLF/bAxRd5PjYcCP5s21qa8hzlttD4Q1L/CngKBqnOcbuxeM+z+g//zW
 8QY/obqbpPZMCn662R6G68Xq6bYHcV3SMsC1vfCbWc5/EK4cQByrFU4zZymgSIY10VeV
 OoZg==
X-Gm-Message-State: ACgBeo3OXeUYXa9A78dBl8o585l6w4v0ycwMG/Mo0sK8X0yUlzn1TWTX
 +YFjlWp9SKfpMjD/MA74Ncr/vw==
X-Google-Smtp-Source: AA6agR7mfUPS6AdW5lds3YL4QWAZ/Az7cc9vY14jJdbJhiURHOkIePPDcklUl6Kj74OdMuET4dMx7g==
X-Received: by 2002:a05:6638:1927:b0:346:8dec:f1b7 with SMTP id
 p39-20020a056638192700b003468decf1b7mr20523851jal.153.1663230119682; 
 Thu, 15 Sep 2022 01:21:59 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a92d089000000b002eabac77df1sm7643801ilh.61.2022.09.15.01.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:21:59 -0700 (PDT)
Message-ID: <6d32ba57-f38c-78e3-ddf0-7ed8348ae2da@linaro.org>
Date: Thu, 15 Sep 2022 09:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/30] tests/avocado: add explicit timeout for Aarch64
 TCG tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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

On 9/14/22 16:59, Alex Bennée wrote:
> We don't want to rely on the soon to be reduced default time. These
> tests are still slow for something we want to run in CI though.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

