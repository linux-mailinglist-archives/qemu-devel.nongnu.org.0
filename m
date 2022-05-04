Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36549519B39
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:11:29 +0200 (CEST)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmB2c-0007A1-Ev
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nmAzO-0005Bc-Qz; Wed, 04 May 2022 05:08:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nmAzM-0003fc-Px; Wed, 04 May 2022 05:08:06 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2448VeC5023424;
 Wed, 4 May 2022 09:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yiSdm8iVz6ALlzSLoPyLiRPrlU5kw6oB7emQE/O26js=;
 b=p+3ljG2ahkZFrdqeCLNngAdQoFS95q1heAG3BI5IkrcbvpPjOicG0i0entpOxPYvGvwg
 +KpcbT3pqHMtiQzpNOsabRGprYiQ9TWdEGPWlyE3B1lDSeoqGtwCla2+TBevSRhDNf5i
 AiPMfjpFUTL0E8PDd4PXlqSYi97886kQYS7UJgnG12Uv8GKhj1DE0C7Vd7aLiGeTMWuA
 OxNOFBzsst6X8Wby9VlOXIL1UkhlSaQP8Dc/xO9tEU87LezSyJl7Z2fS3SBF5iHTlaM3
 M4YlPMy8Sy6TulAkE1dAkGJfk9VXeqlgDXa3emUqZLcdB4Lt0qFFuT7Vt1HDJXC8DpNI Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fup2a8geh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 09:08:01 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24494dfh004300;
 Wed, 4 May 2022 09:08:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fup2a8gdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 09:08:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 244936La020316;
 Wed, 4 May 2022 09:07:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3ftp7ft6pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 09:07:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24497ujh36897128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 May 2022 09:07:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08AA84C046;
 Wed,  4 May 2022 09:07:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3B6A4C044;
 Wed,  4 May 2022 09:07:55 +0000 (GMT)
Received: from [9.171.50.79] (unknown [9.171.50.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 May 2022 09:07:55 +0000 (GMT)
Message-ID: <1c4e55e45a92250f93d7671b4f658e616fc1edce.camel@linux.ibm.com>
Subject: Re: [PATCH] tests/tcg/s390x: Use a different PCRel32 notation in
 branch-relative-long.c
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Date: Wed, 04 May 2022 11:07:55 +0200
In-Reply-To: <f7a77dcc-590c-96f5-8e92-5806f51ac0d4@redhat.com>
References: <20220502164830.1622191-1-iii@linux.ibm.com>
 <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
 <e71d638b-3c62-31db-1abd-02ba40042eab@redhat.com>
 <8543dc2de432c787770f9f01c448434ab1e30c63.camel@linux.ibm.com>
 <f7a77dcc-590c-96f5-8e92-5806f51ac0d4@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TPzeduIO_Ivc6q73YZOyZXkgEuMeyj1F
X-Proofpoint-ORIG-GUID: GUz74GHjlqO_MfDRuiDHmawRLLp2IlTo
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_02,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205040061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-05-04 at 09:01 +0200, Thomas Huth wrote:
> On 04/05/2022 00.46, Ilya Leoshkevich wrote:
> > On Tue, 2022-05-03 at 21:26 +0200, Thomas Huth wrote:
> > > On 03/05/2022 11.02, Thomas Huth wrote:
> > > > On 02/05/2022 18.48, Ilya Leoshkevich wrote:
> > > > > Binutils >=2.37 and Clang do not accept (. - 0x100000000)
> > > > > PCRel32
> > > > > constants. While this looks like a bug that needs fixing, use
> > > > > a
> > > > > different notation (-0x100000000) as a workaround.
> > > > > 
> > > > > Reported-by: Thomas Huth <thuth@redhat.com>
> > > > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > > > ---
> > > > >    tests/tcg/s390x/branch-relative-long.c | 4 ++--
> > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/tests/tcg/s390x/branch-relative-long.c
> > > > > b/tests/tcg/s390x/branch-relative-long.c
> > > > > index 94219afcad..8ce9f1c2e5 100644
> > > > > --- a/tests/tcg/s390x/branch-relative-long.c
> > > > > +++ b/tests/tcg/s390x/branch-relative-long.c
> > > > > @@ -13,8 +13,8 @@
> > > > >            #_name "_end:\n");
> > > > >    DEFINE_ASM(br_r14, "br %r14");
> > > > > -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
> > > > > -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
> > > > > +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
> > > > > +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
> > > > 
> > > > Works for me, thanks!
> > > 
> > > Sorry, I spoke too soon - it compiles fine, and also runs fine
> > > when I
> > > run it
> > > natively, but when I run it through "qemu-s390x", it crashes...
> > > does
> > > that
> > > work for you?
> > 
> > Hi, yes, I just double-checked - it works fine for me.
> > Could you please share the resulting test binary?
> 
> 
> Sure, here it is:
> 
> https://people.redhat.com/~thuth/data/branch-relative-long
> 
>   Thomas

Your binary worked fine for me.

QEMU commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947,
x86_64 host,
configured with --target-list=s390x-linux-user.

