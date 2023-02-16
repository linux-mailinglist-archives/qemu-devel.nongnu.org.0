Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0443A698B69
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 05:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSVpG-0001yE-8t; Wed, 15 Feb 2023 23:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSVpE-0001wH-4u
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 23:24:52 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSVpC-0000wP-CP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 23:24:51 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 w20-20020a17090a8a1400b00233d7314c1cso4571137pjn.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v9I+TxywuEW+jAWEFG7AVpOypfV9nGpKAv5q4FyagMM=;
 b=vOXrwsHWGQjNi4f6WDS89zW7lG5Xwm9QzKJud/FElSy6KUhYGbVkVqU4aD58R0nqvu
 btziz8Liv4IwYWmvcEgPw4rFKh3TME/aGbyioxEiuFi0mlWdR1J5YY8Qlfjrn7oIgBe9
 2O/oOS4JXpTIVqsvLWbpzxtl3QWaBGiToNL778UjxG8gvXa4ffR1VdUzDNC/tzWi5pVp
 3DDrDkvtu09g7A+7cGrEu4VOHXVvc5h9iLlfKfEsoD3pE3dyXBgL9N9SHV88j5c0JXEZ
 uqmzaF1rGFmJO9hHXaks3o2fqaJHNxQplyDmJPnLXAkPzqEazIeLXzdN8sLoUq55/qGv
 mpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v9I+TxywuEW+jAWEFG7AVpOypfV9nGpKAv5q4FyagMM=;
 b=PfwHr1k64t48msn41uz2Kdkx0WKgbXA/PglEMFVjR0Dg+YigNJSjIiXA94Xg/nsB/6
 8lCJ/UjQ4IxZ4Q/YTGfSD9QNzvQHrHzSOXkSAy2JrwS2x8ECn8jHO2reDARUg+AK2hwp
 /fVuAydi0wk2QqxE/UeLeZ5dvrJJOClwfapbOz00P0oZu2JfGnIdWmtvsOW+hg7ehqDs
 d2DWjA9iRGstVZOiLXwdm0kLHzZPhD6lxh0O86v34vAaAGCNdtt6rOBvglFm7x3D4Gys
 fkqNvXKmcCUFI7IPS8+rDdnrHv7cVO/vKcvugX34vgt3ENsdxZPnjn80o2YvVr2pWhSN
 qO8g==
X-Gm-Message-State: AO0yUKU3T6g1E92ewonfKw7cbFPJ00rqpsQ71jPpx65aA1eL0j0oI5/M
 2eHaxf3XpXVchqGLuffP+FITHQ==
X-Google-Smtp-Source: AK7set+mn0II87o/vbFXKsB2LH7ucllnhM20nKdHLkTjPZuG4JKPlgA+2wl+BGL04hEtoBWtN475yQ==
X-Received: by 2002:a17:902:fa03:b0:19a:a815:2881 with SMTP id
 la3-20020a170902fa0300b0019aa8152881mr4097347plb.37.1676521488472; 
 Wed, 15 Feb 2023 20:24:48 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 u12-20020a17090282cc00b0019a7385079esm161865plz.123.2023.02.15.20.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 20:24:48 -0800 (PST)
Message-ID: <4d474968-dce8-0d69-3e52-2c42a6398e4c@linaro.org>
Date: Wed, 15 Feb 2023 18:24:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Adding ability to change disassembler syntax in TCG
 plugins
Content-Language: en-US
To: Mikhail Tyutin <m.tyutin@yadro.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, alex.bennee@linaro.org
Cc: erdnaxe@crans.org, ma.mandourr@gmail.com
References: <7d17f0cbb5ed4c90bbadd3992429006f@yadro.com>
 <be45264f-03d5-e6d1-f12e-c92b0ef7b557@yadro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <be45264f-03d5-e6d1-f12e-c92b0ef7b557@yadro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 18:17, Mikhail Tyutin wrote:
> ping
> 
> patchew link:
> https://patchew.org/QEMU/7d17f0cbb5ed4c90bbadd3992429006f@yadro.com/
> 
> 10.02.2023 18:24, Mikhail Tyutin wrote:
>> This patch adds new function qemu_plugin_insn_disas_with_syntax() that allows TCG 
>> plugins to get disassembler string with non-default syntax if it wants to.
>>
>> Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>

Why?

It's certainly not very generic, exposing a disassembly quirk for exactly one guest 
architecture.  I mean, you could just as easily link your plugin directly to libcapstone 
via qemu_plugin_insn_data().


r~


