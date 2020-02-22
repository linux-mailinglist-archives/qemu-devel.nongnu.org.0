Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD348168C07
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 03:28:54 +0100 (CET)
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5KXF-0008GI-7Q
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 21:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chengang@emindsoft.com.cn>) id 1j5KWM-0007rM-Ck
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 21:27:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chengang@emindsoft.com.cn>) id 1j5KWI-0003P4-7F
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 21:27:58 -0500
Received: from regular1.263xmail.com ([211.150.70.206]:56258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chengang@emindsoft.com.cn>)
 id 1j5KWH-0003LJ-Qk
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 21:27:54 -0500
Received: from localhost (unknown [192.168.167.209])
 by regular1.263xmail.com (Postfix) with ESMTP id F19C5229;
 Sat, 22 Feb 2020 10:27:45 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [192.168.1.3] (unknown [120.244.107.136])
 by smtp.263.net (postfix) whith ESMTP id
 P23774T140158621951744S1582338465725952_; 
 Sat, 22 Feb 2020 10:27:45 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a96f9e7f24f59c49c7a933138f56d9ab>
X-RL-SENDER: chengang@emindsoft.com.cn
X-SENDER: chengang@emindsoft.com.cn
X-LOGIN-NAME: chengang@emindsoft.com.cn
X-FST-TO: gang.chen.5i5j@gmail.com
X-SENDER-IP: 120.244.107.136
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH] target: i386: Check float overflow about register stack
From: Chen Gang <chengang@emindsoft.com.cn>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20200221034547.5215-1-chengang@emindsoft.com.cn>
 <a5533719-7ef1-938b-e52c-20711e65417f@redhat.com>
 <900fd511-72f0-675d-4a7e-d228b2ade9c7@emindsoft.com.cn>
 <d893eac5-0b7a-ddfe-2acf-a6f27ab48ccf@redhat.com>
 <f3bea474-468b-5818-9f69-5463be6d9b2a@emindsoft.com.cn>
Message-ID: <f0efb92a-85db-8ba5-8fec-399076db17a3@emindsoft.com.cn>
Date: Sat, 22 Feb 2020 10:27:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f3bea474-468b-5818-9f69-5463be6d9b2a@emindsoft.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 211.150.70.206
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

On 2020/2/22 =E4=B8=8A=E5=8D=8810:10, Chen Gang wrote:
> On 2020/2/22 =E4=B8=8A=E5=8D=8812:18, Paolo Bonzini wrote:
>> On 21/02/20 15:09, Chen Gang wrote:
>>>> -    /* XXX: test fptags too */
>>>> +    if (env->fptags[env->fpstt]) {
>>>> +        env->fpus |=3D 0x4100; /* Empty */
>>>> +        return;
>>>> +    }
>>>> +
>>> For fpop overflow, this fix is enough, but for me, we still need
>>> foverflow to check fpush/fld*_ST0 overflow.
>>>
>>> Don't you think we need check fpush/f[i]ld*_ST0 overflow?
>>
>> After fld/fild or any other push, FXAM ST0 should not return empty in =
my
>> opinion.
>>
>=20
> OK, it sounds reasonable.
>=20
> After check the intel document for f[i]ld* instructions, it says:
>=20
>   "Set C1 to 1 if stack overflow occurred; set to 0 otherwise".
>=20
> In helper_fxam_ST0, I guess, we need "env->fpus |=3D 0x200" (but I don'=
t
> know wheter it will be conflict with SIGND(temp)). And we have to still
> need foverflow, because all env->fptags being 0 doesn't mean overflow.
>=20

After read the document more about fstp* and fld* instructions, I find
that fstp* are also related with C1, and fld* will generate IS exception
when stack underflow or overflow occurred.

It seems more modifications should be done (but they will be several
patches).

Thanks.



