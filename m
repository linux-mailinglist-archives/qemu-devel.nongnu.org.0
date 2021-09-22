Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A78414CDB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:18:43 +0200 (CEST)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT41C-0003Oa-CF
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3yw-0008SW-NX
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:16:22 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3yt-0006Ag-5Z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:16:21 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t4so2024662plo.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=RlS7DyOr7Zrin4jt5MY2LAifRecgG58sAGMzVfZQ388=;
 b=cc+ThLzjqN39xpuCmMCvyZpNqxtQsHIk8fCDMgKjQxv6I1MMVb+J6PSeJpde9kHnb2
 O9M+qxwvPfkcynBz/mqptiLSLUWGUJFIC+K088s06HjTtnzy/4lphOCJr1c/Qa8Whr/R
 /DXtxF2OE2V5LJc8YeKy6ac/+IXwG0GeEbC7yimQmT+RorUkHbl4iY50BTRen68QAOy5
 LlQZaciy3R4NWz5hKNfezRKT2iRcSsFX5i7r3h8xHH9Ak+kqP8yOF9n5jvBSQOXvchAu
 ufNmZIGtUZX5nzSbKp+gorfsDXacjyg8FTOPQTbiK+VKQSexEGVBYw04TZah3plhvAnI
 3SYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RlS7DyOr7Zrin4jt5MY2LAifRecgG58sAGMzVfZQ388=;
 b=d4gj0daiGyb72ajmKGLumIt0ae3xqY8OMgw5hM6lBeEPPnKmjJocZ6yIPN1DNURv3H
 clzYNKoBx6IB5ISdHD3cQA/1W3nckw4eRwo5Dz3GDs5YSf3XStphP4YgivoYNJuB0ZpT
 WgNWxfDAUEQAmy8GZHJE8DW4Cdq3mTRu4emsZakf3/GjII4X+8G8QOghB7Z/9XLaPB3N
 GpsCcZZg0wUaR4NGUmvh1DDr6tYKHkdbFt9+bzOiNg7vHusTMpT1BCgqNTP3a7jG/gKv
 jkm9FYBc5qWIh1yCI95OfHHlYLrifnBK5B30Dx2AQVuuSloI+d85zHKzoRAb35TklZUg
 qJHw==
X-Gm-Message-State: AOAM531S4G42N3bwImDzSwjyQWEPIfhczcBUflfeKLkv7QlJkvLZdi/A
 d3BZjf1dVgtsxUNnNXk0EyIBDrapQ3GgWA==
X-Google-Smtp-Source: ABdhPJwnXID2ltP9wBAymotPf6rCg6v8vR48vZC4br5wEd0xRjx1tEWeoqonMw+s6Ab0GWtYrEA3nA==
X-Received: by 2002:a17:90a:e003:: with SMTP id
 u3mr11989903pjy.137.1632323777782; 
 Wed, 22 Sep 2021 08:16:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g22sm2931332pfj.15.2021.09.22.08.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 08:16:17 -0700 (PDT)
Subject: Re: [PATCH v2 21/30] tcg/loongarch64: Implement tcg_out_call
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-22-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4a2c1cf-4805-31d8-1bff-5fb0dc5edfb7@linaro.org>
Date: Wed, 22 Sep 2021 08:16:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-22-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:19 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

