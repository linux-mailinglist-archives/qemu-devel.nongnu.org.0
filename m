Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F115636B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Feb 2020 09:31:37 +0100 (CET)
Received: from localhost ([::1]:38876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0LWa-0005zb-5W
	for lists+qemu-devel@lfdr.de; Sat, 08 Feb 2020 03:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j0LUy-0004Zm-Vh
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 03:29:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j0LUv-0003g9-3p
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 03:29:56 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j0LUu-0003fa-Sq
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 03:29:53 -0500
Received: by mail-wm1-x342.google.com with SMTP id f129so5189893wmf.2
 for <qemu-devel@nongnu.org>; Sat, 08 Feb 2020 00:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+nCdLCaBDmqnEn7ZYYF27GMv/dmswyV9SbuqtuhOtZY=;
 b=xh2E4Oh/TwJWpOfCylXxxKiGtXbYO9J713SXIVWeRAfG517ltayIDb6kYgrkgWxMnM
 EmMfro+y0U+f5JvUixJ/UEoQi1gP+YjyEfonRoFzrMEuiJzOqV9bWlsMOdtd187PdNHr
 S1frm5ddoC7PTe69TRHDooQTKFQDJokuAseYu+hxi44ivf3oWlJdrijV6qhyXoD5uydT
 2k7HkcBYKugmLn1i7aIrZ6nk4fmpaQxQfQBgtpQkK07oIc5z92KvZ0plXOiGbqwWFcNt
 ent7d9GKB5JagHI4mS8dobUgu+wTg3hjOYigEysmwvMxZXk6fPY0ElPWVMlvzwyPtDbN
 OEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+nCdLCaBDmqnEn7ZYYF27GMv/dmswyV9SbuqtuhOtZY=;
 b=seeVIra0ytQwRJ9r4gQS1INnv4s7mp6odZGHd6WmfkDwlN5Nv86nWssoH+tnYnPzTl
 ApiVH/9g27wRuH+QjDPtOCAIfW13CBsZiJ0bKAizp7MMPEAlcMT8FxZew/yuY7XjeCC9
 ATS2As8nIRipPW+vGhgCKujGx+8hk6qJF1Z11sB179OMmUyi905TcwfJkHd/GxhNC++N
 Uqg1rk0gQXk6uO4b5nTAakNAnD71i/x41EmvwL9cg/u+TaM19cyCwnySX0WuIA8xr7Hb
 nwVa6sLzN+FtZpd41yzlIPfl3pWFy/JxGVGa20zG1bcUQHtUnOPII2wRolj+0qDlUfAH
 YqwA==
X-Gm-Message-State: APjAAAUu8vmcmgww+c1TxqaXjb9GItASBKG8jhvt0ZPPPYwy0VaJwAIQ
 72TP3ikt/6fO9YkPoKQsGRjKpQ==
X-Google-Smtp-Source: APXvYqxik45zCtoUrqPKxGHbNsZ3Ml7YOccGUrPzg7g7sTTYZKs/VP0DgwnGoGA1ZD9AOIabpRmgQw==
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr3335936wml.138.1581150591874; 
 Sat, 08 Feb 2020 00:29:51 -0800 (PST)
Received: from [10.43.13.93] ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id v15sm139224wrf.7.2020.02.08.00.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2020 00:29:51 -0800 (PST)
Subject: Re: [PATCH v3 09/20] target/arm: Tidy msr_mask
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200203144716.32204-1-richard.henderson@linaro.org>
 <20200203144716.32204-10-richard.henderson@linaro.org>
 <CAFEAcA9qhMX2xM_nX9Np4g0s=nAW6zH5Hz_HdzwBJMuiWQqxCg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10deb047-06b8-1bae-bd11-b0df7cfca846@linaro.org>
Date: Sat, 8 Feb 2020 08:29:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qhMX2xM_nX9Np4g0s=nAW6zH5Hz_HdzwBJMuiWQqxCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/20 5:40 PM, Peter Maydell wrote:
> On Mon, 3 Feb 2020 at 14:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The CPSR_USER mask for IS_USER already avoids all of the RES0
>> bits as per aarch32_cpsr_valid_mask.  Fix up the formatting.
> 
> CPSR_USER includes CPSR_Q and CPSR_GE, which might be RES0
> depending on feature bit settings.

Oops, yes.

> Diff made a bit of a mess of this patch -- I think it would
> be easier to understand if the reformatting to add {} was
> separate from the code change.

Because of the above, I'll probably drop all of this except for the formatting fix.


r~

