Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F532CA35
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 02:54:20 +0100 (CET)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHdBz-00080p-BZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 20:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdAD-0007Kl-R2
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 20:52:29 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdA7-0008Js-UD
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 20:52:28 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x24so479079pfn.5
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 17:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fH2+8dslFA9NYvFzy20u9dcCIIF4+76Lxto2Bst2O3s=;
 b=bdoBLH+KNfpLVzAZ+XCvqk1g0cCAn7SPbkCe1XdfRsib+H69dW281HQpWN08xP9vei
 s6tGp/xrtXOZdbd9wnBsJpLLTSikXZmmeU4wspOkG3u1gjpH/h7YCROI5Bcvg80HXROz
 P04SPcTy4JOV8U/Av5SZK7+9fKTEXMlEtSDfFO0kT4TG4QS6B4QIQ1Dfqjn9T2Utvz7I
 fPAPPLB6A5qlGIKGa3k2/ntveXBxs0kzSd3rvZHPGLZklSS5Hn4JPsig3qOthl4mQVPb
 637/VmgWQ0U+3LqS/r8c8eoTESRzGsuVeh+0+nq2es8X5osVnxG4TRVLKbU16KU9L5Ci
 Kjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fH2+8dslFA9NYvFzy20u9dcCIIF4+76Lxto2Bst2O3s=;
 b=tIdNrU7lf8VcpAhfVUU6djA8pZmugtlvAoaoEBbJgnhkWf3xlRW/HAZTH6Sw8XbF63
 Zc/rDA4roMT+UIgt9mFp7gmuVcFIr/jcvFyMCuK8wVXRDVItiOE+vqb/+D9Xlm8jigsp
 xW1yF1vS9M8QmZ6CjI+7pQXIYA68MN2UcJ0quR6TqZXQL4hmSvhLX5vYa0REYN0HJbmn
 w0KO//9Upcqjs6IfYd/e7r9llSmieBchOifM9cW3HrtezvSsL099qHGegNborpgCCRry
 NW+HlS3goX+5h1ga+apt9kjDAM9tLQGzzN6RTk8r77RdYUWG70+HX/yMzxB5Oi+FDepO
 sRpw==
X-Gm-Message-State: AOAM533cVbz8yEIMEVqGsVSNMp8sMGNUFnlq6ByiV65duFX4IUtIQ7PB
 sWzoiK3NbandnX47x4zykiuTBw==
X-Google-Smtp-Source: ABdhPJxHr++aEXw6b9gCYonkbtSGQfmfxiqZtPsc+JOEzhve68icqDnzO8oSuZqTIc5abmASC9/ulQ==
X-Received: by 2002:aa7:8286:0:b029:1e2:70ef:c410 with SMTP id
 s6-20020aa782860000b02901e270efc410mr1483468pfm.45.1614822742456; 
 Wed, 03 Mar 2021 17:52:22 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id t36sm473606pfg.111.2021.03.03.17.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 17:52:21 -0800 (PST)
Subject: Re: [PATCH v4 00/28] cpu: Introduce SysemuCPUOps structure, remove
 watchpoints from usermode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210303214708.1727801-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dacf368e-aef4-cccf-1abe-3b9f496442fb@linaro.org>
Date: Wed, 3 Mar 2021 17:52:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 1:46 PM, Philippe Mathieu-Daudé wrote:
> Patches 1-6 are generic cleanups.
> Patches 7-15 move from CPUClass to SysemuCPUOps
> Patch   16 restricts SysemuCPUOps to sysemu
> Patches 17-26 remove watchpoint code from user emulation
> Patches 27-28 remove USER_ONLY #ifdef'ry from "cpu.h"

Patches 1-18:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

While mst has asked for a name change vs patch 4, I think that if we do that it 
should be separate, because it would involve a rename through hw/ as well.

The watchpoint patches that follow need some more careful thought.


r~

