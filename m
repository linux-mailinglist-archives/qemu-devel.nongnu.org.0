Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF950BBAC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:26:50 +0200 (CEST)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvBK-0006hq-1S
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhv8q-00037T-2d
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:24:16 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:36424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhv8o-00038c-Fp
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:24:15 -0400
Received: by mail-io1-xd31.google.com with SMTP id y85so8951342iof.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WrJYfGheHWQkQvRjP30ZrWXH0n54pBSaeAKlBsdQl04=;
 b=CWre36P6s4FM4g11BIWOAMsCpt7FpN20oQFbQv8D6ti5npDhQhhOsYpC8oqTNf+bHi
 CRb6ro1GZzAKqzo8XyK3ior5Ywi1SoUvFmFngW9HUn0EoACaX66liuBBLe/YsOzFeIeq
 35YJ+w/xGRrvcx0O/Q/OVR+ydx/RdlpefzanBl2T3J/2N3y1hvSUEvkTC3ciTw1HLtd9
 DK53SnSWM69gIaU6FF8v2lsbGM55ckvOAKxeEbM7yGXTQMGTXGjCcCvqOqTWH2Nj0JjG
 FQV9HJOURIvr+Y073NOOJs33BX++CoHKFHf5tQKizp/C9b+nZ1M/mg7yMusR9FVLnK9Q
 N9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WrJYfGheHWQkQvRjP30ZrWXH0n54pBSaeAKlBsdQl04=;
 b=1cAjVM4McydtyDpCIvEMLSn/jKEqlU9Z44ck1OmYo/pKy+j8Yc9S8bRMnJQ4pEzDlo
 eNWqGXzU3PeiwFdRkC3sCDYoBWOU+4wwF4CqyBUwcqAYUvVrbpUWCfdtMwqjJy70YZYC
 59DRYSMUu1eKiKU76+Jba0SftcY7IGZfd/Cws7ryEVOeV7d2zX9G7aKT6hBtwuCAz9hw
 FACCqyHh07YTHp5eZ6mPbs223CW1afR8/kYUjDsyt98cZlSMVocG6G262n3FtOQnk4yx
 Ux23tGtMCcd5E7HNPt24H/vx0y3taKgz5r+SID7+GpHmgZzIaFa2j+RgdQ7FLynM+XSk
 iJmw==
X-Gm-Message-State: AOAM530FqHwSNAFTk3Uzg/n3h7uuVu8dT5hEyTpWy0ANXQGocSM797xr
 Z8ZPbu+YLEzCGBq0a8PVnR0Uog==
X-Google-Smtp-Source: ABdhPJxe5vxENw2HhP5++WKlEhRkg+IgeZB2chiaQAJEmvqnzth3GwwO/oM5sWj+SZ+s3xKN7P3+ig==
X-Received: by 2002:a05:6638:2405:b0:327:d930:bc9c with SMTP id
 z5-20020a056638240500b00327d930bc9cmr2335926jat.70.1650641053042; 
 Fri, 22 Apr 2022 08:24:13 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1?
 ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a92c212000000b002cc3f380cf3sm1457310ilo.39.2022.04.22.08.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:24:12 -0700 (PDT)
Message-ID: <4b4e8791-795e-0037-d9e8-b85a66ce2a42@linaro.org>
Date: Fri, 22 Apr 2022 08:24:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-9-richard.henderson@linaro.org>
 <875yn1uskp.fsf@linaro.org>
 <CAFEAcA-Evh0mTHOzsk=dv9MAKjPcKmSVTFfKzV42zzRyZ4hUfA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-Evh0mTHOzsk=dv9MAKjPcKmSVTFfKzV42zzRyZ4hUfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 07:04, Peter Maydell wrote:
> On Fri, 22 Apr 2022 at 15:01, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> Bool is a more appropriate type for this value.
>>> Move the member down in the struct to keep the
>>> bool type members together and remove a hole.
>>
>> Does gcc even attempt to pack bools? Aren't they basically int types?
> 
> It's impdef, I think, but it'll typically be a 1 byte integer
> rather than a 4 byte integer, with the usual struct packing
> rules for 1 byte type sizes.

Yep, it's 1 byte for all extant abis except macos where it's 4.


r~

