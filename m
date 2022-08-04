Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1835897AD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 08:13:09 +0200 (CEST)
Received: from localhost ([::1]:53006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJU6W-00043x-IA
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 02:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJTqy-0006HK-UU
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:57:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJTqw-0006O0-1Y
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:57:04 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2745iq8v016913;
 Thu, 4 Aug 2022 05:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=u7jP0xDopkUogYdCIn+sQ9kqn9u5/O89UED+9S5nqcE=;
 b=mCO913jjjdJdqFt+APd4uXeqaq/m+NVCHljC3nqDm9oeVKdQJnuebIfIrlDf9x7Vmatg
 TZb/Lnk8OCSK1oNT4yuALFfTIz7h+oCxfcflJj8UAYOYrkptjgwoRY/Jb9DoQ5+4coI3
 XNCWYxd9jpETeIMVQEAFByqMmfrsjVf5B7nXJz7nspQRgmGPmTwYQGAoPLHeX6GvOlqi
 LtMdjYV6OiF9/1lNDHZnzvgxdMdqEi49+2vankWby11NTs3w08/c9T3DQnRlCfbuG2yF
 9jmsXEwzP+dOO6Ni4MwP3OoPNlwfpN+9rZmFbLHymuiK8VObSGqyAv7Vesc/ATk82qyq 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hr883g73c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 05:56:59 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2745jFND018761;
 Thu, 4 Aug 2022 05:56:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hr883g72g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 05:56:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2745Zd4T021642;
 Thu, 4 Aug 2022 05:56:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3hmv98wr86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 05:56:55 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2745uqCk15794642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Aug 2022 05:56:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 598E1A4055;
 Thu,  4 Aug 2022 05:56:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0111A404D;
 Thu,  4 Aug 2022 05:56:51 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.8.197])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Aug 2022 05:56:51 +0000 (GMT)
Date: Thu, 4 Aug 2022 07:56:49 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [PATCH v2 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <20220804075649.6e562c52@p-imbrenda>
In-Reply-To: <YuqxtV1O8IqRAuDu@redhat.com>
References: <20220803173141.52711-1-imbrenda@linux.ibm.com>
 <YuqxtV1O8IqRAuDu@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x7ybEsm3BVxjrRXSlljMkGuaNA_b1ayG
X-Proofpoint-GUID: gNg40lDPHHYN8kMPeMEFMVlu3A_atuzs
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_01,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 mlxlogscore=976 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040023
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

On Wed, 3 Aug 2022 18:34:45 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, Aug 03, 2022 at 07:31:41PM +0200, Claudio Imbrenda wrote:
> > This patch adds support for asynchronously tearing down a VM on Linux.
> >=20
> > When qemu terminates, either naturally or because of a fatal signal,
> > the VM is torn down. If the VM is huge, it can take a considerable
> > amount of time for it to be cleaned up. In case of a protected VM, it
> > might take even longer than a non-protected VM (this is the case on
> > s390x, for example).
> >=20
> > Some users might want to shut down a VM and restart it immediately,
> > without having to wait. This is especially true if management
> > infrastructure like libvirt is used.
> >=20
> > This patch implements a simple trick on Linux to allow qemu to return
> > immediately, with the teardown of the VM being performed
> > asynchronously.
> >=20
> > If the new commandline option -async-teardown is used, a new process is
> > spawned from qemu at startup, using the clone syscall, in such way that
> > it will share its address space with qemu.
> >=20
> > The new process will then simpy wait until qemu terminates, and then it
> > will exit itself.
> >=20
> > This allows qemu to terminate quickly, without having to wait for the
> > whole address space to be torn down. The teardown process will exit
> > after qemu, so it will be the last user of the address space, and
> > therefore it will take care of the actual teardown.
> >=20
> > The teardown process will share the same cgroups as qemu, so both
> > memory usage and cpu time will be accounted properly.
> >=20
> > This feature can already be used with libvirt by adding the following
> > to the XML domain definition:
> >=20
> >   <commandline xmlns=3D"http://libvirt.org/schemas/domain/qemu/1.0">
> >   <arg value=3D'-async-teardown'/>
> >   </commandline>=20=20
>=20
> How does this work in practice ?  Libvirt should be blocking until

I don't know the inner details of how libvirt works..

> all processes in the cgroup have exited, including this cloned
> child process.

..but I tested it and it works

my impression is that libvirt by default is only waiting for the
main qemu process.

the only issue I have found is the log file, which stays open as long
as some file descriptors (which the cloned process inherits from the
main qemu process) stay open. A new VM cannot be started if its log file
is still open by the logger process. The close_range() call solves the
issue.

>=20
> With regards,
> Daniel


