Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F2943997E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:59:59 +0200 (CEST)
Received: from localhost ([::1]:38862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf1SA-0004c4-KZ
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf1Qs-00039X-Kh
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:58:38 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf1Qo-0003FK-FX
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:58:38 -0400
Received: by mail-pg1-x531.google.com with SMTP id r28so6850950pga.0
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KT0HFOPEZfxT/Hx5zbOsHK6qtEo2Ov503tpbnuW8Ujc=;
 b=Wij2kiK3wkPyzZo6kp7858QhWEdExr/DTsb9bk1kxRI5gUdSJ3iP+9OXhvs1zqfUJB
 elWNP3KT/k4FLD9Fn9k209Qli1mTUd5tM9Eg96aVUBu+2UuPn95VNnVIdp3QelW42cs8
 Y3C21rUEmMMxdopNl6xsMXJueMb4wDZNmJdRyBmCk+puMWp9+qQhyhEtivQ4qdhApViG
 vGzCuCKg+VfAmiDyweXbivbbjbpoVWOSPkM6/idN3O1pv/PiT4dQShwms7ScPZ5CfSZs
 PgR0UYcRsTstqxc0tSFyKR/Mb19OL9I2sKvOgmpTHgc51vxxlwp50Jrj677H58s178kX
 4xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KT0HFOPEZfxT/Hx5zbOsHK6qtEo2Ov503tpbnuW8Ujc=;
 b=cHQaWxnPahiD4G5p7OeaWY66i0FeZh7YPaiHPW3u1ewWlkhDsPgXeIc1z4QkfWOWga
 0uGrhjTVcvwEgWMBObz8jKTk42o6Rdx+qet7QFgNsZOe6DP55GGeHxmn/z8cZqy8cMCh
 ik7oHkRBfjvL3GOWgelBGUPa/egOmpFEFBj8EewHrmWWObz+kqkcbkwL8I+EFScpwCWz
 TqbS6RB7T73KedWBBRY/El9ZC38pqgSBKThHQ711JlXWzXaQcofsepwoC9XJZkQN1QNu
 SOl1LYdeApFM5ixnoKYkYGZySmQeG2+ElZNOsdEKOb4lnwDcj/5lZuId/ghqkji4zbbX
 bwAQ==
X-Gm-Message-State: AOAM5308WiJ0sjx4pLKOEfQ9xQknKNomG+H0gdGT/UKH8eR8Pd5ax7hv
 MvBcvDT1bLo5Ra7pOj6Y0Oh6Aw==
X-Google-Smtp-Source: ABdhPJx6Ulqii2mAcXJZIZqhzEo5tVyxw0RS/6zDBeHlKrQfvCUhpMMD7PPOlaWoY2CksRg50l/e6Q==
X-Received: by 2002:a63:894a:: with SMTP id v71mr11191795pgd.451.1635173912724; 
 Mon, 25 Oct 2021 07:58:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v19sm16848640pfu.179.2021.10.25.07.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:58:32 -0700 (PDT)
Subject: Re: [PATCH v6 00/15] target/riscv: Rationalize XLEN and operand length
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20211020031709.359469-1-richard.henderson@linaro.org>
 <17397bbe-7dfe-ac2e-6033-4ab4840a11bd@c-sky.com>
 <663d5df5-c107-c4ce-99e0-2a5d336a69ca@linaro.org>
 <606880b5-83fc-6ab6-6d34-fb2b71536f99@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4de33722-7cb9-7566-6830-a45709eda452@linaro.org>
Date: Mon, 25 Oct 2021 07:58:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <606880b5-83fc-6ab6-6d34-fb2b71536f99@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 2:24 AM, LIU Zhiwei wrote:
>> I think extending on write is the correct thing. 
> 
> Thanks. I will pick this way.
> 
>> Jumps, exception entry and return, gdb write.
> 
> If we carefully process jumps and gdb write, I think we can omit exception entry and 
> return. Is it right?

No, though you'd probably have to create a special test case to see it.

On exception return, a 64-bit OS can write a 64-bit value into SEPC.  But when SEPC is 
copied to PC during SRET, UXL should be examined and the assignment should extend for a 
32-bit user program.

Exception entry would seem to be limited on its face by SXLEN; STVEC will always contain 
the same number of bits as PC, so no (additional) extension would be required.  But we do 
have to be careful to interpret the target_ulong value properly for the current SXLEN.


r~

