Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7458FBE4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:07:39 +0200 (CEST)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM6yQ-0000tS-85
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oM6ud-0006ka-KC
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:03:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oM6uZ-00073l-S2
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:03:43 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BBtnd2011172;
 Thu, 11 Aug 2022 12:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=NdCmW+DXZqDUHxDOIiPKSQH5l21Vi/YhT9dQa7XfhYg=;
 b=UIUZYDRzqg3nBV+iNt56RJRFGKjokuyc/TkC3Q84kaTa+U/RSrH12rMeNVeP8ItVkJ8r
 E42voH7iC3m/qji503K9uUM2yOZvRtZNmZ/hsX7pVwJoH1tCQkZioli8wEbEnvHGytRX
 wuo4/UN9gaUeRmLA5y6cTSEhtWNQckg5Qignp4CUHyyqKXkiXCjYsP8bTON7AQ2PG/oQ
 YV4Ym3izT1yS34E1dkdva3JUzxKpZljGSUhf6P3CLY/mIQVSfNcGjUFvPhHDRVXFRCN5
 McLf83WPZ4TFHLY9m2Kq/yTXwSw4fU8JLYo4As1sMVt1t+1iGgSk61NbscPqhPWREEjt 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1b0g77m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:03:36 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BBuCHX014139;
 Thu, 11 Aug 2022 12:03:35 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1b0g75n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:03:35 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BBoMAW032361;
 Thu, 11 Aug 2022 12:03:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3huww0sqwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:03:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BC3SpL36569406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:03:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78AF05204F;
 Thu, 11 Aug 2022 12:03:28 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.15.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BBFFC5204E;
 Thu, 11 Aug 2022 12:03:27 +0000 (GMT)
Date: Thu, 11 Aug 2022 14:03:25 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Murilo Opsfelder =?UTF-8?B?QXJhw7pqbw==?= <muriloo@linux.ibm.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 berrange@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Message-ID: <20220811140325.4c6d227a@p-imbrenda>
In-Reply-To: <8a9891ed-1cb2-6b2e-efed-04c61b546c2e@linux.ibm.com>
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
 <8a9891ed-1cb2-6b2e-efed-04c61b546c2e@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8FKBB8cAPj-Dr4nG4Aufw-nPPirny8qT
X-Proofpoint-ORIG-GUID: ME_10IjRAfTkI7MNFkLNLwLyGp7hH9jV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208110037
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

On Wed, 10 Aug 2022 17:30:41 -0300
Murilo Opsfelder Ara=C3=BAjo <muriloo@linux.ibm.com> wrote:

> Hi, Claudio.

Hi Murilo,

[...]
=20
> I've smoke-tested this on ppc and everything looks fine.
> For what's worth:
>=20
> Reviewed-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Tested-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

thanks a lot for testing this!

>=20
>=20
> Have you measured the benefits of using -async-teardown vs. not using it?
> If so, can you please share the details so I can give it a try on ppc, to=
o?
>=20
> The wall-clock perception is that nothing has changed, for better or wors=
e.
> My tests used mid-sized VMs, like 128 vCPUs, 64GB RAM.

The number of CPUs doesn't really have any impact. 64G of RAM is quite
small to notice a sizeable difference, although you should be able to
see a few seconds of speedup in the shutdown. Also, starting a guest
with a lot of RAM is not enough, you have to make sure that the guest
ram is actually allocated (completely fill the ram in the guest before
shutting it down)

I just tested a 64G and a 256G guest on s390x. I measured the time
between the last line in the console ("Reached target Power-Off.") and
the moment when control comes back to the shell. The measurement was
not exactly super accurate (I manually ran "date +%s" in another shell
when I saw the last line in the console, and then again when I got the
shell back from qemu).=20

The 64G guest needs a few seconds, the 256G needs almost exactly 4
times as much. With the asynchronous teardown it's almost instant in
both cases (less than 1s, too fast to measure manually).

Try a multi-TB guest if you can (at the moment I can't) to
see a more marked effect.

Also consider that this is for _normal_ guests. Protected guests on
s390x have an even slower teardown due to the way protected
virtualization is implemented in the hardware.

I hope this was helpful

>=20
> Cheers!
>=20
> > ---
> >   include/qemu/async-teardown.h |  22 ++++++
> >   os-posix.c                    |   6 ++
> >   qemu-options.hx               |  17 +++++
> >   util/async-teardown.c         | 123 ++++++++++++++++++++++++++++++++++
> >   util/meson.build              |   1 +
> >   5 files changed, 169 insertions(+)
> >   create mode 100644 include/qemu/async-teardown.h
> >   create mode 100644 util/async-teardown.c
> >=20
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
> >  =20
> >   #ifdef CONFIG_LINUX
> >   #include <sys/prctl.h>
> > +#include "qemu/async-teardown.h"
> >   #endif
> >  =20
> >   /*
> > @@ -150,6 +151,11 @@ int os_parse_cmd_args(int index, const char *optar=
g)
> >       case QEMU_OPTION_daemonize:
> >           daemonize =3D 1;
> >           break;
> > +#if defined(CONFIG_LINUX)
> > +    case QEMU_OPTION_asyncteardown:
> > +        init_async_teardown();
> > +        break;
> > +#endif
> >       default:
> >           return -1;
> >       }
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 3f23a42fa8..d434353159 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -4743,6 +4743,23 @@ HXCOMM Internal use
> >   DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
> >   DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
> >  =20
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
> >   DEF("msg", HAS_ARG, QEMU_OPTION_msg,
> >       "-msg [timestamp[=3Don|off]][,guest-name=3D[on|off]]\n"
> >       "                control error message format\n"
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
> > +}
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
> > +    prctl(PR_SET_PDEATHSIG, SIGHUP);
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
> > +        return;
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
> >   if not config_host_data.get('CONFIG_ATOMIC64')
> >     util_ss.add(files('atomic64.c'))
> >   endif
> > +util_ss.add(when: 'CONFIG_LINUX', if_true: files('async-teardown.c'))
> >   util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
> >   util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
> >   if config_host_data.get('CONFIG_EPOLL_CREATE1') =20
>=20
>=20


