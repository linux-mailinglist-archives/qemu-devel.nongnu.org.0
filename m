Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF316B723
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 02:23:52 +0100 (CET)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Owx-0002I2-F6
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 20:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chengang@emindsoft.com.cn>) id 1j6Ow1-0001sl-4f
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:22:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chengang@emindsoft.com.cn>) id 1j6Ow0-0000T1-01
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:22:52 -0500
Received: from regular1.263xmail.com ([211.150.70.203]:35844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chengang@emindsoft.com.cn>)
 id 1j6Ovz-0000MQ-Lm
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 20:22:51 -0500
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id 09ED93B7;
 Tue, 25 Feb 2020 09:22:44 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [192.168.1.3] (unknown [223.72.93.93])
 by smtp.263.net (postfix) whith ESMTP id
 P15418T139869099652864S1582593763893495_; 
 Tue, 25 Feb 2020 09:22:44 +0800 (CST)
X-UNIQUE-TAG: <d1650730b36a58a0bcf32ac371506ee5>
X-RL-SENDER: chengang@emindsoft.com.cn
X-SENDER: chengang@emindsoft.com.cn
X-LOGIN-NAME: chengang@emindsoft.com.cn
X-FST-TO: gang.chen.5i5j@gmail.com
X-SENDER-IP: 223.72.93.93
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH] target: i386: Check float overflow about register stack
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20200221034547.5215-1-chengang@emindsoft.com.cn>
 <a5533719-7ef1-938b-e52c-20711e65417f@redhat.com>
 <900fd511-72f0-675d-4a7e-d228b2ade9c7@emindsoft.com.cn>
 <d893eac5-0b7a-ddfe-2acf-a6f27ab48ccf@redhat.com>
 <f3bea474-468b-5818-9f69-5463be6d9b2a@emindsoft.com.cn>
 <2ab8ed82-dadd-2d5e-5bbc-69a67ba89e26@redhat.com>
 <22cf9eb4-7d48-5eb1-5d4e-38d83c0a3f40@emindsoft.com.cn>
 <487e94c0-ccdf-2317-9ee2-6674aaed0aa8@redhat.com>
From: Chen Gang <chengang@emindsoft.com.cn>
Message-ID: <f63932c1-80d4-90df-b3e6-2fb0df172045@emindsoft.com.cn>
Date: Tue, 25 Feb 2020 09:22:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <487e94c0-ccdf-2317-9ee2-6674aaed0aa8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 211.150.70.203
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
Cc: qemu-devel@nongnu.org, Chen Gang <gang.chen.5i5j@gmail.com>,
 ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/2/24 =E4=B8=8B=E5=8D=888:43, Paolo Bonzini wrote:
> On 22/02/20 13:25, Chen Gang wrote:
>> On 2020/2/22 =E4=B8=8B=E5=8D=883:37, Paolo Bonzini wrote:
>>> On 22/02/20 03:10, Chen Gang wrote:
>>>> Set C1 to 1 if stack overflow occurred; set to 0 otherwise".
>>>>
>>>> In helper_fxam_ST0, I guess, we need "env->fpus |=3D 0x200" (but I d=
on't
>>>> know wheter it will be conflict with SIGND(temp)). And we have to st=
ill
>>>> need foverflow, because all env->fptags being 0 doesn't mean overflo=
w.
>>>
>>> No, you need to add "env->fpus |=3D 0x200" and "env->fpus &=3D ~0x200=
"
>>> directly to fpush, fpop, etc.
>>>
>>
>> OK. The content below is my next TODO, welcome your opinions.
>>
>> When overflow occurs, for me, we need keep everything no touch except
>> set C1 flag.
>=20
> No, push will overwrite the top entry if there is overflow.
>=20
>> In fxam, we don't clear C1, but keep no touch for clearning
>> C1 in another places.
>=20
> FXAM is neither push nor pop, it just detects an empty slot via fptags.
>  FXAM should be okay with my patch.
>=20

OK. I am not quite clear about it, but it fixes the current issues at
least. Please apply your patch.

Thanks.



