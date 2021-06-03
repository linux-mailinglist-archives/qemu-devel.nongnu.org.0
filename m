Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871939A980
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:47:00 +0200 (CEST)
Received: from localhost ([::1]:40472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorQp-0003c3-G5
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorOt-0001x2-Lj
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:44:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorOq-0007Br-Py
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:44:59 -0400
Received: by mail-pl1-x631.google.com with SMTP id c13so3301388plz.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lT2xGHb+lXwi3VSkBktdMzmY9pXHRUPOQmEmqiEPCYo=;
 b=CcXjCX4u6CzCCGwDTKQdcy7DsFO/w+XQ/m5002mIpz9BCSB6rF0i824hqRBlu22U3C
 o4448OIxxGF0SrNRKtu72IuC7NQV94261d+abqeEt5Plmh3K3LdBHSAgMR2dSfoPV5W2
 XBnejqJmqo2vHqeHNPMv/xsepgu/AUMXwoPQ9nsTATouk8LniFfywrq6gVBnJyFkDvKw
 A8TDvE86f+uRaki9eJ31ie4JwNvXqQmo9KCu4r9SxruVkOgeYE+xRzIUsBNUKEE3GDky
 QkCZ6meqJTAXo4nlnAXMcQXwl1SzS11k3/JzVS+MlRRgz5y2CzhjwGny6EWKcOECvGat
 gDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lT2xGHb+lXwi3VSkBktdMzmY9pXHRUPOQmEmqiEPCYo=;
 b=jKnGhhUK5CdrNW2Dwy2GkzQRuj7IKZGoppIiF4mZvgCgxM6Uo6nDX3DEDxLfC6pjHB
 CEkdBpfCZsL4f7bfIQAI/nA6XE9ShLmr4etkyIH68KPP+CQ+oiKT+Muv72tRRuHQEeHD
 sMEsNq5lGpG+XJKdOsMvSVQnHLYC2gd81Z/Tb9dgsXTTxKU8nkTEsPzLd1Ih049V8nCm
 0qUDWHqbOXFgkDtYxyYWmAdU4HpjqDKdD3WT9PjDCv+CCo2x7zS89xV50G0GlORvHjC6
 0xA4cvGqeDpvMLASJ6OZpOanTVNOTExInQENJXZ+fLBSNuyq0tQ2t55VVQTtisoduxl/
 oLBA==
X-Gm-Message-State: AOAM532WJb0pFRuhT8qkg5zHR+stOlS5vmYFz/7sN0DRa+0x7wNWxOta
 xQylilLFsqmk0Ru+ZPOc2XwoSA==
X-Google-Smtp-Source: ABdhPJx3R1q1csXQPLvSXkSbh3UIfnbbTfvjmGXdWak2Uvlm8erLAkQmYj++/waPohEms5mo5aRVug==
X-Received: by 2002:a17:902:b205:b029:105:cb55:3a7a with SMTP id
 t5-20020a170902b205b0290105cb553a7amr198131plr.17.1622742293038; 
 Thu, 03 Jun 2021 10:44:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r4sm2709935pff.197.2021.06.03.10.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:44:52 -0700 (PDT)
Subject: Re: [PATCH v2 21/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 MULTIPLY AND (ADD|SUBTRACT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-22-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1fd9e571-1d50-d485-ed22-b83d269a1b1c@linaro.org>
Date: Thu, 3 Jun 2021 10:44:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-22-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  4 +++
>   target/s390x/translate_vx.c.inc | 47 ++++++++++++++++++++++++++++-----
>   target/s390x/vec_fpu_helper.c   | 44 +++++++++++++++++++++++++++++-
>   3 files changed, 87 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

