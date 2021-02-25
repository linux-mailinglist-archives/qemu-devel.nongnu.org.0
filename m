Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D753247F3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 01:30:31 +0100 (CET)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF4Y1-00026E-TX
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 19:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF4Wb-0001LC-IB
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 19:29:01 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF4WZ-0000SW-LY
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 19:29:01 -0500
Received: by mail-pj1-x1032.google.com with SMTP id u12so2241583pjr.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 16:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iF1WPvGNj23F4diYJgGZcmMLOtU/fITYj7BO6CyjsQY=;
 b=G8DmEMcRuMWuZarQvPH4rEPGdvAGxHrlEMPtSARFuEQU1jap+Jy0/m/OYXjOip9ubG
 XYWGDuY0UK+tc679GoFY7t6XAa2QWSk5uYnFsE1uSuIEQWRR5sn5MQE2GuH0OW43+kf0
 r11+GBHO9mvNFaEauNvbPRfRUW8QEpvkelnmnGnH5gpYjWrEfiJKfYhHd/S7Oc8zMZOP
 vQXJv8YYTuUOlWyN6r45Nz0z1RrE4oIEDnIqy86E7zBmJSQnixC5EY4fMwH+qIWnlxHL
 N06J/O9EgZbwb0DRvM/Tebn1VLMWRtsB/LPDdZ/C4wHMRBL3IRbsl5q5nVxe4eukEvRF
 GEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iF1WPvGNj23F4diYJgGZcmMLOtU/fITYj7BO6CyjsQY=;
 b=UEutL+MdaFnQJ3lR/zZf8AkYRW3zwypyw9ZxpDPds96pTJB5JdXpLoak7v4HM1DfhE
 5kjZVEnrr5cjXVRskde/XVuubOYnaw0OpvzSf6p3ATG2tsfR5KMDg1QBG9KRcOKlKFz7
 /E/fbDLv92PXE6oSbNH8a8DXbwGSjNq4x+yJfCVRsooG1DzEMg5tb8ALjol9FrSa2Q62
 bIrcm9IVdf/3zoWTtF51ljm9IQ//MFdFk/E5ba8aqr2O0iRsVp3ec/e6hjJDjErmL2bM
 3nWydPDaKQ7GGbOe5VCIAyVeRohqJ75tH8/wgSZwkA4EOkmz7IiLuxUQDsKr7Zyi30DO
 EHhw==
X-Gm-Message-State: AOAM531FaXKmwmzUTcdiyAxSLlb1/jmLm5EJWstaZ4ZGvWdU81tImdhv
 c7RFWK7zrSuaEfovkr3Evjy4BIbpdBOnwQ==
X-Google-Smtp-Source: ABdhPJxpHsaGx2ZhtNfNMP/FoXvupho55l7uQhtcdV6hHW3IM2vvkaLtZ2i7R16wWDRiIla3g8O2mg==
X-Received: by 2002:a17:90a:9909:: with SMTP id b9mr502809pjp.46.1614212937659; 
 Wed, 24 Feb 2021 16:28:57 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id t187sm3866484pfb.91.2021.02.24.16.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 16:28:57 -0800 (PST)
Subject: Re: [RFC PATCH 0/5] Experimenting with tb-lookup tweaks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224165811.11567-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d23665f-fa20-028f-d48a-2ea79ab35b2f@linaro.org>
Date: Wed, 24 Feb 2021 16:28:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224165811.11567-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 8:58 AM, Alex Bennée wrote:
> Hi Richard,
> 
> Well I spun up some of the ideas we talked about to see if there was
> anything to be squeezed out of the function. In the end the results
> seem to be a washout with my pigz benchmark:
> 
>  qemu-system-aarch64 -cpu cortex-a57 \
>    -machine type=virt,virtualization=on,gic-version=3 \
>    -serial mon:stdio \
>    -netdev user,id=unet,hostfwd=tcp::2222-:22 \
>    -device virtio-net-pci,netdev=unet,id=virt-net,disable-legacy=on \
>    -device virtio-scsi-pci,id=virt-scsi,disable-legacy=on \
>    -blockdev driver=raw,node-name=hd,discard=unmap,file.driver=host_device,file.filename=/dev/zen-disk/debian-buster-arm64 \
>    -device scsi-hd,drive=hd,id=virt-scsi-hd \
>    -smp 4 -m 4096 \
>    -kernel ~/lsrc/linux.git/builds/arm64/arch/arm64/boot/Image \
>    -append "root=/dev/sda2 systemd.unit=benchmark-pigz.service" \
>    -display none -snapshot
> 
> | Command | Mean [s]       | Min [s] | Max [s] | Relative |
> |---------+----------------+---------+---------+----------|
> | Before  | 46.597 ± 2.482 |  45.208 |  53.618 |     1.00 |
> | After   | 46.867 ± 2.242 |  45.871 |  53.180 |     1.00 |

Well that's disappointing.

> Maybe the code cleanup itself makes it worthwhile. WDYT?

I think there's little doubt that the first 3 patches are a good code cleanup.

Patch 4 I think is still beneficial, simply so that we can add that "Above
fields" comment.

Patch 5 would only be worthwhile if we could measure any positive difference,
which it seems we cannot.

I have a follow-up patch to remove the parallel_cpus global variable which I
will post in a moment.  While it removes a handful of insns from this
fast-path, I doubt it helps.  But getting rid of a global is probably always
positive, no?

I was glancing through the lookup function for alpha, instead of aarch64 and saw:

 21e:   33 43 18                xor    0x18(%rbx),%eax
 221:   4c 31 e1                xor    %r12,%rcx
 224:   44 31 ea                xor    %r13d,%edx
 227:   09 c2                   or     %eax,%edx
 229:   48 0b 4b 08             or     0x8(%rbx),%rcx

and thought -- hang on, how come we're just ORing nor XORing here?  Of course
it's the cs_base field, which alpha has set to zero.  The compiler has
simplified bits |= 0 ^ tb->cs_base.

Which got me thinking: what if we had a per-cpu

typedef struct {
    target_ulong pc;
    ...
} TranslationBlockID;

static inline bool arch_tbid_cmp(TranslationBlockID x,
                                 TranslationBlockID y)
{
    return x.pc == y.pc && ...;
}

We could potentially reduce this to memcmp(&x, &y).

First, this would allow cs_base to be eliminated where it is not used.  Second,
this would allow cs_base to be renamed for the non-x86 targets for which it is
being abused.  Third, it would allow tb->flags to be either (a) elided or (b)
extended by the target as needed.

This final is directed at ARM, of course, where we've overflowed the uint32_t
that is tb->flags.  We could now extend that to 64-bits.

Obviously, some tweaks to tb_hash_func would be required as well, but that's
manageable.

What do you think about this last?


r~

