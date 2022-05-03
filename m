Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EA1519256
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:31:02 +0200 (CEST)
Received: from localhost ([::1]:35756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1yv-0003Er-QE
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nm1I2-000457-F3; Tue, 03 May 2022 18:46:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nm1Hz-0000rz-Kq; Tue, 03 May 2022 18:46:41 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243LmWud031190;
 Tue, 3 May 2022 22:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=i9hTdPtlp1D7ZvF9dYU+OiO4TrCQ1rPs8kOoCqcmWqk=;
 b=q76F3XsnDQxaOV2LfnGoU7HvYBkI6XC2wsgaXHV/RshIeI3paIQ7LGVguapT7kYpzTvl
 ND5Dp0pLs8V8x7WgUciTjuCP8CkkP7VDDJOJihfdptDep6Nq7IXwrqj4hytYA4UyofDG
 WhBKRe71aIFwJK2b4Wgq6p3j8pMWpitM2yVbeco6o155ulnxAbFYcbg7cNgY+b/2suhb
 Y2G+8cXmB6uSPa1TnDVEm8e+NnwL7iqsiCfRU7UVZo/gJ3ia5cUSMG648RGdvUhjqAuX
 z+OudX/JJ73gWyw3cvQYh77dUpLVkEBDr/0V+feTRDajX26L8k16uJRJWDRApqImDqAg mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fucmurs6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:46:36 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 243Manx1010663;
 Tue, 3 May 2022 22:46:35 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fucmurs6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:46:35 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 243McYhC024649;
 Tue, 3 May 2022 22:46:33 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3fscdk35yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:46:33 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 243MkTZI17039620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 May 2022 22:46:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A3CFA4053;
 Tue,  3 May 2022 22:46:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2308A404D;
 Tue,  3 May 2022 22:46:30 +0000 (GMT)
Received: from [9.171.50.79] (unknown [9.171.50.79])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 May 2022 22:46:30 +0000 (GMT)
Message-ID: <8543dc2de432c787770f9f01c448434ab1e30c63.camel@linux.ibm.com>
Subject: Re: [PATCH] tests/tcg/s390x: Use a different PCRel32 notation in
 branch-relative-long.c
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Date: Wed, 04 May 2022 00:46:30 +0200
In-Reply-To: <e71d638b-3c62-31db-1abd-02ba40042eab@redhat.com>
References: <20220502164830.1622191-1-iii@linux.ibm.com>
 <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
 <e71d638b-3c62-31db-1abd-02ba40042eab@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vHVCj-MuMJUvqs8kuU_NuyINP6e2PC5P
X-Proofpoint-GUID: Lce7qSsR7QZpbQuni8uoaaz2kJAF-GAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_09,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030136
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 2022-05-03 at 21:26 +0200, Thomas Huth wrote:
> On 03/05/2022 11.02, Thomas Huth wrote:
> > On 02/05/2022 18.48, Ilya Leoshkevich wrote:
> > > Binutils >=2.37 and Clang do not accept (. - 0x100000000) PCRel32
> > > constants. While this looks like a bug that needs fixing, use a
> > > different notation (-0x100000000) as a workaround.
> > > 
> > > Reported-by: Thomas Huth <thuth@redhat.com>
> > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > ---
> > >   tests/tcg/s390x/branch-relative-long.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tests/tcg/s390x/branch-relative-long.c 
> > > b/tests/tcg/s390x/branch-relative-long.c
> > > index 94219afcad..8ce9f1c2e5 100644
> > > --- a/tests/tcg/s390x/branch-relative-long.c
> > > +++ b/tests/tcg/s390x/branch-relative-long.c
> > > @@ -13,8 +13,8 @@
> > >           #_name "_end:\n");
> > >   DEFINE_ASM(br_r14, "br %r14");
> > > -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
> > > -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
> > > +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
> > > +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
> > 
> > Works for me, thanks!
> 
> Sorry, I spoke too soon - it compiles fine, and also runs fine when I
> run it 
> natively, but when I run it through "qemu-s390x", it crashes... does
> that 
> work for you?

Hi, yes, I just double-checked - it works fine for me.
Could you please share the resulting test binary?

