Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1C6813A7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVO9-00015G-Qd; Mon, 30 Jan 2023 09:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pMVNy-00012l-G8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:43:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pMVNw-0006fG-FR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:43:54 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UEGWs3009409; Mon, 30 Jan 2023 14:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lIyIc3I8eDyneoZTW23+aIOKLe7rjhOiN6PtMN/oo1w=;
 b=QChGbMuYCXqKh8D6sAC/PYpWpVZZAwqXrr51pcNkze4r6/fOpMBjisRnG68DUX0uMkKd
 nfkaSFaxxEE/bJUuKDNmOZnzkvnS21bt5Yf9lop+qPhY94wT7X4teoivMGJSzPICwTIM
 T6qyaY5wGSAhdl19ezGeHB9dIWivl6BXByLWddiFAuTGmsXGrFdOTL12QFE1cKVbN/0L
 DGzRmIVHqQDG1DtBmZSn8ialdyMkPfA7OVSYyNP+hfyG+FP43sPZiWMo5PEV7paXDoNV
 oyGJArJUL7zUNi2Jd4S0FMXxU4pRLVWLoT//LxHjxpb3zBxV5LFsIstakvGQ2i46W1qX bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nefgy0sjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 14:43:45 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UEGXnl009683;
 Mon, 30 Jan 2023 14:43:45 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nefgy0sj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 14:43:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30U5slkY026900;
 Mon, 30 Jan 2023 14:43:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ncvs7jc0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 14:43:43 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30UEhfit51642664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Jan 2023 14:43:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F06F320043;
 Mon, 30 Jan 2023 14:43:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA73B20040;
 Mon, 30 Jan 2023 14:43:40 +0000 (GMT)
Received: from [9.155.209.149] (unknown [9.155.209.149])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 30 Jan 2023 14:43:40 +0000 (GMT)
Message-ID: <d0954ad88ac09adafa29ea509afd4e80015de536.camel@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] accel/tcg: Add debuginfo support
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
Date: Mon, 30 Jan 2023 15:43:40 +0100
In-Reply-To: <c341f40c-59f6-754b-1323-b3343ee40cad@redhat.com>
References: <20230112152013.125680-1-iii@linux.ibm.com>
 <20230112152013.125680-3-iii@linux.ibm.com>
 <c341f40c-59f6-754b-1323-b3343ee40cad@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DVv9ux-ILOM_B2hEaaumc5xReYGI56N2
X-Proofpoint-ORIG-GUID: PqfMTk_QNLfN2taaoY4JAjdwFjCj-eqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_13,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300141
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 2023-01-30 at 15:33 +0100, Thomas Huth wrote:
> On 12/01/2023 16.20, Ilya Leoshkevich wrote:
> > Add libdw-based functions for loading and querying debuginfo. Load
> > debuginfo from the system and the linux-user loaders.
> >=20
> > This is useful for the upcoming perf support, which can then put
> > human-readable guest symbols instead of raw guest PCs into perfmap
> > and
> > jitdump files.
> >=20
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> ...
> > diff --git a/meson.build b/meson.build
> > index 175517eafde..cab8c67d961 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1648,6 +1648,12 @@ if libbpf.found() and not cc.links('''
> > =C2=A0=C2=A0=C2=A0 endif
> > =C2=A0 endif
> > =C2=A0=20
> > +# libdw
> > +libdw =3D dependency('libdw',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 method: 'pkg-config',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kwargs: static_kwargs,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required: false)
> > +
>=20
> =C2=A0 Hi,
>=20
> I recently did a build with "configure --without-default-features"
> and I=20
> noticed that this new libdw does not get disabled automatically
> there, which=20
> looks kind of weird. Is there a reason that there is no config knob
> here to=20
> disable it like we have it with all the other optional libraries that
> we=20
> support?
>=20
> =C2=A0 Thomas

Hi,

this sounds like an omission on my part - I'll have a look at this.

Best regards,
Ilya

