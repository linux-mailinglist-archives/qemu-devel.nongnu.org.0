Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B258518726
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:47:28 +0200 (CEST)
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltoF-0006r2-LE
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nltnF-0006CI-Nk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:46:26 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nltnD-0005XB-EV
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:46:24 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so2433746pju.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VnruQLmkKvvhzWMTiTFgFCtJE2gDbASMSMSy7nXxxAs=;
 b=OaxG3GzQ13qR4P2b0uJXWDAq9pcVHYMybrEWsd2NXRtzvDyOcrWdVmrU2UruIb+ipR
 RutK1BZ5ltBiWDM6Q1ZEekWZgkyoDzt8+WOXjWRiTdEFi/EMbQYCL7KXp7kbXoxAtSZC
 gVlNWlj8ydNcX0Aj+hGjmPRpw/JRF0+IAo/Sz7EI28XrTsNqPf5kvRTDPS2jm7F4OIp4
 Qc0/wZvTwfk/7zkoYPlrpkl7fZKDInyNXlnAsTDRULi7XzeEWUS/WA4OnShOXAHKLNz6
 YLkrEXsq9OJvC6JzvmkkUWpCcfj1d4MX5TBGr7r/3lAS7AkMa8vMYayoRBqseKAiTDSV
 5KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VnruQLmkKvvhzWMTiTFgFCtJE2gDbASMSMSy7nXxxAs=;
 b=TtBKInKymPAMSDkIFl95ROZq5ZNfghc/A3HvRshrPYJhRAhqM74KSZG/Q/+pgbTujf
 iqJowJel3lIC8dpJRJxbu4UAUj160G1rVj+2D/gUhwaQfKEbOKNnF1WOzU2c95Qsc/py
 5aECz9lPLeI0Cbk0ssw0enRLpChSPAmZS98XXNwN72RSZDd1YrABAG9tD/OhNR3un0pQ
 +f8EtqCCDq9tPnXPYQKbyRHldopJIpYy6no8eYJef+W9+wuMAd1U3LKbdbATyAEiS9UE
 bEhXp0pwriUQhdxlhFVKnjf3R5NCxeW5kRaldVvwhj+J2BdxX3a/bLC3zRGx0YyAdAqV
 XVUA==
X-Gm-Message-State: AOAM531gCbUjtSjpzMzR4RZcQgFpFKU1Q540n0MADNfkoLMPMqy+AMxA
 KOepNuY6GOOfWWBdTgjcnFTOmg==
X-Google-Smtp-Source: ABdhPJw4CB9kOXcSRFIRCEHh+vIdvPpifmuI6fJ2QQKxmrgrLG1ABni3Y1iwgTRL1IU/uoADSqATqA==
X-Received: by 2002:a17:902:f28b:b0:15c:5c21:dc15 with SMTP id
 k11-20020a170902f28b00b0015c5c21dc15mr17208714plc.16.1651589182037; 
 Tue, 03 May 2022 07:46:22 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 on13-20020a17090b1d0d00b001d9acbc3b4esm1457553pjb.47.2022.05.03.07.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 07:46:21 -0700 (PDT)
Message-ID: <0eef40cc-47e0-6670-2b5d-b97026308ce6@linaro.org>
Date: Tue, 3 May 2022 07:46:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/openrisc: implement shutdown and reset helpers
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, openrisc@lists.librecores.org
References: <20220502225230.237369-1-Jason@zx2c4.com>
 <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
 <YnDt0YZK3aG3y8Tl@zx2c4.com> <YnDyaEW2QiUXTNx8@antec>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <YnDyaEW2QiUXTNx8@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/22 02:14, Stafford Horne wrote:
> Yes, we had a mail discussion about this with Peter.  This being similar to ARM
> semihosting; enabling these special instructions should be behind the semihosting
> flag.  Something that needs to be done for this patch.

Ah, ok.

> Our other simulators implement this, so the compromise is if we document this
> officially and only implement it behind semihosting peter was OK with it.
> 
> I haven't started on the documentation yet as I haven't has much time in the
> last few days though.
> 
> Or1ksim:
>    - https://github.com/openrisc/or1ksim/blob/79c6f153390127e50259d46a7cc0421aa787d2ed/cpu/or32/insnset.c#L768
> sim:
>    - https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=sim/or1k/or1k.c;h=bfab35461bee1457fe8f42179ac6d27f5ad46b96;hb=HEAD

Thanks for the pointers.


r~

