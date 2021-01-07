Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16702ED756
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:17:09 +0100 (CET)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxamS-00062V-QJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxajQ-0005D3-KM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:14:00 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxajO-0004vf-L7
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:14:00 -0500
Received: by mail-pf1-x431.google.com with SMTP id q20so1169913pfu.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NqHPJRonh2KweBPwVeTY9SnVPR9oPTzv3U0fhsNcdHs=;
 b=DCyyLhON/MisIOh44fNdv8bbwYCtt4zQoN/L+HH70UPRjRK0FmJdMATrI36KE0FwGS
 uauP8JF9kKovBv1Hg50plNghMl7v/+k4Zt9MLK3zzUqDrECAB/KCl8ULqiIFoG6uKnSM
 uqpHzM7gbPB4oVZJV1T1GxGZjYdNBY4WqNyVDcdJPjHeQ0SbtRm9eRj5kzd02NeFiWdM
 Toqm+cqSLuvEgss8sqAGD/sNkxSw2iqi6NONC5sDVN3sAN4RauqKbEgFsZ/oI/PHYvG9
 gfryEPkhwDHnvSf/vbOUWoI1MNfmHYJLTzzi2tOdDlP1tPNleUx+JDP1TlJB7CHqfOAn
 Xc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NqHPJRonh2KweBPwVeTY9SnVPR9oPTzv3U0fhsNcdHs=;
 b=sr1x4Iptf1rhQRBSgatguK3yC3ZPpQEqf7vH5a8mNUHjBjZVvEW5UWJv3A7gppgUn8
 79538mjS0vmjHCL6fv3VydCRdczcBbzJ7RvGzlGBE+Pxh8NEFWjSK5PoKh29Ee99AU2r
 qrUHZP8h9NIJP2qV3kKhzuZA1+O8FwY8ZUSrPxqKAIu6k3HQMqMI+zOgrBAUwbAlIUZd
 VEMymW1Z9wuKm+XUDhuR8qXeAPEnFMbmHzXW8iLYVCBGjnU2VLX1ZuyR87CzyPou22Y7
 i3mI6JOaPMf1AiNPBOz/OiwHWzX77c2MH71bE5q+/mQCqZhIAr2sQmrM9+FL2whKu35/
 ZXJA==
X-Gm-Message-State: AOAM533wnNFXKB/3GU7HRE9Jd1TdJ8z6Ck5pfGD8h62DNkofbQTWiiVc
 YVKLTU82c8l/G8jz7f0n3FOWEQ==
X-Google-Smtp-Source: ABdhPJxF9uzm3HW4QMFY69jmicwCDK9VWTZyPv6LXUrahmvrFerCvGtVaUpPvhwQYa1Z1zz/Mx/jjQ==
X-Received: by 2002:aa7:9685:0:b029:1a9:3a46:81eb with SMTP id
 f5-20020aa796850000b02901a93a4681ebmr79427pfk.20.1610046837026; 
 Thu, 07 Jan 2021 11:13:57 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id y5sm7051097pgs.90.2021.01.07.11.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 11:13:56 -0800 (PST)
Subject: Re: [PATCH] target/arm: Fix sve pred_desc decoding
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201230172522.33629-1-richard.henderson@linaro.org>
 <CAFEAcA_0J5UDcPf29y+9SEzfZdo8mG1toHAfHOMvqM6Kx=uChA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97afe9a0-c5b1-8dfe-62a2-f3d0a1b55540@linaro.org>
Date: Thu, 7 Jan 2021 09:13:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0J5UDcPf29y+9SEzfZdo8mG1toHAfHOMvqM6Kx=uChA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 8:02 AM, Peter Maydell wrote:
>>  void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
>>  {
>> -    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
>> +    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
> 
> Why do we not get oprsz by extracting SIMD_OPRSZ_BITS starting at
> SIMD_OPRSZ_SHIFT ? (or even by calling simd_oprsz(), which
> certainly looks like it ought to be a helper function for
> extracting the oprsz...)

The predicate operations are small -- minimum 2 bytes -- and cannot encode with
the real simd_oprsz (minumum 8, then multiples of 16).

This is shear abuse of the SIMD_* defines.  You're right that I shouldn't have
done this in the first place, and should probably rename everything having to
do with predicates.


r~

