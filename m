Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BBE3DF6B5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 23:04:51 +0200 (CEST)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1aj-0004z4-Q2
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 17:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mB1ZF-0003fB-AR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:03:17 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mB1ZD-0007Ji-KV
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:03:16 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so5687349pjb.3
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 14:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OkBDZlgu05lZlUpfdbD1FCpfq4OUU4bJP/czZaM6Opk=;
 b=sDRzX5e0iYuvTryxMXaOG3XuLz72vhkwINjj6cUrsPOYChSitV+xy3JCUSca3UPJns
 odtjRlQxCO3xWmpmpc0wt0+eugrYTxRS1HpuwAGgi7qiM0ceNVQEhCZAr98MsK7N2TYl
 GGYw3ud3qxf93svXSRtnfvm37BO6AEsaxGhEqABHXmA7RcCdlhf5BTVhS+Tq2pMQKJQF
 qJ8dEDa51qFZdhY5BdeyOnHZ6SZrc9cy3DIWQjdnxLfjSnKOGSw5AeEWJRUgH4koHPiJ
 kpY7INWtzYJgrB7ocA50/6qNeWtdrdx9V5i+TDQBDvZ/KW0wl+umaIMqTakL4DcZ2MdK
 0HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OkBDZlgu05lZlUpfdbD1FCpfq4OUU4bJP/czZaM6Opk=;
 b=ionB2wWXv5B300ryVfALqs4/zC+JXwHPWf11rpqoLZWdzPGZxw/50AAxj6m2UCouiu
 tveDtufKwPBJY/hB/ofaAtTVC581GnR4B3fsScUugzjoIGaRMv2TA3TNcYx+CrQciwFO
 wpn1hs4AHjPgyOzI/qwR97/GnXDGV02u0dzOB/OKW56rr6+r/1Ap1SY8/4rA3/kk+5Nk
 U6Ec0JRpPWz2/IZe19ig6CespzXV2QmX7fNbaQJUAPzT6XLMSs//Z5NA+tOJqs5wTxUc
 gGqP0ykbcIBFA9cSHpnzSbdA3SByCWMmYQu1dcafPxyn7Mi/njMX0+lKIFz4QNw5tu87
 b9HA==
X-Gm-Message-State: AOAM533I4zF0gGFqiUPNUCR1Yog+LvlfHMyaKQm2YPzWU71Je1movkJ/
 0ujEiZy4ZE605AVD+esd+zXBTQ==
X-Google-Smtp-Source: ABdhPJyqycVD+gwlM8cdtbnvzCUbJtFoj/yG//7fH6vXHIiyIn/XQSdLjXDp+lRJ+5JxE3NhD/68TQ==
X-Received: by 2002:a05:6a00:1305:b029:347:676:d38f with SMTP id
 j5-20020a056a001305b02903470676d38fmr23858567pfu.39.1628024591790; 
 Tue, 03 Aug 2021 14:03:11 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id l13sm101255pjh.15.2021.08.03.14.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:03:11 -0700 (PDT)
Subject: Re: [PATCH] linux-user: fix guest/host address mixup in i386
 setup_rt_frame()
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>
References: <20210803171858.148394-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0748655e-be89-1542-e1cd-66506c7e54f0@linaro.org>
Date: Tue, 3 Aug 2021 11:03:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803171858.148394-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 7:18 AM, Ilya Leoshkevich wrote:
> setup_rt_frame() passes siginfo and ucontext host addresses to guest
> signal handlers, causing problems when e.g. emulating x86_64 on s390x.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   linux-user/i386/signal.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

