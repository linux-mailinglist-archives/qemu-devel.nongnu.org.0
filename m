Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E781951D0C6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 07:35:21 +0200 (CEST)
Received: from localhost ([::1]:54548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmqca-0008WB-Az
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 01:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmqZY-0007M6-QB
 for qemu-devel@nongnu.org; Fri, 06 May 2022 01:32:13 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:58147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmqZX-0001Mn-0y
 for qemu-devel@nongnu.org; Fri, 06 May 2022 01:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651815127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUpY1J6F01Hx9ZhMvKP034OpvEhdt7W+srEg5e6h3y4=;
 b=eT5rRsI6O5hye5M1nFYGzFJGUwBEz4sjZWHu/8Z8Z44GBQpyfXVSj5IwKn2D+dWPu0DNM8
 5BrKGJZGBmWfB7m3j0u0pMGX7q91CAs14tHWZe2/e8GmHS0B75wGtAwNoG1WsW3no5QTMB
 878FmxaDiiWvsehqM6UG/d7K1120qB8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-58nx0TiLPDqrK8kndWhMDQ-1; Fri, 06 May 2022 01:32:05 -0400
X-MC-Unique: 58nx0TiLPDqrK8kndWhMDQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 g10-20020a0562141cca00b00456332167ffso5150908qvd.13
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 22:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SUpY1J6F01Hx9ZhMvKP034OpvEhdt7W+srEg5e6h3y4=;
 b=I2Nr2fOV4nAw8qGoIaCcpHSMT3ryuZAj6IWSKKhvaQBVSxhWNeLFd6BpbBlPYkWPdw
 JOuk4e51IeWOZEWIvLSDUlBP80m/KHvx968mjLGIK8/Zq9XzGCU4XCpaFkQQPHZeTM1m
 EmaFi46DvBOJYoLr/AFQd5OI7o2eLX1fh4PF0ypfLRfHNU2Xr+wLLGZKSY0Nogt5xiLp
 K6lOcDQOnMysEOL9qyrhE7N0Mu8gwAw81HGw2oi+W1iLhe37IWCFHK+5GcjKxfDePQi3
 tte7ZZ0NA335kyWln/hnOhPAuPeGtLJTdEma2WU30teOLFd5oTMah6rf69tRqOCwGy4R
 0SZQ==
X-Gm-Message-State: AOAM533YYOD5ueMXrBe1xsXthz2+7LlF3U2lvT/rTHKeIo1LB4+YU+wN
 T/+gtPUEbIvYNIVksA7jo3HjOHQVaRXYaWLn6Zxem9+vbuJCif7nzk2KK12s3/GfGNZd09jkZh5
 Bi133MJlWGfOnTHA=
X-Received: by 2002:ac8:5b93:0:b0:2f3:9b90:34a5 with SMTP id
 a19-20020ac85b93000000b002f39b9034a5mr1279416qta.677.1651815125165; 
 Thu, 05 May 2022 22:32:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJsJpKOxUrjiWsfd830mUdBUNscIgO1yMB8RqoOKFrfywGY8r6vYrkyZPA2kJaw82SFggqkQ==
X-Received: by 2002:ac8:5b93:0:b0:2f3:9b90:34a5 with SMTP id
 a19-20020ac85b93000000b002f39b9034a5mr1279389qta.677.1651815124852; 
 Thu, 05 May 2022 22:32:04 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 x9-20020ac84d49000000b002f39b99f677sm2041808qtv.17.2022.05.05.22.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 22:32:04 -0700 (PDT)
Message-ID: <309ab0f5-7bb0-ddb4-3736-8cf0a4cfb269@redhat.com>
Date: Fri, 6 May 2022 07:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH][RESEND] MAINTAINERS: Add myself as a reviewer for Hyper-V
 VMBus
Content-Language: en-US
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
References: <7ecb5ece9d1e0a607e801d547d387bc840b250ea.1651779343.git.maciej.szmigiero@oracle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7ecb5ece9d1e0a607e801d547d387bc840b250ea.1651779343.git.maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 05/05/2022 21.36, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> This way there is at least some contact point for incoming patches.
> 
> We'll see whether the code still gets just a random patch a few times
> a year or whether it requires a permanent maintainer to take care of it.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> ---
>      Resending, since the previous submission at [1] wasn't picked up.
>      
>      [1]: https://lore.kernel.org/qemu-devel/b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com/
> 
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 218c9459b6..907f1d4a88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1776,6 +1776,12 @@ F: include/hw/block/fdc.h
>   F: tests/qtest/fdc-test.c
>   T: git https://gitlab.com/jsnow/qemu.git ide
>   
> +Hyper-V VMBus
> +S: Odd Fixes
> +R: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> +F: hw/hyperv/vmbus.c
> +F: include/hw/hyperv/vmbus*.h

If there's no dedicated maintainer, I'd rather pick "Orphan" instead of "Odd 
Fixes" here? Who's supposed to pick up the related patches?

  Thomas


