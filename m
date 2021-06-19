Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1473AD8F6
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:31:41 +0200 (CEST)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXKG-0003ye-3k
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXIg-0003BZ-8C
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:30:02 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXIe-0006Zw-KK
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:30:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c5so13548225wrq.9
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OBQJLNQXff88/YUb9RgNp1ajrcJ/BCgB7MJQXT86p9s=;
 b=r910N3EKCjpEvKnf0DSiwaWmTEf1ZcQWwWAAMvi76k0pJjT5MPxpWsgxA6381F1UVy
 1/XE0CG3hSckcjkRy/2KuArM89qhPEuvE5pDTUIFxv3oNddE3bvFw1dGaqP1erNwTK8i
 qYTYB5zGNfEWZXMMyK/Ph8kxAora5NLC5V5Rf/4e4zRNoMqNIe4/qjDgRMfn+i/ltDO6
 JwqkU3n2RVfMn4xMhY5Rv0JQ5NlU+zdg1LJrCqVnmmu8lQTAlUzelERmTMBpPwNHMFSv
 8KpW4zRNM2g8GGAXPdaqxCeSVxLr30VVr4hy6pdBkLHeXAmk3XXe6nkuzh+qWk4z/elp
 x/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OBQJLNQXff88/YUb9RgNp1ajrcJ/BCgB7MJQXT86p9s=;
 b=BnS5V643fenFJ/FUvGZ1afrlfORWTfHfnAxFKuu1FFmY5yD08ER5cOM5y2TG6GCz2I
 I7FHEUlgt1qFrjcu/ySzLWyDMX9au6D3Lmt9no5TNwusiH+lWR5ZfWuBjIv35quFOuJM
 UNH12OdCPewudO+11Co/DwcAmPzvYh2HxthyxQl8nypdaV7krw41f1jnNaVoz9eIojj8
 cRZP8p3BaJ8YCrv4Ky1PoJzC6h3ZbIY4bTjuIrjxaJD2nDorHL6Ye9LD3QPwj2jPn34v
 81q5kn9T6Ch8UHwFI+hKKcmW9l26l7rSl3ujVRH304mgTFdPyCQIpO1URmppD4Ab027g
 fPCw==
X-Gm-Message-State: AOAM533lrVkHAxl0NPWBdhl6YN1mJNM0wj6QzQ3QVh+hjzkb7XKuT5lh
 L9rFxgGs8UG9ViAnN0czsb4=
X-Google-Smtp-Source: ABdhPJygIplKOs+hOfFPhv2TF/SqhFoToJJxCmnXKcPvZKdczTo6yYrXh6SsWTEV+DizD1R2YPT15w==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr17036896wrw.104.1624094999120; 
 Sat, 19 Jun 2021 02:29:59 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m5sm11178034wmg.32.2021.06.19.02.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:29:58 -0700 (PDT)
Subject: Re: [PATCH v2 13/23] linux-user/mips: Tidy install_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b5c13ac1-d3e5-67dc-c290-4b9a82fd4806@amsat.org>
Date: Sat, 19 Jun 2021 11:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618192951.125651-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 9:29 PM, Richard Henderson wrote:
> The return value is constant 0, and unused as well -- change to void.
> Drop inline marker.  Change tramp type to uint32_t* for clarity.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mips/signal.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Thanks :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

