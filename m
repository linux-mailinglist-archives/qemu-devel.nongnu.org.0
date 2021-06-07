Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C8E39E2D7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:22:03 +0200 (CEST)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqI0o-0008TC-9F
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHzg-00077y-0M
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:20:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHze-0000bZ-G5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:20:51 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so11948404pjr.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H96Dj4juF2KKCmh9oX6ljSZEgSgeZ+TZbmIjouY0AA8=;
 b=iC6+1yWBZDXkOMq5hmHgKNOLQSkixsRm/eFRhFUskDZVcl8quHgy5r9qqDbNmvjgXj
 5zGpc1174lDet4HkiWky44i4wFhptXR3V5T7qS9NUymrgEz16CR2BIBTwvHPzakc6pnb
 /k65EegDsFRA3j0uu3hYl9RmSLaHtIBB+IfiLpAmBqE0JUkLO6zXkrPNAz7ANsYxxrlu
 x1/nEslFhBtRXIY8mSrTnwUtBUvZb2W/+hP/Ywt6AszfnYAeq4jIyrE7LOIBxRVSg+4c
 EVRwprbteloElukR0DNAtWj949Wq2uk+/JTtUSeLA1gch0GFGQUZEnlHb4+SowoWu7Kp
 u4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H96Dj4juF2KKCmh9oX6ljSZEgSgeZ+TZbmIjouY0AA8=;
 b=Lp11eqhlZYhRU+2n3GkgCuCxHn+M2cnyO8GRLDt2ag9RgEtW+4il75k4LzOt6vRxIA
 llvCsbwQEUrovOcinMbFmoQTUtj7d8cnUvo/rKCfAmHF6sVj9RN99n0gPOSqOcjiyIAr
 kZQjMoFAwlQGp8n8lOnjkUhiAYGtHkbY1VhaDsyCfU9zK/RtfC0rJOUGR0SlOCdm9nCC
 Yeq64BxrowmKBicgtoV+fIUZynhX4rm89xjp4kRjq9/GpBaMOKvKPh0VVloYIVLr459u
 yM3Yz/KrdyokZcn0vkbxHUdGlPm4UFPwgC/BiRRdBftocB38HqMs3wS4JFk5RFqH3SOI
 thjw==
X-Gm-Message-State: AOAM531WKNt02V13tAxMo13EzHGT9QH7BGi2MWmHjl8gQQWnA/0pMyrp
 45Iai4/hqLXKBY9brYVnMqCyOg==
X-Google-Smtp-Source: ABdhPJzTzR64mqL16CfgbpgkEct6E3kGMWrTGZRSBtZpNMTJZ8WKzOAgAU0PtL5SsW1ZQHOay5d9Vw==
X-Received: by 2002:a17:90a:ec10:: with SMTP id
 l16mr33827540pjy.142.1623082848912; 
 Mon, 07 Jun 2021 09:20:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 n72sm8689670pfd.8.2021.06.07.09.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 09:20:48 -0700 (PDT)
Subject: Re: [PATCH v3 23/26] s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210607110338.31058-1-david@redhat.com>
 <20210607110338.31058-24-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8495083-ac37-1b5b-74a6-164d628cf1f2@linaro.org>
Date: Mon, 7 Jun 2021 09:20:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607110338.31058-24-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 4:03 AM, David Hildenbrand wrote:
> +static S390MinMaxRes vfmin_res(uint16_t dcmask_a, uint16_t dcmask_b,
> +                               S390MinMaxType type, float_status *s)
> +{
> +    const bool neg_a = dcmask_a & DCMASK_NEGATIVE;

Minor nits:
Only used in the zero block.

> +    const bool nan_a = dcmask_a & DCMASK_NAN;
> +    const bool nan_b = dcmask_b & DCMASK_NAN;

Only used in the nan block.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

