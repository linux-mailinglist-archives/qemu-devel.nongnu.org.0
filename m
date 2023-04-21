Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7BF6EB141
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:57:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuzj-00044p-5J; Fri, 21 Apr 2023 13:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppuzg-00044J-M1
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:56:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppuzd-0002TB-Tn
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:56:24 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f8405b3dc1so1266776f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 10:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682099780; x=1684691780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7tW9fz4SHdNW5EMnlP29hh5sbkPuziVWHGpeYQEpi24=;
 b=dXNBuv6fHtXmkuUmN4BiXxOnKN/xAwllmC/FTd/ogRkFL+8vsMtvXNJwzBfM5ppZ+4
 g50exut08WD2FE4FhrlZor/kSG4u2fl73R7sCQ7IJS0n7oDvM5cU4kEfbX3wNqVDiPwj
 gsIF53X3U2IWpnr3b17OsKBQCVZX2Caw8q4PeU7xqz04uUA8QufnD4flthH0VTcT8Qi3
 mJCbuBx/14nxN3TFYNDE246gb3PylIMXYUP6Vyijnx/ibu/9azr9iIc32yAbpd55ryTS
 PGzEBiLw4Yxf/3fcq0W31p3094qxW+zBU1Bwe2clsGJrmw5Egb+hAn6Tdp7zrDMaXTGi
 DpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682099780; x=1684691780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7tW9fz4SHdNW5EMnlP29hh5sbkPuziVWHGpeYQEpi24=;
 b=L7f8mwK/o7Gq6K0c8/RBzS5ZWxIZDyNH2RSuA6zJAQPa0SI9J4dIFoLXjxjzGFSJWG
 i96EdwGKwV3d3QYJj7TKVg1XOrTGsTDT3ziZMlklkdvDYB0vha25/nclUEhBN2Z5fPKR
 lvB+pwskyO1ZM7LeAIr2iSYHxb0i8QN5OxE7uUKCVWucNnngm3iIrNY3Mj1suCQHyaJW
 jzyCIM14O5qtiGFWA+lgLDosPhRYMoEN8l/o4F04M5LjrzqyT59RqQUEQ5vKVIprGczK
 qFTuPoA1XaEGHZ8HjaV5TN8kZF6wpDpOxqjbxgqUw9acNGwhYQnkm4+Q0IkRzBhWsOd+
 m7Dg==
X-Gm-Message-State: AAQBX9cZGK4ZU3Q2bVyNgSgkkTwm7xsYUHyi5HKpkKlGpXltXWZu0yoP
 uLn0QL9b4lsNqJzslqWAfpZQBA==
X-Google-Smtp-Source: AKy350bw99qzQIzssf/Gg2cY0oB5uotyekjsRIMa9mFNcmHDicUZLID0xyQi9yGhO2xrcBnhVl6lAw==
X-Received: by 2002:a05:6000:152:b0:2fb:283a:1751 with SMTP id
 r18-20020a056000015200b002fb283a1751mr4255788wrx.15.1682099780113; 
 Fri, 21 Apr 2023 10:56:20 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 g18-20020adff3d2000000b002fb2782219esm4930017wrp.3.2023.04.21.10.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 10:56:19 -0700 (PDT)
Message-ID: <36cc0233-f6b3-7805-1840-cd31ce5cf7a0@linaro.org>
Date: Fri, 21 Apr 2023 19:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 03/11] target/arm: Extract TCG -cpu max code into a
 function
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-4-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230412121829.14452-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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

On 12/4/23 14:18, Fabiano Rosas wrote:
> Introduce aarch64_max_tcg_initfn that contains the TCG-only part of
> -cpu max configuration. We'll need that to be able to restrict this
> code to a TCG-only config in the next patches.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu64.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


