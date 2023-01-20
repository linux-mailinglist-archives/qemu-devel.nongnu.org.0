Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0796752D1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIp1Q-0007cH-LU; Fri, 20 Jan 2023 05:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pIp1O-0007aO-MW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:53:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pIp1M-0005l1-JP
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:53:22 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30KAosVn022536; Fri, 20 Jan 2023 10:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QapN04nTq14cZJ4IWTOPM34vIdBlTVg6uE1xvcwCBec=;
 b=ZiSwZ8Ag6sjhDlooKD6dwqcGaXO8MhLyA2vWCwYj/O8C9NICzkbaWN5l0vlScEVtHQFT
 4LPkE47acxwny8X5WlzUV4mqy6DByfHJ2SSDGaIBrsxT5q7P7ouZT6H1WEpAFNyQmKgF
 YocrSmGrTbqwfZigB/24GEhzfWEB8K0TYoQBIN692NwF6magMrD3rquNcokfDMo7mnUz
 zCyLu5kbJW7Seqsb40toBZNO5tZqCW+s6mVukZ5kxX5xer7cMUIik5/jw11Yj9LbJwSE
 +HNQARrtKqB1KBr8H2zJqP9kFS7xhrpR3sxfJyubOwgtXs6aoSdPVKcpD0yBzA2LskgI cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7sjfr1de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 10:53:17 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30KApdc3025358;
 Fri, 20 Jan 2023 10:53:17 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7sjfr1cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 10:53:17 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30K0Pbjd004825;
 Fri, 20 Jan 2023 10:53:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3n3m16dqr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 10:53:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30KArDXs45613542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Jan 2023 10:53:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12C1520043;
 Fri, 20 Jan 2023 10:53:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAEA120040;
 Fri, 20 Jan 2023 10:53:12 +0000 (GMT)
Received: from [9.171.3.141] (unknown [9.171.3.141])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 20 Jan 2023 10:53:12 +0000 (GMT)
Message-ID: <fd1b116ac19feaaebbf82f8e41a24883af81f851.camel@linux.ibm.com>
Subject: Re: [PULL 0/5] tcg patch queue
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Date: Fri, 20 Jan 2023 11:53:12 +0100
In-Reply-To: <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
 <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pVhL0HQRx9qtE9Cxhh2bEswgZtq6WVP9
X-Proofpoint-ORIG-GUID: fCHhdxVn1lixK00ahekMKGengdZPvm-E
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_07,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200090
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

On Fri, 2023-01-20 at 10:41 +0100, Thomas Huth wrote:
> On 16/01/2023 23.36, Richard Henderson wrote:
> > The following changes since commit
> > fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:
> >=20
> > =C2=A0=C2=A0 tests/qtest/qom-test: Do not print tested properties by de=
fault
> > (2023-01-16 15:00:57 +0000)
> >=20
> > are available in the Git repository at:
> >=20
> > =C2=A0=C2=A0 https://gitlab.com/rth7680/qemu.git=C2=A0tags/pull-tcg-202=
30116
> >=20
> > for you to fetch changes up to
> > 61710a7e23a63546da0071ea32adb96476fa5d07:
> >=20
> > =C2=A0=C2=A0 accel/tcg: Split out cpu_exec_{setjmp,loop} (2023-01-16 10=
:14:12
> > -1000)
> >=20
> > ----------------------------------------------------------------
> > - Reorg cpu_tb_exec around setjmp.
> > - Use __attribute__((target)) for buffer_is_zero.
> > - Add perfmap and jitdump for perf support.
> >=20
> > ----------------------------------------------------------------
> > Ilya Leoshkevich (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-user: Clean up when exiting =
due to a signal
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accel/tcg: Add debuginfo support
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg: add perfmap and jitdump
> >=20
> > Richard Henderson (2):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 util/bufferiszero: Use __attribute=
__((target)) for
> > avx2/avx512
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accel/tcg: Split out cpu_exec_{set=
jmp,loop}
>=20
> =C2=A0 Hi Richard, hi Ilya,
>=20
> with the recent QEMU master branch (commit 701ed34), I'm now seeing
> failures=20
> in Travis:
>=20
> =C2=A0 https://app.travis-ci.com/github/huth/qemu/jobs/593786529#L14411
>=20
> Everything was still fine a couple of days ago (commit fb7e799):
>=20
> =C2=A0 https://app.travis-ci.com/github/huth/qemu/builds/259755664
>=20
> ... so it seems this is likely related to this pull request. Could
> you=20
> please have a look?
>=20
> =C2=A0 Thanks,
> =C2=A0=C2=A0 Thomas
>=20

I would expect this to be (temporarily) fixed by [1], but we probably
don't set GITLAB_CI in Travis. Would it make sense to set it?=C2=A0It looks
as if this variable is currently used only to skip certain tests.

If not, then maybe split it into QEMU_CI, GITLAB_CI and TRAVIS_CI?

https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04438.html

