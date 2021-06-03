Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2872239A942
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:33:26 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorDh-0000su-5B
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorCd-00009y-1A
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:32:19 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorCY-0000dc-0X
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:32:16 -0400
Received: by mail-pl1-x636.google.com with SMTP id u9so3181305plr.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ojv3lyZP05LSTz/CocStel96pEzCyn6miUiV/L99x5w=;
 b=sCzKJDx7Xtx2MlVTGO8gAu6wu/1hrJphuoD5YGKhEi9ljXV5a1G9zU6pydpmu61S6U
 e8SYDMdH7+XGpZMlxm7iKT76CP0zd1KNkbQb9Bl+INwWvvv/29lFWQh4lP5nSAvzY7/v
 2kQhc1azhRrgKQBJeRgxMj7NkFK1OvzzrqtU4zDtaUcaaP8otu47mg93kR9hoiFOOShb
 rY/sqtDxuHwOOvKAnzhRdPQymB1RYQwgcWaaoojgw+cjGNLcHTVlDaWXrzVakmdbs1Ya
 w2ZBFtydi9jhXTbqH3U6VBAMzVkrLYPdZoZ1tYZO0S9Bb3keezcIdWyEeIPruj893Zzg
 rzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ojv3lyZP05LSTz/CocStel96pEzCyn6miUiV/L99x5w=;
 b=SCQ4AFUSNKohnm95uR4bM/XHjo1Lb3SMTXPpk+Pv4Xnwtqvf/6iEbibmaoFKZLmZFU
 XUyWbGVLmhLtnVihJF/q6TdoCndDQ2XzIKZ8HQHCQ18WSkOVhraNmazaAtkUIQuSSiPw
 p9DoWm/um2zWWIEucSpVOIBQC5gzB26BHkWbg+r5M31oT/WjwCO6EmIN9OsjX2j2C8Ez
 TRegi7LngZrptqd+mVNvOsL1+kM5+pQ4+h+UNHCYCmDfNmLIF43MZE3AFQXVZoNqsTAT
 U7aZNe7NzRVF5qfbU2WdsYe6zfQLme3392Dz4/i4VQcF5xuwGxKn60ovUoOniR9kTTiH
 NIcg==
X-Gm-Message-State: AOAM530W8xLeLRlVgFmXZgf3RNPPuo+XEAbjBaSKIIpST3CsJuu58nBx
 un9gFf+Zeyog9QIt0YbIPt/okw==
X-Google-Smtp-Source: ABdhPJyLgmVAEZIXNEsNUOuE1RpfOGcrpe0g2fAtOrAv/xL+KYl7Ui6D39MW0w6BPdm8fGsG3ww2ag==
X-Received: by 2002:a17:90a:f88:: with SMTP id 8mr1136181pjz.231.1622741532411; 
 Thu, 03 Jun 2021 10:32:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f139sm2714663pfa.38.2021.06.03.10.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:32:12 -0700 (PDT)
Subject: Re: [PATCH v2 13/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 (ADD|DIVIDE|MULTIPLY|SUBTRACT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-14-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61326501-266c-35a9-5c24-75eee5246b62@linaro.org>
Date: Thu, 3 Jun 2021 10:32:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-14-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> In case of 128bit, we always have a single element. Add new helpers for
> reading/writing 32/128 bit floats.
> 
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  8 ++++
>   target/s390x/translate_vx.c.inc | 85 +++++++++++++++++++++++++++++----
>   target/s390x/vec_fpu_helper.c   | 74 ++++++++++++++++++++++++++--
>   3 files changed, 153 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

