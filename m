Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E2E6B8F23
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:01:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1Rx-00089d-Dv; Tue, 14 Mar 2023 06:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pc1Rq-00088w-Vt; Tue, 14 Mar 2023 06:00:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pc1Rn-0001zt-G7; Tue, 14 Mar 2023 06:00:02 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E9EG0e004944; Tue, 14 Mar 2023 09:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=okFWpy6I/nAXfFfAeP7TzK7Qwh6z+aEjdVDq32OognI=;
 b=T9cSei9nExnmZAGiHQqblOPyLpHYyvVS4PjKFzTvRpYFCdUUvE2OLOziKL2trxwYPzBG
 XYPfKXILBEgh6jquy77kqB4HxfSINaXv4X3y32XoySR3I2M732qZ6pzQXeT9CDD6Cghd
 3kf2N+PkYq6dt/V2YsRDgcHEbNUn1nKj3G1wQkcg0buxxkJQV6ochsZlstJofjCpnrUw
 Q6SOTcuH7+C9lhsJi8q2EsCDN2Qr7KXfePRkCpcyHTmUf/cQmaHwzUDt7V/+T6HcTNJS
 CM9tJWUi6R96m+RtukM5nO+F4XpwdjT6EPg5e2of/YQbtubH1StsrOBgX+A6nmvrVdrP wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pap4996e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 09:59:42 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32E9lm2C037643;
 Tue, 14 Mar 2023 09:59:42 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pap4996d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 09:59:41 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32E9PrmJ007224;
 Tue, 14 Mar 2023 09:59:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3p8h96kknb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 09:59:39 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32E9xZGF41484768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 09:59:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D0CC20043;
 Tue, 14 Mar 2023 09:59:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 972562004D;
 Tue, 14 Mar 2023 09:59:34 +0000 (GMT)
Received: from [9.171.57.117] (unknown [9.171.57.117])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Mar 2023 09:59:34 +0000 (GMT)
Message-ID: <df39767ab4426803928c55b5414ee3a164115bda.camel@linux.ibm.com>
Subject: Re: [PATCH] s390x/gdb: Split s390-virt.xml
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>, Laurent Vivier
 <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>, Thomas Huth
 <thuth@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Date: Tue, 14 Mar 2023 10:59:34 +0100
In-Reply-To: <681f4bef-6beb-2e17-fe78-693506d97c66@linux.ibm.com>
References: <20230313211614.98739-1-iii@linux.ibm.com>
 <681f4bef-6beb-2e17-fe78-693506d97c66@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BcjGYNXewCpCSGauOPmyApaKq5t3XPQZ
X-Proofpoint-ORIG-GUID: yHMYXfU2G3zRO9BMUJy5hjoBpHJ4JYm8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_03,2023-03-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=799 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140082
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

On Tue, 2023-03-14 at 08:06 +0100, Christian Borntraeger wrote:
>=20
>=20
> Am 13.03.23 um 22:16 schrieb Ilya Leoshkevich:
> > TCG emulates ckc, cputm, last_break and prefix, and it's quite
> > useful
> > to have them during debugging.
>=20
> KVM provides those as well so I dont get what you are trying to do
> here. (I would understand moving out the pfault things into a KVM
> section)

The end result here is that ckc, cputm, last_break and prefix are
always available, and pp, pfault_token, pfault_select and
pfault_compare are available only with KVM.

I guess I chose the naming poorly, I will send a v2 with s390-virt.xml
containing common registers, and s390-virt-kvm.xml containing KVM-only
registers.
>=20

