Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A15B244D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:21:33 +0200 (CEST)
Received: from localhost ([::1]:34680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLDY-0000Qi-8o
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLBl-0006e6-5q; Thu, 08 Sep 2022 13:19:41 -0400
Received: from mout.gmx.net ([212.227.15.19]:59245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLBj-0000Iq-4p; Thu, 08 Sep 2022 13:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662657574;
 bh=kNKlza1UtTfiDPzIef8vQ42P7xh/IwqK2ko5bhTDEjY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:References:Subject:In-Reply-To;
 b=dKap8/LuTWCLkBTTpKh5aotHqbEEyN7+O8wuKEFA4QSbhfE7sn208YJ2Cd0wHPk1q
 k/Gy6cyY4C0aKVVxVBTHnkvmtG9nauYSAr3pOsdEK6KpDKCqD69BGlXgI8PGb8RO6F
 Hob1pJjvWX4z0Wc3gapK3emisx1YISw4Y+akTpis=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([178.8.103.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdeR-1oc5wW431B-00EhPw; Thu, 08
 Sep 2022 19:19:34 +0200
Message-ID: <4c410969-6e94-abca-19dc-6888a98e9330@gmx.de>
Date: Thu, 8 Sep 2022 19:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arwed Meyer <arwed.meyer@gmx.de>
Content-Language: de-DE
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
 <20220906194755.98090-5-arwed.meyer@gmx.de>
 <CAJ+F1CLX8gTZ_MsDB+nK7Gp4mBe5UDnaEmKYvfsyjNzKzcQw8g@mail.gmail.com>
 <20220908071424-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH 4/4] serial: Allow unaligned i/o access
In-Reply-To: <20220908071424-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A6oT1YW1HONL11hqefd085bJAzk+VNYURhdAtbkohulDJJNOlVv
 S9DoCNAOVp3+XpGML+Ec8CDWprlJxE1iKF6pehVimfLg3u9h7ydVmzKpOTWGESUUElIj+pi
 RHOpEtfb5dwavPtypSqJC1YJ4jUToBGkuqwCQ9q1MHZmVdUSsJEaE0kUrhuC/nGlSXwosYZ
 Zs+5et9jAvW2kwesXPykQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k2efFPM5RJQ=:7wlL8RZS/KaGWIl2S9+6oO
 XxmeuFBHLgk40c7KYxVdHm2IFLuGtjNha9bJ449WVlQUatGs8BMPLZEbEsjTtZ7ILwTnKoVBe
 5IrPo1UU92cXWAB5TpRAtAByY+ilirwd9PctTUmOksfmv1J5jo9FmrxoS99AhIiURd9H3grQj
 OhDqO5SvvPNxgO7CNtwOnzWPEiTrzNWHUmswjIi/X8HfVe2X00mmgKTGdcO2qp3SdnAoteVPM
 EVIbkph5GSfJFDo9C4ifqX80UxSxmH5/gBR3aGN+hHZdJiY5zWpWtqnBjloTpaFnkn/3nzenL
 QDs7c0sEW1mu38FeoliK1kFZ0AsbBV0Ehsp8L0VBg5+gYSNCeRLGT1iEoMXi3KGY3rqt4x9pG
 r0PRcyk36dhXRYHtmTvq904JyjkwEmgOZxX8Vf72SWij4ur2y/zJbWHc3IiyoSJIcFGLThCy6
 KtIMj3KCCPZ4IesSAjG8XmmqpADQzlpEI0yP3eHzQps95Ri0mWVSEQR/t5e/bvhWLszea9izw
 ZL7uZpPQqp+6dRul9oU7DfOw6W9vlq9IbF/D0tA4xgUufeNTfCZ3FqBZVXEvlfrwqfhcFaq6/
 DAPorzg0f+IiG/ojp8T4onO06NwvbTFiKPcBoj5GIZmVrDGk33ox4R1XNGQfClfZHRtuTShre
 07Xmr2/eO4SJphRYVKTl3Pu6/rv1T4Ka7clsLmdzHCHP0/iW8Z4LYIoaZPBUXPsPyz1fIdl9i
 bg0h4u07SB9+OMYttwIEAfRPb3K8VWzJ+Ub9ONZ6boS7z8RpnfL5pFDq4oJnclihKMSBUE8pw
 SbCwsc6r4eVVNLfee8QXSNxA7t75TGofwFYXIKc/f2QDN1y0g950kbl4dB5MD0xoOCV8gFZHy
 l51qHam79wsFTeWJ5vQ0AavAzOSgaXw62vuYLl4UzIz5xVtX1h3fI4se4lGgHg9hxQCU10VIy
 JZwuDYDsANmhFcuU2M+tXEY16TnujqO6ediSunjQ1i+tzotOb6F1YwEB+YhqXwYoDtxZRfEq6
 d+sfigpIc8dZPRrXhnUy2u7wjEQik3tdHccxVichxXM9PcIpcJ28xHebBXJ3/SbFQVyrdiWLJ
 ynN3LGBJ16g6xkpiSZ5fsV6SrLaTXz4YTcLay4izJ4rEPnho/8buZ7RV90EN1IypHPsJ1EL2q
 WIbDZ4bRLJUYvoqxX1BlVv8iGZ
Received-SPF: pass client-ip=212.227.15.19; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SCC_BODY_URI_ONLY=1.861,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.09.22 um 13:15 schrieb Michael S. Tsirkin:
> On Thu, Sep 08, 2022 at 02:11:28PM +0400, Marc-Andr=C3=A9 Lureau wrote:
>> Hi
>>
>> On Wed, Sep 7, 2022 at 2:03 AM Arwed Meyer <arwed.meyer@gmx.de> wrote:
>>
>>      Unaligned i/o access on serial UART works on real PCs.
>>      This is used for example by FreeDOS CTMouse driver. Without this i=
t
>>      can't reset and detect serial mice.
>>
>>      Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
>>      Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>>      ---
>>      =C2=A0hw/char/serial.c | 3 +++
>>      =C2=A01 file changed, 3 insertions(+)
>>
>>      diff --git a/hw/char/serial.c b/hw/char/serial.c
>>      index 7061aacbce..41b5e61977 100644
>>      --- a/hw/char/serial.c
>>      +++ b/hw/char/serial.c
>>      @@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint=
32_t
>>      frequency)
>>      =C2=A0const MemoryRegionOps serial_io_ops =3D {
>>      =C2=A0 =C2=A0 =C2=A0.read =3D serial_ioport_read,
>>      =C2=A0 =C2=A0 =C2=A0.write =3D serial_ioport_write,
>>      +=C2=A0 =C2=A0 .valid =3D {
>>      +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unaligned =3D 1,
>>      +=C2=A0 =C2=A0 },
>>
>>
>> I don't get how this can help if both min_access_size & max_access_size=
 are 1.
>>
>>
>>      =C2=A0 =C2=A0 =C2=A0.impl =3D {
>>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.min_access_size =3D 1,
>>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_access_size =3D 1,
>>      --
>>      2.34.1
>
>
> Because that's .impl. If access is invalid we don't get as far
> as breaking it up to chunks.
>
>>
>>
>>
>>
>> --
>> Marc-Andr=C3=A9 Lureau
>
Exactly. Not really knowing the serial/chardev code much it took me a
while to figure out why calling FreeDOS CTMouse/protocol.com would never
execute the ioctl mouse reset code in msmouse.c.

