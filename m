Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7D130E40E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:31:31 +0100 (CET)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OoE-0003mn-0K
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7Ol9-0002zY-29
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:28:19 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:33596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7Ol6-0004eb-Nd
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:28:18 -0500
Received: by mail-il1-x135.google.com with SMTP id e1so521073ilu.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 12:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5LRbsW+fhDIZDoNXCV2FLpGEjppVOjbALW9K+kxAtoQ=;
 b=tIAgeCwxNFnqsQVCli+O7kUSvSAgSudFtTphH5jLgDbIVM0cgbCYOnL1IObXPOI3BY
 TjHIpEvAsQGwDsn+bv7Jhnl3XzO/sENu48RVUo4uVq2und+YRNFW/mKtrWLfdwnC55d0
 QaaVPON7IizqysYENZwPu95tKx44gZGVD/l9RiFo3GJlsHe08BlQ+Y5PvgFRKhxP5ogs
 8TkF9vK7+YNMgb+Di8qeFHpN1M6v2EU025Ufp8YvOwsoIetg+c5C412lsgCbee+RqJ7d
 YcCxCmD+231WdrWPseCub5DBZix6iQxYo6hFPB7brany0S7mY/k9o3fs+Xcje7DRraBs
 Sw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5LRbsW+fhDIZDoNXCV2FLpGEjppVOjbALW9K+kxAtoQ=;
 b=o+OyJ91J9EZASIKp2yB3vX0eiLOPD2hPHRsiWEGT6FoNz24gkG08StU/MJH08Sf13E
 36wqVocjwCKdUf180O8yefAK6e1SHv6iHfGqIa9CSOd1fFPMuehAfIalN+2qjHrPCRaE
 qnRMTKkvE1R1TWR+5FW916P7Hfnswo7eSJLGwPKTR/7XTAxRX1PRVTybPZYbrCiaPc8H
 u1DVFPkXUStVmAYEiEwDq0JATXk/KA5OV5a/c2fpMJBzp3niU2h4HQndovEhF2icCzB4
 W9pgvrda+q70mUoqaQFo1VLCvEmEti6foA5/xhOCZbI1zbkYrBdMTig/WZzhuPkMRhkS
 PWxA==
X-Gm-Message-State: AOAM531y9aTK3cUC3LrKgNE/Mv0dDXH97/BFpZHGNMY/HQkDLRVTxsgd
 l5Xi/7iEWcgkCAT8e4yzlNK+cg==
X-Google-Smtp-Source: ABdhPJxJUlLo1fCEHnJNdEAr5xtd0hGreDsnvb7mCXLuUUHRldcsgxZLPAF0448vyd0m2S/wOEobCQ==
X-Received: by 2002:a92:cf08:: with SMTP id c8mr3952363ilo.106.1612384095452; 
 Wed, 03 Feb 2021 12:28:15 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id o20sm1513159iob.41.2021.02.03.12.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 12:28:14 -0800 (PST)
Subject: Re: [PATCH v4 2/4] target/arm: Support AA32 DIT by moving PSTATE_SS
 from cpsr into env->pstate
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210203045816.10953-1-rebecca@nuviainc.com>
 <20210203045816.10953-3-rebecca@nuviainc.com>
 <42e9640c-9798-2515-1e7d-131609078833@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <67c1c588-1210-da0e-24c2-49bb77c1d217@nuviainc.com>
Date: Wed, 3 Feb 2021 13:28:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <42e9640c-9798-2515-1e7d-131609078833@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 10:17 AM, Richard Henderson wrote:
> On 2/2/21 6:58 PM, Rebecca Cran wrote:
>>           if (!arm_singlestep_active(env)) {
>> -            env->uncached_cpsr &= ~PSTATE_SS;
>> +            env->pstate &= ~PSTATE_SS;
>> +        } else {
>> +            env->pstate |= PSTATE_SS;
>>           }
> 
> Where did this addition come from?

I thought this was needed given your comment:

"This is missing the restore of PSTATE_SS for when singlestep *is* active."

-- 
Rebecca Cran

