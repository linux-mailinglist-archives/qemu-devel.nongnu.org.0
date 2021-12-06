Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA0469533
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:44:45 +0100 (CET)
Received: from localhost ([::1]:36868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muCQG-000491-TL
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1muCP0-0003S3-7s
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:43:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1muCOx-0006My-Ud
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:43:25 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6BHBuJ006672
 for <qemu-devel@nongnu.org>; Mon, 6 Dec 2021 11:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=iqcWof80fTaJmi5hXoXEEAbr8XEZQPxJnoCE4oYPapQ=;
 b=KXtS5TPSrRjirbnhvMp9BN7KRtyN1QsfDEdMiv0Gz/QUPhnORV3YP9dofNUFFBi4jSXw
 fT7GN5xLPNB2bRuoaO7nTcYpBM9C8bc8PGMUrs4ErB3IkV+7XBPQnFYLcqdK/M1Z95Wo
 hFoAfWniOHRpzF/GLa9NctqDCCDrHrnm0aIwhn3pQRJGz0vAJUptnWhddx45nHEgB2OS
 iGB5n6wh40T9rszp76y9WtcJGRJCLwW1Jlgg2pNk23aKXFe0p0SOd+TT3IhD9X1ISCgn
 6yON5R+MeFZbL0/1SuCPx25x0+99BlSLm4qQIUyNlnxhhEiF0MpB+gsR17aOVuHK7z3O wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cshgu8dc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 11:43:21 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B6BaaMv026690
 for <qemu-devel@nongnu.org>; Mon, 6 Dec 2021 11:43:21 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cshgu8dbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 11:43:21 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Bbq0Z025630;
 Mon, 6 Dec 2021 11:43:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3cqyy93crq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 11:43:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B6BZbew29753820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 11:35:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5478942047;
 Mon,  6 Dec 2021 11:43:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5AF242042;
 Mon,  6 Dec 2021 11:43:14 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.173])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 11:43:14 +0000 (GMT)
Date: Mon, 6 Dec 2021 12:43:12 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v1 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <20211206124312.0a13b7c0@p-imbrenda>
In-Reply-To: <Ya3yJoUh97+B2EYJ@redhat.com>
References: <20211206110611.27283-1-imbrenda@linux.ibm.com>
 <Ya3yJoUh97+B2EYJ@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pM5ozM1A-UrV_CXf3AJI73q9tHY2Bgn7
X-Proofpoint-ORIG-GUID: YaK7rYFkzgrO1AR-tgQFXOrRtzgTRuiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_04,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=745 clxscore=1015
 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060069
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Dec 2021 11:21:10 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Dec 06, 2021 at 12:06:11PM +0100, Claudio Imbrenda wrote:
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
> > spawned from qemu using the clone syscall, so that it will share its
> > address space with qemu.
> >=20
> > The new process will then wait until qemu terminates, and then it will
> > exit itself.
> >=20
> > This allows qemu to terminate quickly, without having to wait for the
> > whole address space to be torn down. The teardown process will exit
> > after qemu, so it will be the last user of the address space, and
> > therefore it will take care of the actual teardown.
> >=20
> > The teardown process will share the same cgroups as qemu, so both
> > memory usage and cpu time will be accounted properly. =20
>=20
> If this suggested workaround has any benefit to the shutdown of a VM
> with libvirt, then it is a bug in libvirt IMHO.
>=20
> When libvirt tears down a QEMU VM, it should be waiting for *every*
> process in the VM's cgroup to be terminated before it reports that
> the VM is shutoff. IOW, the fact that this workaround lets the main
> QEMU process exit quickly should not matter. libvirt should still
> be blocked in exactly the same place in its code, waiting for the
> "async" cleanup process to exit. IOW, this should not be async at
> all from libvirt's POV.

interesting, I did not know that about libvirt.

maybe libvirt could be fixed/improved to allow this patch to work?

surely without this patch an asynchronous teardown will not be possible
at all

>=20
>=20
> Regards,
> Daniel


