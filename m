Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CD8300F81
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:02:39 +0100 (CET)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34Vp-0007U9-WB
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l34T2-0006Vp-Fs
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:59:44 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l34Sw-0001VH-Tx
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:59:44 -0500
Received: by mail-ej1-x631.google.com with SMTP id 6so9805512ejz.5
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jTMGJucmJ43XghYz877ePSJsQmJzJz8W97wM/gE9QGA=;
 b=U3mlsanswp//rzr8hpsgwhu7JQblXXsDqILyRAouLNGdxuTS0dR2E7XtC66mNhepgR
 5Hi5SwC3rwfSmVFUdOLXLC4rrFDxhIGXjNUSoHtSzlsmndO+RyUuoCRTes79tJcE57Ru
 Ul3KlUaEe2R7sKsCcaXm7gV7vcYs51nEcJWyabUmT+mCNESqvK8V4PD7+dMcrNyK+BHC
 yjNVwRNWh6MErrAUQT0akYS5QO64Lx/ptcR/yV3RM0c3Tf1MMqBGrY6yTE15rMw4oK+B
 FhyYFCO3Xa6sO4lQXdjT6EFa+rMvQ8lMSJll9SQ7kvqp+0pJcAWC/IPcBfOe+DMz4zAG
 Mpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jTMGJucmJ43XghYz877ePSJsQmJzJz8W97wM/gE9QGA=;
 b=kyyhupUSS2iVoL1+/bL8JDTUE2NctyTwJQq/EuDH23Ixww1K6X8K4MpeF+XEJ3KGY2
 IeZf/wb2V/QSqqLqNPJk1cPYabGFRnOHaCCvIw5ROzvBLqki87T7WYbat8yhQDv3+8UD
 jvWhL8TywOLRZCvkinqhnbjSNvoAPMZuMvv+kGPAWxmLVcDuP3BBRYqPbk92C5TMH94e
 rlu911j/slnCYiE4dXh46Dl8OUrFp4CGcmUtcuqWQFVTeWveenbdPBYbCn+uLJGP5L4f
 QJq4KXP6PpKbmFtCc4EqA+xWUB2QMZrBBi2iKzAni2xzuk7jwitR16ZfxTg7KwcSJbl7
 8vtQ==
X-Gm-Message-State: AOAM530gAJlT4V2qiEP00lvm/P0rhrAG3vvSxGgJQxQwL6GGfXATyiRi
 U9kPzWWoy205dMCGkBJXdnc=
X-Google-Smtp-Source: ABdhPJwhFybQQmwK37/zeDDGQYLhZ7F/WR6v7cbtyWH/wk1YhEIT+pZTeqHOanqeIBQtQ9f1nULo+A==
X-Received: by 2002:a17:906:344d:: with SMTP id
 d13mr590414ejb.367.1611352777396; 
 Fri, 22 Jan 2021 13:59:37 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z20sm6242096edx.15.2021.01.22.13.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 13:59:36 -0800 (PST)
Subject: Re: [PATCH] target/mips: fetch code with translator_ld
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210116181328.3890849-1-f4bug@amsat.org>
 <632baae5-f8a4-72fd-e33b-d1622b13a04f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1bfe5c24-885a-b123-495a-809a5f7c0713@amsat.org>
Date: Fri, 22 Jan 2021 22:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <632baae5-f8a4-72fd-e33b-d1622b13a04f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 6:40 PM, Richard Henderson wrote:
> On 1/16/21 8:13 AM, Philippe Mathieu-Daudé wrote:
>> +++ b/target/mips/tlb_helper.c
>> @@ -21,7 +21,7 @@
>>  #include "cpu.h"
>>  #include "internal.h"
>>  #include "exec/exec-all.h"
>> -#include "exec/cpu_ldst.h"
>> +#include "exec/translator.h"
>>  #include "exec/log.h"
>>  #include "hw/mips/cpudevs.h"
>>  
>> @@ -526,9 +526,9 @@ static bool get_pte(CPUMIPSState *env, uint64_t vaddr, int entry_size,
>>          return false;
>>      }
>>      if (entry_size == 64) {
>> -        *pte = cpu_ldq_code(env, vaddr);
>> +        *pte = translator_ldq(env, vaddr);
>>      } else {
>> -        *pte = cpu_ldl_code(env, vaddr);
>> +        *pte = translator_ldl(env, vaddr);
>>      }
>>      return true;
>>  }
> 
> NACK.  This is not within the translator.

Oops...

Thanks for catching this mistake,

Phil.

