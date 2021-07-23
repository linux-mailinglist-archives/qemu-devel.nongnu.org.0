Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A151F3D34C6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:42:36 +0200 (CEST)
Received: from localhost ([::1]:35808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6otH-0000UU-PA
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6orZ-0008Aj-SL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:40:50 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6orW-0002eU-HH
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:40:49 -0400
Received: by mail-pl1-x62b.google.com with SMTP id e14so2084354plh.8
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 23:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=beUh09B/gd1QZzEyir9IhWNP/2XNB+RlmtLEjlNmtNc=;
 b=X3aHSC42+Be2Ys85iYTHJwctMtrSYOxdrpFFWniazh6OXlvOO+pVd3MfrV6NkYL05L
 9XcVFhDVFUmm6KDR/FAkiHhp8vvObErR7Y3PJpHI90Sd41O3LYBFFbKgraOzbgIEizq3
 GIRWsvf4cVHHrP9g28mKCyfxyagcPfGDh7O5Pv29WKJw0cXvutcoIlFP4CWB749K6jEq
 9hO/CUkuPus6amx8tW/6B6aYjqTHe9lKC5oNj5Y6lQqwP54BHSMRDGzF9FKXxbEJzLrM
 dULEapF3fGQEHgoHcTVDjzEcLLj7V2y2hMcKUf4YHR0G+/y/pXEbheexkewOL4koWgbD
 aohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=beUh09B/gd1QZzEyir9IhWNP/2XNB+RlmtLEjlNmtNc=;
 b=oC8vymmUHDhtLpB0SJj/o80vuuM8WBb1wIEdQDQnqdX2pBk4hpmp1MOvD6XqeMoRE9
 xD4lT+DwL3bqVNE/1swAeLdGYM+JKZnGlBmk+eB6nfT7HGOcsUbMQXkz0Ooe2uMrVMBn
 dYpLJDx9p/Puomu1KNnPDRmS1ptO5iqAeWOxeU2oc8VGVAboxPr96J8PQC6XOzijj2Cz
 CoGzEVXmlrmuEg1oLJYhjnKPZyP5C+xuMbRP6w3uIU2ZzQc1m0CdaBUQL3DyRYGUw73Y
 vJ4SqAmGH9CVDn9okD2wvv6xE6c3QtHnoFGD5G5cHm7+MGzxzOLIcOhTapaa90017iVA
 PNrA==
X-Gm-Message-State: AOAM532Au/iXlROoehOK0XOesXSnAM4ybdxged/LGyqNAXBIRAJBYGqX
 Xy4HJ9Xz+/xNcYiGvsCeU0fiAA==
X-Google-Smtp-Source: ABdhPJxzfpSmCfpuOHAIE/HWSymsBq8u43ogdpfhI+oAYDAdJvnQKAQviVIH2hHqyOOYVW2vpB8uXQ==
X-Received: by 2002:a17:902:6905:b029:12b:8f6a:7c60 with SMTP id
 j5-20020a1709026905b029012b8f6a7c60mr2724485plk.24.1627022443442; 
 Thu, 22 Jul 2021 23:40:43 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id l11sm27612450pjw.45.2021.07.22.23.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 23:40:43 -0700 (PDT)
Subject: Re: [PATCH v2 19/22] target/loongarch: Add disassembler
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-20-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78ce6f0e-58db-e4d4-889c-f35ea24f16c6@linaro.org>
Date: Thu, 22 Jul 2021 20:40:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-20-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> This patch add support for disassembling via option '-d in_asm'.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   MAINTAINERS             |    1 +
>   disas/loongarch.c       | 2511 +++++++++++++++++++++++++++++++++++++++++++++++
>   disas/meson.build       |    1 +
>   include/disas/dis-asm.h |    2 +
>   meson.build             |    1 +
>   5 files changed, 2516 insertions(+)
>   create mode 100644 disas/loongarch.c

A quick browse looks fine.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

