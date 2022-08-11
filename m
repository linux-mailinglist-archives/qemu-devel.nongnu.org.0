Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E5858FDE8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:58:06 +0200 (CEST)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8hJ-000442-85
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oM8fu-00026S-Rb
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:56:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oM8fs-0001yV-5m
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:56:38 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BDdVaM022916;
 Thu, 11 Aug 2022 13:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NTJsHeDT6yDZD2IEuK5KsNoLt3+snMN8YXGFjQp6Bjk=;
 b=agl+9ABPN8NoQGTbe0PhTLMdrr/lL1gi9PAG3HIhVeTi8+wklX4kNNUUb3FRyiQk71e6
 rQ3hc+D+VWqtPA6QFrTkzcpxiJWhGFY+nspww652qIuNo/ERMWxlOVVJRW/PAevrs3vc
 SWxtWaO5REtdNTm+IEJvZlm9XZOL+KA5YIJC9ARdroxVcd+SV6ZvgnDMTr6hwHjczydL
 y5mLoJ0r3XU6RpgOzSpjvfpuE7kcFi8uh/sc10JlVP9h4X3KGjISBOom+oy7G1q93ty+
 9ZUxlPvlyBKr9Y4NTWPaKjE0B/EeDIIRoLcssOq5swuFcJmEqcK7PwdPWQP7JE4YRsXr Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw17sksfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:56:32 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BDdZBu023603;
 Thu, 11 Aug 2022 13:56:32 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw17sksf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:56:32 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BDoYHD026717;
 Thu, 11 Aug 2022 13:56:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3huww0stpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:56:30 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BDuRR222675796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 13:56:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBD585204E;
 Thu, 11 Aug 2022 13:56:26 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.15.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 372AA5204F;
 Thu, 11 Aug 2022 13:56:26 +0000 (GMT)
Date: Thu, 11 Aug 2022 15:56:23 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Message-ID: <20220811155623.25f0d4b4@p-imbrenda>
In-Reply-To: <YvT1wC0vi2juO5n3@redhat.com>
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
 <YvT1wC0vi2juO5n3@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MP4ARr1l0nOfqBPu16pobhpiFQV81Hgr
X-Proofpoint-GUID: yEIKZ-e6pgaDBMvHf3La2EW4GVReVKi5
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110044
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

On Thu, 11 Aug 2022 13:27:44 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Aug 09, 2022 at 08:40:24AM +0200, Claudio Imbrenda wrote:
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
> > The new process will have the name "cleanup/<QEMU_PID>". It will wait
> > until qemu terminates, and then it will exit itself.
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
> > to the XML domain definition to pass the parameter to qemu directly:
> >=20
> >   <commandline xmlns=3D"http://libvirt.org/schemas/domain/qemu/1.0">
> >   <arg value=3D'-async-teardown'/>
> >   </commandline>
> >=20
> > More advanced interfaces like pidfd or close_range have intentionally
> > been avoided in order to be more compatible with older kernels.
> >=20
> > Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> > ---
> >  include/qemu/async-teardown.h |  22 ++++++
> >  os-posix.c                    |   6 ++
> >  qemu-options.hx               |  17 +++++
> >  util/async-teardown.c         | 123 ++++++++++++++++++++++++++++++++++
> >  util/meson.build              |   1 +
> >  5 files changed, 169 insertions(+)
> >  create mode 100644 include/qemu/async-teardown.h
> >  create mode 100644 util/async-teardown.c
> >=20=20=20
>=20
> > diff --git a/include/qemu/async-teardown.h b/include/qemu/async-teardow=
n.h
> > new file mode 100644
> > index 0000000000..092e7a37e7
> > --- /dev/null
> > +++ b/include/qemu/async-teardown.h
> > @@ -0,0 +1,22 @@
> > +/*
> > + * Asynchronous teardown
> > + *
> > + * Copyright IBM, Corp. 2022
> > + *
> > + * Authors:
> > + *  Claudio Imbrenda <imbrenda@linux.ibm.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
(at your
> > + * option) any later version.  See the COPYING file in the top-level d=
irectory.
> > + *
> > + */
> > +#ifndef QEMU_ASYNC_TEARDOWN_H
> > +#define QEMU_ASYNC_TEARDOWN_H
> > +
> > +#include "config-host.h"
> > +
> > +#ifdef CONFIG_LINUX
> > +void init_async_teardown(void);
> > +#endif
> > +
> > +#endif
> > diff --git a/os-posix.c b/os-posix.c
> > index 321fc4bd13..4858650c3e 100644
> > --- a/os-posix.c
> > +++ b/os-posix.c
> > @@ -39,6 +39,7 @@
> >=20=20
> >  #ifdef CONFIG_LINUX
> >  #include <sys/prctl.h>
> > +#include "qemu/async-teardown.h"
> >  #endif
> >=20=20
> >  /*
> > @@ -150,6 +151,11 @@ int os_parse_cmd_args(int index, const char *optar=
g)
> >      case QEMU_OPTION_daemonize:
> >          daemonize =3D 1;
> >          break;
> > +#if defined(CONFIG_LINUX)
> > +    case QEMU_OPTION_asyncteardown:
> > +        init_async_teardown();
> > +        break;
> > +#endif
> >      default:
> >          return -1;
> >      }
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 3f23a42fa8..d434353159 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -4743,6 +4743,23 @@ HXCOMM Internal use
> >  DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
> >  DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
> >=20=20
> > +#ifdef __linux__
> > +DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
> > +    "-async-teardown enable asynchronous teardown\n",
> > +    QEMU_ARCH_ALL)
> > +#endif
> > +SRST
> > +``-async-teardown``
> > +    Enable asynchronous teardown. A new teardown process will be
> > +    created at startup, using clone. The teardown process will share
> > +    the address space of the main qemu process, and wait for the main
> > +    process to terminate. At that point, the teardown process will
> > +    also exit. This allows qemu to terminate quickly if the guest was
> > +    huge, leaving the teardown of the address space to the teardown
> > +    process. Since the teardown process shares the same cgroups as the
> > +    main qemu process, accounting is performed correctly.
> > +ERST
> > +
> >  DEF("msg", HAS_ARG, QEMU_OPTION_msg,
> >      "-msg [timestamp[=3Don|off]][,guest-name=3D[on|off]]\n"
> >      "                control error message format\n"=20=20
>=20
> It occurrs to me that we've got a general goal of getting away from
> adding new top level command line arguments. Most of the time there's
> an obvious existing place to put them, but I'm really not sure
> where this particular  option would fit ?
>=20
> it isn't tied to any aspect of the VM backend configuration nor
> hardware frontends.
>=20
> The closest match is the lifecycle action option (-no-shutdown)
> which were merged into a -action arg, but even that's a bit of a
> stretch.
>=20

I have no preferences as to how the parameter is passed

> Markus/Paolo:  do you have suggestions ?
>=20
>=20
> > diff --git a/util/async-teardown.c b/util/async-teardown.c
> > new file mode 100644
> > index 0000000000..07fe549891
> > --- /dev/null
> > +++ b/util/async-teardown.c
> > @@ -0,0 +1,123 @@
> > +/*
> > + * Asynchronous teardown
> > + *
> > + * Copyright IBM, Corp. 2022
> > + *
> > + * Authors:
> > + *  Claudio Imbrenda <imbrenda@linux.ibm.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
(at your
> > + * option) any later version.  See the COPYING file in the top-level d=
irectory.
> > + *
> > + */
> > +#include <stdlib.h>
> > +#include <stdio.h>
> > +#include <sys/types.h>
> > +#include <sys/unistd.h>
> > +#include <dirent.h>
> > +#include <sys/prctl.h>
> > +#include <signal.h>
> > +#include <sched.h>
> > +
> > +#include "qemu/async-teardown.h"
> > +
> > +static pid_t the_ppid;
> > +
> > +/*
> > + * Close all open file descriptors.
> > + */
> > +static void close_all_open_fd(void)
> > +{
> > +    struct dirent *de;
> > +    int fd, dfd;
> > +    DIR *dir;
> > +
> > +    dir =3D opendir("/proc/self/fd");
> > +    if (!dir) {
> > +        return;
> > +    }
> > +    /* Avoid closing the directory. */
> > +    dfd =3D dirfd(dir);
> > +
> > +    for (de =3D readdir(dir); de; de =3D readdir(dir)) {
> > +        fd =3D atoi(de->d_name);
> > +        if (fd !=3D dfd) {
> > +            close(fd);
> > +        }
> > +    }
> > +    closedir(dir);
> > +}=20=20
>=20
> I know you said you're intentionally avoided close_range, but the
> cost is that this makes 'proc' a mandatory dependancy.

Running qemu without /proc sounds a little bit weird, but ok

>=20
> IMHO, we should build with close_range support if it is available
> in the glibc headers. Only use proc as a fallback if close_range
> reports ENOSYS, or is compiled out.

sounds reasonable.

what is the best way to do it? just some #ifdefs to check if the
syscall is available, or a config option to check at config time if the
syscall is defined?

(and then I guess the ENOSYS check needs to be there anyway)

>=20
> > +
> > +static void hup_handler(int signal)
> > +{
> > +    /* Check every second if this process has been reparented. */
> > +    while (the_ppid =3D=3D getppid()) {
> > +        /* sleep() is safe to use in a signal handler. */
> > +        sleep(1);
> > +    }
> > +
> > +    /* At this point the parent process has terminated completely. */
> > +    _exit(0);
> > +}
> > +
> > +static int async_teardown_fn(void *arg)
> > +{
> > +    struct sigaction sa =3D { .sa_handler =3D hup_handler };
> > +    sigset_t hup_signal;
> > +    char name[16];
> > +
> > +    /* Set a meaningful name for this process. */
> > +    snprintf(name, 16, "cleanup/%d", the_ppid);
> > +    prctl(PR_SET_NAME, (unsigned long)name);
> > +
> > +    /*
> > +     * Close all file descriptors that might have been inherited from =
the
> > +     * main qemu process when doing clone, needed to make libvirt happ=
y.
> > +     * Not using close_range for increased compatibility with older ke=
rnels.
> > +     */
> > +    close_all_open_fd();
> > +
> > +    /* Set up a handler for SIGHUP and unblock SIGHUP. */
> > +    sigaction(SIGHUP, &sa, NULL);
> > +    sigemptyset(&hup_signal);
> > +    sigaddset(&hup_signal, SIGHUP);
> > +    sigprocmask(SIG_UNBLOCK, &hup_signal, NULL);
> > +
> > +    /* Ask to receive SIGHUP when the parent dies. */
> > +    prctl(PR_SET_PDEATHSIG, SIGHUP);=20=20
>=20
> Hmm, I was hoping you could just use SIGKILL to guarantee that this
> gets killed off.  Is SIGKILL delivered too soon to allow for the
> main QEMU process to have exited quickly ?

yes, I tried. qemu has not finished exiting when the signal is
delivered, the cleanup process dies before qemu, which defeats the
purpose

>=20
> If so I wonder what happens when systemd just delivers SIGKILL to
> all processes in the cgroup - I'm not sure there's a guarantee it
> will SIGKILL the main qemu before it SIGKILLs this helper

I'm afraid in that case there is no guarantee.

for what it's worth, both virsh shutdown and destroy seem to do things
properly.

>=20
> > +
> > +    /*
> > +     * Sleep forever, unless the parent process has already terminated=
. The
> > +     * only interruption can come from the SIGHUP signal, which in nor=
mal
> > +     * operation is received when the parent process dies.
> > +     */
> > +    if (the_ppid =3D=3D getppid()) {
> > +        pause();
> > +    }
> > +
> > +    /* At this point the parent process has terminated completely. */
> > +    _exit(0);
> > +}
> > +
> > +/*
> > + * Block all signals, start (clone) a new process sharing the address =
space
> > + * with qemu (CLONE_VM), then restore signals.
> > + */
> > +void init_async_teardown(void)
> > +{
> > +    sigset_t all_signals, old_signals;
> > +    const int stack_size =3D 8192; /* Should be more than enough */
> > +    char *stack, *stack_ptr;
> > +
> > +    the_ppid =3D getpid();
> > +    stack =3D malloc(stack_size);
> > +    if (!stack) {
> > +        return;=20=20
>=20
> THis should be fatal. How about using  qemu_alloc_stack instead ?

sounds like a great idea

>=20
> > +    }
> > +    stack_ptr =3D stack + stack_size;
> > +
> > +    sigfillset(&all_signals);
> > +    sigprocmask(SIG_BLOCK, &all_signals, &old_signals);
> > +    clone(async_teardown_fn, stack_ptr, CLONE_VM, NULL, NULL, NULL, NU=
LL);
> > +    sigprocmask(SIG_SETMASK, &old_signals, NULL);
> > +}
> > diff --git a/util/meson.build b/util/meson.build
> > index 5e282130df..63acd59bb0 100644
> > --- a/util/meson.build
> > +++ b/util/meson.build
> > @@ -2,6 +2,7 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', '=
qemu-timer-common.c'))
> >  if not config_host_data.get('CONFIG_ATOMIC64')
> >    util_ss.add(files('atomic64.c'))
> >  endif
> > +util_ss.add(when: 'CONFIG_LINUX', if_true: files('async-teardown.c'))
> >  util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
> >  util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
> >  if config_host_data.get('CONFIG_EPOLL_CREATE1')
> > --=20
> > 2.37.1
> >=20=20=20
>=20
> With regards,
> Daniel


