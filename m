Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D450BBB3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:28:57 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvDM-0001wO-Ig
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhv9j-0005h7-UR
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:25:11 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhv9i-0003Mj-CY
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:25:11 -0400
Received: by mail-io1-xd33.google.com with SMTP id c125so8921918iof.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=8wFLR4pSVH7ljRtKLvcY0/jyBPgb7HdDlrir5th7a3Q=;
 b=LyLHFjkDGiIXZ8BV0W5pHg6tJaMKnlsB8Af+sB3M8FT8ZCDTVffciFfOafqdoImFon
 sXgGtpIfwhN5egS0svzAaAvwOdavlRImsdhqhpbYSSN8mwn80zoBUArlKUVi9QoHyxut
 G3LlL8Vl7lOUg3xfIu2qIXEijM+QyBcB2DztKQSmabUDtf8qyX7g5Pm/nVbt07ci3R4Y
 QVH2GJKhRzIuHlj0X7w8qjT15K6fimdrbZbz/749ZDuJwp60zDhxgGaqiyR454NA13Q5
 3fTCYHH2QPvLHXiMu44lrn3sz+l4YtCfpskzQhVZfvgumzoRQWJ2EUfEngAFqtfQg6dz
 Quwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8wFLR4pSVH7ljRtKLvcY0/jyBPgb7HdDlrir5th7a3Q=;
 b=g9m2i8qoNaF/VHGPhcJjIyTHOFP6XkOb9pIwqROrS58+Peb9fATEFUr4Z6L9vcKHo+
 ccjGPWWROdXJHemOUnv0Zn9fGSa+wawSlj3YdY8/pWXPIKjx9eqy4FbjIDSb9c6U+FTL
 mDCBt8W4mA1eZOe+RHsB7hDjJBhi9b63Zk8mZy8ByO+D710SLFfzfKw4tY8WIBE3S3r0
 1J8OhPFZrIGNHQ/ugW6m+4tKnxaiUH1aNc4lG+g1hw8AIFEgVWyalTIcjriamVHsbRgb
 roq0qJRlNHDzZlDqCG8ljFRg0BZerTifRoxw6eQ38GUEbM3/THYsfJO0MunoChNBWQu0
 sdqQ==
X-Gm-Message-State: AOAM531p8ZSILeH7XEQ2nI40uH3HBuhf32OfkaKcTBZVI7QBwWhc2kP0
 NbSX4mI6Fbf36LHY9BP9gRy4LA==
X-Google-Smtp-Source: ABdhPJzVk0umlHzVHRVewr1J235Q1TOedxPD9LqEM9FUcWKg4ow4oP7F0Vn1Lxg5LVA/dXFYKENgXw==
X-Received: by 2002:a6b:f60d:0:b0:645:b224:8d45 with SMTP id
 n13-20020a6bf60d000000b00645b2248d45mr2260931ioh.131.1650641109156; 
 Fri, 22 Apr 2022 08:25:09 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1?
 ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a6bcf0f000000b00649c4056879sm1623049ioa.50.2022.04.22.08.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:25:08 -0700 (PDT)
Message-ID: <2f8be0c6-4c62-04b3-6ab2-8e48b633d7f9@linaro.org>
Date: Fri, 22 Apr 2022 08:25:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/7] target/xtensa: fix missing tcg_temp_free in
 gen_window_check
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
 <20220422114332.374472-2-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422114332.374472-2-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 4/22/22 04:43, Max Filippov wrote:
> pc and w are allocated with tcg_const_i32 but not freed in
> gen_window_check. Use tcg_constant_i32 for them both.
> 
> Fixes: 2db59a76c421 ("target-xtensa: record available window in TB flags")
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
> Changes v1->v2:
> - also use tcg_constant_* for PC
> 
>   target/xtensa/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

