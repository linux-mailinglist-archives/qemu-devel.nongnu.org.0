Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE295463D2E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 18:46:25 +0100 (CET)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms7Cy-0005ax-DJ
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 12:46:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms7Av-0003lS-2L
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 12:44:17 -0500
Received: from [2a00:1450:4864:20::333] (port=39768
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms7At-0008HJ-GB
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 12:44:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso20162397wmr.4
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jLjkq309a4RQ6LVBNbmNUfy+IvIk2YTkS5p6OfsTzlc=;
 b=MEI/28UvuCIAVbYTv3k2Yg69sL2dzjipaFN1Z8bfE4ohoypfp2VFgFJoM+nDc+GTNy
 99Y+MeNElFkEYZ95ngrfhbXfzUd3wvPwiq2gREupAKU+eSn3L170lpzYsoT+rubQXKYP
 cNplcM38ow1dTcOYaU+ukVaEbl2HQlTqZE3TcLknM0+1D4l1cqVhT5hGqU4C94HK3LpF
 2uAqgD3HgmUHxgiIZvxA6hIm27vBv3hzB/m2BT6Fjm4E1W8Fk+EU0HpsMfXaL7Jg0Rnr
 H3bz8Ijls4xrb+FDTbq0oGIpmNQ9gUOoBl03P7TrmzJgZC23ccLnNL/8M+5k7hGIplM5
 XhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jLjkq309a4RQ6LVBNbmNUfy+IvIk2YTkS5p6OfsTzlc=;
 b=pmCkV1o0bLYkAld7U4rUE0eoq97yVRPQ88/BBKG9aUkb3ooxtoJGcOXnfeqbyPO0AC
 QGYmgHuJm9q8NlpgMgEDEcO0ORsutCjPJLxK4r+HO7zQ/4yy/zZ8GOCpcItkfwRsnb2B
 GRSUeP8qtgW2Gejgf6Mb4d/iy70OmUuQjOdSTDIxhvcHkMRZO0Txy5miNkCyxFa0Z7AH
 qJqq0iwP1YhSOf3Fjmap+b8GzvVwEdNwfjeRD7BXBWIVZ/BGNOWpwxVuAgTQQ5iKQ44P
 F+5CotmhqdxOcBKDLaS2fZvpW12dQl9yQ+NVtyijcfB+L9ZINYCS7QHUQEQ9AQT++puS
 qW/Q==
X-Gm-Message-State: AOAM532GMaNAG8raj/5V5JppScFAkyLte7xqBv1/Y6riv2w36+KaN6Jm
 NYp45O8xwtqLJz4YWIfIdRU4Tw==
X-Google-Smtp-Source: ABdhPJw3yGThY0KWdLOeVmlgDcQitQFBOnwVafiNtV1DBHm3j0eZaUjOwkhMlNu06iJ5CzES7QY+rQ==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr93119wmd.103.1638294253845;
 Tue, 30 Nov 2021 09:44:13 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id g5sm22563642wri.45.2021.11.30.09.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 09:44:13 -0800 (PST)
Subject: Re: [PATCH] target/arm: Correct calculation of tlb range invalidate
 length
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211130173257.1274194-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57c19405-15c9-fb06-1e9f-6377e46e2d4e@linaro.org>
Date: Tue, 30 Nov 2021 18:44:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130173257.1274194-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 6:32 PM, Peter Maydell wrote:
> The calculation of the length of TLB range invalidate operations
> in tlbi_aa64_range_get_length() is incorrect in two ways:
>   * the NUM field is 5 bits, but we read only 4 bits
>   * we miscalculate the page_shift value, because of an
>     off-by-one error:
>      TG 0b00 is invalid
>      TG 0b01 is 4K granule size == 4096 == 2^12
>      TG 0b10 is 16K granule size == 16384 == 2^14
>      TG 0b11 is 64K granule size == 65536 == 2^16
>     so page_shift should be (TG - 1) * 2 + 12
> 
> Thanks to the bug report submitter Cha HyunSoo for identifying
> both these errors.
> 
> Fixes: 84940ed82552d3c
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/734
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not marked for-6.2 because this isn't a regression: we
> shipped the TLBI range invalidate support in 6.1.
> I have no repro case for this issue, but this doesn't break
> booting an aarch64 kernel, at least.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

