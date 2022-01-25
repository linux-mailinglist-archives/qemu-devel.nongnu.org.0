Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5A49B82B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:07:40 +0100 (CET)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOM6-0007NZ-KM
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:07:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nCNDp-0000Cv-QR; Tue, 25 Jan 2022 09:55:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nCNDo-0003OV-4b; Tue, 25 Jan 2022 09:55:01 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PEjKeh035000; 
 Tue, 25 Jan 2022 14:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=N1Qk54U1eSkOzwn2pIF6xD2HsVBzVjZcFgE4DjKnI9I=;
 b=Qrua6aFUSTru7lD5ZEvbO6HB2zfVrMRIEn/Pe2nGWQyYnXY6+SEHuM+4e0c+MPnTwK00
 ztihVeImD/sleaqZnu1s1UJXz8kGho5x4IFh14QOXAznKI3uAjy2l6OBouKAZV1Nlwm0
 QGq1fl//oqEcGj957mcC8P9e1PGGGvKX5pv53t/m1gUFfBLvzP/VwfboRuTHop2/fLVr
 IF3v/rvQwFKuee6sFz9J+VVkMUf0R0x2QybpJ5/2kNu8oYZ3npvUB6Fbh/7uAMkRkmcu
 Es8jTMUS1drDWXleJTjQy4isTrfw9ETms4cc4DEaJ+cP/OTlY0QuEKDCmlJtK7XN8ijm og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dthxvt5vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 14:54:53 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20PElsSv004871;
 Tue, 25 Jan 2022 14:54:52 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dthxvt5va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 14:54:52 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PEljpd016422;
 Tue, 25 Jan 2022 14:54:52 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3dr9jav222-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 14:54:52 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PEso8822020568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 14:54:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC771BE059;
 Tue, 25 Jan 2022 14:54:50 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32326BE061;
 Tue, 25 Jan 2022 14:54:50 +0000 (GMT)
Received: from localhost (unknown [9.163.21.20])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 25 Jan 2022 14:54:49 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/5] target/ppc: powerpc_excp improvements [BookS] (4/n)
In-Reply-To: <6605f0a0-fcc4-44fa-1b94-397dd7ed554e@kaod.org>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
 <6605f0a0-fcc4-44fa-1b94-397dd7ed554e@kaod.org>
Date: Tue, 25 Jan 2022 11:54:47 -0300
Message-ID: <87pmofx3uw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6ma9ja3Ou8-OdQoq8hsrB239_KF6Mk_S
X-Proofpoint-ORIG-GUID: DWe2JwjrwlA3-XHKUYpmD4vyjKXsxZZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-25_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250094
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 1/24/22 19:46, Fabiano Rosas wrote:
>> This series splits the exception code for BookS CPUs: 970, POWER5+,
>> POWER7, POWER8, POWER9, POWER10. After dealing with the 405, let's go
>> back to something more familiar to give everyone a break.
>>=20
>> No upfront fixes this time. The pseries code gets used a lot, so there
>> are no obvious issues and the older BookS CPUs get the benefits by
>> default since they are similar.
>
> Super ! I think this series can go in directly. I would only change
> the name to book3s because it fits better the current naming in QEMU
> and Linux.

Not that it matters that much, but QEMU emulates Books I and II as well,
doesn't it?

Book I, Power ISA User Instruction Set Architecture,
covers the base instruction set and related facilities
available to the application programmer.

Book II, Power ISA Virtual Environment Architecture,
defines the storage model and other instructions and
facilities that enable the application programmer to cre-
ate multithreaded programs and programs that interact
with certain physical realities of the computing environ-
ment.

Book III, Power ISA Operating Environment Architec-
ture, defines the supervisor instructions and related
facilities.

Anyway, I'm OK with either name.

>
> Thanks,
>
> C.

