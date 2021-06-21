Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00763AEBF7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:05:38 +0200 (CEST)
Received: from localhost ([::1]:32844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLUX-0003o3-NL
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvLT5-0002bf-LD
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:04:07 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvLSz-0006fE-Rb
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:04:06 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o39-20020a05600c5127b02901d23584fd9bso11334253wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XU1ccI0xJvrI1JAi17lGq8BvnZVyzaC6HL6vOKntFNU=;
 b=sPmk836I3sMW1lC+8/zLPHf5Dwb+LzzuWSHrwLCIXakjF1/3GBlU/Zw994HSnfSTDo
 TlqyemGCrPxZMrtwBroLICdirR6fSwGebn4JmDcemkNS9CA4KuGuzhIBF0UJeDwQ4YR5
 e6WyoqshdC6mnyM5Ae0TydRnh/gN7ZzZsnRK2qJOPQAGHJzOffNxDC36urC3Xgo2/jR3
 ZF6aBh7g06nizQrMs07NDGKEBPsD+WRFb5701WieM/6ip0Zyakh69kB29oFl5+fj15pk
 hEGVtXXfjKcIl2EUmcPBJYymtDcWXGb8GVaBKVg6RP+9D5WM0lRmRkMq9o0sHnWesPpd
 yGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XU1ccI0xJvrI1JAi17lGq8BvnZVyzaC6HL6vOKntFNU=;
 b=MKBIJnSe3EvMKO3Hmsnqg/wtJ0U6WdMW/pPcQ88YFsjfym3SpTaxwj7BcVSOxfZgvZ
 dmI8ii6m5bU1XSfrGc9VDnZI62Gi/fmdqQ4xhxZ3WiYHiEy39yQvpU0HCDd7qKwOLNBw
 4RtzibLE9befxkQnGaQsPXwNQW27NnqUd0f3tq6deoHOI1dbNn66gEj/DB+QvQXyO1wP
 Cunc6IoPHaILKSNNAxhYAcJlWhTGBA6ZcTJkIiwMvv64IwpWrqw4lE2gh9W9XEKVbKlV
 F8+RZRC2Nw48Hbgc8xO9p/t/8aZytnZ21Kd2xqTOy4/fRRhm0gqPntwGXawWozHLdQ2I
 GDjA==
X-Gm-Message-State: AOAM5306Zk7Vfbfz41DO36nnayrxKzY9QiPqxzou6MnANN5maIUlQrFM
 u1gBSPvMl4I5GO+MqJD9OMI=
X-Google-Smtp-Source: ABdhPJyRCjxRYZifr3WDFjCXcgj7k52xTt0+lY2cNl6H2reXowAY3g072zRxTczk0YCHUz+Buo94Fw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr27922159wmq.138.1624287839879; 
 Mon, 21 Jun 2021 08:03:59 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o18sm17811118wrx.59.2021.06.21.08.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 08:03:59 -0700 (PDT)
Subject: Re: [PATCH 01/26] accel/tcg: Introduce translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-2-richard.henderson@linaro.org>
 <d0f44918-da3f-60a2-d07c-1fde60b445d5@amsat.org>
 <7b8a349b-35ec-ee63-175f-6182ae8d58d1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eaad10ac-399c-5cdf-0ac5-d581aa105c1b@amsat.org>
Date: Mon, 21 Jun 2021 17:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7b8a349b-35ec-ee63-175f-6182ae8d58d1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 3:47 PM, Richard Henderson wrote:
> On 6/21/21 5:50 AM, Philippe Mathieu-Daudé wrote:
>> I notice various targets do:
>>
>> #ifdef CONFIG_USER_ONLY
>>         return true;
>> #else
>>
>>> +    /* Check for the dest on the same page as the start of the TB.  */
>>> +    return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
>> #endif
>>
>>> +}
>> Is that OK to remove this case? If so, it might be worth a comment
>> somewhere.
> 
> I mentioned it in the cover letter.

But the commit letter will vanish, so preferably mentioning
the change in the commit description (copying the cover letter
comment could work too):

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

