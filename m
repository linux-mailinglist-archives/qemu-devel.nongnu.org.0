Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA7566A41E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQif-0005sf-Fw; Fri, 13 Jan 2023 15:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQic-0005sH-Hu
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:32:06 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQiZ-0004EE-J1
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:32:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso13836350wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 12:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Srpe3T5FAq6TaQfce0ZrSNLnDNGx0vvrFxE8HHamLA=;
 b=WLkMQr/YY0V6E6KDLm4vAmSj9sPNUgxjDXw+DRHwYq9l7sWekrYB5fKY5hpRLXDff2
 BKRu6z1r0QGbcgf8zgCsvj2lTYz7Y9CYUduvxbY2YJseP7fFC6sJeZLJFGi/OqzwGxC0
 zdc4aBUaihEGbubugUTPhawV0M5/bglpiW/+Umjfy24MoeZYnz72RlK9j0RN019VuYpi
 X2XOwZRZ8FfTbligOjXiomC1tG5jLfb5ZOnvpxBH/kFDYywEIApGk1XVDLz48sq8Wl78
 iOefdrvnaWVViB7ROaslQYBhTVDB3RyfOIKK9FQA3/QgR6ixkqniURd3QRTM8Te4VZtD
 0Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Srpe3T5FAq6TaQfce0ZrSNLnDNGx0vvrFxE8HHamLA=;
 b=s6cEkn3BJMYNClYV7ibPohgXOKG+2YQ/VQJ9yz8lMD8KUDQfa3lrj8Q2u6WMCr9K8K
 uOsjCeLpvReaMNiwdSlBE3Z70MG0A3J5fOayl2ztObVSvC+x5VBHi4L81bJ9AdQrPhwA
 xtGgL/EgZLCkK8iNnaX9LqlbQdrLvL12+iq7IwbPWIT6D2I31y/2vs/CGiE3K9WVpeWS
 a4XpAYT8xG2DquLNlb2Gic03iBI5zz2r6jtZ/NnMYoieSiNzFmJOsIviaf6bhOy5EhSa
 CAZ+vOVVZRc7QvpWxEcxUujZp7fy74db3nZStgevsmCnuoRB7ubax0ZV8DCwgURcKLiC
 tv9g==
X-Gm-Message-State: AFqh2kqmK43vv/Z6/7kpThPMAszEZoUXx1Hp9Tr4twXhY5tH648j2aB7
 alNZC5IGaCSEkd3g4KPRsFwkDg==
X-Google-Smtp-Source: AMrXdXtXt3+2gzL7kjKC4eP7fwvxwv5bOAkTAc7gMYbI9DPPqeiCptT4oj2LIz4enATTMLTZh6hU8g==
X-Received: by 2002:a05:600c:4d21:b0:3d2:2a72:2573 with SMTP id
 u33-20020a05600c4d2100b003d22a722573mr59702333wmp.11.1673641921777; 
 Fri, 13 Jan 2023 12:32:01 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm31905459wmc.13.2023.01.13.12.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 12:32:01 -0800 (PST)
Message-ID: <553a8707-417d-b692-1176-f2fbdd146961@linaro.org>
Date: Fri, 13 Jan 2023 21:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 00/46] MIPS patches for 2023-01-13
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230113154532.49979-1-philmd@linaro.org>
 <CAFEAcA9mKmOahpvVQUUwyxcbJE2aNeB+Y_a1brgnq1kPNtv_nQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9mKmOahpvVQUUwyxcbJE2aNeB+Y_a1brgnq1kPNtv_nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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

On 13/1/23 18:57, Peter Maydell wrote:
> On Fri, 13 Jan 2023 at 16:05, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> The following changes since commit 3db29dcac23da85486704ef9e7a8e7217f7829cd:
>>
>>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-01-12 13:51:36 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/mips-20230113
>>
>> for you to fetch changes up to 4828656f65324249273ad2f2db80844ba90eeb9b:
>>
>>    scripts/git.orderfile: Display MAINTAINERS changes first (2023-01-13 16:22:57 +0100)
>>
>> ----------------------------------------------------------------
>> MIPS patches queue
>>
>> Confronting my triskaidekaphobia, here goes
>> a bunch of cleanups from various people:
>>
>> - Improved GT64120 on big-endian hosts
>> - GT64120 north bridge and MC146818 RTC devices are now target independent
>> - Bonito64 north bridge converted to 3-phase reset API
>> - PCI refactors around PIIX devices
>> - Support for nanoMIPS in bootloader generator API
>> - New YAMON Malta Avocado test
>> - Removal of 'trap and emulate' KVM support
>> - System-specific QMP commands restricted to system emulation
> 
> Hi; gpg says your key has expired -- which keyserver can
> I get an updated version from?

"the usuals"? :)

This time I set up an alarm to upload a renewed one before the
expiration date, and submitted it to pgp.mit.edu and keys.openpgp.org.

This worked for me:

$ \
curl 'https://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE' \
| gpg --import

