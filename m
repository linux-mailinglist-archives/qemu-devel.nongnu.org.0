Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711C60C194
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:18:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9Tx-0004Xh-Rg; Mon, 24 Oct 2022 22:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on9Tr-0004QT-7s
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:15:51 -0400
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on9Tp-0003Ka-Et
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666664142;
 bh=I/ChHoSuQbJu+gdWjYrTcozcMf5DwHQ2HWyioGqM9xk=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=Mw5xCPZ58InvhfmbDRNwa2C9uaxZtBfPD7hA/aXTWE6Vxhao6vPeF+ACpfZ5VFVp7
 LWlYFhT8+vlCFY1mxukMyhJ+BRBs7rs6sl1VTWbYAHgdX6HWtORmHm25PhNMyHxvTg
 SNW38avudnkDX5rdokY86eXvkh2jKENtm3h4II3Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.30]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My36N-1p0iLx0BiB-00zZoU; Tue, 25
 Oct 2022 04:15:42 +0200
Message-ID: <00224c21-4218-d3e9-689f-ec4acf4350ad@gmx.de>
Date: Tue, 25 Oct 2022 04:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4] linux-user: Add close_range() syscall
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <Y1b45IL371MJP2WW@p100>
 <6412545a-5b43-421f-d94a-cf3111725047@linaro.org>
 <436afa3a-bb4b-3807-4c01-25d3ddb195a1@gmx.de>
In-Reply-To: <436afa3a-bb4b-3807-4c01-25d3ddb195a1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K+N2Lz5TYSyH1eckMZ3qPiLuMLu/Kx+ig5SRiVLAHyo17PuRRrj
 kxO8L4TvlYN7DNUu7Xa1b90b2YB/8v5qrRAVVaYK3x1bMEnztinTGFvrb40WJXv27j9MXWk
 s1TTbejE5MxWx0GX6xWIheRfNIQwSz4Ol4b0Li9ffs+CVMFi8mchNYYaXpamAlXLFo7o35L
 Ww4PRsh9G7I9QIM2rtnvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nEqFgS5mm7o=:Cvz8QRyIS4QrAUDWmMFjhn
 phiZtlN9JU1/xWkNXVu7R5XuPjBj5+gQ2kCORUcO8/jX6PfewO3ME35R7wAjbvj4JAsjm2aG0
 8ztX02OAskb4HQnWBxYOTNJbAC6mUqwhJ0l/S6rpjSC1ApZJGuvKcQVBfCMt4wyDL37E+lpTo
 18JPvGY+wc0W17VufFJMVV6YjsZwNbyqb/9HC/T+OfpCyWH9iE/51dCY+m+ZF/x9PcCM3gF2f
 woJ9k3NX/H9OZqvyNpT0tutzjU/iUH9w94rl3autHef6axMhU+JLamTIiEfCPSqHAeEycrVaR
 wqcbVn85ZRGX8odB1jRf/c3uZGlWrgb0eqqvlN+cWR0dhoew7fIO+UBKXK7bCX6VaDwjGbYRj
 zQp0ylS2rc02BZK0jlY8ybMiRt08MN8e9Odgn70QdTVaQ9ZovK0fUOc+Ct+QEJeODv6jozCVm
 dcXQZsDT0+wk6vkVdAOGSGm3IUrhQDjFRR6blbvBmBLEMs+cj3UvWmrm0tvF5vtkS9oKj+3o3
 DiOSKc+fL0m1rawpZN6WBQ+U8pCxxnvOd+S036Izn/9pu7L6MYtDP82GaO26YcJg//wiwYac1
 nNMP57j2NpBbZD5yX28OHI/U1HqTDwo3Z0V5/Tk68cFt1vtRIECOFb89/WzZ5/USB/hjn3F6s
 Kho9OmO31fKWagm4xiyfGm7v11LYfDZN0i+cgTVIuaZO/BFgjzqnEcHLDSQkShcXxI1yj49d2
 RjnBQxJYtZHlauFFMb3d2TqwTbgmbmN2nMJxC+PeRYjjYkRR2TUKyP9HD2KnUPOPhRSaszdwh
 xLRlhpxsCB4fwCc3yDZZli3pttXrGiVfnRKBpQbxoD/a3V6jJwmyC8Cd775mSyl+/2PjifxXm
 zmkXyznejEUqcE+oGOgpMjSIZuB+SBn0rC/p9l7CG5tZUkLQuHy10LetGBbfVAg2LsGMWlD9u
 CXmfTXFCtIseMevwvK4j1S8ezgwIUfKtJUeZnMfmKnWxHwf9z/tYamVUttte0jm+reH71AjhP
 NMXMZPd1h1oVbOPz2zQJCioMsFohfomLYjIaEU2btAV+7K3YBqDYgnornbLbpl6CAO8UV4UuH
 kGngOfdxqeMD1h5EsBErsle77yEHllVyBhM8kcipt34M8uXGpHu4n79AGXdubNsZEEpez3T1U
 a+7VgDQ+SS42tO4ECPLNV875fMvPhIir84DZ1ShQb2Kh7qV6wPZKnD97gNp3yxgrhBcFaRVjm
 OAfzceceKOsnxoBRPwJlxxxP1Y5w6GWGAdC3EMVd2VeSGo+inrJJvUD2hCap8Ii2tjIsbzuJy
 z77t+uKDw/mafxNEiRRlnkXbCtwbRD9kdvDHy/HkPB6GJJOh6kPZR509wmxl6wnieAxf1jmjG
 zeqdG3wVS/dxqIzUC//zRFWqIeSQaMtSbadivOe1ncekxb6VUkaM83pCPuEkE7p1MbEykamT+
 18uGo3GmBdqVHdtq2XUY3p+VS6/42lYcLhppZ+cs4CinnGo9uffg7hf8sDkyvj4HMiuDu1Xy3
 dLPjdV/XU/Y7XcoGMJI/Ahvuwwj0n2qsLmvwePGEg0KU+
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 03:39, Helge Deller wrote:
> On 10/25/22 00:39, Richard Henderson wrote:
>> On 10/25/22 06:43, Helge Deller wrote:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ab=
i_long maxfd =3D arg2;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 ((sizeof(abi_long) =3D=3D 4 && arg2 =3D=3D (abi_long)0x7FFFFFFFUL) ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (sizeof(abi_long) =3D=3D 8 && arg2 =3D=3D (abi_long)=
0x7FFFFFFFFFFFFFFFULL)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 maxfd =3D target_fd_max;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fo=
r (fd =3D arg1; fd < maxfd; fd++) {
>>
>> Why do we need explicit checks for INT32/64_MAX?
>> If the guest passes 0x7FFFFFFFFFFFFFFEULL,
>
> A 32-bit guest (on a 64bit host) will pass 0x7FFFFFFFUL...
>
>> do we really need to iterate over all of those impossible values?
>
> The compiler will optimize one of those checks away, so it's effectively
> just one expression.

My above comments are correct, but....

>> I should think some expression involving MIN() is in order.

that's even better.

Will resend v5 patch.

Helge

