Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E458A73E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 09:38:55 +0200 (CEST)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJrv3-0004Ti-ON
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 03:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJrpk-0001xR-6K
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:33:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJrph-0006SR-1u
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:33:23 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2757Idug036697;
 Fri, 5 Aug 2022 07:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IBkBDCVOvYE/wJ/SNHy/OCIkdrnTX5TC/M880vtXbSo=;
 b=pDv2WyeX+dob0l+7LLML+xJykOOL9Kr+BGeNQt2IdKOCpsM5PfYuwVSGneClEVlzLy46
 AcmK2GfcwZ0WgDkbp/puIqt8DpT6NCk++AXUtlWtytoFtfCUmadrzatuMRsqS55SLpLj
 9/7O2gKxzdAapxHmnl7UTAFltSH8qiSB6lcgVvM78b+ey4fR2xp7spG0Fj5q1PNM7OiU
 BCDJopA84GbZihANHFKWeBJdoCYZq2MKZkd2dCgGdh01Id40LDApN2vQfFCXUa5fvCXV
 dA5+DKao/yTQUg2NEXhO1bo6zCl6Oa6074/QNMPeFtTgLrXqB8JCLzgtBzC8S2RqTd9l qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrxq30a1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 07:33:15 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2757KHsj003847;
 Fri, 5 Aug 2022 07:33:15 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrxq309um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 07:33:15 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2757KxUY006845;
 Fri, 5 Aug 2022 07:33:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3hmv98w936-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 07:33:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2757X1J525690586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 07:33:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE88C4203F;
 Fri,  5 Aug 2022 07:33:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ABEF42042;
 Fri,  5 Aug 2022 07:33:01 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.4.149])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 07:33:01 +0000 (GMT)
Date: Fri, 5 Aug 2022 08:59:42 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [PATCH v2 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <20220805085942.2c5cbce1@p-imbrenda>
In-Reply-To: <Yuv2nW57bSGdK/1d@redhat.com>
References: <20220803173141.52711-1-imbrenda@linux.ibm.com>
 <YuqxtV1O8IqRAuDu@redhat.com> <YuuDc8nsLtPvtrQ7@redhat.com>
 <20220804164929.2ae0d34e@p-imbrenda> <Yuv2nW57bSGdK/1d@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HPsUhpRLrNcb6xKI3-MODq2gbagSoIPw
X-Proofpoint-ORIG-GUID: IGprqQpQs2x-qnoPvyg68f_r-4vbvIZt
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_01,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208050036
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 4 Aug 2022 17:41:01 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Aug 04, 2022 at 04:49:29PM +0200, Claudio Imbrenda wrote:
> > On Thu, 4 Aug 2022 09:29:39 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >=20=20=20
> > > On Wed, Aug 03, 2022 at 06:34:45PM +0100, Daniel P. Berrang=C3=A9 wro=
te:=20=20
> > > > On Wed, Aug 03, 2022 at 07:31:41PM +0200, Claudio Imbrenda wrote:=
=20=20=20=20
> > > > > This patch adds support for asynchronously tearing down a VM on L=
inux.
> > > > >=20
> > > > > When qemu terminates, either naturally or because of a fatal sign=
al,
> > > > > the VM is torn down. If the VM is huge, it can take a considerable
> > > > > amount of time for it to be cleaned up. In case of a protected VM=
, it
> > > > > might take even longer than a non-protected VM (this is the case =
on
> > > > > s390x, for example).
> > > > >=20
> > > > > Some users might want to shut down a VM and restart it immediatel=
y,
> > > > > without having to wait. This is especially true if management
> > > > > infrastructure like libvirt is used.
> > > > >=20
> > > > > This patch implements a simple trick on Linux to allow qemu to re=
turn
> > > > > immediately, with the teardown of the VM being performed
> > > > > asynchronously.
> > > > >=20
> > > > > If the new commandline option -async-teardown is used, a new proc=
ess is
> > > > > spawned from qemu at startup, using the clone syscall, in such wa=
y that
> > > > > it will share its address space with qemu.
> > > > >=20
> > > > > The new process will then simpy wait until qemu terminates, and t=
hen it
> > > > > will exit itself.
> > > > >=20
> > > > > This allows qemu to terminate quickly, without having to wait for=
 the
> > > > > whole address space to be torn down. The teardown process will ex=
it
> > > > > after qemu, so it will be the last user of the address space, and
> > > > > therefore it will take care of the actual teardown.
> > > > >=20
> > > > > The teardown process will share the same cgroups as qemu, so both
> > > > > memory usage and cpu time will be accounted properly.
> > > > >=20
> > > > > This feature can already be used with libvirt by adding the follo=
wing
> > > > > to the XML domain definition:
> > > > >=20
> > > > >   <commandline xmlns=3D"http://libvirt.org/schemas/domain/qemu/1.=
0">
> > > > >   <arg value=3D'-async-teardown'/>
> > > > >   </commandline>=20=20=20=20
> > > >=20
> > > > How does this work in practice ?  Libvirt should be blocking until
> > > > all processes in the cgroup have exited, including this cloned
> > > > child process.=20=20=20=20
> > >=20
> > > Also, have you disabled use of seccomp with QEMU when testing this,
> > > as the seccomp filter that libivrt enables is supposed to block
> > > any use of clone() except for the creation of threads.=20=20
> >=20
> > it was just a vanilla libvirt 8.0.0 as found on ubuntu 22.04; I have no
> > idea how it is configured by default=20=20
>=20
> Ok, so the reason it is working is because the extra process is
> cloned() right in middle of processing argv. This is before the
> seccomp filter is applied to the process, so clone() is not blocked.
>=20
> One think I note about this in practice is that (unsurprisingly)
> if you do a process listing, users now see 2 QEMU processes instead
> of one.
>=20
> I wonder if we should consider overwriting argv in the child
> process with "[qemu async teardown]" to give users a hint as to
> why this duplicate process exists.

sounds like a good idea

>=20
> With regards,
> Daniel


