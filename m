Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC5E61049C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:40:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAaY-0000db-1G; Thu, 27 Oct 2022 17:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooAaW-0000dS-CO
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:38:56 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooAaU-0006nE-IO
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:38:56 -0400
Received: by mail-pf1-x436.google.com with SMTP id m6so3068329pfb.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6rE4mHZTJUDqhUs59YE/Zf+Wj9BHnhQjKxvXsu1+muc=;
 b=D6gn2pQbnSwnKtuGny28PuyV70i9vCcRVXU4CDSZJp3h5daCNaf4iNjNilhwbH5FB4
 fBDKxACbC3NYU0lr+DAyiHzXihJA5iuMG7qOxTjnY9uH6zjS6Px/HZ7zEUtDzl89V0yj
 ic8kknfcrZLzR+TRRYopN6c03xAkPSIqOR8gjyLyWtCSR1V9YWvERIWnGCJlhqQkrmGP
 VkbckQRKM58KasUsh/LW2Vi3SfSTUdhac++8QYT3F56bnf61PhjaTPNSW6ny74lQ5zQE
 JQaRlTazjdW0vkLnOSheuYpaD6NpPALil1bRqcxCOwx8QWwOnrTHn8PaIax98Amz5GJ6
 XvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6rE4mHZTJUDqhUs59YE/Zf+Wj9BHnhQjKxvXsu1+muc=;
 b=Re9NSem7Qk2gAXbYgAMWcgb0/YuRU1MJY9xJhFb6Hj1d/AvQ6oOOpoFwIIq2JZosSz
 LyigDf3EXJm7TP9k0PzxOy7NsAX7bjAtEwhYEwTCcJw7smRMKDub4KTw4vAasmgU1Dyv
 rEZjJMA4HuH6F2dpwX2IClxgZaNFZZzW8zQQD0ZnR13qgas9SQNPldDR79O1MDMJ4PyX
 bu7yY2MKAzkqKi+2vPK/RI1hTKH3ynuFiLYFgjzaz2CghvLykaDIwa8QxYgIB4R5hY9Y
 qM6vHBtAC6RxLlYiZnPUwdzaxfW+qQHOKzZs6NNL8i2KwEysY/PwGThDvtt6pQY34fZd
 iNDw==
X-Gm-Message-State: ACrzQf3thzZgNX7sMHpYhixR0wP6fDQQ5ywuvw3gKnS14nO6wHdHoXSi
 8db5r3y3Rtbp096O/4Uwdy14fg==
X-Google-Smtp-Source: AMsMyM6dtiJsizvC0MJUgjkiQct8IX7982MGn7nW5QXWLl2ug5lvRkZO+IPSJSuJFy2q7rjZX3zfaQ==
X-Received: by 2002:a63:594b:0:b0:46f:325:20c4 with SMTP id
 j11-20020a63594b000000b0046f032520c4mr19453816pgm.505.1666906732514; 
 Thu, 27 Oct 2022 14:38:52 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a65580d000000b00429c5270710sm1484178pgr.1.2022.10.27.14.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:38:51 -0700 (PDT)
Message-ID: <bbb345b8-5f04-40a7-12ba-5b4fcb52cd9f@linaro.org>
Date: Fri, 28 Oct 2022 07:38:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 22/24] accel/tcg: Use interval tree for user-only page
 tracking
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-23-richard.henderson@linaro.org>
 <87eduu4rzo.fsf@linaro.org> <4df39234-6697-61b8-6c56-1bd17b4f9fa8@linaro.org>
 <87y1t1yw32.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y1t1yw32.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/28/22 01:59, Alex Bennée wrote:
>> I'm unwilling to put an expensive test like a function call
>> (have_mmap_lock) before an inexpensive test like pointer != NULL.
> 
> Is it really that more expensive?

Well, yes.  I mean, the function call isn't really slow, but it isn't single-cycle like a 
comparison against 0.

> Sure, I guess I'm just trying to avoid having so many returns out of
> the code at various levels of nesting. The page_get_target_data code is
> harder to follow. What about:
> 
> int page_get_flags(target_ulong address)
> {
>      PageFlagsNode *p = pageflags_find(address, address);
> 
>      /*
>       * See util/interval-tree.c re lockless lookups: no false positives but
>       * there are false negatives.  If we had the lock and found
>       * nothing we are done, otherwise retry with the mmap lock acquired.
>       */
>      if (p) {
>          return p->flags;
>      } else if (have_mmap_lock()) {
>          return 0;
>      }
> 
>      mmap_lock();
>      p = pageflags_find(address, address);
>      mmap_unlock();
> 
>      return p ? p->flags : 0;
> }

Ok, I can use this.  In for v3.

As for page_get_target_data, see v2, in which there has been clean up.


r~

