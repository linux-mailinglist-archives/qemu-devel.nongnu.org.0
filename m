Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D96AE7F7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:10:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaov-0004je-9v; Tue, 07 Mar 2023 12:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pZaop-0004dT-II; Tue, 07 Mar 2023 12:09:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pZaon-0005TU-5K; Tue, 07 Mar 2023 12:09:43 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327GC7HS027216; Tue, 7 Mar 2023 17:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=fMO3kL809EEzXt3V9/EV5+HskRBnH3UK8a9JKuYf3D8=;
 b=TESLM6vKrrP0eJ6X3kQqlxHrwoiQ7SOJ9oiPhhk3BRS3fTJRIpsULIr04t1mYt4xuRdW
 Wez7fsElZtXQ8wi5O3u0gE+4bEeVH4PjpqUYCezeViBfWbvRG5noqnOeH4EZQWF1LyIl
 rl3du8T6EoNjioIr6+I4lEVZTqxExZlbp1lh1BMJAf26xWAAZsCuMYTj3k2M39XvQRV6
 G3nO8SgCINFW8yVkORLE+5lxnRjty4D27LVMt7undKgVUsGEcV4/yxO/iyojN9u/Q8AJ
 jdP5Wl6z9CEFk7lrhMWSkqJKOl1/2+9qheMnYAsAGjway6Nxt2HYU5bGpTfrgOHnOJ5K 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p68k21khy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 17:09:36 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327GWBNL019635;
 Tue, 7 Mar 2023 17:09:36 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p68k21kh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 17:09:36 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 327H2h3V010170;
 Tue, 7 Mar 2023 17:09:35 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3p419ecb6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 17:09:34 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 327H9Xl47865044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Mar 2023 17:09:33 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27B0A58051;
 Tue,  7 Mar 2023 17:09:33 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5783A5805C;
 Tue,  7 Mar 2023 17:09:32 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.160.17.144]) by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  7 Mar 2023 17:09:32 +0000 (GMT)
Message-ID: <04f940dd7f0e5540fb1cb0d1fb8be1c95f797695.camel@linux.ibm.com>
Subject: Re: [RESEND PATCH 1/1] pc-bios: Add support for List-Directed IPL
 from ECKD DASD
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 jjherne@linux.ibm.com, frankja@linux.ibm.com, Christian Borntraeger
 <borntraeger@de.ibm.com>
Cc: jrossi@linux.ibm.com, qemu-devel@nongnu.org
Date: Tue, 07 Mar 2023 12:09:31 -0500
In-Reply-To: <9739da85-adf2-cf33-15c8-6107aaf6b814@redhat.com>
References: <20230221174548.1866861-1-jrossi@linux.ibm.com>
 <20230221174548.1866861-2-jrossi@linux.ibm.com>
 <9739da85-adf2-cf33-15c8-6107aaf6b814@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PewtK3dY_P4GM_QWZstV3gWlGa42YtvJ
X-Proofpoint-ORIG-GUID: fslUSL0EEl3Xk7wyhzBdMfNBrmzFK-aI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_12,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070153
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2023-03-03 at 13:38 +0100, Thomas Huth wrote:
> On 21/02/2023 18.45, jrossi@linux.ibm.com=C2=A0wrote:
> > From: Jared Rossi <jrossi@linux.ibm.com>
> >=20
> > Check for a List Directed IPL Boot Record, which would supersede
> > the CCW type
> > entries.=C2=A0 If the record is valid, proceed to use the new style
> > pointers
> > and perform LD-IPL. Each block pointer is interpreted as either an
> > LD-IPL
> > pointer or a legacy CCW pointer depending on the type of IPL
> > initiated.
> >=20
> > In either case CCW- or LD-IPL is transparent to the user and will
> > boot the same
> > image regardless of which set of pointers is used. Because the
> > interactive boot
> > menu is only written with the old style pointers, the menu will be
> > disabled for
> > List Directed IPL from ECKD DASD.
> >=20
> > If the LD-IPL fails, retry the IPL using the CCW type pointers.
> >=20
> > If no LD-IPL boot record is found, simply perform CCW type IPL as
> > usual.
> >=20
> > Signed-off-by: Jared Rossi <jrossi@linux.ibm.com>
> >=20
> > ---
> > =C2=A0 pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---=
-
> > -----
> > =C2=A0 pc-bios/s390-ccw/bootmap.h |=C2=A0 30 ++++++-
> > =C2=A0 2 files changed, 148 insertions(+), 39 deletions(-)
>=20
> =C2=A0 Janosch, Jason, Eric, Christian,
>=20
> could you please help with reviewing + testing this patch?

Thanks for the heads up, Thomas.

I've been using this on a z16 system with SE guests (with newer zipl to
actually write out LD-IPL data; something that should have been
mentioned here), and it seems to behave fine. I gave a quick glance
through the code, and while nothing jumped out at me this code is
rather opaque. I realize this is already queued by now but I'll still
go through it later this week so it gets another set of eyeballs.

Eric

