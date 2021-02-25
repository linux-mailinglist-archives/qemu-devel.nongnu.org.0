Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746A324DCD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:20:40 +0100 (CET)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDl9-0000cy-8W
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFDjd-0008BL-SS
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:19:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFDjb-0002qX-MJ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:19:05 -0500
Received: by mail-wm1-x335.google.com with SMTP id i7so4671978wmb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lS2cyUb0+WMGUVekZr0v25w3b1nLBIUqaYiUShVoqsg=;
 b=M9Dl5w3oElt+gL8Wghm3vVAusfC9lS2sKRHJc4Wdd3pcOdcxCeJlSKtIqYaLF1ILGd
 h9WlNksG4vlnvCjE2PvDPQnEra18MTqQ4lPe8CRbKA14mgXNQg+hvjZUfiJ6i2WmWWFi
 oFSLBRq6v/Fk2T4Dut5QDs3K8NmkNEJW+29BbwACJsIz+J7r+j9Fh3A3ldUMzqi1PDXa
 cSZ52S4dlRE9DuWyFRnyaCkOsuoCVg8JmQmgrj7TY8afUaTVaB3dNDxVLdx2e9D0TInX
 djW3Xa4ZT+BArcEjxgpuBX3VAefvP5U/Rvoe1Us52nDhNK4lAhkBfdB5Y/Yhoxrw+Nr4
 qmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lS2cyUb0+WMGUVekZr0v25w3b1nLBIUqaYiUShVoqsg=;
 b=cniE5JZ1oMqCiI4/ed6W8XOwU5sLgcj+3c28e65IKfWhbhbUDARSa9Vt5O8NZR8j9Q
 xdbK72Q18CqdqFata2MAWtktxIDngwqx/NAVTGgU+gXuwgONYQqIUx3NE4Vf20szuFY2
 xx5i1TyJ3jfyo3uqWMfatRm6/r1gi7wByd86LIHAg/YPvAVoIFQNyHOH3pxZJzXan48V
 MjnHz0wLV+itRbr5R+nUp4HvCibE6S+scfPpfOzPHLMK9AXEVCDKiUM8+35UbaIzRcTs
 /+qbdYZpnrjGjfEnlyHp7Fojh2lAdwj2gwElIGd/BQx1AyALZO/igBFJGJfB3dn4t20D
 rkeQ==
X-Gm-Message-State: AOAM530wxz9rlndG8EO1IZuEIYeAi8K+LeH8ZGImakwrmS6e/ZAAd8lv
 0O4ENbPT/pt1mD7I3lWJPsEQcQ==
X-Google-Smtp-Source: ABdhPJyGztuNcrdTEXYnoJSjhafs5BpnV+aLXbbUaBEsb3I/69ej/yBnHlwwlWrXx8Lf2T+QFaADYA==
X-Received: by 2002:a1c:9d0e:: with SMTP id g14mr2506353wme.165.1614248342097; 
 Thu, 25 Feb 2021 02:19:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a21sm7659257wmb.5.2021.02.25.02.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:19:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67C1F1FF7E;
 Thu, 25 Feb 2021 10:19:00 +0000 (GMT)
References: <20210224165811.11567-1-alex.bennee@linaro.org>
 <7d23665f-fa20-028f-d48a-2ea79ab35b2f@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH 0/5] Experimenting with tb-lookup tweaks
Date: Thu, 25 Feb 2021 10:15:42 +0000
In-reply-to: <7d23665f-fa20-028f-d48a-2ea79ab35b2f@linaro.org>
Message-ID: <871rd4bgbv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/24/21 8:58 AM, Alex Benn=C3=A9e wrote:
>> Hi Richard,
>>=20
>> Well I spun up some of the ideas we talked about to see if there was
>> anything to be squeezed out of the function. In the end the results
>> seem to be a washout with my pigz benchmark:
>>=20
>>  qemu-system-aarch64 -cpu cortex-a57 \
>>    -machine type=3Dvirt,virtualization=3Don,gic-version=3D3 \
>>    -serial mon:stdio \
>>    -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22 \
>>    -device virtio-net-pci,netdev=3Dunet,id=3Dvirt-net,disable-legacy=3Do=
n \
>>    -device virtio-scsi-pci,id=3Dvirt-scsi,disable-legacy=3Don \
>>    -blockdev driver=3Draw,node-name=3Dhd,discard=3Dunmap,file.driver=3Dh=
ost_device,file.filename=3D/dev/zen-disk/debian-buster-arm64 \
>>    -device scsi-hd,drive=3Dhd,id=3Dvirt-scsi-hd \
>>    -smp 4 -m 4096 \
>>    -kernel ~/lsrc/linux.git/builds/arm64/arch/arm64/boot/Image \
>>    -append "root=3D/dev/sda2 systemd.unit=3Dbenchmark-pigz.service" \
>>    -display none -snapshot
>>=20
>> | Command | Mean [s]       | Min [s] | Max [s] | Relative |
>> |---------+----------------+---------+---------+----------|
>> | Before  | 46.597 =C2=B1 2.482 |  45.208 |  53.618 |     1.00 |
>> | After   | 46.867 =C2=B1 2.242 |  45.871 |  53.180 |     1.00 |
>
> Well that's disappointing.
>
>> Maybe the code cleanup itself makes it worthwhile. WDYT?
>
> I think there's little doubt that the first 3 patches are a good code cle=
anup.
>
> Patch 4 I think is still beneficial, simply so that we can add that "Above
> fields" comment.
>
> Patch 5 would only be worthwhile if we could measure any positive differe=
nce,
> which it seems we cannot.
>
> I have a follow-up patch to remove the parallel_cpus global variable whic=
h I
> will post in a moment.  While it removes a handful of insns from this
> fast-path, I doubt it helps.  But getting rid of a global is probably alw=
ays
> positive, no?
>
> I was glancing through the lookup function for alpha, instead of aarch64 =
and saw:
>
>  21e:   33 43 18                xor    0x18(%rbx),%eax
>  221:   4c 31 e1                xor    %r12,%rcx
>  224:   44 31 ea                xor    %r13d,%edx
>  227:   09 c2                   or     %eax,%edx
>  229:   48 0b 4b 08             or     0x8(%rbx),%rcx
>
> and thought -- hang on, how come we're just ORing nor XORing here?  Of co=
urse
> it's the cs_base field, which alpha has set to zero.  The compiler has
> simplified bits |=3D 0 ^ tb->cs_base.
>
> Which got me thinking: what if we had a per-cpu
>
> typedef struct {
>     target_ulong pc;
>     ...
> } TranslationBlockID;
>
> static inline bool arch_tbid_cmp(TranslationBlockID x,
>                                  TranslationBlockID y)
> {
>     return x.pc =3D=3D y.pc && ...;
> }
>
> We could potentially reduce this to memcmp(&x, &y).
>
> First, this would allow cs_base to be eliminated where it is not used.  S=
econd,
> this would allow cs_base to be renamed for the non-x86 targets for which =
it is
> being abused.  Third, it would allow tb->flags to be either (a) elided or=
 (b)
> extended by the target as needed.
>
> This final is directed at ARM, of course, where we've overflowed the uint=
32_t
> that is tb->flags.  We could now extend that to 64-bits.
>
> Obviously, some tweaks to tb_hash_func would be required as well, but tha=
t's
> manageable.
>
> What do you think about this last?

Sounds like a good idea for clean-up, especially to get rid of
cs_base/extend tbflags when needed. One concern would be where do we go
when we get to heterogeneous emulation? Will they share the same
translation area like the current cpu->cluster_index stuff or will that
only be for similar but not quite the same architectures? Maybe I'm
thinking too far ahead...=20

>
>
> r~


--=20
Alex Benn=C3=A9e

