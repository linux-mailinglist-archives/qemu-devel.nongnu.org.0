Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D18201E38
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 00:49:00 +0200 (CEST)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmPoh-0005xp-JO
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 18:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPnl-0005RX-PR
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 18:48:01 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPnh-00024t-H6
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 18:48:01 -0400
Received: by mail-pl1-x643.google.com with SMTP id k6so4516581pll.9
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 15:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Fi6CPrs4M+nb/FU/foAhmvlkzzSTg8CGtbvKr3xghu0=;
 b=IoJ9AyxsTZWPmX29qRxzqOJgwZ/6I/SFh4YNIa8oKA9EB1wjnk2gDnb2PKV1J6+j+j
 yA0ScjCdyGVweeUS+Far4djHhe+IcL6E9goIoiDlAXErpBuS3N/C0ySaZDe46SHZOF2e
 Z4+FomInrZbzDup3rR73uur1iiPx7rxuuR1DNcVgXhenURIEJQrMDlhcc48JnEjgxkLZ
 8DRVul9Ypag7vKBLeNSmYTbEZ/qpsJaJxZtLNhMbvkRiBxJ8poKVvXON7dSsrIW5Olr9
 RBf5FbiTb4InFUyi7CleS4DvGQnYJfRtb57mABhrqxv5cOJOOx0SWMDD0Fns59gmgmWu
 7KYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fi6CPrs4M+nb/FU/foAhmvlkzzSTg8CGtbvKr3xghu0=;
 b=eQxuPoQEOc8J155cPJNBjjNemnmHBXp3iRaKtORp58lTtcsRdnkNwvh7DTHpIfDlUK
 MbZBYhLQ/t9mqICcqh9Inh9Avn/BuXUg1INl742+J4OTYV7Xo7AHSQOPxYAgJ3NkOuYC
 3suS3Hv4HOFuUSXK5v7WaGSTCgeriQq3a9BwBupENn2SyHapCIM5QJDISa10eboiiLyK
 VDNsBWJ1elTFz2mPmSHr0ENsaLv3CIYwHp2SZWiYhLoid4sRXylsFzCUBMt5TX53MEPx
 6SvVwgslV6OEWS2VhVQC9vz750UUd8K6fsHRwQO4S7H64JrmQML7hc9uUcT/B9aD2zSo
 icOg==
X-Gm-Message-State: AOAM533+3Xe2qH3L3FebO37PiDh/PIU2VLIbXmzfG983erUMl8vxj3jY
 m1efoX1gPBl4aSHkHLTlrwRlK59BdVU=
X-Google-Smtp-Source: ABdhPJzBa8WpoBlMMKR7iR0HR8tetfW03LaCxVQvKeIHCywkKPqMW8FuZP8fmMvB/FfrPyE7LiihbQ==
X-Received: by 2002:a17:902:8a82:: with SMTP id
 p2mr9580254plo.316.1592606875922; 
 Fri, 19 Jun 2020 15:47:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b4sm6962925pfg.75.2020.06.19.15.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 15:47:55 -0700 (PDT)
Subject: Re: [PATCH 03/21] target/arm: Convert VZIP, VUZP to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17a26e98-ca88-23a2-6c94-6da06716d69e@linaro.org>
Date: Fri, 19 Jun 2020 15:47:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon VZIP and VUZP insns in the 2-reg-misc group to
> decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  3 ++
>  target/arm/translate-neon.inc.c | 74 ++++++++++++++++++++++++++
>  target/arm/translate.c          | 92 +--------------------------------
>  3 files changed, 79 insertions(+), 90 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


