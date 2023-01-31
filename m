Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA55682FE5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:57:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqmG-0002TW-TF; Tue, 31 Jan 2023 08:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMqmA-0002SN-RK
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:34:19 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMqm4-0003kF-Pl
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675172049; bh=R0PXh9mmQxIkCzKPrYynaqtvYPVeI0EBA19psUnzAHI=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=hJP5z3e3SswfgTPonJOWWEq3sSW2lut5smj0w56pn/vkUb6qmpEo9THr8zPmTMMxS
 Ct3cONPbs1pfleHCeIyeGWBe6Z/+en13LBU1xN7dvMiAZ4wtKpVEhoQZAxcFS3G9jw
 pik1xl7mC2uzooL82n71zTXhnwJ0IfkwwOUjlHKEytPOLByTjnDJgld8248PFPZL0e
 H9cYE8zeBUQD/tOhIBAG1Mpwa0mNgpXlUkIra+JHTPPmFJtwDMGgpbzSs2+Upvlw/h
 uBDuDUOu8cgjWvgrQV1I537ncZfBUlfutE2SmuGg+2AcAv0flwPUYrKxQTNFZGVNhK
 tJKJjvCSwJVEg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.177.115]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkHQX-1ou8nw0dfV-00kg3n; Tue, 31
 Jan 2023 14:34:09 +0100
Message-ID: <9bd130a2-f1bc-6bf9-a409-f923cf98e2f3@gmx.de>
Date: Tue, 31 Jan 2023 14:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] linux-user: Allow sendmsg() without IOV
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20221212173416.90590-1-deller@gmx.de>
 <20221212173416.90590-2-deller@gmx.de>
 <3517fbb1-e6eb-3495-d524-4a37ef46bd4e@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <3517fbb1-e6eb-3495-d524-4a37ef46bd4e@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KVo4Indds5z5fy+MyOrIe0+uxue1n8BHSB7zSx8N4j2cYQYX/v5
 UZnwOrS7aq67XrUEg1wcTlKp4ePwb7fIXQhdk81YIgPRgdRSSvwhrWbwk13iJvti0AiQDh9
 +ELf9g37BRv1JSqao0sg/0/tiJb157kfsJSp1NdSBtnHB6CKCzCz5W3CXK15DcSOceQQWPp
 gF8AH1rg/6jt331AGd46Q==
UI-OutboundReport: notjunk:1;M01:P0:j7j8X9jcuuE=;/X5eCQyF9Sn3kDe5VZxP9uDr4n0
 EG8yAPVqh9WApvI6PWB6wXx88fTRr2Mlm8RFV9bAAlzEmtRgRL4coA1zfnddp+Yojk0+xZq/3
 okLd6O9TeJz9OzpXDtOd7BZ8V2FSzpJTxP/x3GULXbdH7uQ6VVdVs4VA/TikR5hUMTH/2B78L
 i4ef25Hcpm7inQQK/Xe2fgAHcGIKa3ccGj+TC/4AECPXzYXjD8b/Q9Uu901MemDAJElDUkVPe
 lVZ+poEyJPqHnldg2b8ZBXGUD6cQ0j02ExwNSjVeQKWsVNAwtwt1tKTOl4+/vMQhx/R1xxfbN
 iDPSjaDn+XZdkG5bEbMWJ1m1gQow++zbCtQ4s8KFrZu+ZrtboD7Dmm8glyms/LWnI3YCDY7W9
 hVpZtMfawbOikfu8hnAr8PrHydK+ZSAbLxxQCYzE5FvQAmyGuEsYOID8nvd2ZqmYuUuyXgJH7
 TsDk7A1fxRkYlreXkKfcGRgBC+LC6Td/tbzSyTTF7/3dCsXW+TV1ilWQuUg3nv39A93X6dVs8
 zi0FMFOOUjBnsgvf7Aq/AJk2yMa7fKN6+FD+8QqJESTv1EsaTTZKQLvxLPoeXckuseojuxpK6
 1K13qKUMvVAN8g7vle4Rof6Fwg6pbY7M2X60Ed3Oyou0SBmXMdXIjSb6VS1lP5SE3bLS15cv7
 KkJ0QK3mAQv65p0FDFfzQtqhItLwyfYkWRPFgBHkk8jLV7wf/9a78fmbTcEVCpyL71MW2ZQyP
 ZRsQTyBirYUn7phNKXEd1VqNmNM3yDFlnvw1T/+ROHthaObMUe33nMdHicUeZsibyHnZiSfCF
 F78LaRd/8gIefZTml6aD0n+HwBN4jhxe8QC0AKzzdFKzpijMM+9L5ebIuxKW2RjQ8wDImyP+9
 6I8ZVD+e0fkvxRilHl6WL5qmnFx7ncOzpf7XR+0hai4PcD+Csd7OxCKrCo1+SBmHcXATb0PHE
 1UJxWg==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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

On 1/31/23 13:28, Laurent Vivier wrote:
> Le 12/12/2022 =C3=A0 18:34, Helge Deller a =C3=A9crit=C2=A0:
>> Applications do call sendmsg() without any IOV, e.g.:
>> =C2=A0 sendmsg(4, {msg_name=3DNULL, msg_namelen=3D0, msg_iov=3DNULL, ms=
g_iovlen=3D0,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msg_control=3D[{cmsg_len=3D36, cmsg_level=3DSOL_ALG, cmsg_type=3D0x2}]=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msg_controllen=3D40, msg_flags=3D0}, MSG_MORE) =3D 0
>> =C2=A0 sendmsg(4, {msg_name=3DNULL, msg_namelen=3D0, msg_iov=3D[{iov_ba=
se=3D"The quick brown fox jumps over t"..., iov_len=3D183}],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msg_iovlen=3D1, msg_control=3D[{cmsg_len=3D20, cmsg_level=3DSOL_ALG, c=
msg_type=3D0x3}],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msg_controllen=3D24, msg_flags=3D0}, 0) =3D 183
>>
>> The function do_sendrecvmsg_locked() is used for sndmsg() and recvmsg()
>> and calls lock_iovec() to lock the IOV into memory. For the first
>> sendmsg() above it returns NULL and thus wrongly skips the call the hos=
t
>> sendmsg() syscall, which will break the calling application.
>>
>> Fix this issue by:
>> - allowing sendmsg() even with empty IOV
>> - skip recvmsg() if IOV is NULL
>> - skip both if the return code of do_sendrecvmsg_locked() !=3D 0, which
>> =C2=A0=C2=A0 indicates some failure like EFAULT on the IOV
>>
>> Tested with the debian "ell" package with hppa guest on x86_64 host.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> =C2=A0 linux-user/syscall.c | 9 +++++++--
>> =C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index a365903a3a..9e2c0a18fc 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -3330,7 +3330,10 @@ static abi_long do_sendrecvmsg_locked(int fd, st=
ruct target_msghdr *msgp,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_vec=
, count, send);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vec =3D=3D NULL) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -host_to=
_target_errno(errno);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out2;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* allow sending packet wit=
hout any iov, e.g. with MSG_MORE flag */
>
> why don't you check only for count is 0?
> Somehing like:
>
> if (vec =3D=3D NULL && (count || !send)) {

You mean:
if (vec =3D=3D NULL && (!count || !send)) {
	goto out2;

lock_iovec() sets errno=3D0 if count=3D=3D0, but for invalid addresses it =
sets errno!=3D0,
so my current check (for which ret is the same as errno):
         if (!send || ret) {
             goto out2;
exits on memfaults too, while a check for just count=3D=3D0 would succeed.

Helge

