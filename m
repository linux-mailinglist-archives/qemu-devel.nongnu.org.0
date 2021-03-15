Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CDC33C1CB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:31:03 +0100 (CET)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLq7S-0002ek-AZ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLq4Y-0001by-13; Mon, 15 Mar 2021 12:28:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLq4W-0006G7-05; Mon, 15 Mar 2021 12:28:01 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FG2wd4102053; Mon, 15 Mar 2021 12:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KN/BhQg1XK4WUtO3V5dePaq+TGwuCu4xjEWYWz/qh4k=;
 b=iqj8R3a2lIHaRc1PeDxmW8e/WZAygIio7BIu+h7At7fhDZ7fLR2fKuuoSDQxv7FKpQSW
 9Bt05G70KbrdYQi4hxwZM98J4vcRLLA1NJX9z7meX6ffBPEdAmGwkfl/nKrk178cLfpu
 1mF3dzVMLhgOIbxJuajJ9zdLueftGdqgiFvj4GVM2/GmIjGjtqLgBO4g0GR0izOzBFV0
 fd/ZHmYjUhJC1fcJg87G8aEwxRH9DNh8E5e49qeJNbVEQp1XEKd3lvcpKTCUN3UIQFiy
 db0Eg48suHyoTkmK97Fr3Mxf7c5DqxKNdMuvD4OwngQM8IRN8bZe3OSgMz9NMSwnmBSA gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aafq1cws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:27:58 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FG3onR105109;
 Mon, 15 Mar 2021 12:27:57 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aafq1cvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:27:57 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGMsGK002616;
 Mon, 15 Mar 2021 16:27:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 378n18j1ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:27:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGRrJ048038232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:27:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13DA94204B;
 Mon, 15 Mar 2021 16:27:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23CD442049;
 Mon, 15 Mar 2021 16:27:52 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.7.179])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:27:52 +0000 (GMT)
Subject: Re: compile warning in i8259.c
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
 <21da022d-7349-ceca-ca88-b7987ac2eb0d@de.ibm.com>
 <8ba68f46-3bd8-b8ee-b45d-4f3235b38583@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <521b60b3-d286-39aa-aa0d-69709515b469@de.ibm.com>
Date: Mon, 15 Mar 2021 17:27:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8ba68f46-3bd8-b8ee-b45d-4f3235b38583@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150112
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15.03.21 17:20, Thomas Huth wrote:
> On 15/03/2021 16.44, Christian Borntraeger wrote:
>> On 15.03.21 16:14, Christian Borntraeger wrote:
>>> For some time now I do see the following, when I compile x86-softmmu on s390:
>>>
>>> FAILED: libcommon.fa.p/hw_intc_i8259.c.o
>>> cc -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/capstone -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/libusb-1.0 -I/usr/include/vte-2.91 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/fribidi -I/usr/include/libxml2 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gtk-3.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include -I/usr/include/at-spi-2.0 -I/usr/include/virgl -I/usr/include/p11-kit-1 -I/usr/include/SDL2 -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/slirp -fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -Werror -std=gnu99 -O2 -g -isystem /home/cborntra/REPOS/qemu/linux-headers -isystem linux-headers -iquote . -iquote /home/cborntra/REPOS/qemu 
>>> -iquote /home/cborntra/REPOS/qemu/include -iquote /home/cborntra/REPOS/qemu/disas/libvixl -iquote /home/cborntra/REPOS/qemu/tcg/s390 -iquote /home/cborntra/REPOS/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -DSTRUCT_IOVEC_DEFINED -D_REENTRANT -Wno-undef -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -MD -MQ libcommon.fa.p/hw_intc_i8259.c.o -MF libcommon.fa.p/hw_intc_i8259.c.o.d -o libcommon.fa.p/hw_intc_i8259.c.o -c ../hw/intc/i8259.c
>>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>    203 |         irq = irq2 + 8;
>>>        |         ~~~~^~~~~~~~~~
>>> cc1: all warnings being treated as errors
>>>
>>>
>>> Due to other compile warnings I find this hard to bisect. Has anyone seen this as well?
>>
>> cc Michael, Paolo,
>>
>> Something like
>>
>> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
>> index 344fd04db14d..7335b7a06a67 100644
>> --- a/hw/intc/i8259.c
>> +++ b/hw/intc/i8259.c
>> @@ -176,7 +176,7 @@ static void pic_intack(PICCommonState *s, int irq)
>>   int pic_read_irq(DeviceState *d)
>>   {
>>       PICCommonState *s = PIC_COMMON(d);
>> -    int irq, irq2, intno;
>> +    int irq, irq2 = 0, intno;
>>
>>       irq = pic_get_irq(s);
>>       if (irq >= 0) {
>>
>>
>> would do the trick. Let me know if I should do a proper patch or if you want to have things solved differently.
> 
> Alternate idea, merge the two "irq == 2" blocks:
> 
> diff a/hw/intc/i8259.c b/hw/intc/i8259.c
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -179,19 +179,19 @@ int pic_read_irq(DeviceState *d)
>       int irq, irq2, intno;
> 
>       irq = pic_get_irq(s);
> -    if (irq >= 0) {
> -        if (irq == 2) {
> -            irq2 = pic_get_irq(slave_pic);
> -            if (irq2 >= 0) {
> -                pic_intack(slave_pic, irq2);
> -            } else {
> -                /* spurious IRQ on slave controller */
> -                irq2 = 7;
> -            }
> -            intno = slave_pic->irq_base + irq2;
> +    if (irq == 2) {
> +        irq2 = pic_get_irq(slave_pic);
> +        if (irq2 >= 0) {
> +            pic_intack(slave_pic, irq2);
>           } else {
> -            intno = s->irq_base + irq;
> +            /* spurious IRQ on slave controller */
> +            irq2 = 7;
>           }
> +        intno = slave_pic->irq_base + irq2;
> +        pic_intack(s, irq);
> +        irq = irq2 + 8;
> +    } else if (irq >= 0) {
> +        intno = s->irq_base + irq;
>           pic_intack(s, irq);
>       } else {
>           /* spurious IRQ on host controller */
> @@ -199,10 +199,6 @@ int pic_read_irq(DeviceState *d)
>           intno = s->irq_base + irq;
>       }
> 
> -    if (irq == 2) {
> -        irq = irq2 + 8;
> -    }
> -
>   #ifdef DEBUG_IRQ_LATENCY
>       printf("IRQ%d latency=%0.3fus\n",
>              irq,
> 
> It's a bigger patch, but the code is IMHO easier to read afterwards (less indentation).

I would defer such a change to someone more familiar with x86.


