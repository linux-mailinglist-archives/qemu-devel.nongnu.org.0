Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380742C6D0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:53:02 +0200 (CEST)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahUz-0004RK-9v
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mahTV-0003el-FY
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:51:29 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mahTT-0000ra-IB
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:51:29 -0400
Received: by mail-pl1-x633.google.com with SMTP id w14so2260970pll.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=awt/uP1Ye75bccHJjQTF0Kox7R0APNGAAziQ0yLzeNQ=;
 b=xUAJRa0Btfxu0P0UCF7yiffLnOdZabj1sbnhASq/DOToSp96r8uIjQsc3gWazaCRMX
 i8hSHNSVbFdMwwAejz1Hz4DEW556Bgra4sG5izUh8DlZGCOrtUu7IO/4gOOypLQqoR6X
 6ifL0dCf0Z1+UP1S1Zr0lwtMKmQLJ0DVRZlQpStforDLzL5vomXye/9cdYhDEzHxYo6/
 KHEWLoY9uvUuiJ0lqtc62g5qlF7n/BcFno4UoMYP1CQaVq6Wix4dfvTqC7VEig78zY7l
 hxVoz9SVf++1lSIhtA2gdvo61D5lTBOIHV5pWsPzmIVRBLesWOxIlrRTxA5ey6UQZAZT
 pt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=awt/uP1Ye75bccHJjQTF0Kox7R0APNGAAziQ0yLzeNQ=;
 b=YIkEqOHmxDsVRiAq4VozytsWQNSTBNQhfHdaCG3d/WJZ/ZbNIWOz+f6OQn1N1oOHxW
 BUM16VYX2W19vumFNpBd2O/8BuO7+niftTVpQU3kf9ctGgNSqfRH0I4X024yeSA0eYHn
 uayJ7Kt6jemXx7nYsZbUmYmBmzsTYGolPpPr+4awGklG/7p4Id8bUkGvfn19ATFi1lFy
 haCqz2r1tSZoJQVoCO64Zc6YR/fRVGYQa61CVP6tgEckD045StHAgLvK0VRuTErV8qt7
 BHLf34UQGWvLWRJ8LY8pkHtsgwHUp0tupVgIIEHa1AeMGx4m0sIG50ZAIGwKeT5J1BXm
 mZtA==
X-Gm-Message-State: AOAM530bs+0XHS4XX35rGVir9cFT3yPiL/vNdnDGIeW0SgXdoy+K/xdu
 YQSgzM65CQk1aaqf5uvHAg7IGA==
X-Google-Smtp-Source: ABdhPJylDjOeR7wsrJIKrvHIXMKuFvu3uQLqNLRkymHRuIOGSmTVAOKX7u9ARaRGkPcF1/fSnbpE+g==
X-Received: by 2002:a17:90a:5502:: with SMTP id
 b2mr14857178pji.154.1634143885112; 
 Wed, 13 Oct 2021 09:51:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y22sm89698pjj.5.2021.10.13.09.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:51:24 -0700 (PDT)
Subject: Re: [PULL 11/26] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Vineet Gupta <vineetg@rivosinc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vincent Palatin <vpalatin@rivosinc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
 <20211007064751.608580-12-alistair.francis@opensource.wdc.com>
 <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
 <CAAeLtUBSZ-=+06SowthZds0r19w66S-ibn18st4=DU81SeJk6Q@mail.gmail.com>
 <CAOojN2Ub=ig3akjXRdtq0WkwTn+wqy_q85UzTgV=UD5Y6y+9iA@mail.gmail.com>
 <CAAeLtUDSss2dco5QsT1wXQJ=bBS5ZAwjmXrH5dceZwxmqKKbSg@mail.gmail.com>
 <fe85a41a-af02-2c1e-cec6-af4668f7519c@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c5d9243-7801-408d-1faa-46657a3541ff@linaro.org>
Date: Wed, 13 Oct 2021 09:51:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fe85a41a-af02-2c1e-cec6-af4668f7519c@rivosinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jim Wilson <jimw@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 9:20 AM, Vineet Gupta wrote:
> off topic but relates, for Zb (and similar things in the future) whats the strategy for 
> change management/discovery. I understand you can hardcode things for quick test, but for 
> a proper glibc implementation this would be an IFUNC but there seems to be no 
> architectural way per spec (for software/kernel) to discover this.

Since the architecture restricted access to these CSRs, you do have to coordinate with the 
kernel.

There is an AT_HWCAP value that is given to userland, but it is currently masked to only 
provide a few of the MISA bits.  This will need to be extended for both V and Zb.  It 
doesn't help that Zb has been split into lots of smaller extensions, which (if done 
simplistically) will quickly consume all of the bits within AT_HWCAP.

So: I strongly suggest that RISC-V spend a few moments considering a way to represent this 
that will easily support the myriad extensions.  One possibility is to add more AT_* 
entries straight away -- AT_HWCAP_ZB, which contains one bit for all of the Zb[abcs] 
extensions.  Possibly set the "main" AT_HWCAP "b" bit if Zb is present at some minimal level.

> Same issue is with building linux kernel with Zb - how do we make sure that hardware/sim 
> supports Zb when running corresponding software.

On the kernel side this is easier -- read the CSRs then patch the kernel.
There are existing ways to manage this sort of thing.


r~

