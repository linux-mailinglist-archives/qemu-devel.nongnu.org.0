Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B633C17A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:18:10 +0100 (CET)
Received: from localhost ([::1]:44540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpuz-0006oN-Ds
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLpsp-00052r-ON; Mon, 15 Mar 2021 12:15:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLpsj-00024G-2I; Mon, 15 Mar 2021 12:15:55 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FG4AN4077710; Mon, 15 Mar 2021 12:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7yYNiL5PpOE/7XZwWwWd2sZQWMYt5iTVZWIdzDHCO58=;
 b=snP2WRNN/CPuLUwmr1q8RHgFw58ayjsh+UBWVwj3QVn+gPtDH94rkStOnDzQxqS9/zMe
 PhwqLGERoZHIquLdyPw+xX0L6H+YF2DjM4CiXl06f+qsMfspeXXGXu8WPwLLcL9xghC2
 1WOXUNKl6bMPxYOcbcEyQEBDS63t+/jhRqGs1G6DTw0l9CHsQtlmYF5icDgW6ccdZEan
 zEuxjeJrxnvFMD58FQ4FL2NYqe7hMzkyNGjwZSBgVJ3E3SgFI+QE7NhGSmWjLZngksPS
 IhGNJ7k2ppA+Q0YBPgqWQiMwL9hTD8JrEqD/ChCNkyvr4LWS7mpUrvc3PMgCoMxo4WIL 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37a9pujvvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:15:46 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FG4A5A077798;
 Mon, 15 Mar 2021 12:15:46 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37a9pujvud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:15:46 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FG4NaV027937;
 Mon, 15 Mar 2021 16:15:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 378mnh92du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:15:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGFewb49414484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:15:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6FA242041;
 Mon, 15 Mar 2021 16:15:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 710AA4203F;
 Mon, 15 Mar 2021 16:15:40 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.7.179])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:15:40 +0000 (GMT)
Subject: Re: compile warning in i8259.c
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
 <75aed565-c9a6-6ee1-ab92-d2771df83ff0@redhat.com>
 <d897bc68-a2c9-0826-76a6-93a9682ae4ad@redhat.com>
 <b599711f-b1ab-5156-bfe6-ed49edd9423b@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <0b8f7fc1-1474-32da-b47f-aace812fc960@de.ibm.com>
Date: Mon, 15 Mar 2021 17:15:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b599711f-b1ab-5156-bfe6-ed49edd9423b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150112
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15.03.21 16:58, Thomas Huth wrote:
> On 15/03/2021 16.50, Philippe Mathieu-Daudé wrote:
>> On 3/15/21 4:42 PM, Thomas Huth wrote:
>>> On 15/03/2021 16.14, Christian Borntraeger wrote:
>>>> For some time now I do see the following, when I compile x86-softmmu
>>>> on s390:
>>>>
>>>> FAILED: libcommon.fa.p/hw_intc_i8259.c.o
>>>> cc -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader
>>>> -I/usr/include/capstone -I/usr/include/glib-2.0
>>>> -I/usr/lib64/glib-2.0/include -I/usr/include/libmount
>>>> -I/usr/include/blkid -I/usr/include/gio-unix-2.0
>>>> -I/usr/include/libusb-1.0 -I/usr/include/vte-2.91
>>>> -I/usr/include/pango-1.0 -I/usr/include/harfbuzz
>>>> -I/usr/include/freetype2 -I/usr/include/libpng16
>>>> -I/usr/include/fribidi -I/usr/include/libxml2 -I/usr/include/cairo
>>>> -I/usr/include/pixman-1 -I/usr/include/gtk-3.0
>>>> -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/atk-1.0
>>>> -I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0
>>>> -I/usr/lib64/dbus-1.0/include -I/usr/include/at-spi-2.0
>>>> -I/usr/include/virgl -I/usr/include/p11-kit-1 -I/usr/include/SDL2
>>>> -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4
>>>> -I/usr/include/slirp -fdiagnostics-color=auto -pipe -Wall
>>>> -Winvalid-pch -Werror -std=gnu99 -O2 -g -isystem
>>>> /home/cborntra/REPOS/qemu/linux-headers -isystem linux-headers -iquote
>>>> . -iquote /home/cborntra/REPOS/qemu -iquote
>>>> /home/cborntra/REPOS/qemu/include -iquote
>>>> /home/cborntra/REPOS/qemu/disas/libvixl -iquote
>>>> /home/cborntra/REPOS/qemu/tcg/s390 -iquote
>>>> /home/cborntra/REPOS/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE
>>>> -D_FORTIFY_SOURCE=2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
>>>> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
>>>> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
>>>> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
>>>> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
>>>> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
>>>> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
>>>> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC
>>>> -DSTRUCT_IOVEC_DEFINED -D_REENTRANT -Wno-undef -D_DEFAULT_SOURCE
>>>> -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -MD -MQ
>>>> libcommon.fa.p/hw_intc_i8259.c.o -MF
>>>> libcommon.fa.p/hw_intc_i8259.c.o.d -o libcommon.fa.p/hw_intc_i8259.c.o
>>>> -c ../hw/intc/i8259.c
>>>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>>>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in
>>>> this function [-Werror=maybe-uninitialized]
>>>>     203 |         irq = irq2 + 8;
>>>>         |         ~~~~^~~~~~~~~~
>>>> cc1: all warnings being treated as errors
>>>>
>>>> Due to other compile warnings I find this hard to bisect. Has anyone
>>>> seen this as well?
>>>
>>> I've never seen this warnings so far... which compiler version is this?
>>> Looking at the code, it seems to be a false positive to me.
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg599522.html
> 
> Oh, well, I completely forgot about that one ... but that was with -O3 ... interesting that it now occurs with -O2, too!
> 
> But even after staring at the code for a while, I cannot see how irq2 may not be initialized here ... so this really rather sounds like a compiler bug to me...

Its not a bug, its part of the nature for "may be" warnings. The compiler cannot figure out.

  anyway, we could simply silence it by pre-initializing the variable to -1 or so?

I can certainly spin up a patch with -1.


