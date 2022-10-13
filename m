Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465DF5FE0EF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:18:44 +0200 (CEST)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2n5-0002nB-0z
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2ig-0007R6-QK
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:14:11 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2if-0005xz-8y
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:14:10 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so5666672pjg.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P8c/6NSIVil1WKOR3nxL1QV2Mb4WY8WPJioU1iryS3c=;
 b=PdZB+XdqpU78hOJcqR+SIc3B7xLmCOYgmbV0X66WjsxH6v66w6ui8Gkjla7KXycPa+
 mTcOtD49o/0u7S4u2aafsqYBkTqzufcTFRX20Tq5pmE9qtd00vVBqfay1yJipIFKyMHl
 bLmgFqdBDr+GtDNh/T0GAktRj0kgkybWloM8l/dufe8di+hm4LKj2KBtIq4U9ekklbO6
 BMaG9bd4rR8MkmqDclvN2VfWZcea5HBDdu8MbOAWimeObsyOdpwmoRLRWEGcTK9aG3ry
 V1xk9EGraVI4VfcciohEursHkpF8T7WkDTDwbgsmyHXihz/eVWm0gMtSv2ANhWKMkvJV
 y7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P8c/6NSIVil1WKOR3nxL1QV2Mb4WY8WPJioU1iryS3c=;
 b=6nOcYgXvQe8BLlZDfrV+2M7TlhSR3QLCa3wUggbiHz8cYKhq8j7/EFb3g8zo0SDxpk
 SdW71a6I827YJNKVyJfvQOMfjw7Dd9SF86fJAdETB7QczbbpiLnTI2WOhfXb+MtPb30X
 lkwe192CtWhxPaRRmFsKaP2gX+nXHvF/kcE5IJODtNSna75Z3tCAvhrwOkGe5yzDef1E
 IoHlva44V0SviuGZKJSWMz8Nwv4n+ZiN5ncxPEi/AC74A0AGvQzp4v+jMSXzvgK+LsYW
 n45BWTdNHDRPuUHck4Jc8qGozsceXMi9+amO/CZadCqcEOUx8cSBY+xotK3dyfiK9AUK
 KzXw==
X-Gm-Message-State: ACrzQf2hVCFQX6i3n/nBIuq3tT6pYJaJ2S/qQmu1qlrY0Lx909Rm1mIk
 Kv0bLPOUbgGFVCWN+LeMQxUWjyqz/AjxZRaA
X-Google-Smtp-Source: AMsMyM6udEuCCveSitlSVDmmPiFO9UI+uZ5XZJArsU2lZWV0NGwdI6v58UYnf3ifr5BLqHVTY0NYNw==
X-Received: by 2002:a17:902:8f91:b0:184:d3ed:afd8 with SMTP id
 z17-20020a1709028f9100b00184d3edafd8mr1210402plo.15.1665684845162; 
 Thu, 13 Oct 2022 11:14:05 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 c21-20020a63da15000000b00439c6a4e1ccsm24199pgh.62.2022.10.13.11.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:14:04 -0700 (PDT)
Message-ID: <6be37344-0c0e-9641-550b-3e1a32726035@linaro.org>
Date: Fri, 14 Oct 2022 05:13:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 0/8] rerandomize RNG seeds on reboot and handle
 record&replay
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221011204645.1160916-1-Jason@zx2c4.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221011204645.1160916-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/22 13:46, Jason A. Donenfeld wrote:
> When the system reboots, the rng seed that QEMU passes should be
> re-randomized, so that the new boot gets a new seed. This series wires
> that up for FDT.
> 
> Then, since the record&replay subsystem makes use of reset as well, we
> add a new reset cause for record&replay, so that we can avoid
> re-randomizing in these cases.
> 
> Jason A. Donenfeld (8):
>    device-tree: add re-randomization helper function
>    arm: re-randomize rng-seed on reboot
>    riscv: re-randomize rng-seed on reboot
>    openrisc: re-randomize rng-seed on reboot
>    rx: re-randomize rng-seed on reboot
>    mips: re-randomize rng-seed on reboot
>    reset: allow registering handlers that aren't called by snapshot
>      loading
>    reset: do not re-randomize RNG seed on snapshot load

You need to invert the patch order so that the series is bisectable.
At the moment you still introduce the reported bug, then fix it in the final patch.


r~

