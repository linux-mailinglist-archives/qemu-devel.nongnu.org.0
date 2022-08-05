Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2BF58A7DE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:14:21 +0200 (CEST)
Received: from localhost ([::1]:38482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsTM-0000A7-Vo
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJsKg-0000mr-Gj
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:05:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJsKd-00033t-OU
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:05:22 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2757fnwR006101;
 Fri, 5 Aug 2022 08:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=vTuoh7qhdkokKt+s4QU4f4OZ90mnDxwUbrm+TxyhyD0=;
 b=SuLNhuAtmhC/zoY3eYfIJalV75/zQ0pKd7dXEJJIIr+m3Li5rI6ccxG37RPOD2zr5KK9
 q7vum1hV48REr5okAvVq0sqHIdHLs/Qr2ffPtaRL0pIKrBvmRNXEuiLWNE6f9NrY51SM
 qHDbnjWKS5GSbl2KzDMn6kXi5i2BwZrsvaa0PxL8QvFesgfpfMfAab7DvubU1VliE7RM
 gjuqzFHeEZHNDixZDM6JMnwFJOmISqqNpL4hGqSKbZX0jZTLnhJS3CkWVnIyE36OY1h8
 tQ6TOOtmGIqLQ28dm5GuC3v3zmxJrDrsSX7QL2MvEl8DMuAYRtKOpiE7SbzeA2s0lGho dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrx8h1wbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 08:05:15 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2757iWpn016107;
 Fri, 5 Aug 2022 08:05:14 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrx8h1vxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 08:05:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2757JlSm025790;
 Fri, 5 Aug 2022 07:33:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3hmv98y3ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 07:33:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2757WxLb31261178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 07:32:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7469442041;
 Fri,  5 Aug 2022 07:32:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E292C4203F;
 Fri,  5 Aug 2022 07:32:58 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.4.149])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 07:32:58 +0000 (GMT)
Date: Fri, 5 Aug 2022 09:02:17 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [PATCH v2 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <20220805090217.1007fe18@p-imbrenda>
In-Reply-To: <Yuv6uhuxjQHawmeL@redhat.com>
References: <20220803173141.52711-1-imbrenda@linux.ibm.com>
 <YuqxtV1O8IqRAuDu@redhat.com> <20220804075649.6e562c52@p-imbrenda>
 <YuuBa4lQZd62JIg9@redhat.com> <Yuv6uhuxjQHawmeL@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9me3cq8_jHdbK26rEG7QJOENz3cGqVMl
X-Proofpoint-ORIG-GUID: mtRonF3xDBGbR89NRAlMdj7n6qmtuBSO
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_02,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050039
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

On Thu, 4 Aug 2022 17:58:34 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Aug 04, 2022 at 09:20:59AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Aug 04, 2022 at 07:56:49AM +0200, Claudio Imbrenda wrote:=20=20
> > > On Wed, 3 Aug 2022 18:34:45 +0100
> > > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > >=20=20=20
> > > > On Wed, Aug 03, 2022 at 07:31:41PM +0200, Claudio Imbrenda wrote:=
=20=20
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
> > > > How does this work in practice ?  Libvirt should be blocking until=
=20=20
> > >=20
> > > I don't know the inner details of how libvirt works..
> > >=20=20=20
> > > > all processes in the cgroup have exited, including this cloned
> > > > child process.=20=20
> > >=20
> > > ..but I tested it and it works
> > >=20
> > > my impression is that libvirt by default is only waiting for the
> > > main qemu process.=20=20
> >=20
> > If true, that would be a bug that needs fixing and should not be
> > relied on.=20=20
>=20
> Libvirt is invoking 'TerminateMachine' DBus call on systemd-machined.
> That in turn iterates over every process in the cgroup and kills
> them off.
>=20
> Docs are a little vague and I've not followed the code perfectly, but
> that should mean TeminateMachine doesnt return until every process in
> the cgroup has exited.
>=20
> That said, since this is a dbus API call, libvirt will probably
> timeout waiting for the DBus reply after something like 30-60
> seconds IIRC.

I have not observed any delays.

could it be that DBus doesn't wait for the process to be completely
dead, but only that the signal is delivered?

and which signal will DBus use?

>=20
> >=20=20=20
> > > the only issue I have found is the log file, which stays open as long
> > > as some file descriptors (which the cloned process inherits from the
> > > main qemu process) stay open. A new VM cannot be started if its log f=
ile
> > > is still open by the logger process. The close_range() call solves the
> > > issue.=20=20
>=20
> With regards,
> Daniel


