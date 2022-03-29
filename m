Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0FC4EAB7C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:39:54 +0200 (CEST)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9GT-0005vR-Go
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:39:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ97z-0005bh-Ls
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:31:12 -0400
Received: from [2a00:1450:4864:20::335] (port=36772
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ97u-0000QF-E8
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:31:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 i131-20020a1c3b89000000b0038ce25c870dso995808wma.1
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lr6zO3Hrh3D4QbYOkj/mNv8mKgQzKR+jRzFM972uVy0=;
 b=Z+mGbuJmmHBASiqx8qesfR8cK0tkLf6l3VHhJDMW/DiFqJWq4iT/UTisKO8/E4rgyu
 S/DVEo+b5EMQVFL1EQqoN4N/SRCPxEO4cx3dI/NZ3G3ltydG5PhMWYZaCtQWymHREDEM
 otp8VqpOefHO1ZL0rb+zNB7lY48j0+IEA58buPcs0h4xbwWDprON6nWgkOBh7owsiPiT
 H8XHthKrTmZ0WLdcMcjdg2hiWaMEElg9A8gxCEKA01uSj/M3/EvbiI9EzEpIqYHPtwFK
 R+WIgnABrw61W+qlKeQIpfIB51ZTaRtzYfsZKvSy6jtDU86kURB/cez3mpB0GeEQzw00
 Fc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lr6zO3Hrh3D4QbYOkj/mNv8mKgQzKR+jRzFM972uVy0=;
 b=vv5takR+/CwpQC4UFA1JVLot3tHK+jXTRQSz2jP/LsW3f9lk8La6l0yqH1BE/inPSf
 UUsXyY7kDX/3RK6sRKUp5+yT0VBWcM1G6DRayixw2iLE5JG3/j8KD+CRtfPjMnUpu/3m
 iQYrBYNcPWTD1fqk0YbPcIYc/odBMJsf313HOMxfM53/CicIZp4wJpGqWL6p81v5JlSp
 gOQ/3JdedjrvjrNDbjv8WOfdlW7nNLxJMPm7HNwilfW50G2W7B+uBrIWgeyXDCEQyceX
 /MN8yfr3cwm+AgWc0/FUs+OgFnZ4UmyX5oEC9uykCYFZ6gCwnP6YX1Ein2zitfVqnd+y
 uUpw==
X-Gm-Message-State: AOAM531BDUSs6fMq9H17xNxG5l6xmPL9e12TUWtweJOU1jmd9UsnCgmS
 Fa2tO+whwBaSl7Rm4ipTgaI=
X-Google-Smtp-Source: ABdhPJxbKTKhVbPYV7Q6z0gIJcQ10OlDM8E4Q2M7M0qgRTPKLSto2T//Uml6G61QHe+Qe5KEpGzaMg==
X-Received: by 2002:a7b:c74c:0:b0:38c:7645:9896 with SMTP id
 w12-20020a7bc74c000000b0038c76459896mr6007836wmk.83.1648549860851; 
 Tue, 29 Mar 2022 03:31:00 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3?
 ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b00203ff46f802sm20757164wrn.36.2022.03.29.03.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:31:00 -0700 (PDT)
Message-ID: <5f341ca9-071d-c221-302e-a088505eb854@gmail.com>
Date: Tue, 29 Mar 2022 12:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0 v5] qemu-binfmt-conf.sh: mips: allow nonzero
 EI_ABIVERSION, distinguish o32 and n32
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?=
 <dilfridge@gentoo.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20220328204900.3914990-1-dilfridge@gentoo.org>
 <e3a30b1a-69ab-9e69-4722-c8aa056a8c97@gmail.com>
 <2c72dbc6-9875-9b9e-44a3-02a1a459a7e7@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <2c72dbc6-9875-9b9e-44a3-02a1a459a7e7@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alex Bennee <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/3/22 04:05, WANG Xuerui wrote:
> On 3/29/22 07:39, Philippe Mathieu-Daudé wrote:
>> On 28/3/22 22:49, Andreas K. Hüttel wrote:
>>> With the command line flag -mplt and a recent toolchain, ELF binaries
>>> generated by gcc can obtain EI_ABIVERSION=1, which makes, e.g., gcc
>>> three-stage bootstrap in a mips-unknown-linux-gnu qemu-user chroot
>>> fail since the binfmt-misc magic does not match anymore. Also other
>>> values are technically possible. qemu executes these binaries just
>>> fine, so relax the mask for the EI_ABIVERSION byte at offset 0x08.
>>>
>>> In addition, extend magic string to distinguish mips o32 and n32 ABI.
>>> This information is given by the EF_MIPS_ABI2 (0x20) bit in the
>>> e_flags field of the ELF header (a 4-byte value at offset 0x24 for
>>> the here applicable ELFCLASS32).
>>>
>>> See-also: ace3d65459
>>> Signed-off-by: Andreas K. Hüttel <dilfridge@gentoo.org>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Reviewed-by: WANG Xuerui <xen0n@gentoo.org>
>>
>> v5 changes are too different from v4 to keep these R-b tags IMO.
>>
>> LGTM but I'd like Xuerui to double-check the R-b stands,
>> and an Acked-by from Laurent would make me feel safer ;)
> 
> This is just a squash of v4 patches, but I manually double-checked the 
> definitions against elf.h for that extra confidence, and they looked 
> good. The R-b tags still stand :)

Thanks for double-checking your R-b!

Patch (already) queued to mips-fixes.

Regards,

Phil.

