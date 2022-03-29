Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEDB4EAB40
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:32:25 +0200 (CEST)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ99E-0005Oy-Lb
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:32:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ94g-0001ZJ-WE
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:27:43 -0400
Received: from [2a00:1450:4864:20::42d] (port=39581
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ94e-0008LH-VF
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:27:42 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j18so24078199wrd.6
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QyEev70DpKagn+0Uyo7WMwD0y2ASO3YdZKeo+pXNMpM=;
 b=Ub2ipYuG18Ps4MtlLKtmHMvqiSxletl2kqMnRG3qkptL735H2D2JklVUYfpbZZVf7D
 Qugc+XhDInGD33KmOJRGl+9Wbk8jWnFvpEY+DOUeD3nyTQU02mqsue6Z4IKnjzLVoY90
 n6qrJ86HRHjNPwO9GsZnJuxDTgMCTWCSoTsM0h96K7L2acnFOIqDUgrJZ1nEmxTnwwMl
 vGH05mYi4jdQNB95XXzuAxUjUyJFUKiwyAmhqPv6qfbhMG23NWal1SIZCMUieVDAX8dt
 d2LYyNLwwvpyYuk9338OV66iJ8vpab2y/6kWpw6xLkrliJ6Q9tfa9pl86PuAkqtE9cA1
 TBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QyEev70DpKagn+0Uyo7WMwD0y2ASO3YdZKeo+pXNMpM=;
 b=XLJf4VxcCobJshw2gkpZJglBl/wk7yIVO+4Ha/bGdbIeRGwHDX3h/8uVsOMA+fEku6
 2jUjjaZPCmfM1k/JeP2y0UPH06qoOlEMS1PUIyzqMhZl/A0k0Uom9WEzn/H+ZGxwVJBO
 D824zmGZRr8Pi89RA1ksVIcHclTkelCiB/RjIm7V1Lz9xyNhTRrJrQ8FT0lI8lLUZDN1
 TE+LBMyadNwFn0LPx5ApCg2Vz+/B2LcdlnmBKj8ZVkai0hn+r+P6ba4n8w/WAqYHBkaQ
 90/iYqnuC7cA7c/SsWk42e1wtTVPwwQgoBNIZNe3X+Bp2QIxhpYrdHwcFcwe3MP2YH/v
 uzDw==
X-Gm-Message-State: AOAM532IZSLxLmdLRAWPtIbb+I+h95+COV1Um5HSu1Xfrh5OhzEtbACk
 /2jcu8Jz3Zl1ObbI3Cfr1cM4OSy0hjvjjg==
X-Google-Smtp-Source: ABdhPJxHFDGvGfmWcC1VpjTf+AVOIq1wyAobUbV3TBQmXE4hWQGOg5s9uJNoVAt+tgF612v6TTfrLw==
X-Received: by 2002:a5d:54ce:0:b0:205:133d:c152 with SMTP id
 x14-20020a5d54ce000000b00205133dc152mr30369244wrv.334.1648549653700; 
 Tue, 29 Mar 2022 03:27:33 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3?
 ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm2055083wmq.9.2022.03.29.03.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:27:33 -0700 (PDT)
Message-ID: <db936fb1-268e-9486-b954-fc6cb7ef3c32@gmail.com>
Date: Tue, 29 Mar 2022 12:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL 0/4] Darwin patches for 2022-03-29
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 29/3/22 00:40, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The following changes since commit 27fc9f365d6f60ff86c2e2be57289bb47a2be882:
> 
>    Merge tag 'pull-ppc-20220326' of https://github.com/legoater/qemu into staging (2022-03-28 10:16:33 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/darwin-20220329
> 
> for you to fetch changes up to a4fd374364d4e23e0861273aaf7ff2ebddd57a17:
> 
>    ui/console: Check console before emitting GL event (2022-03-29 00:19:37 +0200)
> 
> ----------------------------------------------------------------
> Darwin patches
> 
> - UI fixes
> 
> ----------------------------------------------------------------
> 
> Akihiko Odaki (2):
>    ui/cocoa: Respect left-command-key option
>    ui/console: Check console before emitting GL event
> 
> Philippe Mathieu-Daudé (2):
>    gitattributes: Cover Objective-C source files
>    qemu/main-loop: Disable block backend global state assertion on Cocoa

Do you mind putting this PR on hold to see Hanna's answer whether we
take her patch instead:
https://lore.kernel.org/qemu-devel/dab63073-d532-2795-fce4-77bd0839f578@gmail.com/

Thanks,

Phil.

