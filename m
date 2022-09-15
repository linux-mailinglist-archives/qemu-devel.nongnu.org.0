Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5025B975E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:26:35 +0200 (CEST)
Received: from localhost ([::1]:56302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYl8k-0001JW-6t
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkRC-0000G4-Ou
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:41:36 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:38744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkRB-0000DN-3D
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:41:34 -0400
Received: by mail-il1-x131.google.com with SMTP id g12so8785574ilj.5
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=SGReWb0FkRbESezrRbC9M9VoJ5fCoSR/aP+Ss3mrS3Y=;
 b=KiFd11lxyNarp47zNNgwktvFl6DILOZEap15XGC/rieH8ehwtII8B3Y1qVlWOVHHpS
 BHS5QPJOGiTCIO4nZ5uQQLM072yC+TQcl9WmxbN3o7y3fbj4PGT97zPWdcWXxt8PUUOB
 BZBkg8XlNcm1ejBKOMQ/ehLrVWDIdqHLvNflLVvHA6qJYhen/ihwzIL/1GILf5xYDzsp
 O38dhXL0UbcynBe4GvKPyamD+x18zgf0C9oB0ZhWi13OMvFyZOksFxgLnqrapIr2vck0
 GPESrKPW7ckzuBq59tM9bIzK5tGtRNPDX8hAiFKBqY7OYabU3qfqocHBtAPPw+L4tV0g
 9a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SGReWb0FkRbESezrRbC9M9VoJ5fCoSR/aP+Ss3mrS3Y=;
 b=e8S3gct0YQOW6PvX19ZSSZKQwhPIXnIW17CZfsQLyFJaktotkdIQHPptjYtr1nxL4s
 bdR/cA0imxn6JnI2oYamEmDp8NsvI9fDQrVl4Pdlcw4E1s/iK7/uM2pNUjF3KH++Zm+l
 4RkMYpcU+jCUL/J5xH9LHQQQeM0yzg7EAG97CfdBS+oc0XQ8z4Iloz1a44/s3dRPAxRl
 qxBSVS4rOvC+cXEzAYx7vsmpT2LbahknL4AZO0SeIq9OUMh/kGwJTCz9IpBmANZL8wSt
 C2PWLxpXgUdBo5YtDdjYQctODw2eiCokDr69B/BoNd5/Rn5uQLDQjnHIALV4BVgKS4yb
 lixA==
X-Gm-Message-State: ACgBeo2W7meQqIzCFgTH6+l1MA1KazffaKZuyc/jlz+apeRj85sbstLi
 HmXSXbFJLcdAmjFO37ElV4Oslw==
X-Google-Smtp-Source: AA6agR46A/gJyQW1SOgNtbqSNQDrCIIPWMK3np+ZOsLNmuOjNBRzerZqRAOmHyzKRw26w95dA6HxYw==
X-Received: by 2002:a05:6e02:1563:b0:2f1:90fe:9fe5 with SMTP id
 k3-20020a056e02156300b002f190fe9fe5mr17514029ilu.71.1663231291829; 
 Thu, 15 Sep 2022 01:41:31 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a02c48f000000b0034c14a6ea76sm833675jam.51.2022.09.15.01.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:41:31 -0700 (PDT)
Message-ID: <72674788-e55a-8429-b1bf-384db3d837aa@linaro.org>
Date: Thu, 15 Sep 2022 09:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 29/30] tests/docker: remove FROM qemu/ support from
 docker.py
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-30-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-30-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
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
> We want to migrate from docker.py to building our images directly with
> docker/podman. Before we get there we need to make sure we don't
> re-introduce our layered builds so bug out if we see FROM qemu/ in a
> Dockerfile.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Acked-by: Thomas Huth<thuth@redhat.com>
> Message-Id:<20220826172128.353798-24-alex.bennee@linaro.org>
> ---
>   tests/docker/docker.py | 38 ++++++++++----------------------------
>   1 file changed, 10 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

