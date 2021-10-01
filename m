Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F041F262
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 18:44:58 +0200 (CEST)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWLeb-0003sh-Kg
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 12:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLbp-0001cy-Ip
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:42:05 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:46964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLbn-0004XW-RS
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:42:05 -0400
Received: by mail-qk1-x731.google.com with SMTP id b65so9697656qkc.13
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aQbL8pXIXocxX9H8b/2nNpVZyCyOOEJ+2eX3f4bQsb0=;
 b=wXbQCGjvp4GLHV24dvNcEoftO+b+jxKTmz0SX5x2HR0+WKCJvkioVyd5rDUb2pCsyj
 o4MwxX88vRap3XoIMPH26Rln/IMU3v7eS9oXh7nMXv+ICLXwXcGBr6pwdAR2E1rH+e9G
 KNiwnEpz/fBuGfOjg9/YJkFPWP0jIasbrHIi5xoe9Jmc2rwoK0LDzR/wU1wjZbeFmvdD
 YEhrospe7J6JtzCADzrRF55UOLO4nVmGg2KvlI4Zwe+SSleJ/yccWHSdHTqccQETU7z8
 JuQIl058Sfvctk3JRr/BoFuVNjJ4FsVaTDrdfRW23LqaJ1v9W9MoKhc5ea1v1Qa+zBz4
 WCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQbL8pXIXocxX9H8b/2nNpVZyCyOOEJ+2eX3f4bQsb0=;
 b=xcJDy3LrB5OhWgQ+D6dLj79m/gH+Rm6PtifYu039n97BOxa1sMGvPU758hLCSh17R7
 c63cSo+b9ivp9BaIuCsffzYdO76Lo7MwVf5tpMx3cL7C5b5VVGiSfm8M1lbTJNE/P3Uy
 VNGh2ggoGNTBPUDyarTSJ3L8atCuOq8yIhpc6d450UjHeTC7FVaH9aDosVow2dCjmgwy
 9AxL2GzNjfvXUVW5wKNZF1bqzrTi9+c6xHfOKghO1Bu47fPwXvq/d8B7D3577YOlsrty
 nOS/9xTjUd2PVEWmUoO8yDtmE6p3pJf++cojwxmreYbG+OROmSjWWMl/fmvQgKtFxNpo
 /81A==
X-Gm-Message-State: AOAM531PamMaVsV49ge6EMkaTpZohEJ2P96RZLi7URiMtNrgF2O/fa2U
 vqZG27fvkjslKtlzwsZZgtCSouQ8OBouYA==
X-Google-Smtp-Source: ABdhPJxEISaAeFeyVBnUq/DuWLEI7heMQCiSZdmm/c7At99cOYDg6yzkNykzMscChFIJiV2TCPFeTA==
X-Received: by 2002:ae9:eb58:: with SMTP id b85mr10034928qkg.323.1633106522896; 
 Fri, 01 Oct 2021 09:42:02 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id p12sm3298438qkj.54.2021.10.01.09.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:42:02 -0700 (PDT)
Subject: Re: [RFC PATCH 00/13] x86 User Interrupts support
To: Stefan Hajnoczi <stefanha@redhat.com>, Sohil Mehta
 <sohil.mehta@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210913200132.3396598-1-sohil.mehta@intel.com>
 <456bf9cf-87b8-4c3d-ac0c-7e392bcf26de@www.fastmail.com>
 <YVXmGTo5Uzp44QQq@stefanha-x1.localdomain>
 <778d40fe-ad8e-fd7c-4caa-499910bb0925@intel.com>
 <YVc47ohb4nxrBO5h@stefanha-x1.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3abdadab-9b7e-7cc0-5ec5-17fa385ce7d4@linaro.org>
Date: Fri, 1 Oct 2021 12:41:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVc47ohb4nxrBO5h@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, qemu-devel@nongnu.org,
 Dave Hansen <dave.hansen@intel.com>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org,
 Raj Ashok <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Zeng Guang <guang.zeng@intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>,
 "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Ramesh Thomas <ramesh.thomas@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Christian Brauner <christian@brauner.io>,
 Jens Axboe <axboe@kernel.dk>, Tony Luck <tony.luck@intel.com>,
 Linux API <linux-api@vger.kernel.org>, Randy E Witt <randy.e.witt@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 12:35 PM, Stefan Hajnoczi wrote:
> QEMU's TCG threads execute translated code. There are events that
> require interrupting these threads. Today a check is performed at the
> start of every translated block. Most of the time the check is false and
> it's a waste of CPU.
> 
> User interrupts can eliminate the need for checks by interrupting TCG
> threads when events occur.

We used to use interrupts, and stopped because we need to wait until the guest is in a 
stable state.  The guest is always in a stable state at the beginning of each TB.

See 378df4b2375.


r~

