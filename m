Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471203E86FF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 02:06:38 +0200 (CEST)
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDblV-0007sz-BM
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 20:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDbki-00072P-EY
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:05:48 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDbkg-0006B5-Uz
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:05:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id f3so307159plg.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 17:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/8k1Om6lD6W7gy917MuLDkRzuuF/w7qmBPpb3eu9IE4=;
 b=gRB8Z/mfG5c3PLxp4dvGyfRzCJEf2UMWaMFowq+l5ZF6l4jBXYE4kF3i0OhV670Rpp
 roT/Oca0ale2XX9JUrzbUHdyTVM/pUfU0EIUSLdzUDVrsJr6bmIztCH1+XZQd5HAzGpq
 j/mrI/ytWB2/+LPjSQQtfPeJBGL4vo5YAoEInHZhh+WnmuH9pUuIYvQF6hCLYH3nemY4
 6qgOtt6Kpm71N0HqSr9xoxbbSDGdwDr5PK7YOvCpRqAYc/muciUz3wiEOcau+K/Rch2B
 GRStzieEXAzPYGCIqlvZRwmfgWEKioXA/1xBNvFmv2sOomSuE/KBWUXT4asFfQOfjKFC
 rzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/8k1Om6lD6W7gy917MuLDkRzuuF/w7qmBPpb3eu9IE4=;
 b=UT1P5DsfMka4IgiEAnLUGHNnVlUWd+YK543uHjx9gCzRD65Zl4LrF4woqgDLq21hPq
 YsKLuFNTdHk8FIV1+GPGn8tSpzykMjSpEhG/RFP3UF6FnsiEvm5CbiX0ppb0lsR+PP/P
 5Y+MFfa/IvZoEZg+5X/XAocXxvCLgixVe6eCoHEckJ6WgmEpBG4KC/M2qOtN0sHRknWv
 Lp2Sbbv1M86HN3cyX6uv3tjhm1QkMyrvP2Mz6/1FJXk8URX6E2mIMug6vCR/bjfAWjqh
 1r+e2Dw5ISm2krKju2fbUX9Sp5olQAbRLmiX8cHHKUEfGiBejsk8DlfY1AAq4YG+gQcn
 ulzA==
X-Gm-Message-State: AOAM532j6D3jcfKFkTjh37ke5JuL316kW0I7DWVOny6Gr5MBaRuir16M
 bKvbmEwyrX6/PGcmyg3QWZiuIg==
X-Google-Smtp-Source: ABdhPJwmE3ZpKoPcHTEBJYlJY6g4AXDuSeceXZ4FkxjYV5OrXl9gWOTsCTIiNUB/9Tzr5KLGgQmDIg==
X-Received: by 2002:a62:bd15:0:b029:31c:a584:5f97 with SMTP id
 a21-20020a62bd150000b029031ca5845f97mr31380407pff.33.1628640345357; 
 Tue, 10 Aug 2021 17:05:45 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id j1sm586180pfc.97.2021.08.10.17.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 17:05:43 -0700 (PDT)
Subject: Re: [PATCH 03/19] target/ppc: add exclusive user write function for
 PMU regs
To: David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-4-danielhb413@gmail.com> <YRHyk2n6xvTQ6Eyl@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d1c4179-cf6c-accf-b9db-8e0dd8054d25@linaro.org>
Date: Tue, 10 Aug 2021 14:05:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRHyk2n6xvTQ6Eyl@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 5:29 PM, David Gibson wrote:
>>       ctx->spr_cb = env->spr_cb;
>> +    ctx->spr = env->spr;
> 
> Eep... with that one line you're copying 8kiB of data into the context
> structure.  That sounds undesirable.. especially since it look like
> you only check 8 bytes of it.
> 
> Plus.. TBH, I'm a bit fuzzy on how the disascontext stuff works, but
> I'm not sure copying the stuff here is correct.

It isn't.

> I think instead you need to actually generate the instructions to read
> from MMCR0 and conditionally generate an exception if the permission
> bit isn't set.

Or copy exactly the bits you need from MMCR0 for the permission check into env->hflags, so 
that you can later read them from ctx->flags.  Bearing in mind that hflags has only 32 
bits, 19 of them are currently in use.


r~

