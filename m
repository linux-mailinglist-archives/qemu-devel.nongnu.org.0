Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D72A2918E5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Oct 2020 20:40:46 +0200 (CEST)
Received: from localhost ([::1]:37708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUDbo-0003KO-OH
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 14:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUDZO-0002On-A2
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 14:38:14 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUDZM-0005RG-LP
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 14:38:13 -0400
Received: by mail-pl1-x641.google.com with SMTP id w11so3848989pll.8
 for <qemu-devel@nongnu.org>; Sun, 18 Oct 2020 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xygWhd7/t3+swPCAk8Jof9t7rlJpbSZ5/RG0684D34s=;
 b=FwS918dQvRkYVfgwvZNLFSAHcbnHXmxOzBJX56j5MHWDCEfonXASVRr5xYyYuuWRoq
 12+z3Clbc0T4sfZjTvTSpikiUqLabZd3leZaQeynigtFqNq7+97fZTm05CaOacCwCcG8
 g+EqUIBBIAOfWBhz/Z1/lWvBrDE8l+80EOR5SyS0BAHSTwBTqWgVAuf0AxdPjP+UtwhQ
 GiY2jdNIqbmvaMdCpgF14Qbsmu9sFJiDsjgfd9q3Wx8t/K85QKpzsJEVt6TmpR/hqejr
 EW8Je9MwMRt5mclDHJHPn4lfs5FZVH5hysQYDUqKclF2h89d5hmnh50/qdlQHHUJXumJ
 6JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xygWhd7/t3+swPCAk8Jof9t7rlJpbSZ5/RG0684D34s=;
 b=DUMwET2Ioo5EwwKLkveB97J7PmU+Nf9GcX46HO/ANcNh0M3LzHF8O+jyVVOsicimlO
 DIa/OBMVrgm4WZCNzb4xaTdVq2eaB+VJE7gQvxGG8RHyE4Hxj+Ljpo6c8C1Wy1BmFleO
 dDGglgFnDN68kBVcmDc9Dac0QQJcsZdX8eF7ABkymmvNHNNwtEhUX0XYLSF+Q3Or4YJq
 zc5AdDT01+8FPuJS3aZteLPHco++YqgtQ6pLKOVhgyHl/hj7BXYC8/L0J+gJbIM5dGAr
 ax0x2El2sgmusFbAA0IcVkKGFgqzLCW/JJFM+PKvArGpasTJhCSXT08qb9XD5Lcp7fUl
 ndRA==
X-Gm-Message-State: AOAM5321HM6FbEHNj0P/NIesn/s3Ie0xTHhEI7/SPZEaOx/8Ox+Pm0Wj
 BjTrSTsGZd1mpJ45fWqdw9xf7g==
X-Google-Smtp-Source: ABdhPJybBQ4HP7msdjXVUsUlAwJTZ7yozc90Xwr/jcBpL/+zRg+xS9VbuRkIN+EIxqjemW4INyLkxg==
X-Received: by 2002:a17:902:7c01:b029:d5:aad0:b7b1 with SMTP id
 x1-20020a1709027c01b02900d5aad0b7b1mr13783322pll.53.1603046290118; 
 Sun, 18 Oct 2020 11:38:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v65sm8999928pgv.21.2020.10.18.11.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2020 11:38:09 -0700 (PDT)
Subject: Re: [PATCH v3] util/oslib-win32: Use _aligned_malloc for
 qemu_try_memalign
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201018164836.1149452-1-richard.henderson@linaro.org>
 <a80c300f-1a78-e3d1-bc28-2380fd4c7c8e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d821c01-3dda-7cab-f383-8fd31ba64c92@linaro.org>
Date: Sun, 18 Oct 2020 11:38:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a80c300f-1a78-e3d1-bc28-2380fd4c7c8e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/20 11:34 AM, Philippe Mathieu-Daudé wrote:
>> +    g_assert(size != 0);
> 
> "The alignment value, which must be an integer power of 2.",
> so maybe:
> 
>        g_assert(size != 0 && is_power_of_2(alignment));

This is also true of posix_memalign.  If we are going to add this, we should
also assert in the other qemu_try_memalign.


r~

