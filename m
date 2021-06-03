Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3069239A8A8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:22:45 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor3M-0002xx-2R
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor1t-0000lC-7c
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:21:13 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor1q-0002Nt-93
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:21:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id u18so5374852pfk.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ix7uOvDgtdZ4F7x0aHQNMYiQ9HJRsiFRhI97TQ94kRw=;
 b=El3v1zDfDbSSIUKVw9ZA1e49Isj8O4+TliB5WFfgdP4t/9TsCFD9mS3FYCB9sfdZgo
 AiuPeUXDS/Ty5q9B74r7f8idGkZWvaRpQrLwI6c0sEIgmx2BNBgqBN5jD065EDIFCF3F
 iSckr6Tc7O2S5QefC5jnyqsrohTYSMRl33G4v2yVfLKNqNEJSaJEV+H9oTmcUMHvz1PT
 OO4PWFLguQbHZDQai99cwr+DMMgP6w9+9267dm+Cfp05sYa4gVRun5ehAnWcbwrnxO/p
 kxah2/38udgs6Sg5+NO2hVceVAm+eBCpGL+GF4Vup3vPjRZ+vU0lpRUZFJqWSq3SIcqL
 hA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ix7uOvDgtdZ4F7x0aHQNMYiQ9HJRsiFRhI97TQ94kRw=;
 b=gHiwVao2sS+VZELvElubl8ex2/ubfniFZokd9rnNCFB4S6GKiRoExTYKmmV3AdT65G
 5Qd6J5ZXpgD7COdshoPgm7Kso3tKseGFExkMAqfFdU3KiGG08/ibxM07ckf53i7cgGB1
 PaU27WEJQHAZin1+xPVCqkk47tdVIQu1DWZQ49RvTm0A60w1CRdecNe38AJMNK5Q9JmP
 p4Nbo0qo3l1517675rUpfijLcznTdZyLr8dZPQEfS8JcYLMkaRj8EJ3gMbQj+r9Om6Ge
 a4+aP+sRBhTO1KUbH7jVs4KItVB2+/Dn+R9tUalgK+UXZQnMZ3ILelUaH516I8kkUAWZ
 F/ow==
X-Gm-Message-State: AOAM5310lqSl/vMadcIotyvPnzPEjp0IrXe0Da3sU8+97uLHxVieEQmP
 QoR1/YTrkuUBApWOhyx7ShtgJg==
X-Google-Smtp-Source: ABdhPJxbFgoeos4PdlN9paQCp1GRDD+IQWvcizvUYNC6mDWSGex6d/SYaE46CEBm3HxCpSVL/gbP0A==
X-Received: by 2002:a62:e21a:0:b029:2ea:26c5:2ec3 with SMTP id
 a26-20020a62e21a0000b02902ea26c52ec3mr218950pfi.8.1622740868952; 
 Thu, 03 Jun 2021 10:21:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p20sm1544259pff.204.2021.06.03.10.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:21:08 -0700 (PDT)
Subject: Re: [PATCH v2 06/26] s390x/tcg: Simplify vftci64() handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-7-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <339c4e7e-20b1-ddc6-d96c-c774929def98@linaro.org>
Date: Thu, 3 Jun 2021 10:21:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-7-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
>   target/s390x/helper.h           |  1 -
>   target/s390x/translate_vx.c.inc |  7 ++-----
>   target/s390x/vec_fpu_helper.c   | 29 +++++++++++------------------
>   3 files changed, 13 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

