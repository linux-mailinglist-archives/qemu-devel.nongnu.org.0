Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB944D68DD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:02:32 +0100 (CET)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSkX1-0007SG-6o
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSkVq-0006kS-4T; Fri, 11 Mar 2022 14:01:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSkVn-0003Y1-Un; Fri, 11 Mar 2022 14:01:17 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BHrcv2027730; 
 Fri, 11 Mar 2022 19:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=jXK7BbyWTY4TWIRGff5gZIKzz1/sOc7UBGbtxEXnsmo=;
 b=Chstoq7ziUVFvLX9k6wO40Ub4sdzDOjM9qKiv0KIfqDRPg1Xh4hzVczOxnYh99vESuVR
 J6JGKWYnYUKIhs3jRq2pMucyqrZ3pfBhYuphOA3V65K/fnplPrkN5oHkY0YKVf4sphfj
 UCUPrdN3JvNZ4U5vTWWtu7TY0k50JGuZjzcJGNlapGQfAkuDkYBclV1gCvpNtvRVRHuV
 wKjkdrW5mTN3twyBgbNDL+7FJkrbnkKMnhb3YxNu0ObBB/HnrWbQfE7BhvdLoBmn9w5U
 1hSi18UP5S7LH5/I1bZdO9Hnj7zIzxWc6cb6YrTXj6vLT2Y1IOKCzjnxj441pfnA1a34 OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqsgmvust-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 19:01:12 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22BIuAph017202;
 Fri, 11 Mar 2022 19:01:12 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqsgmvur7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 19:01:12 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22BIwVmh032310;
 Fri, 11 Mar 2022 19:01:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3epyswc9j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 19:01:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22BJ17rZ37486968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 19:01:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D35611C04A;
 Fri, 11 Mar 2022 19:01:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21A9011C054;
 Fri, 11 Mar 2022 19:01:06 +0000 (GMT)
Received: from [9.171.29.97] (unknown [9.171.29.97])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Mar 2022 19:01:06 +0000 (GMT)
Message-ID: <2720c32beaa3db66c72328f9b0c70a84b52c59f2.camel@linux.ibm.com>
Subject: Re: [PATCH 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Thomas
 Huth <thuth@redhat.com>
Date: Fri, 11 Mar 2022 20:01:05 +0100
In-Reply-To: <9bdc726e-fbf9-3507-39f0-0b3c2d73ef07@redhat.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
 <20220311184911.557245-4-iii@linux.ibm.com>
 <9bdc726e-fbf9-3507-39f0-0b3c2d73ef07@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: --lwFoSZsy_QSH3aasp1n8kO1qN7iSaW
X-Proofpoint-GUID: VrMLFauy7qm40X0ZbPZt5ssFw16LtRtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_07,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=862
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110091
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-03-11 at 19:57 +0100, David Hildenbrand wrote:
> On 11.03.22 19:49, Ilya Leoshkevich wrote:
> > Add a small test in order to prevent regressions.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  tests/tcg/s390x/Makefile.target        |  1 +
> >  tests/tcg/s390x/branch-relative-long.c | 29
> > ++++++++++++++++++++++++++
> >  2 files changed, 30 insertions(+)
> >  create mode 100644 tests/tcg/s390x/branch-relative-long.c
> > 
> > diff --git a/tests/tcg/s390x/Makefile.target
> > b/tests/tcg/s390x/Makefile.target
> > index 257c568c58..fd34b130f7 100644
> > --- a/tests/tcg/s390x/Makefile.target
> > +++ b/tests/tcg/s390x/Makefile.target
> > @@ -15,6 +15,7 @@ TESTS+=mvc
> >  TESTS+=shift
> >  TESTS+=trap
> >  TESTS+=signals-s390x
> > +TESTS+=branch-relative-long
> >  
> >  ifneq ($(HAVE_GDB_BIN),)
> >  GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
> > diff --git a/tests/tcg/s390x/branch-relative-long.c
> > b/tests/tcg/s390x/branch-relative-long.c
> > new file mode 100644
> > index 0000000000..b9fcee9873
> > --- /dev/null
> > +++ b/tests/tcg/s390x/branch-relative-long.c
> > @@ -0,0 +1,29 @@
> > +#include <assert.h>
> > +#include <stddef.h>
> > +#include <sys/mman.h>
> > +
> > +int main(void)
> > +{
> > +    const unsigned short opcodes[] = {
> > +        0xc005,  /* brasl %r0 */
> > +        0xc0f4,  /* brcl 0xf */
> > +    };
> > +    size_t length = 0x100000006;
> > +    unsigned char *buf;
> > +    int i;
> > +
> > +    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
> > +               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > +    assert(buf != MAP_FAILED);
> > +
> > +    *(unsigned short *)&buf[0] = 0x07fe;  /* br %r14 */
> > +    *(unsigned int *)&buf[0x100000002] = 0x80000000;
> > +    for (i = 0; i < sizeof(opcodes) / sizeof(opcodes[0]); i++) {
> > +        *(unsigned short *)&buf[0x100000000] = opcodes[i];
> > +        ((void (*)(void))&buf[0x100000000])();
> > +    }
> 
> Hmmm, can't we write some "nice" inline asm instead?
> 
> 

If we do this in a straightforward way, then the resulting binary will
be 4G large.

But maybe there is a way to play games with sections, I'll need to
think about it.

