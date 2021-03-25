Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01D349231
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:39:55 +0100 (CET)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPHG-0004lf-Df
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPGV-0004Ml-7Z
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:39:07 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPGT-0004Om-Mi
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:39:06 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so1758113ote.6
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5wMLCkb0GlKN9ufHaKWXPsNqTNpQrGcdDnFc8DoQYyc=;
 b=FgR4RdnY30rBpJeueMepWz7CQ5OEmrEXf56Hk+oaHrhnWhXlka7bVbh69nuPZclcma
 KOjpi4k9wlEy3VgwQl6pXNa+QMLvL2gR+ROQdVog6x2r5Hz1GRnprBh/kgUiQ2gvFHiE
 v1liTpgdfITrqnRb56Ydl6h8laxdU+pBLYBkzBTYyL19RkkW9pmXDbXbztfS3zJdqO3L
 eqeRE1LmVpDbk33km3mXAjI8C4tn1HdT5xoPidoQr3V6v/7dBNGrz/zdjs9PN7O9Y8ti
 v5UQo5wG/HeEJqenNqe4DPVRGHDqid5IS2PZPDAPIjHFxd83tUluGgJGOVERXu0kNVfr
 4aKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5wMLCkb0GlKN9ufHaKWXPsNqTNpQrGcdDnFc8DoQYyc=;
 b=AirtU+Dxm3UFiLvjCO0Mg4K5hJqUHfzfnoeDgLIKQJ2CE3MFhwL6k6qXiJr+xefebc
 SufQ7eME0DZykjrPO8mcqhri3QrwxwkMvwMgc97+yqERggepXVfDm89Lk+14wzV07D87
 3vymN8pM6S9xN0vQb9d1gdw3DwO4sekGJs7ZJVHOWdA3bH7vB4KaaCB6qYNy/Mgmvfen
 i1sVa0um9cgf5dC+ObOswYPDqqadZlWeM4PF3V7HAOoRKaRwz38hyqIe+auoy6E3jhBk
 yQ34FQc28CYMeaRbxSsgFwHaWgQBTFEtvTETWF/DP6ssZjY59LvAzbFEccggKGj73AdX
 daog==
X-Gm-Message-State: AOAM530c2QJ4RCBSgwmJyTHhwcrOmZL0CzFkgs3xQ9aucxIkcXkk6cpS
 Dt8ZSF4xsI3Jh6COZlcRMDAcI1P8qSCBQjLg
X-Google-Smtp-Source: ABdhPJwzoGohHN0mwNh+qUtiCgTxXgRfxYbQj65mh8cecN7WMTqQ6bpjmMUR1b+9gtmlFbxLl+dc2A==
X-Received: by 2002:a05:6830:57:: with SMTP id
 d23mr7242336otp.44.1616675944400; 
 Thu, 25 Mar 2021 05:39:04 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id a16sm477851otk.62.2021.03.25.05.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:39:03 -0700 (PDT)
Subject: Re: [PATCH v3] i386/cpu_dump: support AVX512 ZMM regs dump
To: Robert Hoo <robert.hu@linux.intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com
References: <1616572804-7898-1-git-send-email-robert.hu@linux.intel.com>
 <fc15756c-755d-fc96-80f4-ac9d6f6b461b@linaro.org>
 <09e24732185ed4df204063a6446c39ae4805d4f6.camel@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30be732d-50ce-d11c-88c6-f23e2e2d1c48@linaro.org>
Date: Thu, 25 Mar 2021 06:39:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <09e24732185ed4df204063a6446c39ae4805d4f6.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 9:15 PM, Robert Hoo wrote:
>>> +        } else if (env->xcr0 & XFEATURE_AVX) {
>>
>> This is normally a 2-bit test.
> 
> I beg your pardon. What 2 bits?

I forget the names, but isn't the usual test xcr0 & 6 == 6?

> BTW, checkpatch didn't warn me on this. It escaped.:)

Heh.


r~

