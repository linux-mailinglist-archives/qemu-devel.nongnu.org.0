Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A0610331
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:47:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9mZ-0002EV-DT; Thu, 27 Oct 2022 16:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9ll-0001qG-20
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:46:31 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9li-0007KD-VV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:46:28 -0400
Received: by mail-pf1-x436.google.com with SMTP id e4so2889909pfl.2
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+zTs4rOn/VSUHV5PS/bd1aREf+YsSvHqipKQCptgodU=;
 b=qRdj4nYlW7Jl4G1JHYJlvf266Q4h7f38niyfXTlXBKFgCq42X1T01dXIff7gTH0I+6
 T7bE5bmZgkrPXp9dfwtf2WL+cq0d4tobq5+fccnAAWTnjUqlJNtDeGn6GTEUz5HPEYVP
 vGicxfkCuK9q7N46o8NsRS5JfxaEmWxjEXkbr/ZAmUbQcSmrTGos6B3bazQIC1Hztqum
 nY5VIM92/Q7AGRUG4yxkBghqOO0rWYYyBQXMsodr//NKfFf+Yo5FnqAZikbJaXVUaKIj
 M9Zx9tPLjpNmQWNCDeQAtbm78OEz3sKsoV30eITEYdxVpAWHEqlrtiM6T7ula2iVwHZG
 FLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zTs4rOn/VSUHV5PS/bd1aREf+YsSvHqipKQCptgodU=;
 b=ZSj/rz7IILJPiGaBdRQKgFNNLfmHEflIXtT6r12DCZdk0l5pyefPr0x5GWKdWtnNqW
 xTOYl7fbxOqsRv4c/Rrf/FqKHxEqHhpp8SLWu6OPYI8lUZG/CVsoVYsigh9rW9pSBy/f
 awKUco4NAo6s9mEiV5nj33R1R5PuFNEMR5f83xuKzAYrPRIyCNwUnxwmsg51tfezHO+L
 WCVj43JQjCtGcqI2tLUzC9kZGHIPICbCPjRQLXxcbjdp5y+jeB/3fsEQfS2l6NCeZ3b0
 N44udy2MMwjWLRlvvM+tkhjeIpALGEqkN0vDwPC4Al10rw2JVqFxmJDtIRecjuFzwJH6
 qyag==
X-Gm-Message-State: ACrzQf3hQxWImL6LlfuvcAmoDp4fdC3CaP2KDkMBTIvVjPP3sV6cq7Sd
 VhMiQle4tQej/I52k+zyMbp6ew==
X-Google-Smtp-Source: AMsMyM7rXoBN6826rp2Q2zu2d9CvIKm5rx2C8TaVHNPb12M68v1LJvCTOuIOPnxH5or8UT0K7Xcpjw==
X-Received: by 2002:a63:1564:0:b0:46f:6aff:6976 with SMTP id
 36-20020a631564000000b0046f6aff6976mr145159pgv.500.1666903584938; 
 Thu, 27 Oct 2022 13:46:24 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 x35-20020a17090a38a600b0020ad26fa65dsm1330109pjb.56.2022.10.27.13.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 13:46:24 -0700 (PDT)
Message-ID: <6057ee70-f117-f7a6-6ac6-e9d21dbc653a@linaro.org>
Date: Fri, 28 Oct 2022 06:46:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PULL 15/20] include/hw/core: Create struct CPUJumpCache
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
 <20221004195241.46491-16-richard.henderson@linaro.org>
 <20221027141856.w5umjgklawgu7pqv@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221027141856.w5umjgklawgu7pqv@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 00:18, Ilya Leoshkevich wrote:
> in one of the wasmtime tests (host=x86_64, guest=s390x).
> GDB shows that the root cause is actually this:
> 
>      Thread 181 "wasi_tokio::pat" received signal SIGSEGV, Segmentation fault.
>      [Switching to Thread 0x7ffff6c54640 (LWP 168352)]
>      0x0000555555626736 in do_tb_phys_invalidate (tb=tb@entry=0x7fffea4b8500 <code_gen_buffer+38503635>, rm_from_page_list=rm_from_page_list@entry=true) at qemu/accel/tcg/translate-all.c:1192
>      1192	        if (qatomic_read(&jc->array[h].tb) == tb) {
>      (gdb) bt
>      #0  0x0000555555626736 in do_tb_phys_invalidate (tb=tb@entry=0x7fffea4b8500 <code_gen_buffer+38503635>, rm_from_page_list=rm_from_page_list@entry=true) at qemu/accel/tcg/translate-all.c:1192
>      #1  0x0000555555626b98 in tb_phys_invalidate__locked (tb=0x7fffea4b8500 <code_gen_buffer+38503635>) at qemu/accel/tcg/translate-all.c:1211
>      #2  tb_invalidate_phys_page_range__locked (p=<optimized out>, start=start@entry=836716683264, end=end@entry=836716687360, retaddr=0, pages=0x0) at qemu/accel/tcg/translate-all.c:1678
>      #3  0x0000555555626dfb in tb_invalidate_phys_range (start=836716683264, start@entry=836716584960, end=end@entry=836716982272) at qemu/accel/tcg/translate-all.c:1753
>      #4  0x0000555555639e43 in target_munmap (start=start@entry=836716584960, len=len@entry=397312) at qemu/linux-user/mmap.c:769
> 
> Let me know if you need more information, I can try to extract a
> minimal reproducer.

A reproducer would be helpful.


r~


