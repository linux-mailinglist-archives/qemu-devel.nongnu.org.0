Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC23320EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 02:04:42 +0100 (CET)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDzeT-0006P7-E5
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 20:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lDzd0-0005dx-7s; Sun, 21 Feb 2021 20:03:10 -0500
Received: from mout.gmx.net ([212.227.15.15]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lDzcy-0007dt-9p; Sun, 21 Feb 2021 20:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1613955786;
 bh=k9QoPDhp6zmp2EgpNGKAmxAP6JtreYCrHtHGBeWZE2Y=;
 h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
 b=XfRfAnkwMHjb2h1twjfA0dFXVhKD4FWwlROv6ZJFLKiobMPfrULh48Uo/eWutMpNi
 cdvh7Uk2JMQqXZfnWzHzRrRqnY0Eht+HazO9LBdFozQvOmceK/T+t8afE3ExURVY7U
 fkWl8dlt9LLG1bbBYVeeJKW323eKDDYStP90nZZg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.180.210]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Bk-1lajTL3qKc-00oC0g; Mon, 22
 Feb 2021 02:03:05 +0100
Subject: Re: [PATCH v2] linux-user: fix O_NONBLOCK usage for hppa target
To: qemu-stable@nongnu.org
References: <20210201220551.GA8015@ls3530.fritz.box>
 <f6c72e80-a800-1ab3-544b-337537e9cfe5@vivier.eu>
From: Helge Deller <deller@gmx.de>
Message-ID: <061e9b23-48cb-5a9f-9377-f3f4ab43acca@gmx.de>
Date: Mon, 22 Feb 2021 02:02:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f6c72e80-a800-1ab3-544b-337537e9cfe5@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WX8bqPfKNBd6bykKh5l4HAe4Wcis4w0kELlsldmV0yFqMPPFvpk
 1CBNi+9jG8/BAUwVpO9vjcP8GGSJjIN2OS4l5VnPaVPT90YICjl9t3pzYEJk1kYmV+PDu1L
 Lt1vS9lqeTVGbrUvXPxcfpeZqsl1V7OfBeCSe1rtro5hEt/wkrjPOqQcwjyklBCxUnuzNZ0
 YDj27lIjR8SWhl5YkIXIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GDA0dxm1DF4=:APguX3gYp08nTVMOpJETdQ
 vOCURnU16Av8AAJs38PEX0qE5xfURDPLBh3u2LmfOTaeNP+5+dnQkuoY0FjUWZ4VOxWYGzvHd
 Bybh/hfYPxT/fyWCqJMPjCvj7FyRvkj0KxfftltQEPAIP8jkzlihLO9w/HsIyZ0YNy6ZHnj4Z
 jYHygWymHfnmcSRSIBrnOdULTeABldK99h7Zd/0neYj+OZY/RWXKlBrkurwrgaTuqeLnyEYq4
 E6U/ApBo2NL4AH9VqvAJONoAYsbZuPtODI8j4HWBVgIJAxtAm2FhLWsVxCPyBk048R0ljBc98
 En/BacWRR2z36vme+Pb18g4jk8qtMps7q44/Jmg5tqdww3FBCQwrxWrFcQZUnXaeDChvwYEjj
 Qr5UXaLDgaYv0DiQih1HbbCOfuZUTWnWzK7F23Rw/Uz6nMtN1IW4ew/jIC379ooAI08yhp2dO
 T9guHdBUC68AYZil/XD7XLUDKjMfgUMKsPY5l70Wevo1gb0nYW51zbUVUynQl3FjUNclayz06
 kdTc2Sr5TkHr8SMGqduA5GS3BlC2BzWCPV+ambQ7/YjUsfBrhuiPHvpmoScKefy4YfaTjqyf8
 7vnMe/XMAbagj+DpHgeEJqfidVbvCRVPJA8mNiNMm8Js4ZHopJ3egquI/fP3TT4LQv8ytROEm
 7Y2EBFfXNVe/Dnn57F3tzcjv7G6yPIt/rFa2XcEb5PspzYcOBN0OPHEw9QUlMExPSqiqW2aXF
 4RfJgK2gnMAJdK7T37Bh/CoyCYmi/wGWybzsCwc+B9SkNg4NHu9UnL1/VRMZHpO7ZxaOCMQsE
 vA0Ya6NTZY61jBXjvxX58ZIIbW7NFAZ/BsqWNwxqBeD553rEsalg0d7vS6GioPssuXrrlRcGd
 Iad5mc6Z7fIc2CzJtM7w==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear qemu-stable,

can you please consider adding this patch to the qemu-stable branch.
Upstream commit	2bdc74f3d7c4cacb65dbde910471c62992640275

Thanks,
Helge


On 2/13/21 5:25 PM, Laurent Vivier wrote:
> Le 01/02/2021 =C3=A0 23:05, Helge Deller a =C3=A9crit=C2=A0:
>> Historically the parisc linux port tried to be compatible with HP-UX
>> userspace and as such defined the O_NONBLOCK constant to 0200004 to
>> emulate separate NDELAY & NONBLOCK values.
>>
>> Since parisc was the only Linux platform which had two bits set, this
>> produced various userspace issues. Finally it was decided to drop the
>> (never completed) HP-UX compatibilty, which is why O_NONBLOCK was
>> changed upstream to only have one bit set in future with this commit:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D75ae04206a4d0e4f541c1d692b7febd1c0fdb814
>>
>> This patch simply adjusts the value for qemu-user too.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> ---
>>
>> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fc=
ntl.h
>> index bd966a59b8..08e3a4fcb0 100644
>> --- a/linux-user/hppa/target_fcntl.h
>> +++ b/linux-user/hppa/target_fcntl.h
>> @@ -8,7 +8,7 @@
>>   #ifndef HPPA_TARGET_FCNTL_H
>>   #define HPPA_TARGET_FCNTL_H
>>
>> -#define TARGET_O_NONBLOCK    000200004 /* HPUX has separate NDELAY & N=
ONBLOCK */
>> +#define TARGET_O_NONBLOCK    000200000
>>   #define TARGET_O_APPEND      000000010
>>   #define TARGET_O_CREAT       000000400 /* not fcntl */
>>   #define TARGET_O_EXCL        000002000 /* not fcntl */
>>
>
> Applied to my linux-user-for-6.0 branch.
>
> Thanks,
> Laurent
>


