Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDB5646288
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:42:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p31EE-0001jo-H8; Wed, 07 Dec 2022 15:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p31EB-0001he-7z
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:41:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p31E4-0005MO-4I
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:41:11 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7IHm7B014073; Wed, 7 Dec 2022 20:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=GcfHFoziaveJVp61ZWPu/nt5c2eBq46791JLkIhC7Lo=;
 b=hfp45FUiexkRl3UTlC491hbbSlCCGcTmiPmrMc8wRIatr3Z81PB/K0kQ9kjrHkK51Ygy
 F/PHQspe/3uNJI5dcCvQsQOSnRFpb5OuR/S1fiCcvIWbNDlbu+K5LyVCLYQZwP5ryOWm
 20CQTb3oxfqTD4VrL0Ug3QCtJEH9oWuBvzozGcd+8xTCsqqONs+dhGukUByD6bkcvkRW
 fajqj1G+kmyWMJ2cRBNOSmRITpTGCu26OJnI0wjX0jmzhxrEK5UyQwTGdw0oGnoef1vV
 JzBA7oVHzd+L9zNMaB0uKtOaAMsbdznjCo5KF9ZGwF1snx5GWkhRWsTB+c6s+Hzc14Y+ YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mb0023bsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 20:41:03 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B7KLdob017205;
 Wed, 7 Dec 2022 20:41:03 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mb0023bs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 20:41:03 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7HHtPu016511;
 Wed, 7 Dec 2022 20:41:01 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3m9m5y3e2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 20:41:00 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B7KewM742139932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Dec 2022 20:40:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73CF120043;
 Wed,  7 Dec 2022 20:40:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E77820040;
 Wed,  7 Dec 2022 20:40:58 +0000 (GMT)
Received: from [9.171.70.83] (unknown [9.171.70.83])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  7 Dec 2022 20:40:58 +0000 (GMT)
Message-ID: <1fdded318cbe47fb03b6b476b294afc75bf17d09.camel@linux.ibm.com>
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Thomas Huth
 <thuth@redhat.com>, qemu-devel@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Date: Wed, 07 Dec 2022 21:40:57 +0100
In-Reply-To: <3ab2945a-c54b-d806-0316-efcf26c91814@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
 <20221206192947.fi6c3ftrueuiqmch@heavy>
 <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
 <f035fe38-44ed-6045-b948-d5fcd0dfafd7@redhat.com>
 <3ab2945a-c54b-d806-0316-efcf26c91814@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cG1ZCgThBdPwKX9excN2oM3m1IJTubus
X-Proofpoint-GUID: N2iCSvnOVFSe9a32geXps-GScEkE9CBc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_09,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxlogscore=978 malwarescore=0 bulkscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070172
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

On Wed, 2022-12-07 at 08:55 -0600, Richard Henderson wrote:
> On 12/7/22 01:45, Thomas Huth wrote:
> > On 06/12/2022 23.22, Richard Henderson wrote:
> > > On 12/6/22 13:29, Ilya Leoshkevich wrote:
> > > > This change doesn't seem to affect that, but what is the
> > > > minimum
> > > > supported s390x qemu host? z900?
> > >=20
> > > Possibly z990, if I'm reading the gcc processor_flags_table[]
> > > correctly;=20
> > > long-displacement-facility is definitely a minimum.
> > >=20
> > > We probably should revisit what the minimum for TCG should be,
> > > assert those features at=20
> > > startup, and drop the corresponding runtime tests.
> >=20
> > If we consider the official IBM support statement:
> >=20
> > https://www.ibm.com/support/pages/system/files/inline-files/IBM%20Mainf=
rame%20Life%20Cycle%20History%20V2.10%20-%20Sept%2013%202022_1.pdf
> >=20
> > ... that would mean that the z10 and all older machines are not
> > supported anymore.
>=20
> Thanks for the pointer.=C2=A0 It would appear that z114 exits support at
> the end of this month,=20
> which would leave z12 as minimum supported cpu.
>=20
> Even assuming z196 gets us extended-immediate, general-insn-
> extension, load-on-condition,=20
> and distinct-operands, which are all quite important to TCG, and
> constitute almost all of=20
> the current runtime checks.
>=20
> The other metric would be matching the set of supported cpus from the
> set of supported os=20
> distributions, but I would be ready to believe z196 is below the
> minimum there too.
>=20
>=20
> r~

I think it should be safe to raise the minimum required hardware for
TCG to z196:

* The oldest supported RHEL is v7, it requires z196:

https://access.redhat.com/product-life-cycles/
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/ht=
ml/installation_guide/chap-installation-planning-s390

* The oldest supported SLES is v12, it requires z196:

https://www.suse.com/de-de/lifecycle/
https://documentation.suse.com/sles/12-SP5/html/SLES-all/cha-zseries.html

* The oldest supported Ubuntu is v16.04, it requires zEC12+:
https://wiki.ubuntu.com/S390X

Best regards,
Ilya

