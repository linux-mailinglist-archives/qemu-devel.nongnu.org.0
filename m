Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587CA45AAE4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 19:08:08 +0100 (CET)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpaD9-0004gf-G5
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 13:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpa16-0007oL-Py
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:55:40 -0500
Received: from [2a00:1450:4864:20::42c] (port=42540
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpa15-0007KQ-22
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:55:40 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c4so40341460wrd.9
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AaamTke+m53pF+W3Pv1hIIS9uUQ7lg2Dt+VqwSuIDqo=;
 b=JKS13+f361NiLjnnYgy/JG7PHF6MkssWZGoxhOaaRLvc7iZhfLV5z5mhaT9QO3a29E
 3IPLVgFnN4YgV9fyV/iww8AgQ/2sGasO9qSF91zOvT5nxiXsrcEkOQJZnhnXLcAGtPKe
 MtpBTI2xLQb6jYlAx7CbNVWFHQd5W7p5FlJ+8PksoITkW2eaMiOJX5b/3k9CN4mW35Y8
 Godn0Py4zajwrpHaXC/I+2WeTryviLAEmDudexeWGhrvyGOZ05DPIf2SadAOb+NPTDBM
 2inR/q0mYdjuu7csgDxs6vs5zrL9nQImUqk/dNsb6F9hdSLZ3cFiOYx2fHw3CkkMyg6n
 zk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AaamTke+m53pF+W3Pv1hIIS9uUQ7lg2Dt+VqwSuIDqo=;
 b=c3EYnMp0+qUrAWghFkrxIwwzT6H+tHkdyJds+K5zzxpBdo/bcShMYPCUeP/ssV15vj
 MnuFgfWc0tk/zf9wiHPdJJVfukTqHVu3oAPgO8ba1l2hOHZ0emubdHKFOqmTOmaXf/R6
 vRf7eO26cNUYqFVC4q5cGRe7zgCh7GGgtHGVZjjTKmAqYovHOyXNyfj3jo7tMuEK9U9s
 UEUbR7PDp2Q96mU1xlBYqURwsfKFle+2Dnk6650ueoTLRGd46EnJXOP5Ee4PbH4CSC2N
 Ih7f5KMUihLoczVr61HnT6m7oahGpQz9AyE7eff4vt8uHMnKqOTOHMz1Og12CZa5XRsm
 xhsQ==
X-Gm-Message-State: AOAM531C49ltsMqxX2ER+LQHMtaUVUGu/2zqRYPFq8TucmxZ542ta7e9
 ehtDerIuC6JfDTsl28OxjM1bfQ==
X-Google-Smtp-Source: ABdhPJx7eJtwwjkt0EGvSV8Tj2Bx3AG6gW93qKD8rPzL0RHcb8SNCXoXU2QNb0+ifXkA7ziN6YgJig==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr9691859wry.415.1637690136033; 
 Tue, 23 Nov 2021 09:55:36 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id x4sm1773491wmi.3.2021.11.23.09.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 09:55:35 -0800 (PST)
Subject: Re: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211123171031.975367-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fdee2c9-464b-7e39-be91-135bdbc315ab@linaro.org>
Date: Tue, 23 Nov 2021 18:55:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123171031.975367-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 6:10 PM, Peter Maydell wrote:
> In gicv3_redist_lpi_pending() we update cs->hpplpi to indicate the
> new highest priority pending LPI after changing the requested LPI
> pending bit.  However the overall highest priority pending interrupt
> information won't be updated unless we call gicv3_redist_update().
> We do that from the callsite in gicv3-redist_process_lpi(), but not
> from the callsite in icc_activate_irq().  The effect is that when the
> guest acknowledges an LPI by reading ICC_IAR1_EL1, we mark it as not
> pending in the data structure but still leave it in cs->hppi so will
> offer it to the guest again.
> 
> The effect is that if we are using an emulated GICv3 and ITS and
> using devices which use LPIs (ie PCI devices) then Linux will
> complain "irq 54: nobody cared" and then hang (probably because the
> stale bogus interrupt info meant we never tried to deliver some other
> real interrupt).
> 
> Add the missing gicv3_redist_update() call.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Marked for-6.2 because this is a bug fix to the ITS support
> which is new in this release. At least for me this is necessary
> to boot Debian on the virt board, since the ITS is default-enabled.
> The failure seemed to be somewhat intermittent; I haven't bothered
> to try to work out why.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

