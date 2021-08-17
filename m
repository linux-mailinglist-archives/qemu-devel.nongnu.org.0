Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F5A3EEFAB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:54:50 +0200 (CEST)
Received: from localhost ([::1]:53870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1QP-0006kC-O0
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG1PJ-0005iQ-PT
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:53:41 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG1PH-0003BV-86
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:53:41 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q2so25313375plr.11
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hfUudmOi+wqXyPDOY339e2DVPnIEwu0fpqDRt3BOh7M=;
 b=rrshm1Md4DRSq2yU5burKAok+v0ieYRO9QapsM3ccCQp7ID8dRFR3AuWS+Lzd47GIP
 mrJ3ht26cW4INWFbNVLpFsoE0akc+jm8Pk7ZlPDRoYBs9AS8iBEc3w+JsgNg3304zRfB
 UYYjGms4D99bdvFKDBQAdEp7whzXAjYrQcaZZ/7xy/YxhlR2ndJXy6RpJ1vfo9/SC2wy
 R3kx4KB4IAOsXeyB/5LVXvyDf2Z7PH5At/4pG1OP37UYt8k99AoTNt9R6J0kN6ujGmB4
 AnouPuLjN0aOzAmIZUTIiDdgOr4FZpsAQ9c+xq7lrcO/ToBp/IGbAekQdZQ2unoHWJIj
 d1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hfUudmOi+wqXyPDOY339e2DVPnIEwu0fpqDRt3BOh7M=;
 b=Tvq6CirvicWw8/at2h8sQgf81MtNiB4BbWvj7WdmFaRQu3quMSFFn4tBnIPYP/2l0v
 nn4CGdt9Oy93UPygOXb1ofRoTIC1CFdwxa9ohcyoE1VZFVwCK4uaIYvPgQx/9aPGvmwV
 aOlQq7LtK8c0XqjwAJVWn23dlXk/8O71ZRFKFXaOgutp9jMNRZ0sEtJoQFAXTWpAMCW1
 jtZDg4pLjmDrbiLX3H8r5ItY+lIjGUF0voPatrMxl6oeb0/2xrBc/ChWLoFQQiNoqEvl
 OP24xB9btXAvMxa5OjuzWjT4/PeoUpN5GImd0Gt1PVaP8C9QSN7DLzUvMD2j/c2XNk7H
 QJcA==
X-Gm-Message-State: AOAM53341W9T92DR4kO3FnOQ37GoO0zN8gA99dtboI0Wi4AyHDobpNKj
 U2WQzL9dMpN/jPiow9408KSZRlhm8pNAAQ==
X-Google-Smtp-Source: ABdhPJzigIBzYUxGympH2nC8F/CoQzTKM5hrWkiSJm2/aLYFiTpZEtv/OmJ/vJy8PQFy3eVTf8CC9g==
X-Received: by 2002:a63:f754:: with SMTP id f20mr4164125pgk.385.1629215617559; 
 Tue, 17 Aug 2021 08:53:37 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id z131sm3180466pfc.159.2021.08.17.08.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:53:37 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
To: Andrew Jones <drjones@redhat.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
 <20210817153639.o5fxdgmuhjusvyhq@gator.home>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
Date: Tue, 17 Aug 2021 05:53:34 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817153639.o5fxdgmuhjusvyhq@gator.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 5:36 AM, Andrew Jones wrote:
> On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
>> On 8/17/21 1:56 AM, Andrew Jones wrote:
>>> I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
>>> which would forbid changing the properties if you wanted to, but then
>>> we need to answer Peter's question in order to see if there's a
>>> precedent for that type of property.
>>
>> I don't see the point in read-only properties.  If the user wants to set
>> non-standard values on the command-line, let them.  What is most important
>> is getting the correct default from '-cpu a64fx'.
>>
> 
> So maybe we should just go ahead and add all sve* properties, but then
> make sure the default vq map is correct.

I think that's the right answer.

Presently we have a kvm_supported variable that's initialized by kvm_arm_sve_get_vls().  I 
think we want to rename that variable and provide a version of that function for tcg. 
Probably we should have done that before, with a trivial function for -cpu max to set all 
bits.

Then eliminate most of the other kvm_enabled() checks in arm_cpu_sve_finalize.  I think 
the only one we keep is the last, where we verify that the final sve_vq_map matches 
kvm_enabled exactly, modulo max_vq.

This should minimize the differences in behaviour between tcg and kvm.

r~

