Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67858F398
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 22:38:40 +0200 (CEST)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLsTP-000726-7U
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 16:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsLm-0001RA-0U
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:30:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsLf-00079A-78
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:30:45 -0400
Received: by mail-pl1-x634.google.com with SMTP id o3so15230633ple.5
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 13:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=zYNSI5VkpvuAX0PyQ9TxOuVLOz8bjZAyzgtVdynLWWY=;
 b=OTpGhL1I3hHelqz/Qi4UiPNTbq1D8yJEZL5D1elIJUBgTJIY8T+aVJcyMxevnTb1pV
 fcc8GJ5LeZHzVkluVfAFTdMA26bojLEHHvPXc+izJ/Iq/IwHZgAND0ZGo3CF3ZvO7pdq
 SbGFR1hMRFkl/0y5kDM9uttBvnp8PXfdI7187G682zip9z1EV2t42Oti6kq+OundZfVt
 ly4PCcxX/18tdPfEdDaMef+tStcvWFQsbHmCpj0Fgr8hvBDyJIO2HLheyeBodZL8NsoX
 ppXeLUaevHRbtcSXDx5o1rgtWTmC8VTCXio3mpVjF+MHzHYOntz/0/89zcjoGAAyt0Iq
 BNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zYNSI5VkpvuAX0PyQ9TxOuVLOz8bjZAyzgtVdynLWWY=;
 b=gD2MjDDAlajDjFxay5RqSYrYynCGaQdz2Xm9WWZ2BNjoSC+XrQr1TwHgFzsncS/qiD
 rJNpXt38F82TLYLc9OETuC8/HMSv4gKNaBpNoqR3/5rTcoS8Id2znlzu5/EqN7XM2lK8
 POpNEISa4Nw4Cqz2c88zxj2IpJ8Azv5q9ok4Wxm/rI7tG1H5TRecC3jWcUHmnT1YLB4F
 lOlUeWy3qvD6LxF1Znk+HizI3oF8YheSJnVqxEC1RKtPfCSZ2JTpl/xcIRgBM4bKhn/h
 J6Tm3WwZHFqWkd6yhmajk2602WSzbzvOoo69TGMqvRZ1cGSf0dox7cJoAKi8EfuJy4FT
 k4cw==
X-Gm-Message-State: ACgBeo09J0S5yzkGcsogKb3/6tUfMX5Mhgnoy4X8V5lM4Vi6ilX4hX/7
 6kCF+AttCysGjA1u5UkIhN07sQ==
X-Google-Smtp-Source: AA6agR7NHNHYzc3ILJJHM6BhnY6dYesNCdfLnc/CtJo/6W3w0f9oYBvCaM208EJl+xRvfeTHaobHSw==
X-Received: by 2002:a17:90a:c690:b0:1f5:858e:f538 with SMTP id
 n16-20020a17090ac69000b001f5858ef538mr5341641pjt.10.1660163436212; 
 Wed, 10 Aug 2022 13:30:36 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646?
 ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a621c05000000b0052bae7b2af8sm2349615pfc.201.2022.08.10.13.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 13:30:35 -0700 (PDT)
Message-ID: <a1a0ed65-824c-4999-a7f9-4c9c3ff123c0@linaro.org>
Date: Wed, 10 Aug 2022 13:30:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/4] target/s390x: Make translator stop before the end
 of a page
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220808171022.49439-1-iii@linux.ibm.com>
 <20220808171022.49439-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808171022.49439-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/8/22 10:10, Ilya Leoshkevich wrote:
> Right now translator stops right*after*  the end of a page, which
> breaks reporting of fault locations when the last instruction of a
> multi-insn translation block crosses a page boundary.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   include/exec/translator.h    | 10 ++++++++++
>   target/s390x/tcg/translate.c | 15 +++++++++++----
>   2 files changed, 21 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

