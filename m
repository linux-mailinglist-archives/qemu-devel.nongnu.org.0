Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA030EC98
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 07:43:37 +0100 (CET)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7YMa-0006xv-FC
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 01:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7YKw-0006Tt-Uk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:41:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7YKs-0005uh-OU
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612420908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNBC5bl9YG7k9vYjAdBF2MTVofGYy/76gpjjwZU5TLI=;
 b=JSbWAln92zcjQL9eO2utwYqpFl8GVZlsGlOrVAlAgCBeY1IMjvg0uY1oE0LPAWt37cGrfS
 9HnGGL9IcVZuqHhQY9qsyiYMg44ItKG/qiuwg+UGybXOf3JvxLVWuVSLox3wCks0I92PvH
 Xj6/5aAWsT4sp0VhBZ2SaifInR7z+EA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515--SQ5rKujOkun5fQXKyiKRw-1; Thu, 04 Feb 2021 01:41:47 -0500
X-MC-Unique: -SQ5rKujOkun5fQXKyiKRw-1
Received: by mail-ed1-f71.google.com with SMTP id o8so1992779edh.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 22:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=TKOOefKyt/MO+MV2XhQNkg6Aep8HAZ3f0xCCr5KmOQo=;
 b=kXwwj3P1WNnIJdCOqK5qE3QQEmx08KrCxBWrUXUNdu3NJSNam1pm0vWN1zj/JryQKc
 SOKZtXBKt0uYVZn5n/lgmvkzIbdcZ0t9OLfWtrJsZrz9k+2UYhdjNluyPHdbrqwXtuZH
 3TMXTLEvwWZydtlLqk+NlO8dLdVOi7JzTXE/L+lfN3l+TdHs/SpGmk0L3m/uEj4cv7gN
 9xN7TQaHFqkVVc9Kdr1QBQ6AiZGhjD3ngG8ntAoLkhwiQ/lO6MHiVI5PmeAEGBMZP/EN
 wG8MMoAqxx/0gg4YqkJ8SeePi8y6QYtjtk2TaOoPIShQY95h82C4W3R4FjG0ZYc8WwJ2
 KYRg==
X-Gm-Message-State: AOAM532oTorPQ65p5BVdw76pI9x/DKUUIo9Sx2lep2OAJEuMhH2+LFbX
 6+hbC10quA/+NMaHq0YzPIt/jAsJ1iWuaFxrt5rA28Nm89h1RuXnRgMB15EHf+y5LNnRRQTVdur
 jG6aT5hIAlYbiGdyXNW3Xze80yAQHj05LAag7GKceLQymzMxpzVvbFLRTEE3g8u8=
X-Received: by 2002:a17:907:28c9:: with SMTP id
 en9mr360050ejc.314.1612420906026; 
 Wed, 03 Feb 2021 22:41:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWj7gO37QOa2juBe6LYYg16XyP44N67vdzvDBekAqj5yQnng4nN8sNuStF63d+nr6OnLmJwA==
X-Received: by 2002:a17:907:28c9:: with SMTP id
 en9mr360031ejc.314.1612420905751; 
 Wed, 03 Feb 2021 22:41:45 -0800 (PST)
Received: from [192.168.3.108] (p5b0c63e8.dip0.t-ipconnect.de. [91.12.99.232])
 by smtp.gmail.com with ESMTPSA id
 g22sm1975002ejw.31.2021.02.03.22.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 22:41:45 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
Date: Thu, 4 Feb 2021 07:41:43 +0100
Message-Id: <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
In-Reply-To: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: iPhone Mail (18C66)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 04.02.2021 um 03:22 schrieb Richard Henderson <richard.henderson@linar=
o.org>:
>=20
> =EF=BB=BFOn 2/1/21 10:45 AM, Richard W.M. Jones wrote:
>> This commit breaks running certain s390x binaries, at least
>> the "mount" command (or a library it uses) breaks.
>>=20
>> More details in this BZ:
>>=20
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1922248
>>=20
>> Could we revert this change since it seems to have caused other
>> problems as well?
>=20
> Well, the other problems have been fixed (which were in fact latent, and =
could
> have been produced by other means).  I would not like to sideline this pa=
tch
> set indefinitely.
>=20
> Could you give me some help extracting the relevant binaries?  "Begin wit=
h an
> s390x host" is a non-starter.
>=20

Hi,

I=E2=80=98m planning on reproducing it today or tomorrow. Especially, findi=
ng a reproducer and trying reproducing on x86-64 host.

> FWIW, with qemu-system-s390x, booting debian, building qemu-s390x, and ru=
nning
> "/bin/mount -t proc proc /mnt" under double-emulation does not show the b=
ug.
>=20
> I suspect that's because debian targets a relatively old s390x cpu, and t=
hat
> yours is using the relatively new vector instructions.  But I don't know.
>=20
> What I do know is that current qemu doesn't seem to boot current fedora:
>=20
> $ ../bld/qemu-system-s390x -nographic -m 4G -cpu max -drive
> file=3DFedora-Server-netinst-s390x-33-1.2.iso,format=3Draw,if=3Dvirtio
> qemu-system-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
> qemu-system-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
> LOADPARM=3D[        ]
> Using virtio-blk.
> ISO boot image size verified
>=20
> KASLR disabled: CPU has no PRNG
> Linux version 5.8.15-301.fc33.s390x
> (mockbuild@buildvm-s390x-07.s390.fedoraproject.org) 1 SMP Thu Oct 15 15:5=
5:57
> UTC 2020Kernel fault: interruption code 0005 ilc:2
> PSW : 0000200180000000 00000000000124c4
>       R:0 T:0 IO:0 EX:0 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 RI:0 EA:3
> GPRS: 0000000000000000 0000000b806a2da6 7aa19c5cbb980703 95f62d65812b83ab
>       d5e42882af203615 0000000b806a2da0 0000000000000000 0000000000000000
>       00000000000230e8 0000000001438500 0000000001720320 0000000000000000
>       0000000001442718 0000000000010070 0000000000012482 000000000000bf20
>=20
> Which makes me thing that fedora 33 is now targeting a cpu that is too ne=
w and
> not actually supported by tcg.
>=20

Try rawhide instead, that worked when testing the clang build fixes. Altern=
atively, boot F33 via kernel and initrd.

The Fedora 33 iso is broken and cannot boot under KVM as well (the combined=
 kernel+initrd file is messed up).

Cheers!

>=20
> r~
>=20


