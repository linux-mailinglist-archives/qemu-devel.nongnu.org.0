Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A53682FC3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:52:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMr1d-0004uc-7k; Tue, 31 Jan 2023 08:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMr1V-0004te-8C
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:50:12 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMr1Q-0007ZX-P6
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675172998; bh=rIVz75CX0VeoYxfiK6R8jaNgr17ma4QC2CqUPHo9Xno=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=mvX88S4E1me9KeWj0w4PH2nUvWOVx/rN5jbF+8nyaIpLfIY4YCDDRHKu6avXZM5/f
 WXvvuR0EtirsDXP+gsHLWdAy+Vm3FRaBJ3jLJO2O3VImPgzxFahD6d1GyVxm9G0SaO
 M64blCjL5cAsapSSJyXhoJufvvLazNb5oS90xZxwBaisQFAouGE+ttyBhTwWWfU+iw
 5lotxC//2mcIwIRc+j9BE6Bh0MPlRZCwDt3wb8oCdJl8CoartuF4ggKxpnfWUwilcS
 cgjpLWCsYORBbwQaOA8ijSXI69vDnP2aqgfm+36aR3YZ7LgG1z/jIZXVw3eIuAMBb4
 RH1hWq9joI2nA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.177.115]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wPb-1pGVe61oQF-007YnR; Tue, 31
 Jan 2023 14:08:41 +0100
Message-ID: <871b2b31-a04a-254a-bced-f07fa821109a@gmx.de>
Date: Tue, 31 Jan 2023 14:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Improve strace output of pread64() and
 pwrite64()
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <Y9Q7BlDc/VX+1SBL@p100>
 <521ea804-5afc-fb19-db72-e1ed73300781@vivier.eu>
 <79a67002-0294-3a87-41ed-82bbb2689bf0@gmx.de>
 <e4f75988-4906-bce9-5617-9014d8b45b2b@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <e4f75988-4906-bce9-5617-9014d8b45b2b@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5H3RxreK5afDFQDhuuOlmXa7UwdsYzwdSJ0snHAr6V70sxUYC9Y
 Hv1R5cT6hOWlRCpm5xlgp1ZpH96xv/nEcJV3pPErofrHP4mQQ75HnXVgT9hZZMKbx4W/ueP
 b5GXmaAOPtiATGjSrkiarCFyIQeGCpPAgEWzio+GzEgBot9Spx+KNQ4+jGY/Ba8bZ1W01Pt
 hy78uymxXlI6veHtv9hqg==
UI-OutboundReport: notjunk:1;M01:P0:1TD7CsR2MZU=;y9Jbk9u98CU2IhZC+d8UWUtEHbn
 9fM5ZLc7kGeHpcl4fUbEdTyfg4QbVYiNssA9k/+KjB/02jznBxsk2IOr8swakYaQ2NBSpGcKs
 gX2MoKP3WmLiTlPHR+P8j7x82ntCOZBnMYwas/TAZLvg1Nyf+AOM5rz7r4zL+1ElN55O9o1h2
 E8ZOOL9H7+Cid9qfwe54Xl62SiTVqzn2Lb07F5OXP0Li8dsDce0eqzgvf5ZUmw0y9xTT6c+Sb
 JzRE3JLVKcMn+vzKmkPYB6/oE08y9fJc4FsaaeXqD2Bx2r+RaFNVBGraIbxW77ve461GNqiog
 +W7oNDXn14os+ZkRXU6gHw/flZwMaQuQG1B7CL6H693/EfRZFJV/h0HMuEHWIAhXlOzzLJoeD
 Q6NdFPa8Da69MS3OpaAeIL0rA6JmrrUqUXTJxWOfoH2TdGUo3xywPjdXUaCgX3XZvOQsI/Kb8
 WA3FvkkXKmstAPAR8mxwUGpdru2+lCQjDHP/il5I3onrT6OxeURv4dIviBNpYIAoup9An8KNN
 kIUtnrDV15yKhj19bCRfmMmRRbrf9s2KkseJ4SzEk2ru27wTOL+1AxYP1LZbVW+TcmFhm6+qr
 k3GqY8mZV8GgSA0PQwV5Zoh6aWU0NqOP2RSR/GCIFPzaI4Phyy/0drmVNTOgE9FesDgZWl3wE
 5MT2K7OeEJO7nC4rbe9kaLIgReUo7HfOES8x+E73ADw9EnFmi4YZ85Z61OOycv1H1reFl4ZVR
 3+AVlo9FS8eJKjofacY+jfqav97zrmsYYd4dHciODqzMyg/c46wJA9in+OOEGGmgfDO8eqdEG
 3e/Px7urE1PV3R1hzcpgXPzCB7IX2Ei2Hwe9PHf2gb51+StJRuTFomoADnr83Uj6vOmyGvFm4
 JC1ICClt8mbVIA8q6Z3pLKkVM7IhStVpzUfDhT7MAJn/0hYqwqgdbZZpfZoR0vcV4NKKaHcpU
 SlY4PQ==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/31/23 12:04, Laurent Vivier wrote:
> Le 30/01/2023 =C3=A0 23:11, Helge Deller a =C3=A9crit=C2=A0:
>> On 1/30/23 10:26, Laurent Vivier wrote:
>>> Le 27/01/2023 =C3=A0 21:58, Helge Deller a =C3=A9crit=C2=A0:
>>>> Make the strace look nicer for those two syscalls.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> ---
>>>> v2: Use regpairs_aligned() and target_offset64(), noticed by Laurent =
Vivier
>>>>
>>>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>>>> index 82dc1a1e20..379536f5c9 100644
>>>> --- a/linux-user/strace.c
>>>> +++ b/linux-user/strace.c
>>>> @@ -3824,6 +3824,25 @@ print_rlimit64(abi_ulong rlim_addr, int last)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 }
>>>>
>>>> +#if defined(TARGET_NR_pread64) || defined(TARGET_NR_pwrite64)
>>>> +static void
>>>> +print_preadwrite64(CPUArchState *cpu_env, const struct syscallname *=
name,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_lon=
g arg0, abi_long arg1, abi_long arg2,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_lon=
g arg3, abi_long arg4, abi_long arg5)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 if (regpairs_aligned(cpu_env, TARGET_NR_pread64))=
 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg3 =3D arg4;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg4 =3D arg5;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 print_syscall_prologue(name);
>>>> +=C2=A0=C2=A0=C2=A0 print_raw_param("%d", arg0, 0);
>>>> +=C2=A0=C2=A0=C2=A0 print_pointer(arg1, 0);
>>>> +=C2=A0=C2=A0=C2=A0 print_raw_param("%d", arg2, 0);
>>>> +=C2=A0=C2=A0=C2=A0 qemu_log("%lld", (long long)target_offset64(arg3,=
 arg4));
>>>
>>> better to use:
>>>
>>> print_raw_param("%" PRIu64, target_offset64(arg3, arg4), 1);
>>
>> I thought of that as well, but that won't work, as print_raw_param()
>> takes an "abi_long" value, which is just a 32-bit value on 32-bit targe=
ts.
>> See print_rlimit64(), it's used there with qemu_log() as well.
>
> Yes, you're right.
>
> But even with qemu_log() I would prefer you use "%"PRIu64 rather than %l=
ld.
> Or better define a print_raw_param64() (or similar) and update print_fal=
locate(), print_truncate64() and print_ftruncate64().

As adding such define is a unrelated change to this patch, I'd propose tha=
t I send a follow-up
patch on top of this one which adds print_raw_param64() (or similar) and r=
eplaces all
usages of qemu_log() with 64-bit values and use "%"PRIu64 then.
Ok?
If yes, should that define include the last 0/1 parameter to print the ","=
 ?
I think so, because then it's consistent with print_raw_param().

Helge

