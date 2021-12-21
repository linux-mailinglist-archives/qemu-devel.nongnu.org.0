Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4704147C7DD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:58:54 +0100 (CET)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzlHh-0000xr-D3
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:58:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzlF6-0006q9-EC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:56:12 -0500
Received: from [2607:f8b0:4864:20::1034] (port=44937
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzlF3-000758-3j
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:56:12 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso262571pjl.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 11:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5xix6Q1j2gVG0PBt6fMs9oUvYZLlhGvZoncK/PUd+Js=;
 b=W1GDsmknjhw4U6kG5SjHENdOpLih/eSJjqh+4TNC9QpaohN3mFVmk2KncdBlCeVoa7
 ZvGjoTSa00qtHwn89NNXfa2NbK9XT5HpVh/OJxXrFEIdzNyXfkbf37J5bPE11UuexnoS
 51zSgTgFjvRiImez/xxKQnJQrAHsY3JQ6spINT3hIGfSTyXRHvhgut1X6dSppE3bu04J
 jPCU6TKpu1pDedd8HvAgj3/ZDCFXsdlZdSnWXMuz9UtPcRJn+cPtT8vuY2ED/3FX9Drg
 HGwXrqAeD3bM7MMdMWe8OfMT1uuggHxNZmVyrntr9ELVzJAB5rMr8tL1nd7Wmh1EgwpV
 1TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5xix6Q1j2gVG0PBt6fMs9oUvYZLlhGvZoncK/PUd+Js=;
 b=VFXwBDsEmopza+G+sZD7Fb8k+rdpR8eASbqvs2w1d+qF5OQ1bsRD/zTSe5yZjSwiHU
 yYSi4Pb/dfLlUwmexmgbkL80V8KGbCybvtd7fIrS1aLeApqPYxgO8U/iz2twIKrgWxrq
 kmho+tRE4o/06gmPXzn8ZpDwUincU8uUEoW8AscS6KvZkxrGa0g97evO/VDjyk1c67/A
 6ojCgC6akZ5s5uBdfYwJ98+DIiRoHlrbWLg/K+RlM+ZZTESsyN/Z9GLoYm2en7T9Lw0H
 arQFaNbd2feqYOKJYeTMBZZXhe1YRUqPMAT6rnbwLEd/kHuFN24ATGTu6Jr7isYeaLji
 2WvQ==
X-Gm-Message-State: AOAM5325tgoWY99CdzsDz1/gA/uQkzfQOwZJTTIJUNrd6ZUb1auw+A8u
 EdC6QHTLBOimzX42/GPKjPv9zQ==
X-Google-Smtp-Source: ABdhPJwRKtRGK2on401k4ONIUR1sSqJTIzk34/WbNUhS3rcfGgKm3pd13hsLu4NPyAISsgrPPlYorg==
X-Received: by 2002:a17:902:d512:b0:149:3070:48ec with SMTP id
 b18-20020a170902d51200b00149307048ecmr4577572plg.66.1640116567508; 
 Tue, 21 Dec 2021 11:56:07 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id kb1sm3752574pjb.45.2021.12.21.11.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 11:56:06 -0800 (PST)
Subject: Re: [PATCH 2/3] user: move common-user includes to a subdirectory of
 {bsd,linux}-user/
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221163300.453146-1-pbonzini@redhat.com>
 <20211221163300.453146-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <654b03f1-6765-9b5c-9869-8e666f33ab89@linaro.org>
Date: Tue, 21 Dec 2021 11:56:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221163300.453146-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 8:32 AM, Paolo Bonzini wrote:
> Avoid polluting the compilation of common-user/ with local include files;
> making an include file available to common-user/ should be a deliberate
> decision in order to keep a clear interface that can be used by both
> bsd-user/ and linux-user/.

The reason that I did not do this before is that very shortly we're going to have 
bsd-user/host/arch/host-signal.h too.

If we combine them into a top-level include like this, then we have to add host-specific 
ifdefs.  IMO it is cleaner to leave them separate.

If you really really want to move them out of <os>-user/include/host, then the only other 
thing I can suggest is include/host/<os>/<arch>/.


r~

