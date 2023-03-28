Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66566CCD2A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:24:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phHiA-00013d-PZ; Tue, 28 Mar 2023 18:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1phHi7-00012t-Qf; Tue, 28 Mar 2023 18:22:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1phHi6-0000gT-2i; Tue, 28 Mar 2023 18:22:35 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SMKhmZ023206; Tue, 28 Mar 2023 22:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=vS53COY6NyhdxcTdCrj93euCvN1GU+/ymThrXwmmjEw=;
 b=pF6gj50aIs5fMmMY68g2wkQIg1URhoMYZT3masmg71l2XjFAPylQvYorYXQxwhya8qzY
 +0Gp/1AZrWmZrm8P+p82VuyCsSE0s2WgiQ1+V9jFnzBORA4paXW7MWu67KOHt3tLvmlF
 qeMtg1TbO0T2pRfk6a8uZ2/geFTvBQjKGA30EOs0Y/W8EFkSrBSP12AaynjtOLsZiYUu
 SG7+hf80G9K/3CjTh6yNmWutPxn2gjLxizkCdV0RlG9FaSJyT2ouup+puAwRuo6/EYco
 iVxeb8qkgWS8XHLSGTvW3JUUx8yfXK1W0W7H0l+3eh44BiU1XOwMED1VA4zBJV+rsBAV 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm8xvr0em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 22:21:20 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SMLImj024028;
 Tue, 28 Mar 2023 22:21:20 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm8xvr0e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 22:21:19 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SKOTxY002270;
 Tue, 28 Mar 2023 22:21:17 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3phrk6uqxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 22:21:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SMLEJe7537246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 22:21:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A7292005A;
 Tue, 28 Mar 2023 22:21:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AC0E20049;
 Tue, 28 Mar 2023 22:21:13 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.208.230])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 22:21:13 +0000 (GMT)
Message-ID: <07464c8f08535b5c6611135ffeda66c8b26ec46c.camel@linux.ibm.com>
Subject: Re: s390x TCG migration failure
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Juan Quintela
 <quintela@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, John Snow <jsnow@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Coiby Xu <Coiby.Xu@gmail.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>, Richard Henderson
 <richard.henderson@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, Eric Blake <eblake@redhat.com>, Eric Farman
 <farman@linux.ibm.com>
Date: Wed, 29 Mar 2023 00:21:13 +0200
In-Reply-To: <84eebff9-54b8-9354-5b48-822937af0405@redhat.com>
References: <20230207005650.1810-4-quintela@redhat.com>
 <20230324184129.3119575-1-nsg@linux.ibm.com>
 <84eebff9-54b8-9354-5b48-822937af0405@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J_TUOfJGwV-1c3AxevcSyO_YC1nDrl_T
X-Proofpoint-GUID: xPje86byYeLCm976xlh6rK1innXVPDAc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxlogscore=976 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280170
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
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

On Tue, 2023-03-28 at 15:01 +0200, Thomas Huth wrote:
> On 24/03/2023 19.41, Nina Schoetterl-Glausch wrote:
> > Hi,
> >=20
> > We're seeing failures running s390x migration kvm-unit-tests tests with=
 TCG.
> > Some initial findings:
> > What seems to be happening is that after migration a control block head=
er accessed by the test code is all zeros which causes an unexpected except=
ion.
> > I did a bisection which points to c8df4a7aef ("migration: Split save_li=
ve_pending() into state_pending_*") as the culprit.
> > The migration issue persists after applying the fix e264705012 ("migrat=
ion: I messed state_pending_exact/estimate") on top of c8df4a7aef.
>=20
>   Hi Nina,
>=20
> could you please open a ticket in the QEMU bug tracker and add the "8.0"=
=20
> label there, so that it correctly shows up in the list of things that sho=
uld=20
> be fixed before the 8.0 release?

https://gitlab.com/qemu-project/qemu/-/issues/1565

Not sure if I cannot add a label or if I overlooked how to.

