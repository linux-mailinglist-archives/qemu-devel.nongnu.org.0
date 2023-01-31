Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9846E682F30
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMr25-0004xE-9L; Tue, 31 Jan 2023 08:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMr1u-0004vI-Am
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:50:39 -0500
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMr1q-0007ve-3a
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675173027; bh=Q9LhrANv4xKuJ9lucw0rLyEydZmGTLqrY5Ue77Gu8Jw=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=Xbt69fO/FWuUc97sgDGFVUbWrObGDBNtJBc1/kpFc9fzMonyf3MNultliefOE10k2
 oKmVB47l6GYxYWS5jS+1j5+/5PQMzemVLaJso6SVtybVed8AXuFilPLATrSNTDMfoP
 yfD1lOvUbaGZxZQhi/M2QE1rb+FulkOYXZaMWJs2Tdk8AqnAzaMboSLyM8uAKgwHjB
 ZwNt8mPikNR/6u4z0eUp3Hm1rS9Od/Yrw8HnLbokYaHj5Gavl4LPdZxBF0hMKhGIu1
 yLWJeMvSOUX94T2ZFdDj+3suQQPdQYc2zVktwV2Eqbe0SvuY7Y9drm9lEYaaI2VHyt
 HGAPOrrq/MBkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.177.115]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5QFB-1pNfyY2y4j-001OfA; Tue, 31
 Jan 2023 14:50:27 +0100
Message-ID: <a673a642-6ab8-ef52-bbc8-f171e491166b@gmx.de>
Date: Tue, 31 Jan 2023 14:50:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] linux-user: Allow sendmsg() without IOV
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20221212173416.90590-1-deller@gmx.de>
 <20221212173416.90590-2-deller@gmx.de>
 <3517fbb1-e6eb-3495-d524-4a37ef46bd4e@vivier.eu>
 <9bd130a2-f1bc-6bf9-a409-f923cf98e2f3@gmx.de>
In-Reply-To: <9bd130a2-f1bc-6bf9-a409-f923cf98e2f3@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NHoYtrtwHVz7UzYVK9CaXTehGeD3d8vgeBVn0tY+B9T4+Q4R0z7
 pzm9cLB6xV+CaHGrLlKlT4FG2X3TxCQNhcgdPBWZQQbP+lA0CzU6iAPZO4e0yesJxNyan0F
 Y7gIRjYBkjLx3nJgwYqIfrKdUPYkll8U7o2dNgPKB4sBH4ME94XnJDiHopT8vGgeo4d5a0X
 w/7lrO+5rCHnaEg+qca0A==
UI-OutboundReport: notjunk:1;M01:P0:luoCyzqA5vk=;G3lVuqjpuqGN8vzd6YdKlQheB8X
 EqJEr610d81lo9EWeqkmLgrzAdeCk4OEFolVLNcrsU1dokPV84OWZ5TJ0iQiBkI8xY1YbuSQ1
 uIL4sqFhJYzLnkE8Fh/7iC7UxfzeVdW7hMZS3cd05yZlr+p3BGZXIJyTK6y4fvLgThGU9wOE2
 cY3RBDSMjn/7nJHh5vTiS8xP4tBXv/AuYyXk+cx6mGSlgkUK/wYFlRk7Z4h6V130bwEkXqlBm
 qJ8cvoxce9HT8pSOC1xPhYoYxC2HWhvQesIO3Us4vE3GAYjE19j5BvqIz5s1Pmq0nSJyCik61
 aB6PKpGyuDfeqpCSTPsHu3Lp6hqvJcHNbYp7HOgCrzArICeUix94v2Zcz0BMZlxy3Rn1l1rVX
 1ZmKIFHmblV3zWKvvzKXipm6k5gQZtzRcydA92Xls8tzdoJ8HRFVcEel/t1Ddzy6RM/3E+oEN
 6Omjj/VYjBz+EHAiy1yaD+5F9iN8QqeIqLT+G7mZpuY5vrr8dd3pHGewvpsR5rifTiplROVK3
 qbHDbWy31r9OzThQ4KCXHSgIkwBwSXUVSnNCbCHrdMnQGVFvelDskowB0OkJ2GYYGjG7wvy4R
 DO60Ptz0e9P7ro3oSOb2koF8tj5LZ3YldyXEYVJixYFLpdPRiI4mGzLi9STSiZY8u1/3CuG1E
 q/ouMrQhrYW9OrI/8UTFuA1R+Z9Tfe/mReM8f2JgEnI0boqy6VT6/lzvvuCb7hjIyEp3GjpnE
 SmLbss8Zrzt0niPjpZHbXihdxjiuSl1fGa9fmmzpP9fXaQ6RLugEsHRX/ENye/qie6461XPZe
 e+2/OVu+UR1qt225srF9E1w51AOIg0YsMXRd9rChGg+QZjQ4VKQUbnZuLn2nOtvtIkliHiCx9
 CiUF0iR8YisyQb+iRHU+V5Vvxv1vVLDKQdQ9SXwrzO8fVsVwvScDi7mSLB+26rgl9zSUxB6Po
 oPCeGA==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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

On 1/31/23 14:34, Helge Deller wrote:
> On 1/31/23 13:28, Laurent Vivier wrote:
>> Le 12/12/2022 =C3=A0 18:34, Helge Deller a =C3=A9crit=C2=A0:
>>> Applications do call sendmsg() without any IOV, e.g.:
>>> =C2=A0 sendmsg(4, {msg_name=3DNULL, msg_namelen=3D0, msg_iov=3DNULL, m=
sg_iovlen=3D0,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msg_control=3D[{cmsg_len=3D36, cmsg_level=3DSOL_ALG, cmsg_type=3D0x2}]=
,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msg_controllen=3D40, msg_flags=3D0}, MSG_MORE) =3D 0
>>> =C2=A0 sendmsg(4, {msg_name=3DNULL, msg_namelen=3D0, msg_iov=3D[{iov_b=
ase=3D"The quick brown fox jumps over t"..., iov_len=3D183}],
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msg_iovlen=3D1, msg_control=3D[{cmsg_len=3D20, cmsg_level=3DSOL_ALG, c=
msg_type=3D0x3}],
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 msg_controllen=3D24, msg_flags=3D0}, 0) =3D 183
>>>
>>> The function do_sendrecvmsg_locked() is used for sndmsg() and recvmsg(=
)
>>> and calls lock_iovec() to lock the IOV into memory. For the first
>>> sendmsg() above it returns NULL and thus wrongly skips the call the ho=
st
>>> sendmsg() syscall, which will break the calling application.
>>>
>>> Fix this issue by:
>>> - allowing sendmsg() even with empty IOV
>>> - skip recvmsg() if IOV is NULL
>>> - skip both if the return code of do_sendrecvmsg_locked() !=3D 0, whic=
h
>>> =C2=A0=C2=A0 indicates some failure like EFAULT on the IOV
>>>
>>> Tested with the debian "ell" package with hppa guest on x86_64 host.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> ---
>>> =C2=A0 linux-user/syscall.c | 9 +++++++--
>>> =C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index a365903a3a..9e2c0a18fc 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -3330,7 +3330,10 @@ static abi_long do_sendrecvmsg_locked(int fd, s=
truct target_msghdr *msgp,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_vec=
, count, send);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vec =3D=3D NULL) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -host_t=
o_target_errno(errno);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out2;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* allow sending packet wi=
thout any iov, e.g. with MSG_MORE flag */
>>
>> why don't you check only for count is 0?
>> Somehing like:
>>
>> if (vec =3D=3D NULL && (count || !send)) {
>
> You mean:
> if (vec =3D=3D NULL && (!count || !send)) {
>  =C2=A0=C2=A0=C2=A0=C2=A0goto out2;
>
> lock_iovec() sets errno=3D0 if count=3D=3D0, but for invalid addresses i=
t sets errno!=3D0,
> so my current check (for which ret is the same as errno):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!send || ret) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto=
 out2;
> exits on memfaults too, while a check for just count=3D=3D0 would succee=
d.

forget the above...
Maybe just checking for count=3D=3D0 would be sufficient. I don't know yet=
 if
there are any other corner cases where replacing the check of
           if (!send || ret) {
with
           if (!send || count=3D=3D0) {
would behave different.
Checking against errno which is reported back from lock_iovec() seemed mor=
e
logical for me. This patch has been as-is in the buildd trees now since we=
eks
without any problems so far at least.

Helge

