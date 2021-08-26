Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD843F8D26
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:35:47 +0200 (CEST)
Received: from localhost ([::1]:49696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJI2-000268-At
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJJ18-0004wC-JD
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:18:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJJ17-0001GQ-25
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:18:18 -0400
Received: by mail-wm1-x330.google.com with SMTP id u15so2287613wmj.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZB5oAu1bLM0CKy5yu0zCr1BmKyipzIHLuMuvP8CYnCQ=;
 b=elYONqrvprTN17djy3SU1LopvlcaFpBs4lVHhNl/WO/ljXa9eDsaNQG5+X6B9mDhF0
 9Zd2tcO2QD/m4udtGFClJxF693KEjULQInpoAmDqMuU//fiPr8jTSoAzon+45Pgjmje9
 7NES1UtVz6KyAFuSzcT6osYl25a8nkwtYYeMarTOITqsMKs4vTKNcMWWvPM2oVKEZVLn
 c0tunz4nVmLlTRin8kd/pY7r8rLcW3PS43a9a2WNEkXbveniwYyDGQMH7PSge4s3rZkA
 mMs6WdOXZOtTEOW4tvmvbIbqVZapokUsT2Ao2LGcytkvQ5rBzv2x7DHweRSnpJuHCyui
 VKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZB5oAu1bLM0CKy5yu0zCr1BmKyipzIHLuMuvP8CYnCQ=;
 b=eJ1Zn6gmS8Td4NWzgLBBSF9f26iRcRq8lPL0s60VQRTDlHwPcl0j9P8Zj2BSihP9RI
 Krgjhc97lZsGa991I9NCE870zvLJcVsXNd0mROwD3Ufr3D7JBdrKIuUJqpDFRWhVPK4F
 iBswQ1Qb/kOrmymsbsq8xNfUTdJF6OJfC9j6sir+xIGEdSn3QEdS2Sd5ItBFYkuKXxJE
 L021gC5dBrRNBQf7p+75SjSWum/+cdySCV2gK2PWSWJIkTztCwR432oETex999r2G4jZ
 /g8+xv7SegjsioihJ2+ZFFYsNQICJu8o1s0SvdAEn9rsjPE4lY9KjtgU2/SQ5eB+BZC3
 82lw==
X-Gm-Message-State: AOAM530pw6mx+WtdyHWBj3zXQMIobo/hrVOOtnqzv78Euuf5NqF3gwhB
 jD7351qHdD5mGX3VgbVbB/w0M1s9wG4=
X-Google-Smtp-Source: ABdhPJxRsKIOd7j/maPvAjHDrZPWzvzGNdvQ0qTdkSkp+YszBtLIZJOcrS/HO4oEN4l4PdlwL+o2Uw==
X-Received: by 2002:a1c:1b53:: with SMTP id b80mr4837858wmb.133.1629998295018; 
 Thu, 26 Aug 2021 10:18:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c14sm4956056wme.6.2021.08.26.10.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 10:18:14 -0700 (PDT)
Subject: Re: [PULL 35/37] target/arm: Do hflags rebuild in cpsr_write()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210826170307.27733-1-peter.maydell@linaro.org>
 <20210826170307.27733-36-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <50947060-d007-205f-8c10-8890204a1a75@amsat.org>
Date: Thu, 26 Aug 2021 19:18:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826170307.27733-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 7:03 PM, Peter Maydell wrote:
> Currently we rely on all the callsites of cpsr_write() to rebuild the
> cached hflags if they change one of the CPSR bits which we use as a
> TB flag and cache in hflags.  This is a bit awkward when we want to
> change the set of CPSR bits that we cache, because it means we need
> to re-audit all the cpsr_write() callsites to see which flags they
> are writing and whether they now need to rebuild the hflags.
> 
> Switch instead to making cpsr_write() call arm_rebuild_hflags()
> itself if one of the bits being changed is a cached bit.
> 
> We don't do the rebuild for the CPSRWriteRaw write type, because that
> kind of write is generally doing something special anyway.  For the
> CPSRWriteRaw callsites in the KVM code and inbound migration we
> definitely don't want to recalculate the hflags; the callsites in
> boot.c and arm-powerctl.c have to do a rebuild-hflags call themselves
> anyway because of other CPU state changes they make.
> 
> This allows us to drop explicit arm_rebuild_hflags() calls in a
> couple of places where the only reason we needed to call it was the
> CPSR write.

Just noticing this patch, nice.

> This fixes a bug where we were incorrectly failing to rebuild hflags
> in the code path for a gdbstub write to CPSR, which meant that you
> could make QEMU assert by breaking into a running guest, altering the
> CPSR to change the value of, for example, CPSR.E, and then
> continuing.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20210817201843.3829-1-peter.maydell@linaro.org
> ---
>  target/arm/cpu.h        | 10 ++++++++--
>  linux-user/arm/signal.c |  2 --
>  target/arm/helper.c     |  5 +++++
>  3 files changed, 13 insertions(+), 4 deletions(-)

