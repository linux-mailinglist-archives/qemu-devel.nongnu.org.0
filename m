Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE24296199
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 17:22:55 +0200 (CEST)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVcQY-00035O-Cc
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 11:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVcPB-0002Fo-H5
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 11:21:31 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVcP9-0003TG-5G
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 11:21:29 -0400
Received: by mail-pg1-x543.google.com with SMTP id n9so1111661pgt.8
 for <qemu-devel@nongnu.org>; Thu, 22 Oct 2020 08:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jgwEEuVg1nvnBDAWncdVnqCa7k74Z4tQ9N9wv/8+FCk=;
 b=vpxog/FCElgZ4b3/iLENMJW6ZBIo8mEsaWGp9eJaBEEZwFviV/nxTNYrZp4QgB+qP7
 BxLfFaOtkBBQJ3GWJbOJPZyBM4ZQaJgH+g1bqMLODy25FzwBe+AUh6+troUjlaxmXLag
 dk/UsLlTKyNKIFz1Z8g0RZYetc/YqIF8V4YGfi4qEI52n8VK4N9q19sJLbzcr9Y/q6gM
 nWPJIH3f4sEA/RI5XwFmU6s0gvQCa+v9lnVE7IBeTaaJqB0jMkVzaZQMZR4Ut5pirD12
 4vsuKTKqCecIytX5fakBTc6CQjYEzr6bFc61/YRCaERtBqlxBhFo5hRIVc658gBw8JqG
 UsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jgwEEuVg1nvnBDAWncdVnqCa7k74Z4tQ9N9wv/8+FCk=;
 b=uENhtKk3ahmPBLd0hnneBcUsKsaVrZNWlTgPi+rJqYMF+mStrBl8wyIY8d/CHVdWA1
 AT1KpRs+Z8C7lzIgx/VPtoKFTEY1lgNT42pl83/423kTiwbkycFUAdgNl78G3edJeml4
 6gxT6fItBeM7LX0uH8ZMaXs6yODhYxczOrXJlYq7DSeTEB+6gaGhc18ecRGnsFk6y/DO
 UZ/F0aWLrV7WBPO0n+wqAInVstCYec2tsUSXL5xRevecOSt34zQCFJu8wd3Pnq4gbodZ
 73+34Q2esAglKQYSUIqoiAD2ShxQPHIMIfDWTMOtYQ86GJL+sQqq+PAumto/evyL0bNB
 tjUA==
X-Gm-Message-State: AOAM532lkmgVPGbRf3w/PqZHYfxJkRXWh7lIfPjvTtLn7VNa6qpYyCjv
 iFUI69lMJSBL6iKr0jIKHihhmA==
X-Google-Smtp-Source: ABdhPJxcTnp/af9YlgPZyfAFy7U5Pup6ForWvjDe1SJSTrIpLXwPiCF+oM9QVnzTQgwAEcD5Bb5Q3w==
X-Received: by 2002:a63:1d12:: with SMTP id d18mr2748163pgd.314.1603380084737; 
 Thu, 22 Oct 2020 08:21:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q2sm2344858pfu.193.2020.10.22.08.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 08:21:23 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Adjust privilege level for HLV(X)/HSV
 instructions
To: Alistair Francis <alistair23@gmail.com>
References: <20201018120308.1712054-1-georg.kotheimer@kernkonzept.com>
 <bb17cae6-68eb-af14-0d08-1140e83cabcd@linaro.org>
 <CAKmqyKOaTEX0G5AxW31rYXfHi8rH1jjj6OQFtmmAUJaurPFtJQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <968d33ab-3df9-a043-5462-03f51ccde431@linaro.org>
Date: Thu, 22 Oct 2020 08:21:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOaTEX0G5AxW31rYXfHi8rH1jjj6OQFtmmAUJaurPFtJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/20 12:21 PM, Alistair Francis wrote:
>> mmuidx, you would use cpu_lduw_mmuidx_ra.  I would also split the function into
>> two, so that one performs HLVX.HU and the other HLVX.WU, so that you don't have
>> to pass the size as a parameter.
> 
> I'm not clear what you mean here.

target_ulong helper_hyp_x_load(CPURISCVState *env,
  target_ulong address, target_ulong attrs, target_ulong memop)

should be split to

target_ulong helper_hlvx_hu(CPURISCVState *env,
                            target_ulong address)
target_ulong helper_hlvx_hw(CPURISCVState *env,
                            target_ulong address)

(attrs is already unused?) so that memop is not required.


r~

