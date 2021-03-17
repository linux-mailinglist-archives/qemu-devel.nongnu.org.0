Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5633E835
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 05:01:02 +0100 (CET)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMNMj-0001sj-8e
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 00:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMNLK-0001Sa-2w
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:59:34 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:38515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMNLI-00074v-IA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:59:33 -0400
Received: by mail-qk1-x72c.google.com with SMTP id f124so37625900qkj.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 20:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mg5eXazdh68LKi9mPMo9ldsAhwmw9VV59uJWGe/aHrE=;
 b=n1YUyhiLjNny68Gd7pYx1ZbGez+ufOgg9XAEULsfBGh6xWKPK1Z+jBnWQAoanem86T
 +2IOTogXP9mfhrUFSji8xaB/8fZKqgSnqVJDr84vw8arCj4yf8zGm7yG0G3OlAoQ8yJX
 HIw3GBnksUonm4MaKBVLHWypvwBkfvo+i4O7PQWkz2O6VNmDxY3L2Z8IjjJGX42ptP+y
 tKTHRzw/ESWEH8aF+0VZgd/R1CUe4n2qY7fbejYafkVGHpAG9/ixlbuI1Os8uHoKnP41
 B9m7r/rXPGViVNPC4KPiB/hQOF9wN/vpfcxLwldJdhZJyHMvG89n8fI6svYd8wMaZjJF
 Yq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mg5eXazdh68LKi9mPMo9ldsAhwmw9VV59uJWGe/aHrE=;
 b=FNDbGJ/8dOto5sGyWsGVGf5Rgtg4gZuEPXealY7HiKIGoLgnmCiadnk34+tmiozvp4
 2MAG27NRmk+7o4syyc2gHHBv59LO8nKKJt+lVEQW1mCCmuQz1U+0q3wKd3pvLXVNuFwh
 EF1I/QeCtRz2/1wOvyyGU4Rdpyk7PzqeH5bYlpju9W/UhhVYkIDLU+0mN/zf8OUC37K2
 WL2uvFgShcri84eFp3z99Vodpcn2qg07Ddf90Z5jbnQepPDZEcQ7TL93WEoKf14ws9Fz
 FmLAUQlZj4wNnxqrU3Kq46iWmWeJsgbLbkOWKWYjhEM2SBaTRlZNa+Y1J2rhiAW2yuHR
 kTfQ==
X-Gm-Message-State: AOAM531dyZbZGs92p05qFadpi+auY2OlPGCjCYCC7Thv2+ebHqATl4hK
 VcR2eXwcRaGAnumYhTWoOCbB/A==
X-Google-Smtp-Source: ABdhPJycJ/RJVUlh3U4FxuRx/CjDhqtLegaiEJWrGOFqyw0ENTkUWXFSBQVU9HhSdNp0oeApAXLGEA==
X-Received: by 2002:ae9:c30e:: with SMTP id n14mr2545671qkg.291.1615953570790; 
 Tue, 16 Mar 2021 20:59:30 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j18sm13311225qtl.83.2021.03.16.20.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 20:59:30 -0700 (PDT)
Subject: Re: [PATCH v5 42/57] tcg/tci: Split out tcg_out_op_r[iI]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-43-richard.henderson@linaro.org>
 <867ed16e-2457-c237-d349-fc56541e90ad@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a99b724-75f1-bc9c-d155-30b892f190c1@linaro.org>
Date: Tue, 16 Mar 2021 21:59:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <867ed16e-2457-c237-d349-fc56541e90ad@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 5:39 PM, Philippe Mathieu-Daudé wrote:
> "And support mov_i64 on 32-bit host"?

Um, no...

>> +    case TCG_TYPE_I32:
>> +        tcg_out_op_ri(s, INDEX_op_tci_movi_i32, ret, arg);
>> +        break;
>>   #if TCG_TARGET_REG_BITS == 64
>> +    case TCG_TYPE_I64:
>> +        tcg_out_op_rI(s, INDEX_op_tci_movi_i64, ret, arg);
>> +        break;
>>   #endif
>> +    default:
>> +        g_assert_not_reached();

... aborting if it happens.


r~

