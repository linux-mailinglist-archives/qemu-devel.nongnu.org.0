Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156A73A4686
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:31:13 +0200 (CEST)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrk3r-0007R4-PP
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrk1r-0005yC-Vs
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:29:08 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrk1q-000661-9u
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:29:07 -0400
Received: by mail-pj1-x1030.google.com with SMTP id g4so6009512pjk.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vDcBsQW7/YXUSGh+0eNQWnAUMAj2dUeJKXsG2lRLMdE=;
 b=soObAfqnIbCQwUvJdufRPNeBIViEgV/6uVwjJbG2kYqEHXZh5Mjnk3UPYf/BukTABl
 Lxk5y5HoU4jOE0GreN3GA2yo4B6ZIfjIkqlrt5as2D1uwec6larRUpl0XwphvVasTd4F
 p8r2Ps5Jedhb5zk2F4Ub3jPB51gQwOda7W8/AkVId9ClaVxuceuhGhPG2wMIhYg8QdMa
 1L/zQx5LiodTws+GDdAU6V79ZxaIJGTJZpxE5oTaqliAkDoWxfrwKU9bpSbh0hSDUdHp
 UClgTz79WeAnBgQKG+dFgp2OPIQQl6GN/YMBsBtXLXlVTu4sQ7nbyMx+IJLBTElfU1LK
 d8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vDcBsQW7/YXUSGh+0eNQWnAUMAj2dUeJKXsG2lRLMdE=;
 b=UAou+FWNxSJLHcYxOG2yF4kWtiqGgQPX9RLrmsKrIsV/qQn+7MoF4viUcbORaqYo6C
 I+A+if7/hEo3i+xo9ceoGdYs6HGzoeCgw4ph93Z9bKp7obJTATmFaTCY4beWWEsRMwM3
 qewvdinN0mVP9PQOY6u6Vl+TCW2955yM1UBeez8lWc2h3WBPngAaHMOMezedhzS5VPGD
 JPaLJvScvmoGG5vWSQUOkkTyZh7ONIWdjUUTQnbUo0RyZscAWIwFVh2ZaD2u/Yg8jWKJ
 n2n/O0Tr+jBuOID1gH8xPbIQ3oK54b9tS7bIKFMn+HBwWOaT9ttP4ICeG63H/RMg17Wt
 8M5w==
X-Gm-Message-State: AOAM532HMdigQO6T/EBYONxcccCaGsYkS03BG/TWn8VzZ40uzQExUQKd
 eCWtMkEsH6cQRRadq8D/7LKFWQ==
X-Google-Smtp-Source: ABdhPJxi3Gke7pyqO7nsBgIeKg2/1ab6Jh1x12wGSBbtOMYAIp8Xofop5AUuarMQNrM5QOWCsIZbbQ==
X-Received: by 2002:a17:902:b683:b029:ee:f0e3:7a50 with SMTP id
 c3-20020a170902b683b02900eef0e37a50mr4532610pls.7.1623428944522; 
 Fri, 11 Jun 2021 09:29:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 n129sm5539427pfn.167.2021.06.11.09.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 09:29:04 -0700 (PDT)
Subject: Re: [PATCH] tcg/arm: Fix tcg_out_op function signature
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
References: <20210610224450.23425-1-jziviani@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2f1166c-be90-8d71-ec73-183cd850eca5@linaro.org>
Date: Fri, 11 Jun 2021 09:29:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610224450.23425-1-jziviani@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 3:44 PM, Jose R. Ziviani wrote:
> Commit 5e8892db93 fixed several function signatures but tcg_out_op for
> arm is missing. This patch fixes it as well.
> 
> Signed-off-by: Jose R. Ziviani<jziviani@suse.de>
> ---
>   tcg/arm/tcg-target.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, queued.

r~

