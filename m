Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9D410CBC
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 19:51:38 +0200 (CEST)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS0yX-0000gX-BE
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 13:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS0wX-0007Z7-J1
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 13:49:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS0wU-0005hU-Kt
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 13:49:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f3-20020a17090a638300b00199097ddf1aso13602063pjj.0
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zJh6gWnpi/zvN3FjxAOpEOQ4hfU9A2bPUoy/9lGWnoU=;
 b=Wty1SrMtb2xAX0qnO13z1O/I8puKqYzRV1z2wGmnfWa37IyQhpeUDdnZD7dRHQ2fPs
 CAhLC/+dffS5xLK/xiFTBRUGc7o7fX9XnHE0lO9mpCIpYxqz57Uz9FOW11XOjkqdSkRC
 rBpKQfoxb6iDBTkSSCL3w/Q9EozYv+hfigDFSkoGU8UWHJQ3HAgA/Y2vse5lM4HZ0x2C
 Q8FwSIKqyym/J46MqFa4u0/rxaHh1h3hcf4ixIDcy08QA8nGVxEJpKzCRmbNa+MFsQms
 mNpdrtT+4ABumcJFGj2FEROSB4Kwqd8u0blAdxw23mYDrSp/y6xz93Iy6vxz2W5265e3
 Zozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zJh6gWnpi/zvN3FjxAOpEOQ4hfU9A2bPUoy/9lGWnoU=;
 b=iFtzdkEnkT3+wBAbNm+Q6tZ8Ne2ZtGUNtt1aQHci2MYttGamOw30Jdlg1jW6YcdQwh
 b53Gc5am/Wkt+/ZFmuzHS+uw54KsX4w0VpY0hhZSJGENAYZIHKFvMAMCS9Ss5lSVhPP8
 IVDOGW8NbQdeTBn0V3KtKNLTEIEIwbpM8OVMDskXG7mIlZ7MzMBrPKo5IkBBu6tyLbF8
 dqx28maTuhhp1DkKvNNuWCSpwTZcaasj4G5OBebnAjxneOWXTtdtbbq3flMLsJM3EHCr
 0rc+HOLv1YqHIWGQYsFanspNCLLw/2Lsna+l+clxsHexFM53wR27yEUmAxpBPc5kXFZ0
 kiPw==
X-Gm-Message-State: AOAM530xA/S7R3Ksvw+q+5G6PtkkBxAr/b70USuzoS4sg3Vv0HRaYMFR
 Zcht8qYYam4QRrQORsRuwGKodg==
X-Google-Smtp-Source: ABdhPJyTjFxlDcTrMCZ4GN6OYQ3ncZDDp7Y3zH3Si9UGyrVJUTCZwg+nQiaVxUXLy0NFvTtyK9ebvA==
X-Received: by 2002:a17:90a:d686:: with SMTP id
 x6mr33620539pju.8.1632073768203; 
 Sun, 19 Sep 2021 10:49:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g140sm11417202pfb.100.2021.09.19.10.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 10:49:27 -0700 (PDT)
Subject: Re: [PATCH v2 24/30] linux-user/openrisc: Use force_sig_fault,
 force_sigsegv_for_addr
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-25-richard.henderson@linaro.org>
 <CAFEAcA-C_xwxZo2fGsk5Bc36DyFPwOKH_pJgLt8OkSyV=iYZhg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a031dc23-f7e6-49a6-ae90-d563172849ba@linaro.org>
Date: Sun, 19 Sep 2021 10:49:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-C_xwxZo2fGsk5Bc36DyFPwOKH_pJgLt8OkSyV=iYZhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 10:17 AM, Peter Maydell wrote:
> I think that EXCP_RANGE should for us be unreachable in user-only
> mode (because it can only happen if the relevant bits in SR are
> set, and SR is writeable only in supervisor mode, and its starting
> value doesn't set these bits). So we could just delete the EXCP_RANGE
> handling and let it hit the default g_assert_not_reached() case.

If I also disable the SR case from gdbstub.

> EXCP_FPE is more tricky -- this happens for FP exceptions, where
> the enabling bit is in the FPCSR, which does appear to be writeable
> from user mode. So either:
>   * our mtspr is wrong and should either be not allowing writes
>     to FPCSR in usermode (or at least sanitizing them)
>   * the Linux kernel for openrisc is wrong, because a userspace
>     program that sets FPCSR.FPEE can make it run into unhandled_exception()
>     and die(), and it should be doing something else, like delivering
>     a suitable SIGFPE

I believe the kernel to be buggy.  But it also point to the fact that no one has written 
fenv.h for or1k for musl, so no one has tried to use those bits.


r~

