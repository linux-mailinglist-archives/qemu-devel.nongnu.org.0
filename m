Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C30644257
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 12:45:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2WN1-0007Rb-8a; Tue, 06 Dec 2022 06:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p2WMw-0007Nh-Ti; Tue, 06 Dec 2022 06:44:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p2WMr-0008H3-73; Tue, 06 Dec 2022 06:44:14 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6ALHlZ024167; Tue, 6 Dec 2022 11:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=7PG1M6M88p+I0ngYYbwCgFy6NzTm+nBYPmWkz17nmTc=;
 b=ONwG52SSfIhRvdksgomIWji9DF4Of2vZaezNW7iyWS3NXD0e5ykGt8tdJQ96GDu6Dzzu
 UFonK6AivmRf8Fkkw1WPl+xl3tz0CfcRXJFGk6+qvRqSYNEtZYadC+ohglmTaoEwyWet
 AGnAEHWrwHoUpKrCNtW5x0Ar0CVIk9/SpZwr1ObLO4dYzY/Wf1ODvjgG7Q7DIjjBlTTr
 7wl6yjH5Zz2l84tvSCFHPBmllkzweCnllX3YWBGCRSGiNk3TKkx9iAIhE2p+BnkjNzXC
 X++jYpAnh6+oHkdJjeZ1Uqe0e4Zj5VrWOC2iPefs0T3+18KA5EGdvncEm0gRRWQEzXgH CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8g7djt1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 11:44:03 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6ARU5q031554;
 Tue, 6 Dec 2022 11:44:03 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8g7djt0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 11:44:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B5K5C0H008091;
 Tue, 6 Dec 2022 11:44:00 GMT
Received: from smtprelay08.fra02v.mail.ibm.com ([9.218.2.231])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3m9ktqgy32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 11:44:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com ([9.149.105.59])
 by smtprelay08.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6Bhwge26411278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 11:43:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1756CA4040;
 Tue,  6 Dec 2022 11:43:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7818A404D;
 Tue,  6 Dec 2022 11:43:57 +0000 (GMT)
Received: from [9.171.16.157] (unknown [9.171.16.157])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Dec 2022 11:43:57 +0000 (GMT)
Message-ID: <b108e8feba64ca50dc21ae3cd1ea7096f8fca51e.camel@linux.ibm.com>
Subject: Re: [PATCH for-8.0] target/s390x: The MVCP and MVCS instructions
 are not privileged
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org
Date: Tue, 06 Dec 2022 12:43:57 +0100
In-Reply-To: <20221205125852.81848-1-thuth@redhat.com>
References: <20221205125852.81848-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0U11SenPnYM8bz-tgLdWpXTyaGqO2wxJ
X-Proofpoint-ORIG-GUID: SBbeJUKzPC9pvVH_sRgxM30Vyuarzxv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_07,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=655
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060097
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

On Mon, 2022-12-05 at 13:58 +0100, Thomas Huth wrote:
> The "MOVE TO PRIMARY/SECONDARY" instructions can also be called
> from problem state. We just should properly check whether the
> secondary-space access key is valid here, too, and inject a
> privileged program exception if it is invalid.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
> =C2=A0Found only by code inspection - I'm not aware yet of any problem
> =C2=A0in the wild due to this bug.
>=20
> =C2=A0target/s390x/helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0target/s390x/tcg/insn-data.h.inc |=C2=A0 4 ++--
> =C2=A0target/s390x/tcg/mem_helper.c=C2=A0=C2=A0=C2=A0 | 16 ++++++++++++--=
--
> =C2=A0target/s390x/tcg/translate.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++=
--
> =C2=A04 files changed, 20 insertions(+), 10 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

