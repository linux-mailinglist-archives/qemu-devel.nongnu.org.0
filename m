Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B09634332
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXd8-0007Ev-Mc; Tue, 22 Nov 2022 13:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxXd0-0007EB-BB
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:04:17 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxXcu-000820-IP
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:04:12 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z26so15092655pff.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e3HBVeyF7E9Fv8a3Q8/1/nbgUzhXw/i/JOnNH8SSzEo=;
 b=QHB4V3TfjdxZ9g3OtaBkBJoMH+s4aZpa213Q8R1mQunu7eku71SEKpfLVObYj93y3g
 fD1wZfpdPLw8e3VTH0tKzjQQSpy6ZTWiALHgT6i+8IcHnUbeVrj/je8HZS4olGZG4jNb
 OEJcqaEYjvOUgr7OgKtfpwW8Uj4DL55w0xf6dg+fUwAutRKwUx81m4b4UCPwnbR6loba
 GaKmCFFh32D7Z5jL0PigbK8YwO/2Qdwe8Sz/Exdv3Wj7ltJTn1Un5hFdsvHiJTWWH9UQ
 qy7i7uJBVt0ibkRM1Jp9J4P7xYzyFtpgh3kUDuyqnt/aI2ViEr9eQpt4KddwzR66tUBT
 3sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3HBVeyF7E9Fv8a3Q8/1/nbgUzhXw/i/JOnNH8SSzEo=;
 b=Mo3faYasB85mLZ6oMgHPO6TkzqA3uue4rH5GBH/vWbe8SicneXYWPhSJb038pxyzIT
 AYPApMnmc2CwEqvRnESg3cxe2+I8pk7ys7AO/n0BgUCfUAiUURwL4lqTa4NyCFHxb+Is
 fGh4nYLNBN7dbDb1KEwCdJ/pcuCLzXuvBRfooSWSo8/SIdBlaWX898/MNYU8T60gcNty
 /0sdo7bCzC/8vjK36XG7rqLg7j82iYQ2n2adP/ybUoU17I/U80WiwSChI0ltBTRhjJmh
 edGQmsNo4DdVvZtLln1f5by/Q4g1co8HGZaS1N1N0m0j8kZJg2TAYmGfiXGxvaBLfAZ7
 wttw==
X-Gm-Message-State: ANoB5pm97VCqPEh3mSHJi0j8hOQHSaEEKbUKBiQuuPqOzdCjNfv1uBvc
 RQUsQYCq99SLPqvGcACl2tCDWw==
X-Google-Smtp-Source: AA0mqf447+Jj1piIn7LTP8o+4k/Af8zluun9tKj9ko//+fovY4VgInq/Q9U/6+aZhIbbdQUDHA89eQ==
X-Received: by 2002:a65:6d10:0:b0:476:fdde:e539 with SMTP id
 bf16-20020a656d10000000b00476fddee539mr7278686pgb.216.1669140244311; 
 Tue, 22 Nov 2022 10:04:04 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90f5:6f8b:e78a:4a0?
 ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 z68-20020a623347000000b00573eb4a9a66sm2089975pfz.2.2022.11.22.10.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 10:04:03 -0800 (PST)
Message-ID: <ee02113c-0321-86a7-f23f-835a02a5ef94@linaro.org>
Date: Tue, 22 Nov 2022 10:04:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 07/29] accel/tcg: Honor atomicity of loads
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-8-richard.henderson@linaro.org>
 <CAFEAcA_6PHdEPBFqyHC+z8Xz8FcJw1wgDu-R+ynm+Qv04WS1Xg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_6PHdEPBFqyHC+z8Xz8FcJw1wgDu-R+ynm+Qv04WS1Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/22/22 06:35, Peter Maydell wrote:
>> +    /*
>> +     * Here we have the architectural atomicity of the operation.
>> +     * However, when executing in a serial context, we need no extra
>> +     * host atomicity in order to avoid racing.  This reduction
>> +     * avoids looping with cpu_loop_exit_atomic.
>> +     */
>> +    if (cpu_in_serial_context(env_cpu(env))) {
> 
> Is it OK to use cpu_in_serial_context() here ? Even if
> there's no other vCPU executing in parallel, there might
> be device model code doing a memory write in the iothread,
> I think.

Well, it's no different from how we currently treat compare-and-swap expansion.  But you 
have a point -- we should probably be doing something with the iothread lock for both 
EXCP_ATOMIC and round-robin mode.


r~

