Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C844C392093
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:08:49 +0200 (CEST)
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llytc-00051S-UL
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llykV-0001p7-Fj
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:59:23 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llykT-0006oe-Qf
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:59:23 -0400
Received: by mail-pg1-x536.google.com with SMTP id l70so1750458pga.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hZjm8Eg9JpkhEl/OS+NGJHrYod56z9xYVs22kLZMSJs=;
 b=k6yAoDy6FcvAIQGXe7SBRkd9YteGe1JVNkNAn0bCPT5RF9nqrzExXoSKHq2yt85RSO
 Mxa6PmMxxXOhyFY1Xh8kU+3v+lR9/m4EklzNz9DSXcB/7p//2c+W01F2V/SA2wmPvzdf
 BHuPI0ldoCfbZn0fIKVD9emhfP/azsiq+IxrzRNQNdTqQ0HfxPN0gihlK/MAvnFQLyQ7
 f7iI4mo51OIxQaHlvxslReoXLXZ24iqU90XnMsqwoYuGhnXT/SyKSef5PKLX3XId0iA2
 7m72EL0Voxrs7UOmmi0BvRjiEaG9lGJBJi+ZFILccYmoudT+kzFAiuYgrXY2ZD+iG+8N
 KPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hZjm8Eg9JpkhEl/OS+NGJHrYod56z9xYVs22kLZMSJs=;
 b=Tl6YX/s8psHknqINBgALkOV6orgW63j/u7gPkADl1umQR6q1D9Ux101bD/mUaSa2oI
 vY8+WWfHQ4MaEyrL3qS9imHoDvaVHNi0mFjHobXcGt9hwdtGDf7m5d5NYCjV84xhRLZj
 W2okHD4YIAS9jwruuuLU+Q0RJPY6wHgx/JbL1puapPF/0CAQYfSZnAyEJ9KXQ9anv7RO
 Ky9VMww17tYQHiwknM5649PXFKTYDqJHG/yspHZr9F/ACQRV1ejAUdrkxRNJGAr1VH66
 4QVA4B+9B/Z7fLZwxT2+leLUzHBSKsWxnV+3yUdlYYMx65M6fLu5Fw4x58ppGzwqZuVr
 VK2Q==
X-Gm-Message-State: AOAM5334vs5zasFvxhgl6n2pJ/bziwERvyjP4NLmj2bLUZqbkinUpv/i
 MtsMry4NY2w3+YiLbDKHFnbomw==
X-Google-Smtp-Source: ABdhPJzPLOz8eyBwvu1dbQ2HXwXniZ4n7vFhVfNruehowHg4BQ6vD1tnkyK/IM34EXAeTMIzbJLcCA==
X-Received: by 2002:a63:334b:: with SMTP id z72mr26877285pgz.46.1622055560458; 
 Wed, 26 May 2021 11:59:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c191sm16603083pfc.94.2021.05.26.11.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:59:20 -0700 (PDT)
Subject: Re: [RFC PATCH 10/15] exec/gdbstub: Make gdb_exit() /
 gdb_set_stop_cpu() target agnostic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <539ddc3a-b1c8-c11f-b2d5-58b4f537a158@linaro.org>
Date: Wed, 26 May 2021 11:59:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> gdb_exit() and gdb_set_stop_cpu() prototypes don't have to be
> target specific. Remove this limitation to be able to build
> softmmu/cpus.c and softmmu/runstate.c once for all targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/exec/gdbstub.h | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

