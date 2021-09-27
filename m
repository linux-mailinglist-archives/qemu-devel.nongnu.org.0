Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664554195F9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:09:05 +0200 (CEST)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrJY-0005C1-D4
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUrAX-00037H-2O
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:59:45 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUrAV-0005TA-7n
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:59:44 -0400
Received: by mail-qk1-x72e.google.com with SMTP id 138so36460966qko.10
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 06:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9kOhoQzDOc9TP41qtRFNkgv/iEKWORCPbeHmLe+sAOc=;
 b=mlWCtd8fp7vjPIhV41WxZxYzvic1Gl9eP1iOSPVBoFQ/19YEKwG4LdXkOq+Idv4A/0
 KtcvODemO7ATZTZLT/w/Ls5/nqF/SPAVOlVb66VWypg3oip68A7lEuuiUL7b9SvimxEh
 qE0OyhIvkxsXiqEQgVG9bMRry+0d9xfXb4xbHKGyXFfRtR3GYPT1I2vEGTWjS4wcEeKV
 DKePdebfB68o10dq52CNeA4+O0kFbJo0n45Jai4t1sAs3l4x2X7MPhSb4KO5WHoof1jy
 ivW8ZX5zDHoj3uKuZdk8tzyoZrjxo+hL8yePgHpqwVio0xD4w6iOlUhXFktJkLXik6dl
 1AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9kOhoQzDOc9TP41qtRFNkgv/iEKWORCPbeHmLe+sAOc=;
 b=6es53uPYaPVcYgVAgsqu+Mli4V45Ug3h15W9yvd6Yd2BUVPG3HJ3vQ+y25TC31eJqy
 7wExTguL2F5zDiv5rVxP2exrkpU0j+zWorSKk9lBOxysmp0SsM6LGu8kJmNHNaKlObB3
 3o74c7l0A2gD+gW5ltKNNBd6X3jdnblD3MXjiljKUOZkzw/Ax50tTyUl99a3jsiyYcHT
 2q9ey1vy6c5ALl70bZZ015CCCKrvF9W63HHO5SmQYC1ZYL1LNUjCMkjYAa9J/j9Y320+
 OX9FcXsxuRzCcmpylJK1A+MVhuuilLBN/x9ipAXiM6yPDTtc3VO/ewIhr796jAFL1ZRr
 0H7w==
X-Gm-Message-State: AOAM530JNy9/yG1SN8xGuV+/cFe/npALXcUZzs/5sj8fH/LU+czuhwXr
 uJpRJ4eKj/AUxNrvnAiH/cJrNA==
X-Google-Smtp-Source: ABdhPJzNr0TKnZ5Oz67J24qiXoKKfGryIwNsDWJVXis0DsGwEXA6/GEDukiAJuGD5brahbl1BC8pIA==
X-Received: by 2002:a05:620a:450e:: with SMTP id
 t14mr64010qkp.93.1632751181814; 
 Mon, 27 Sep 2021 06:59:41 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id k15sm685668qtj.78.2021.09.27.06.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 06:59:41 -0700 (PDT)
Subject: Re: [PATCH v3 17/27] linux-user/nios2: Map a real kuser page
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-18-richard.henderson@linaro.org>
 <CAFEAcA9+KnOeibG+uyyZdtKaCUuE_--F23mFeFy3Jo08aT8XaA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c03bbdcf-5333-3c02-f156-3793dde50ac8@linaro.org>
Date: Mon, 27 Sep 2021 09:59:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9+KnOeibG+uyyZdtKaCUuE_--F23mFeFy3Jo08aT8XaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.136,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 9:26 AM, Peter Maydell wrote:
>> +    /*
>> +     * If the mmap doesn't give us exactly page 1, there's nothing
>> +     * we can do, and it's unlikely that the program will be able
>> +     * to continue.  FIXME: Error out now?
>> +     */
>> +    assert(pg == TARGET_PAGE_SIZE);
> 
> Shouldn't we be doing this via the probe_guest_base machinery
> the way we do for the Arm commpage ?

Well, maybe.  Though the Arm commpage continues to not work.

https://gitlab.com/qemu-project/qemu/-/issues/633
https://gitlab.com/qemu-project/qemu/-/issues/447

But you're right, this could just as easily error out on a 32-bit host.


r~

