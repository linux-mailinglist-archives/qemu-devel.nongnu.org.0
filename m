Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD758A753
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 09:42:55 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJryw-00076P-6G
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 03:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJruR-00048G-Ls
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:38:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJruP-000787-Gi
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:38:15 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2757F0DE036751;
 Fri, 5 Aug 2022 07:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iLcOOHIURuf4f+AtROYhtMOqwF5BGTPtyQJPJuT1+os=;
 b=s1zT5yX7rGBB1NQIRj6U/aSv8oOb+6jEt6xwGsNYYhj/kd1FDNFwEjMbGS//AmT5PLJb
 V0NK4LKKpii7xj1ZfxRwqXdvnyHRRHcjRpKou47vHcmJ1ccDptS8vtGBy+pZaLdyObCG
 Fp6VOLA34rFzPQ7FruE+po8RNTWNHQiwJarhBH2eYIuxIlM/XcJWNSpUoMX7uAIT/ZUB
 HLcR02diRCgtY+MJxEf3yenGQhTSySYUocZMjokjZV4SDOqZmpudgXEODRY7W5VTEuiV
 4UJM3ilm+GCsxDm5mDAwWtgXkAuJZlvfj6Km63qp1rDsstXWv9DLFYJim9V31oWDWQAe Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrxn68mdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 07:38:10 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2757QwmB040290;
 Fri, 5 Aug 2022 07:38:10 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrxn68mbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 07:38:09 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2757JtCq001507;
 Fri, 5 Aug 2022 07:33:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3hmv98q4q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 07:33:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2757X4YM17432872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 07:33:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D6F04203F;
 Fri,  5 Aug 2022 07:33:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F68E42041;
 Fri,  5 Aug 2022 07:33:03 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.4.149])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 07:33:03 +0000 (GMT)
Date: Fri, 5 Aug 2022 09:32:50 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [PATCH v2 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <20220805093250.1d3bcda2@p-imbrenda>
In-Reply-To: <Yuv6QtPCtABMc7J4@redhat.com>
References: <20220803173141.52711-1-imbrenda@linux.ibm.com>
 <Yuv6QtPCtABMc7J4@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OhZ6bcnPPJq6RSI2ftUi-hHWw5LMKHPB
X-Proofpoint-ORIG-GUID: E1jQlEYxVFpLqyUbjbbZ-HVZeXeN317G
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_01,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050036
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

On Thu, 4 Aug 2022 17:56:34 +0100
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
> >   </commandline>
> >=20
> > Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> > ---
> >  include/qemu/osdep.h |  2 ++
> >  os-posix.c           |  5 ++++
> >  qemu-options.hx      | 17 ++++++++++++++
> >  util/osdep.c         | 55 ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 79 insertions(+)=20=20
>=20
>=20
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 60fcbbaebe..bb0baf97a0 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -23,6 +23,15 @@
> >   */
> >  #include "qemu/osdep.h"
> >  #include "qapi/error.h"
> > +
> > +#ifdef CONFIG_LINUX
> > +#include <sys/types.h>
> > +#include <sys/select.h>
> > +#include <sys/unistd.h>
> > +#include <sys/syscall.h>
> > +#include <signal.h>
> > +#endif
> > +
> >  #include "qemu/cutils.h"
> >  #include "qemu/sockets.h"
> >  #include "qemu/error-report.h"
> > @@ -512,6 +521,52 @@ const char *qemu_hw_version(void)
> >      return hw_version;
> >  }
> >=20=20
> > +#ifdef __linux__
> > +static int async_teardown_fn(void *arg)
> > +{
> > +    sigset_t all_signals;
> > +    fd_set r, w, e;
> > +    int fd;
> > +
> > +    /* open a pidfd descriptor for the parent qemu process */
> > +    fd =3D syscall(__NR_pidfd_open, getppid(), 0);=20=20
>=20
> We ought to open this FD in the parent process to avoid a race
> where the parent crashes immediately after clone() and gets
> reparented to 'init' before this child process calls pidfd_open,
> otherwise it'll sit around waiting for init to exit.

sounds good

>=20
> > +    /* if something went wrong, or if the file descriptor is too big */
> > +    if ((fd < 0) || (fd >=3D FD_SETSIZE)) {
> > +        _exit(1);
> > +    }
> > +    /* zero all fd sets */
> > +    FD_ZERO(&r);
> > +    FD_ZERO(&w);
> > +    FD_ZERO(&e);
> > +    /* set the fd for the pidfd in the "read" set */
> > +    FD_SET(fd, &r);
> > +    /* block all signals */
> > +    sigfillset(&all_signals);
> > +    sigprocmask(SIG_BLOCK, &all_signals, NULL);=20=20
>=20
> Technnically this is racy as there's still a window in which the
> child is running when signals are not blocked.

true, I will apply the workaround you suggest below

>=20
> > +    /* wait for the pid to disappear -> fd will appear as ready for re=
ad */
> > +    (void) select(fd + 1, &r, &w, &e, NULL);=20=20
>=20
> While using pidfd can work, a stronger protection would be to use
>=20
>    prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
>=20
> this guarantees that the kernel will deliver SIGKILL to this
> process immediately when the parent QEMU exits.
>=20
> We should probably do both in fact.

makes sense

>=20
> > +
> > +    /*
> > +     * Close all file descriptors that might have been inherited from =
the
> > +     * main qemu process when doing clone. This is needed to make libv=
irt
> > +     * happy.
> > +     */
> > +    close_range(0, ~0U, 0);=20=20
>=20
> Shouldn't we close all the FDs immediately when this process is

that's exactly what I did in the beginning, but some things broke...
but I just tried again now and it seems to work, so probably the
breakage was due to something else

> created, rather than only at the end when we're exiting. I don't
> see there's any need to keep them open. Doing it immediately
> would be better when using prctl(PR_SET_PDEATHSIG)

yes

>=20
> > +    _exit(0);
> > +}
> > +
> > +void init_async_teardown(void)
> > +{
> > +    const int size =3D 8192; /* should be more than enough */
> > +    char *stack =3D malloc(size);
> > +=20=20
>=20
> You need to block all signals here.
>=20
> > +    /* start a new process sharing the address space with qemu */
> > +    clone(async_teardown_fn, stack + size, CLONE_VM, NULL, NULL, NULL,=
 NULL);=20=20
>=20
> And unblock signals again here.
>=20
> That way the "everything blocked"  mask is inherited by the child
> from the very first moment of its existance.

sounds like a very good idea

>=20
> > +}
> > +#else /* __linux__ */
> > +void init_async_teardown(void) {}
> > +#endif
> > +
> >  #ifdef _WIN32
> >  static void socket_cleanup(void)
> >  {
> > --=20
> > 2.37.1
> >=20=20=20
>=20
> With regards,
> Daniel


