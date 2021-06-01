Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9476639736F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 14:41:15 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo3hq-0004OY-5Y
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 08:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lo3fk-0002tv-8F; Tue, 01 Jun 2021 08:39:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38998
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lo3fi-0003BC-3F; Tue, 01 Jun 2021 08:39:03 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151CXfBP063456; Tue, 1 Jun 2021 08:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EtVPRJpokcJqF65cSL2OPW1dXK0fOHetO7koClzcKJ4=;
 b=euQApOndM7rj0cAOJmhGuqoYpfjjkPUizDEFmRhg6OSQr6Lb2nDl2UyVRMj1673mUpGa
 9U345YZrG7udXWNw7gIEYPQBABsrfoM75RSKIySXWjMuApx4+jg48cAIZTJ5gu2GKFEP
 bu5UfcIg52O7Jzjl8J3tnWWukJebsGQbikh761MWxM1nszVfZVS4OhQ64Oy9qjLkl6B4
 rQgQnGh8YlHe7v1s1uWGEFzgBK3VILSYDgBqB3t1G1Po4r3gYI2eQ7Sq81Exle+8sq1M
 IeNfaj7PCngTobyXX1msEIh+qNlbRGj+tBOKOj0TL0ZFQXWHiYRqlKy6iB1LaPKPer9u lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wmucge81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 08:38:58 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 151CXifF063738;
 Tue, 1 Jun 2021 08:38:57 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wmucge7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 08:38:57 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151Cb413007675;
 Tue, 1 Jun 2021 12:38:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 38ucvh8xfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 12:38:55 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151Ccqwj24510814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 12:38:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 196D3A4055;
 Tue,  1 Jun 2021 12:38:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B24EEA404D;
 Tue,  1 Jun 2021 12:38:51 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 12:38:51 +0000 (GMT)
Message-ID: <0afc20739d40f00f1ebbe29f37817b2daf328f3c.camel@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] target/s390x: Fix SIGILL psw.addr reporting
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Cornelia Huck
 <cohuck@redhat.com>
Date: Tue, 01 Jun 2021 14:38:51 +0200
In-Reply-To: <20210521111908.2843735-1-iii@linux.ibm.com>
References: <20210521111908.2843735-1-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: afAFQpfZfBY_Z4CGGkeX1YNttvspaEvs
X-Proofpoint-ORIG-GUID: x1vgNxAkKZb5JMUreoZbwRWFzA7VjfhE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_06:2021-05-31,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=997
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-05-21 at 13:19 +0200, Ilya Leoshkevich wrote:
> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
> should be a pointer to the instruction following the illegal
> instruction, but at the moment it is a pointer to the illegal
> instruction itself. This breaks OpenJDK, which relies on this value.
> 
> Patch 1 fixes the issue, patch 2 adds a test.
> 
> v1:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
> v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
>           magic in the test and add an explanation (David).
> 
> Ilya Leoshkevich (2):
>   target/s390x: Fix SIGILL psw.addr reporting
>   tests/tcg/s390x: Test SIGILL handling
> 
>  linux-user/s390x/cpu_loop.c     |  6 ++-
>  target/s390x/excp_helper.c      | 69 ++++++++++++++++++-------------
> --
>  target/s390x/internal.h         |  1 +
>  tests/tcg/s390x/Makefile.target |  1 +
>  tests/tcg/s390x/sigill.c        | 52 +++++++++++++++++++++++++
>  5 files changed, 96 insertions(+), 33 deletions(-)
>  create mode 100644 tests/tcg/s390x/sigill.c

Hi,

Is there anything I need to do to have this merged?

Regarding the style checker warning: I could move the function
declaration to a separate header, but from my perspective this would
make the test less readable.

Best regards,
Ilya


