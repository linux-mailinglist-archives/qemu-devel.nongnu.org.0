Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173367D428
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL6yD-0005iG-3d; Thu, 26 Jan 2023 13:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pL6y1-0005gk-3F
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:27:21 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pL6xz-0002x4-Bp
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674757634; bh=HyHKnZGWZDpn491JVQ2mSF3t8aVO/n2m4veCYTG3Ltk=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=UDBQ6e/5V+JhSipCv4RxS9wtYfxoFKjriyePquuhHJr1KzlNT4VZpv81UmeT+Odnu
 GG7x/qrtpvT+aSlATzxAZNYEIV/S5Jttn9rROj9tc4XPR2btY7PeqagjMs/e6lwl/d
 xHzdgikGlrxFChC/xyJ/qCm35N9l2eUEIzN0kk9mL2JmEz6zuWNopfAuv/pbXGrsXi
 Q9x94ns6GN0B22v+MTwkRa67ok4yStCOunVEXUNn1F8SEP/7PaGuCT+r244mleZIoS
 Tttft1q0FBSGM+bMFAkvFKN81KF/fgEBrrJXk9DSZs9NCTv0fcXpmqfn5aEFOcKrTX
 kfe9Y22FVfi7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.142.22]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Ed-1ogWVz1LEz-013Jp4; Thu, 26
 Jan 2023 19:27:14 +0100
Message-ID: <db38ab56-d632-8cb4-9e60-aef83477ca74@gmx.de>
Date: Thu, 26 Jan 2023 19:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Fix SO_ERROR return code of getsockopt()
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221216101033.8352-1-deller@gmx.de>
 <8ec83c02-0e87-90c2-835d-e01a330b1969@vivier.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <8ec83c02-0e87-90c2-835d-e01a330b1969@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sG8MTYnBo8iUwwur95s69rEd7Zql4JoPGGzzjwUHlAoTLjkZ8Rb
 kYgxQsVQbGMqK2dXzTbOXO1zCbP87uPTDJalrvyaZI1VOVuYK+l8sCAdQSM6MfX4Y9MVrQJ
 Sq5kuxW1IrXCtkMl+2Xmf0FUPJyaJel+lvORjvylpnqySfS0+qBhBuOwCzIhkvXrt5MIQxF
 HeqT7FyHaVHISIRiREEmQ==
UI-OutboundReport: notjunk:1;M01:P0:+Mj7yM96fBk=;kL5c3X/bwgiVRSVpJtC4QiwvOSv
 42I6AuZaK4A5vefmgTzN9u/ZURe1aBqamaIv6ZGx6HRE0+FIfmO5+daRkjlahKW3nX1p0AFnt
 OTkdXK7RbyOtJ9KxC3AC8lKIyTDgKLm3gSS3EURgQGRgkm/6f+2dACgtaxzGS/K3+dtNmeadS
 Om9weBfGGDPMeIToYvpa8Aqy9zt4cK1XRVTBa9wrr2lVgktgP+pv6o14XNKHf1hGFSAhMcxb2
 9eJKus85/pjAcOGb3eTFYjfr0EwWam/0CZ9Wmvm0zN4BtWbkZuEQYgqk5ymbnH9wzyw60q0vq
 Bc4fkx5thG0/e/hHDma1fln/z1vmciG7iwm4xTwb2a+lBRiyfZ1sAwlN4WjpLa/pUd3U+Etj9
 9N48iVrsX1ST5/Ni06MIoPArOhqOY+oRF702Fe9eHmGL0+DM0CnV13XlOXB0/WlCwbpCWOyX9
 Q3k0R93YIVHaZENT0VVzkyz+G9MqM2FeIhUv2/7Iqat8xZ3HyZKUUuekMcvKUctYrHhPY6Lha
 BVN81tC1yWKDpxYMpYhzgHh4MJH4E40gti6dcS8dg290hB7S2ZbDT9ZJDCNOh/K6AkLvHOEJc
 EM69tJUg6zhPOhXruhDqheTptWRl3CtekINwpEXPx3MdB5dhuzqgWvOwvi3V0nUWlQ7kkRL6Y
 nAKskWVqHhqnNk4hMiSy1+AbcakGqBLrBMjK9fbBfzaMZWV6IAFix6Ghera+nqCtJmfB2OJXb
 a/aVxBtcSs5wXn0KPmQHLaptFirima3mV3uJrKVwO5U8CaKIhs3XypGNXv6kplvUg5L5/GkHK
 Lo3KXZRQsrf+g9zCCo57B8H2ktPBNGWyvXU1Y9xYJKrbQ6Wbg5TXmQ0HeWyNHcn0iWT9FCIRw
 6YIlhpmX5EKGFQcZUHBZshJoWZrrZBIAxOmSHvzBeDEU0w01YOSwQHVdfc5fs5EON3rkkKQqT
 bsZyCy1/Hksuxy5cqSdrSG9SxeI=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/26/23 17:55, Laurent Vivier wrote:
> Le 16/12/2022 =C3=A0 11:10, Helge Deller a =C3=A9crit=C2=A0:
>> Add translation for the host error return code of:
>> =C2=A0=C2=A0=C2=A0=C2=A0 getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREF=
USED], [4]) =3D 0
>>
>> This fixes the testsuite of the cockpit debian package with a
>> hppa-linux guest on a x86-64 host.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>> =C2=A0 linux-user/syscall.c | 5 +++--
>> =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index e541fbe09a..52693b4239 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -2809,8 +2809,9 @@ get_timeout:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D get_errn=
o(getsockopt(sockfd, level, optname, &val, &lv));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (optname =3D=3D SO_TYPE)=
 {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val=
 =3D host_to_target_sock_type(val);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (optname) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SO_TYPE:=C2=A0=C2=A0 v=
al =3D host_to_target_sock_type(val);=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SO_ERROR:=C2=A0 val =
=3D host_to_target_errno(val);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
reak;
>
> It looks good but I think compiler will complain if you don't have a def=
ault case.

It didn't for me, but I'm not sure for others.

> perhaps "if (optname =3D=3D SO_TYPE) { }=C2=A0else if (optname =3D=3D SO=
_ERROR) { }" would be better.

Personally I do prefer this type of switch statement here (which actually =
avoids such nested
"if" statements). But I'm not religious about it, so if you want it as nes=
ted "if"s I can
send a new patch which will be larger and less readable... Please let me k=
now.

Helge

>
> Thanks,
> Laurent
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len > lv)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 len =3D lv;
>> --
>> 2.38.1
>>
>>
>


