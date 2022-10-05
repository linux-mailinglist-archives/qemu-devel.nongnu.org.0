Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696AE5F5B15
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 22:37:52 +0200 (CEST)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogB9K-0005Aq-Jd
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 16:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogAy4-0006Ln-QD
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 16:26:22 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogAxy-0001U1-Bq
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 16:26:11 -0400
Received: by mail-pg1-x534.google.com with SMTP id r18so3151289pgr.12
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 13:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=UA7dva7BvEVn4KzGHucDBYfpIPbT5k3o1sxAJpnd9nk=;
 b=OZ66BY052YVDgdiYWvvIAShqNUSDnTGqu91fknHu9gm2RdDwug/Leeq7hc/wNE29c9
 IO7VTpN6FFq/CwBgrSRTY3OFim/jz5V4yI7q9KlhOR8oaxIVdXWcqqWc9Y0K0XE7HS6z
 mtUbKZwjALn3xsdYMtqgB9nnlZKZqod7o502PPepeMW1sdv3j/nY8zGBKd22nBa1Ffqz
 0R8H2X0XB9J6bFi837BsUE5iN/WfuxTXPFz0W5QN7jVRHUpbZLWwpeEpB93N9b0pKgQk
 m4MJLmcuJiUpxQxKJ+aF7YMjYXQwNt8G5ptyEUZnEpGBivpLEZgD4PHRnEHxZLHP1vVp
 pkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UA7dva7BvEVn4KzGHucDBYfpIPbT5k3o1sxAJpnd9nk=;
 b=eEKYZsGDWxoPB0H9CDm1+hLTGJNDgdyukj4clmW/VXsqn724ltXr4IT5tmNbUvKzhE
 k6hinvOeS9ENZs7E7WvGdhIeug/f90gfP4GovxHjPSocEE8JDWDS45FOWBObyIjsy/TD
 +8Z0mhoR6u/EGNcFNnBcdQpmXpHcr+KEi//x1f6xiLOfkjXytebxMcYdhDbCG7prZfhQ
 q5Rd/FTcxN+AAQiU/fsIy++QSHveE0u8MakBggjDc7aDKVeIXVcanAE3ikk8ARJ1kTi/
 8CS6eXrOkJw/a8b+qw+kIqJ4MRqRjg++wRMWD8HibRRS1sFzqWYcI4e2mCjn5cigbnIv
 ENVw==
X-Gm-Message-State: ACrzQf3PhXLF19eZAQEMo10kATBXO7kmPFZgkIB5H0SKSKQqjq0XML0V
 1pRdK7FQxXCo1alBVjv2rSzbdQ==
X-Google-Smtp-Source: AMsMyM4zq12YHdPOkq8ycxH+4tLkW8cagqJSx8fBEPlOys4R5jnBCq51e1F15bEqZdaXMmZS9yh8Gg==
X-Received: by 2002:a05:6a00:1907:b0:557:e83b:1671 with SMTP id
 y7-20020a056a00190700b00557e83b1671mr1154484pfi.65.1665001562864; 
 Wed, 05 Oct 2022 13:26:02 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:9ad0:4307:7d39:bb61?
 ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a170903234300b0017834a6966csm10981006plh.176.2022.10.05.13.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 13:26:01 -0700 (PDT)
Message-ID: <15240986-73b2-958c-ed7c-275e64c0659c@linaro.org>
Date: Wed, 5 Oct 2022 13:26:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 00/26] target/i386: pc-relative translation blocks
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
 <CABgObfaCCJRSKpdYKjn4EH1Lf6JjZaBREg51USr9tLc7zvU3Mw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfaCCJRSKpdYKjn4EH1Lf6JjZaBREg51USr9tLc7zvU3Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 10/1/22 13:59, Paolo Bonzini wrote:
> 
> 
> Il sab 1 ott 2022, 16:09 Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> ha scritto:
> 
>     This is the x86 specific changes required to reduce the
>     amount of translation for address space randomization.
>     For v3, quite a few changes based on Paolo's feedback.
> 
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
> 
> 
> 
>     r~
> 
>     Based-on: 20220930212622.108363-1-richard.henderson@linaro.org
>     <mailto:20220930212622.108363-1-richard.henderson@linaro.org>
>     ("[PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL")

Thanks.  FYI, yhe Based-on dependency is now upstream.


r~

