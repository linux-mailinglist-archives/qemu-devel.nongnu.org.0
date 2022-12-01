Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E193D63EEAA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 12:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0hIw-0003KZ-Dk; Thu, 01 Dec 2022 06:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0hIs-0003KB-RN
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:00:31 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0hIo-0006cY-GF
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:00:30 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so4849123pjs.4
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3m5F5SZmhCySHaq4Kl+nNPgZPVM9ttm1TTYlw+maT9E=;
 b=BkcdZqbFeePP7PhgiNGQZiQ1/IrHQjmPITDEJdkxgFaPv7QkOL49k7MbmbtcMWit7j
 ziUuIw/Rq95yF8hjpc7DirP8lrB/AP9iPYKQkePxfGawn12jQr3gWEIbxCYZEfH52HIn
 ivtzqFiNBO4d/qxGtGCrRZBhgU6k+lNqPc/SElKFM9K8iiTGd6d4edx1e2x8f7itVwDl
 3j/MC4rYxBD/wUGjtqVjwe/yGhpMFnlIM+lmbBwTDlQmEul39ZXTaGnm5thuriQ9H+0a
 LlqleLvdN7CJOMBYdAZ915Jyph3Bul8ErQmRxhlJaL/ixydmMQs2qbEMi6h/iioNmh9b
 wCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3m5F5SZmhCySHaq4Kl+nNPgZPVM9ttm1TTYlw+maT9E=;
 b=uBPDTZmqxsZ6ehBniBZMbIIRiUseOck/yCjsVn0pTNvN4LfTLyqmHZf8AhqvdAymLR
 ZpIwRPOec7S7MsibEe/ROb/+bNbVajDU2Lmqb9cKNEaFisgswTX71N8q5w/w3MyRAvbS
 scV0HVdqIp7Nd0Su2C5MODmSqJFD/70gTBnpsZrM5f0vMyTbTLReYHVov/c5Ed8+zzJl
 DyADqM5tUmVkm2kk2TQ1hkRIdP56Ehk/rvQt7hrtzafShqiByxw4vi2nCPerFVrZrw+i
 d8ryw4hLto4Tza0tQfYrcnP5dinm09RntOnHjhpvSfPwpRebXjjPEGic0ykrBOVG5t0H
 Tf2g==
X-Gm-Message-State: ANoB5plBri3eUyoFfQAQIEjFvC+8kf5tpw+QN45QsD2QCxmW1SJsUkVk
 +d1D2IysR0glSZ2XbD3HZewc/g==
X-Google-Smtp-Source: AA0mqf5tmeQONwE26vLCpkyddTpVvkN7A/tfrv/HQaUC8nVZjAqUywmWqMwYQ8ENrzKcMCsDq8fIGA==
X-Received: by 2002:a17:90a:fa46:b0:200:1df3:a7a9 with SMTP id
 dt6-20020a17090afa4600b002001df3a7a9mr74111196pjb.202.1669892424814; 
 Thu, 01 Dec 2022 03:00:24 -0800 (PST)
Received: from ?IPV6:2400:4050:c360:8200:7b99:f7c3:d084:f1e2?
 ([2400:4050:c360:8200:7b99:f7c3:d084:f1e2])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902ec8800b001895d87225csm3324805plg.182.2022.12.01.03.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 03:00:24 -0800 (PST)
Message-ID: <a3cc1116-272d-a8e5-a131-7becf98115e0@daynix.com>
Date: Thu, 1 Dec 2022 20:00:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] accel/kvm/kvm-all: Handle register access errors
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221201102728.69751-1-akihiko.odaki@daynix.com>
 <CAFEAcA_ORM9CpDCvPMs1XcZVhh_4fKE2wnaS_tp1s4DzZCHsXQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAFEAcA_ORM9CpDCvPMs1XcZVhh_4fKE2wnaS_tp1s4DzZCHsXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2022/12/01 19:40, Peter Maydell wrote:
> On Thu, 1 Dec 2022 at 10:27, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> A register access error typically means something seriously wrong
>> happened so that anything bad can happen after that and recovery is
>> impossible.
>> Even failing one register access is catastorophic as
>> architecture-specific code are not written so that it torelates such
>> failures.
>>
>> Make sure the VM stop and nothing worse happens if such an error occurs.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> In a similar vein there was also
> https://lore.kernel.org/all/20220617144857.34189-1-peterx@redhat.com/
> back in June, which on the one hand was less comprehensive but on
> the other does the plumbing to pass the error upwards rather than
> reporting it immediately at point of failure.
> 
> I'm in principle in favour but suspect we'll run into some corner
> cases where we were happily ignoring not-very-important failures
> (eg if you're running Linux as the host OS on a Mac M1 and your
> host kernel doesn't have this fix:
> https://lore.kernel.org/all/YnHz6Cw5ONR2e+KA@google.com/T/
> then QEMU will go from "works by sheer luck" to "consistently
> hits this error check"). So we should aim to land this extra
> error checking early in the release cycle so we have plenty of
> time to deal with any bug reports we get about it.
> 
> thanks
> -- PMM

Actually I found this problem when I tried to run QEMU with KVM on M2 
MacBook Air and encountered a failure described and fixed at:
https://lore.kernel.org/all/20221201104914.28944-2-akihiko.odaki@daynix.com/

Although the affected register was not really important, QEMU couldn't 
run the guest well enough because kvm_arch_put_registers for ARM64 is 
written in a way that it fails early. I guess the situation is not so 
different for other architectures as well.

I still agree that this should be postponed until a new release cycle 
starts as register saving/restoring is too important to fail.

Regards,
Akihiko Odaki

