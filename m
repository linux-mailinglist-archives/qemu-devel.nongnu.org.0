Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25B3E036C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:36:08 +0200 (CEST)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBI07-0002yY-Vy
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBHz9-0001kP-R4
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:35:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBHz7-0008C1-TN
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:35:07 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174EXiWV171731; Wed, 4 Aug 2021 10:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=nO+zJQj9wjNZ6yG0O2WX4n+MwT7/B0JJwpAKp4ycuuY=;
 b=R5hORNkXswKBDYJe5n+QZGriF53gbBPJUpRpmcVTlSNxGnuUhju31N7t84mf1CLzIbSH
 +hEDLg0Lr0ODkyq3yd2qk3FHKK3VE3vui9KZ9NzdUsJXQnhpoRWkFLMzVC43MECDwt0Y
 P3cpYPk0WW908VgQxBef3JwTEhwgUVRDFOjVW7nD648+9kXiTP0d2+dY/VK+i1QM9Fsb
 rMI7qQAYiQUWBGUkga8Hf2rYFs56mfPJxc9s+pYD0nsRfGHOBwiOAvhx6UHsIJ/0nP+G
 VgODrRV3rosFvAKzzoMwV8t68g9xIOPm1ApZyArJbcdo0wcmF82i6n95GlewpMxkS9BQ DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a733k2knr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 10:35:03 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 174EY30c174414;
 Wed, 4 Aug 2021 10:35:02 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a733k2kmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 10:35:02 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 174EXWvt001008;
 Wed, 4 Aug 2021 14:35:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3a4wshse0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 14:35:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 174EW2Dg23724454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Aug 2021 14:32:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1676A4055;
 Wed,  4 Aug 2021 14:34:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 695B8A405F;
 Wed,  4 Aug 2021 14:34:57 +0000 (GMT)
Received: from sig-9-145-77-113.uk.ibm.com (unknown [9.145.77.113])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Aug 2021 14:34:57 +0000 (GMT)
Message-ID: <87dc724076a7d1168d9c70856c54c39d9a11bc93.camel@linux.ibm.com>
Subject: Cross-thread code patching and qemu-x86_64
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: qemu-devel@nongnu.org
Date: Wed, 04 Aug 2021 16:34:57 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WgRM2eAt4Sz03lA81kdwTHmO99VE4ncU
X-Proofpoint-GUID: Tfr52rrjP8TLh0Ow7GX5V-Zlf56s5Sbt
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_03:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108040081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm trying to run a .NET app with qemu-x86_64 on a s390x host. With a
few fixes posted earlier it works for a while and then crashes like
this:

(gdb) x/8i $pc-6  
   0x3f8ab23ef8:	jmpq   0x3f87d2c5e0
   0x3f8ab23efd:	pop    %rdi
=> 0x3f8ab23efe:	sub    (%rdx),%al
   0x3f8ab23f00:	callq  0x400143a300 <PrecodeFixupThunk>
   0x3f8ab23f05:	pop    %rsi
   0x3f8ab23f06:	sub    $0x1,%al
   0x3f8ab23f08:	callq  0x400143a300 <PrecodeFixupThunk>
   0x3f8ab23f0d:	pop    %rsi

Here is what I think happens based on the .NET code:

https://github.com/dotnet/coreclr/blob/v3.1.5/src/vm/i386/stublinkerx86.h#L604
https://github.com/dotnet/coreclr/blob/v3.1.5/src/vm/i386/stublinkerx86.cpp#L6622

their design docs:

https://github.com/dotnet/coreclr/blob/master/Documentation/botr/method-descriptor.md#precode

and my core file of course :-)

At 0x3f8ab23ef8 we used to have `callq PrecodeFixupThunk`, which was
patched into a jmp using `f0 48 0f b1 13   lock cmpxchg %rdx,(%rbx)` in
another thread. Shortly before that current thread's disas_insn()
fetched the call opcode and shortly after that it fetched the jmp
offset, resulting in an inconsistent translation.

The following supports this theory:

(gdb) p/x $rdi
0x3f8ac5a25b
(gdb) x/2a $rsp - 16
0x405e52c6c0:	0x3f8ab23efd	0x3f8ac5a25b
                ^^^ return addr ^^^ $rdi

We have a return address 0x3f8ab23efd on stack, which means that a call
was executed. However, PrecodeFixupThunk does not return, so it must
have used the jmp's offset.

I wonder if my analysis is correct, and if yes, then what can be done
about it? I considered doing atomic loads in disas_insn() or adding a
memcmp() to the beginning of each basic block, but all that looked
slow, complex and fragile.

P.S. I asked about this on IRC first, so putting everyone who answered
there on CC.

Best regards,
Ilya


