Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584414136E8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:03:36 +0200 (CEST)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSiF4-0008SP-To
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSiB1-0007Ce-JO
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:59:23 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSiB0-0005kN-15
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:59:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 h3-20020a17090a580300b0019ce70f8243so2301062pji.4
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iNBOwKrz29PzeY0aPQ6ZCUeJTzQJnB6T60Fejf33ROM=;
 b=tH6pej040ZNc3M/pn7WfYsWIk7QVP8xcXKH4AQNqFwe9GXyjxRTOUQctllEsNo+JbX
 34ppkvr+XqywISDVfwK0fd8+IO7GWDAlRGRDC7Gm/gtxTSLhoKNHwELZ0o3/TTFB1kji
 yoessugzABkVKBsTAoNpLWOc2BlmZRQinwElKW0+JpcOrTXPbqNyh8nxGLSEL2ghSVE0
 Wm3ersYEZ0B9/Zl9OENxjAJpjssJFvuV8dUopsdNB3jALDrOXFQmgjDHypPaJLOMmaLy
 DBbrq8Tict8m9gR7UQGvvoSWEHZfrjr9/DwLsjLV+HGbu++98tBRZsI53kyh2ud6jizK
 4R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iNBOwKrz29PzeY0aPQ6ZCUeJTzQJnB6T60Fejf33ROM=;
 b=S0pHDmGfSm0gldPhqtMAUzfejbejuvZSRFRWSNjck1nIGK1tFnD/SKJvYmKS6dT01t
 g99Q9I8FtR1RmFn2GB5jDy5WlhsYkZpKhxKjfnNoIVTC9XFXbppRFauzwuxEsr401IeW
 6vs7zdHN3BI8Y5fZt6z6CD5QGlREMoukqf1LHfRznpGTYJx52oyqfH40i/ieyIOCRbaC
 I5/QOGz1uT1Ej++O6IXGnLShEhqdQk5cm23B3mrop+7QvERP4jsjEJ3MceWpOMRHcSDh
 wVXm0Roc0DdKYzjFnIzhNNS7u1tjkfiZj0UFoZ2kD5FPduCvnYr3oDtdDkd/DwvcoWlY
 5w4w==
X-Gm-Message-State: AOAM530tkgKqDYPF5Vgk9ld8bVD/uA6Q0iy5c2OX8MoQI4qqP18wTXSX
 r3vvMxmnJtzriJR05uNrfijwVfZGdIHsAw==
X-Google-Smtp-Source: ABdhPJwWrcWoCQGsEdPQ+CVl9V0G1lnMeDU7IqcppZyTYo2Rlrcm5pNLKx79bkhULdoS1YXUm5RYtg==
X-Received: by 2002:a17:902:7e0f:b0:139:fdd6:77bc with SMTP id
 b15-20020a1709027e0f00b00139fdd677bcmr28031560plm.22.1632239960293; 
 Tue, 21 Sep 2021 08:59:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c199sm18111581pfb.152.2021.09.21.08.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 08:59:19 -0700 (PDT)
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
 <CAFEAcA9QPxceBR4hn8FpNbX44y3d28rRmyzrkEABU8dChdBqtw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f41c283-1c83-2093-9dbf-be422b7586fa@linaro.org>
Date: Tue, 21 Sep 2021 08:59:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9QPxceBR4hn8FpNbX44y3d28rRmyzrkEABU8dChdBqtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: WANG Xuerui <git@xen0n.name>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 7:42 AM, Peter Maydell wrote:
> On Mon, 20 Sept 2021 at 18:25, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
> 
>> Be consistent with loongarch or loongarch64 everywhere.
>>
>> If there's no loongarch32, and never will be, then there's probably no point in keeping
>> the '64' suffix.
> 
> What does Linux 'uname -m' call the architecture, and what is the
> name in the gcc triplet?

The kernel will report

arch/loongarch/Makefile:UTS_MACHINE := loongarch64

and it appears that the toolchain is using loongarch64 as well.

So, Xuerui, I think there's your answer...


r~

