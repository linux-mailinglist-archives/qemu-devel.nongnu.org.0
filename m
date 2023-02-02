Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658E268874A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 20:03:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNer3-0007Fn-GC; Thu, 02 Feb 2023 14:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pNer1-0007Fe-JT
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:02:39 -0500
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pNeqy-0004C1-Tv
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:02:39 -0500
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 312J2Uv02096822
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 2 Feb 2023 11:02:31 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 312J2Uv02096822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2023010601; t=1675364551;
 bh=doXZ3orLBvUZdkC2mrIQ4cMwe1b5DKKpciUdKr0NWes=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=OsVBecGDi4R5VD5ZYSyy/WcpQhDlU6cyiZdbkotA7dCk1Sv4+Q11vGO9gkPSK31CF
 F04CuHEHELfUa/tKMYGi4k9o9j4jQFeGRdd8ZZzN2ae7QQCbyVmelzDtPk+cQl3Jl4
 RvBqe9MgM05xrLXbsscHnMDI2KwAzCnsNio7ZJobKDgInQVMKQMWNU1X/pufZj//wo
 Dy1SNkHEc7fjoK7tVxfI8uHcrcfZ0btnf40sHKcawC1tYBfsgBlqtPdG9Ro+tbL7NF
 3KUIjzHyIf7ALTfyrw9wwJqL28DAFPoL0ArO3ROTbw26musovX94VM4/BAcWSnKst9
 7VIgnTX6DpA/A==
Date: Thu, 02 Feb 2023 11:02:30 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: jejb@linux.ibm.com, James Bottomley <jejb@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 DOV MURIK <Dov.Murik1@il.ibm.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86=3A_fix_q35_kernel_mea?=
 =?US-ASCII?Q?surements_broken_due_to_rng_seeding?=
User-Agent: K-9 Mail for Android
In-Reply-To: <352eb28a1d913db62421064fe50ec9c8f8afd050.camel@linux.ibm.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
 <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
 <a2d5634ab624497d7d98569041e76661062f7eaf.camel@linux.ibm.com>
 <CAHmME9qy3_TPXoZ4j10JUvGGAbNikb5MdgQRw5DgTmj7nqLujA@mail.gmail.com>
 <d2e01e48fa215684447d17d21d48fa681ab7f7d3.camel@linux.ibm.com>
 <4396778A-6520-4FB5-9227-1E8850753036@zytor.com>
 <352eb28a1d913db62421064fe50ec9c8f8afd050.camel@linux.ibm.com>
Message-ID: <EC1D7FE6-E150-4E3D-B678-2F8352B9EEF8@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:3::138
 (failed)
Received-SPF: pass client-ip=2607:7c80:54:3::138; envelope-from=hpa@zytor.com;
 helo=mail.zytor.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On February 2, 2023 7:17:01 AM PST, James Bottomley <jejb@linux=2Eibm=2Ecom=
> wrote:
>On Thu, 2023-02-02 at 07:03 -0800, H=2E Peter Anvin wrote:
>[=2E=2E=2E]
>> NAK=2E We need to fix the actual problem of the kernel stomping on
>> memory it shouldn't, not paper around it=2E
>
>This is a first boot situation, not kexec (I just updated kexec because
>it should use any new mechanism we propose)=2E  Unlike kexec, for first
>boot we're very constrained by the amount of extra space QEMU has to do
>this=2E  The boot_params are the first page of the kernel load, but the
>kernel proper begins directly after it, so we can't expand it=2E  The two
>schemes tried: loading after the kernel and loading after the command
>line both tamper with integrity protected files, so we shouldn't use
>this mechanism=2E  This is the essence of the problem: If we add this
>area at boot, it has to go in an existing memory location; we can't
>steal random guest areas=2E  All current config parameters are passed
>through as fw_config files, so we can only use that mechanism *if* we
>know where the area ends up in the loaded kernel *and* the file isn't
>integrity protected (this latter is expanding over time)=2E
>
>If we could wind back time, I'd have added the 32 byte random seed to
>boot_params properly not coded it as a setup_data addition, but now
>we're stuck with coping with existing behaviour, which is why I thought
>the retro fit to boot_params would be the better path forward, but if
>you have any alternatives, I'm sure we could look at them=2E
>
>James
>

Somewhat aside=2E=2E=2E

There are other issues with passing the entropy seed in memory, of course;=
 in order to avoid accidental or malicious reuse it would be far better if =
the entropy was actively pulled at use time via virtual I/O, a hypercall, o=
r RDRAND/RDSEED emulation, but I do realize that that is not always an opti=
on=2E



