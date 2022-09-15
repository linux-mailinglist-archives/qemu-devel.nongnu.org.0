Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857B05B9731
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:14:31 +0200 (CEST)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkx4-0000by-3V
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkDQ-000241-UL
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:27:21 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkDM-0001Hq-HJ
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:27:17 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so36696365fac.13
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=iwn75kkR5Nziv1IngcASB5KWhOwkli5F9Wy57aZL3U4=;
 b=ZELFxZnW+cyf99ER3OPYAqraCMOxHjun/y1SZhsfzMjAQ7Wd4pxJtDohwFwn5UbpR6
 6dEWBxf6GjJf9cMJBpqP2Z12GYaLpaWAFObn1M0pvO2M/42l/NIsK5oI2ox88boOYVMJ
 +YGcsbLmeN64cFf1B5ggX6x5OjT7Cu+fv62f8WYUd3LwPMY7SaXUTdApDgpTQVQoMyBP
 SCuJzkoT/wI2gx1Gk2mk6oy4k315mxPcFUCCCFzcJaJqNd9/E+PHUeW0vNJVvG5URQyI
 kb7Zu1gRZ3FH5n7iJjx8GzBBihxOD+j2eSOCAE1tWF625R5B2RcJHqFMxowFHFoDdKm1
 PN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iwn75kkR5Nziv1IngcASB5KWhOwkli5F9Wy57aZL3U4=;
 b=MCEJfz46eokZS3rICjYbcrTrMIy0hV5LNn3VaP6OideOd10zN/WGE6dCOGj5x6Jbun
 AErEGQpsnjzsa4Rw6U7tesmWzsdAaIp61ysClhaj2zNRJIioe/Ojbt6O/yhaGPsVEgab
 dB0ZksXhjbbrycRXMubL8Pn/vAuxIzVMMmPHjL2QbJcmX3gwjOyl437SRGVyESsrbejo
 t0jujH/74VTIzPBxA4d1MjjpR6lOD62Ylu2AbXyzPMHNSaYGKjxj/wtDv9pQvZaWrpyP
 lKfYCHs9IKWuuEhWbGkS+D0cQn7lCYKCQmF4eRnGGq4531sFPJMRnZRsEXI4o/V9zyEy
 sThQ==
X-Gm-Message-State: ACgBeo1Gj18YQW7TzU0Ctwk+kDPqao81xIw4PaAQOyL+milevNuNRn9Q
 zxUXP5BbI9lY1Ou9SRm/OCHMsw==
X-Google-Smtp-Source: AA6agR5/C1oiABehZch0Ham11s4ZuITAOxI/oUiU8R1F96TuMGQ/0nXPjij+A6+6LKoCiqTP+0BzHQ==
X-Received: by 2002:a05:6870:c0ca:b0:127:ab1c:6d18 with SMTP id
 e10-20020a056870c0ca00b00127ab1c6d18mr4972263oad.236.1663230434941; 
 Thu, 15 Sep 2022 01:27:14 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a9d4717000000b006389650374dsm8347503otf.54.2022.09.15.01.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:27:14 -0700 (PDT)
Message-ID: <44fde077-ce8c-ca48-8b97-83094f8ab3c0@linaro.org>
Date: Thu, 15 Sep 2022 09:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 18/30] configure: explicitly set cflags for
 --disable-pie
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
> This is working around current limitation of Meson's handling of
> --disable-pie.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 6 ++++++
>   1 file changed, 6 insertions(+)

Ah, yes, thanks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

