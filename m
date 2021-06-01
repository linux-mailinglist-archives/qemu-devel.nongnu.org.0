Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5A397749
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:54:33 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6iu-0002FR-5N
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lo6gw-0000Dy-69; Tue, 01 Jun 2021 11:52:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lo6gt-0003Su-Id; Tue, 01 Jun 2021 11:52:29 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151FYRFS126371; Tue, 1 Jun 2021 11:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xHlPif6iTS2BRO2Gk0mKe9gd5MVX/QBxyWYTzwXe6Ns=;
 b=A2YcRPfopzyR3qPXFYQuTk+uELX9hjuTVHpfBWqwu0KHLWRmWBJP75DpsC/cfLllWzMA
 y6pqf9t+K865M06x+aWmtaBDb4kcI9SInrCrEhVYyOxvukXMOpUnzjgJdt9eNpwx+uOd
 8QCNFUNHp3vI/P5KX6HnSiIub7lZ6xr/82MLLV9pPZhc4vPoB8oTldHwDnfTHxj2VWD5
 gXFXz+m7oTHxXON+BGbHvPri9khte/vE0Q8ycfdUwbjF6Cm5EZFj2z/ZJ8P4cnRalgXM
 CqC+2SWjfuQq41JJJ1AvSafpIE9q4QRQgR4k1t7QV2JIc74O7+ZstYApADYJsZE4W/wq /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38wqkrgmsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 11:52:24 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 151FYXam127157;
 Tue, 1 Jun 2021 11:52:24 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38wqkrgmrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 11:52:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151FmWVO031850;
 Tue, 1 Jun 2021 15:52:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 38ud889twa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 15:52:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 151Fpmra28311852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 15:51:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B7EF42041;
 Tue,  1 Jun 2021 15:52:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D75142042;
 Tue,  1 Jun 2021 15:52:18 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 15:52:18 +0000 (GMT)
Message-ID: <e30c01a0dbe2fc3373b01797a3a97d8a64cda45c.camel@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] target/s390x: Fix SIGILL psw.addr reporting
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Cornelia Huck
 <cohuck@redhat.com>
Date: Tue, 01 Jun 2021 17:52:17 +0200
In-Reply-To: <0afc20739d40f00f1ebbe29f37817b2daf328f3c.camel@linux.ibm.com>
References: <20210521111908.2843735-1-iii@linux.ibm.com>
 <0afc20739d40f00f1ebbe29f37817b2daf328f3c.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tE42VzjUtT40CRpvM6KITGUjLdXlt7Q0
X-Proofpoint-ORIG-GUID: Sm4NYR344ScO_3o3gnMlDKt0O4sqazvg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_08:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106010105
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-06-01 at 14:38 +0200, Ilya Leoshkevich wrote:
> On Fri, 2021-05-21 at 13:19 +0200, Ilya Leoshkevich wrote:
> > qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
> > should be a pointer to the instruction following the illegal
> > instruction, but at the moment it is a pointer to the illegal
> > instruction itself. This breaks OpenJDK, which relies on this value.
> > 
> > Patch 1 fixes the issue, patch 2 adds a test.
> > 
> > v1:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
> > v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
> >           magic in the test and add an explanation (David).
> > 
> > Ilya Leoshkevich (2):
> >   target/s390x: Fix SIGILL psw.addr reporting
> >   tests/tcg/s390x: Test SIGILL handling
> > 
> >  linux-user/s390x/cpu_loop.c     |  6 ++-
> >  target/s390x/excp_helper.c      | 69 ++++++++++++++++++-------------
> > --
> >  target/s390x/internal.h         |  1 +
> >  tests/tcg/s390x/Makefile.target |  1 +
> >  tests/tcg/s390x/sigill.c        | 52 +++++++++++++++++++++++++
> >  5 files changed, 96 insertions(+), 33 deletions(-)
> >  create mode 100644 tests/tcg/s390x/sigill.c
> 
> Hi,
> 
> Is there anything I need to do to have this merged?
> 
> Regarding the style checker warning: I could move the function
> declaration to a separate header, but from my perspective this would
> make the test less readable.
> 
> Best regards,
> Ilya

I was just finalizing the similar series for SIGSEGV, when I
realized that the problem that it solves is actually caused by this
one. So please don't merge it yet (in case you were planning to), and
let me send a combined v3.

Best regards,
Ilya


