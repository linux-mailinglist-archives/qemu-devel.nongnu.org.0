Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997CA6E0CDD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:43:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmvMG-00055T-7t; Thu, 13 Apr 2023 07:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pmvMC-00054Z-4u; Thu, 13 Apr 2023 07:43:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pmvMA-0003hu-03; Thu, 13 Apr 2023 07:43:15 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33DAQpkF024658; Thu, 13 Apr 2023 11:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=L7Cz10jbtzD2Vx4HFgot7v0wAAh0ryfsWhpR2AGcMUA=;
 b=RPxuR9dZOqbSgSfJb/t9Y87tC83kxkUCOZWJSxEf9QCadntj3PUDgqjyuqH08uJFyrEc
 cypAobMzxPFM8NiN5WHJiHs/UsiPmFuca3KRzKqmXh2Ql+zhJ3jAuLszp0/CtqHNNdNj
 MXKFdyORVoADqupmYfuBYu5gbn+Q6/82+wFzo7rhIIN38oUd6AcBHlhf0Oy4TbGorOlA
 BVU18wCMrBoMtUNbdeEWl+Wxj/76IdJhcWkRHYU4Jb1yniqk5ozNVW0u/7Ojb8D5AQTT
 epzVvkjF0csNYboC6U1msL2xYgYnq839w+y8OuyWKV82YXuM4S4HkwmXxEsKXwCkXLRE bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxg07jrnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 11:42:58 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33DAThnA004913;
 Thu, 13 Apr 2023 11:42:57 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxg07jrm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 11:42:56 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33D3xECZ026645;
 Thu, 13 Apr 2023 11:42:54 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pu0fvtgxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 11:42:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33DBgo7x47251832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Apr 2023 11:42:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1123920043;
 Thu, 13 Apr 2023 11:42:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50F5E20040;
 Thu, 13 Apr 2023 11:42:49 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.152.224.238])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 13 Apr 2023 11:42:49 +0000 (GMT)
Message-ID: <fb6e5977faab9913cf284707396b4dc98c9d0b0b.camel@linux.ibm.com>
Subject: Re: s390x TCG migration failure
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Stefan Berger
 <stefanb@linux.vnet.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, Halil
 Pasic <pasic@linux.ibm.com>, John Snow <jsnow@redhat.com>, David
 Hildenbrand <david@redhat.com>, Fam Zheng <fam@euphon.net>, Thomas Huth
 <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Vladimir Sementsov-Ogievskiy
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
Date: Thu, 13 Apr 2023 13:42:49 +0200
In-Reply-To: <87mt3cn7aw.fsf@secure.mitica>
References: <20230207005650.1810-4-quintela@redhat.com>
 <20230324184129.3119575-1-nsg@linux.ibm.com> <87mt3cn7aw.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2UvLNv5fA2M1RF_sUDmHfNyGJkDu84HL
X-Proofpoint-GUID: oV6XRowDJO-3Dn40mfWvlBIJrQa0fN1f
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_07,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304130103
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
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

On Wed, 2023-04-12 at 23:01 +0200, Juan Quintela wrote:
> Nina Schoetterl-Glausch <nsg@linux.ibm.com> wrote:
> > Hi,
> >=20
> > We're seeing failures running s390x migration kvm-unit-tests tests with=
 TCG.
>=20
> As this is tcg, could you tell the exact command that you are running?
> Does it needs to be in s390x host, rigth?

I've just tried with a cross compile of kvm-unit-tests and that fails, too.

git clone https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git
cd kvm-unit-tests/
./configure --cross-prefix=3Ds390x-linux-gnu- --arch=3Ds390x
make
for i in {0..30}; do echo $i; QEMU=3D../qemu/build/qemu-system-s390x ACCEL=
=3Dtcg ./run_tests.sh migration-skey-sequential | grep FAIL && break; done

>=20
> $ time ./tests/qtest/migration-test

I haven't looked if that test fails at all, we just noticed it with the kvm=
-unit-tests.

> # random seed: R02S940c4f22abc48b14868566639d3d6c77
> # Skipping test: s390x host with KVM is required
> 1..0
>=20
> real	0m0.003s
> user	0m0.002s
> sys	0m0.001s
>=20
>=20
> > Some initial findings:
> > What seems to be happening is that after migration a control block
> > header accessed by the test code is all zeros which causes an
> > unexpected exception.
>=20
> What exception?
>=20
> What do you mean here by control block header?

It's all s390x test guest specific stuff, I don't expect it to be too helpf=
ul.
The guest gets a specification exception program interrupt while executing =
a SERVC because
the SCCB control block is invalid.

See https://gitlab.com/qemu-project/qemu/-/issues/1565 for a code snippet.
The guest sets a bunch of fields in the SCCB header, but when TCG emulates =
the SERVC,
they are zero which doesn't make sense.

>=20
> > I did a bisection which points to c8df4a7aef ("migration: Split save_li=
ve_pending() into state_pending_*") as the culprit.
> > The migration issue persists after applying the fix e264705012 ("migrat=
ion: I messed state_pending_exact/estimate") on top of c8df4a7aef.
> >=20
> > Applying
> >=20
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 56ff9cd29d..2dc546cf28 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -3437,7 +3437,7 @@ static void ram_state_pending_exact(void *opaque,=
 uint64_t max_size,
> >=20=20
> >      uint64_t remaining_size =3D rs->migration_dirty_pages * TARGET_PAG=
E_SIZE;
> >=20=20
> > -    if (!migration_in_postcopy()) {
> > +    if (!migration_in_postcopy() && remaining_size < max_size) {
>=20
> If block is all zeros, then remaining_size should be zero, so always
> smaller than max_size.
>=20
> I don't really fully understand what is going here.
>=20
> >          qemu_mutex_lock_iothread();
> >          WITH_RCU_READ_LOCK_GUARD() {
> >              migration_bitmap_sync_precopy(rs);
> >=20
> > on top fixes or hides the issue. (The comparison was removed by c8df4a7=
aef.)
> > I arrived at this by experimentation, I haven't looked into why this ma=
kes a difference.
> >=20
> > Any thoughts on the matter appreciated.
>=20
> Later, Juan.
>=20


