Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1F409F2D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 23:33:54 +0200 (CEST)
Received: from localhost ([::1]:41586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPtaL-0003zf-LI
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 17:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mPtZE-0003Hx-Mh
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 17:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mPtZB-00036J-0f
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 17:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631568760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GAvDNXzwdWoYevD5FrE/TRs/B97MSNe3YhccgraIl60=;
 b=XRFcoNm63uHxpG17hIVCDhPoMwiJvSQA+djzoFu1JHIys6OBV5vzPziF21+ENugo1Q6HvG
 wXv/XdtSxEqDqIw3mQFjyWbxwP5P7T9QPIvYLsDm9pJ4Y+PM8r6Gdm/PXjr3YvJEjmgHIJ
 Ws0VoKHeiFgIKprYH+G1ewM5A94lNFw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-ircCY4XXP6uUlx1518CsRQ-1; Mon, 13 Sep 2021 17:32:37 -0400
X-MC-Unique: ircCY4XXP6uUlx1518CsRQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 y12-20020a1c7d0c000000b003077f64d75fso1267844wmc.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 14:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GAvDNXzwdWoYevD5FrE/TRs/B97MSNe3YhccgraIl60=;
 b=PCQKVluaDkYqnCodVoVlqWlkH+8HZMekSz2OGq+G2mQS9+OUDAm52kM5Tr6bmz9iCd
 zhxPm5BwaQb8Vz34h9mrxbVepOY+9Bh+/T/olCUDqPtPjf/ZMVKI29VIQUJFUi9rQf38
 pWpIARLMNNiZ1c6yPP6XMI2u1XvUpICoHZdCxJkE+Q3ojApzXH0Yt/2sijG2rbD6GK05
 gTcxvJEobLIP6ZeQs+gNgYNM8T3Xtl69o8WS6mnRqX1IffeG7MQsRvQzzivxdpVW9tOe
 cBLF/tnHAPfmRQTuTMYL6MhfTBa04gp3CIfeVz85OMTF9mFUBtJnQO4S7DY4Q4eb7Dcn
 EWwA==
X-Gm-Message-State: AOAM531D5ejLL9PDVgOfS8CaO0JcWtqH0YYJU+n+7AqNDm/7kVFEwZ5k
 n2nJ/WPFn5jiC0yFa4vZhGzBwmHoXDJrhdS48RGRl8c/jEc8CLqT1NtXsF+zAGFsz+uV/mrkpSR
 nfIQAb+ctokQ6Yr4=
X-Received: by 2002:adf:e643:: with SMTP id b3mr15272416wrn.67.1631568756524; 
 Mon, 13 Sep 2021 14:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAfXBnw7Jge/XR9iRUXOPLFrEKg2T2ZcFXKSvivI68wxozuQlA7NPIJYMN1TaVBj/wN22a+A==
X-Received: by 2002:adf:e643:: with SMTP id b3mr15272395wrn.67.1631568756284; 
 Mon, 13 Sep 2021 14:32:36 -0700 (PDT)
Received: from redhat.com ([2.55.151.134])
 by smtp.gmail.com with ESMTPSA id u26sm8912247wrd.32.2021.09.13.14.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 14:32:35 -0700 (PDT)
Date: Mon, 13 Sep 2021 17:32:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: question on vhost, limiting kernel threads and NPROC
Message-ID: <20210913173020-mutt-send-email-mst@kernel.org>
References: <b6d181c2-ec7b-913b-3eea-142fcce7c104@oracle.com>
 <YOwwGbOhkDEy/KvQ@stefanha-x1.localdomain>
 <cb6824cb-e730-e842-dbbb-95de49a72cd7@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cb6824cb-e730-e842-dbbb-95de49a72cd7@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: libvir-list@redhat.com, "jasowang@redhat.com" <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Christian Brauner <christian.brauner@ubuntu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 12:04:04PM -0500, Mike Christie wrote:
> I just realized I forgot to cc the virt list so adding now.
> 
> Christian see the very bottom for a different fork patch.
> 
> On 7/12/21 7:05 AM, Stefan Hajnoczi wrote:
> > On Fri, Jul 09, 2021 at 11:25:37AM -0500, Mike Christie wrote:
> >> Hi,
> >>
> >> The goal of this email is to try and figure how we want to track/limit the
> >> number of kernel threads created by vhost devices.
> >>
> >> Background:
> >> -----------
> >> For vhost-scsi, we've hit a issue where the single vhost worker thread can't
> >> handle all IO the being sent from multiple queues. IOPs is stuck at around
> >> 500K. To fix this, we did this patchset:
> >>
> >> https://lore.kernel.org/linux-scsi/20210525180600.6349-1-michael.christie@oracle.com/
> >>
> >> which allows userspace to create N threads and map them to a dev's virtqueues.
> >> With this we can get around 1.4M IOPs.
> >>
> >> Problem:
> >> --------
> >> While those patches were being reviewed, a concern about tracking all these
> >> new possible threads was raised here:
> >>
> >> https://lore.kernel.org/linux-scsi/YL45CfpHyzSEcAJv@stefanha-x1.localdomain/
> >>
> >> To save you some time, the question is what does other kernel code using the
> >> kthread API do to track the number of kernel threads created on behalf of
> >> a userspace thread. The answer is they don't do anything so we will have to
> >> add that code.
> >>
> >> I started to do that here:
> >>
> >> https://lkml.org/lkml/2021/6/23/1233
> >>
> >> where those patches would charge/check the vhost device owner's RLIMIT_NPROC
> >> value. But, the question of if we really want to do this has come up which is
> >> why I'm bugging lists like libvirt now.
> >>
> >> Question/Solution:
> >> ------------------
> >> I'm bugging everyone so we can figure out:
> >>
> >> If we need to specifically track the number of kernel threads being made
> >> for the vhost kernel use case by the RLIMIT_NPROC limit?
> >>
> >> Or, is it ok to limit the number of devices with the RLIMIT_NOFILE limit.
> >> Then each device has a limit on the number of threads it can create.
> > 
> > Do we want to add an interface where an unprivileged userspace process
> > can create large numbers of kthreads? The number is indirectly bounded
> > by RLIMIT_NOFILE * num_virtqueues, but there is no practical way to
> > use that rlimit since num_virtqueues various across vhost devices and
> > RLIMIT_NOFILE might need to have a specific value to control file
> > descriptors.
> > 
> > io_uring worker threads are limited by RLIMIT_NPROC. I think it makes
> > sense in vhost too where the device instance is owned by a specific
> > userspace process and can be accounted against that process' rlimit.
> > 
> > I don't have a specific use case other than that I think vhost should be
> > safe and well-behaved.
> > 
> 
> Sorry for the late reply. I finally got to go on PTO and used like 2
> years worth in one super long vacation :)
> 
> I still don't have a RLIMIT_NPROC use case and it wasn't not clear to
> me if that has to be handled before merging. However, I might have got
> lucky and found a bug where the fix will handle your request too.
> 
> It looks like cgroup v2 is supposed to work, but for vhost threads
> it doesn't because the kernel functions we use just support v1. If
> we change the vhost layer to create threads like how io_uring does
> then we get the RLIMIT_NPROC checks and also cgroup v2 support.
> 
> Christian, If you didn't like this patch
> 
> https://lkml.org/lkml/2021/6/23/1233
> 
> then I'm not sure how much you will like what is needed to support the
> above. Here is a patch which includes what we would need from the fork
> related code. On one hand, it's nicer because it fits into the PF FLAG
> code like you requested. But, I have to add a no_files arg. See below:
> 
> 
> ----------------------------------------------
> 
> 
> >From 351d476e8db0a78b9bdf22d77dd1abe66c0eac40 Mon Sep 17 00:00:00 2001
> From: Mike Christie <michael.christie@oracle.com>
> Date: Mon, 13 Sep 2021 11:20:20 -0500
> Subject: [PATCH] fork: allow cloning of userspace procs from kernel
> 
> Userspace apps/processes like Qemu call into the vhost layer to create
> worker threads which execute IO on behalf of VMs. If users set RIMIT
> or cgroup limits or setup v2 cgroups or namespaces, the worker thread
> is not accounted for or even setup correctly. The reason is that vhost
> uses the kthread api which inherits those attributes/values from the
> kthreadd thread. This patch allows kernel modules to work like the
> io_uring code which can call kernel_clone from the userspace thread's
> context and directly inherit its attributes like cgroups from and will
> check limits like RLIMIT_NPROC against that userspace thread.
> 
> Note: this patch combines 2 changes that should be separate patches. I'm
> including both in one patch to just make it easier to get an idea of what
> needs to be done. If we are ok with this then I'll break it up into a
> proper patchset.
> 
> This patch does the following:
> 
> 1. Separates the PF_IO_WORKER flag behavior that controls signals and exit
> cleanup into a new flag PF_USER_WORKER, so the vhost layer can use it
> without the PF_IO_WORKER scheduling/IO behavior.
> 
> 2. It adds a new no_files kernel_clone_args field. This is needed by vhost
> because tools like qemu/libvirt do not always do a close() on the vhost
> device. For some devices they just rely on the process exit reaping/cleanup
> code to do a close() on all open FDs. However, if the vhost worker threads
> have the device open (CLONE_FILES not set) or have a refcount on the
> files_struct (CLONE_FILES set) then we can leak or possibly crash.
> 
> leak - qemu just exits and expects the put done by the process exit
> code will be the last put on the fd. But becuase the worker thread has a
> ref to the fd or to the process's files_struct then it will never get the
> last put and so the vhost device's release function will never be called.
> 
> crash - if we add signal handling to the worker threads then it can
> happen where the worker thread might get the signal and exit before
> qemu has called the vhost cleanup releated ioctls and we can end up
> crashing referencing what should be a valid device still.
> ---
>  arch/x86/kernel/process.c  |  4 ++--
>  include/linux/sched.h      |  1 +
>  include/linux/sched/task.h |  5 ++++-
>  init/main.c                |  4 ++--
>  kernel/fork.c              | 24 +++++++++++++++++++-----
>  kernel/kthread.c           |  3 ++-
>  kernel/signal.c            |  4 ++--
>  kernel/umh.c               |  5 +++--
>  8 files changed, 35 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
> index 1d9463e3096b..1c5d516fb508 100644
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -178,9 +178,9 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
>  	task_user_gs(p) = get_user_gs(current_pt_regs());
>  #endif
>  
> -	if (unlikely(p->flags & PF_IO_WORKER)) {
> +	if (unlikely(p->flags & PF_USER_WORKER)) {
>  		/*
> -		 * An IO thread is a user space thread, but it doesn't
> +		 * A user worker thread is a user space thread, but it doesn't
>  		 * return to ret_after_fork().
>  		 *
>  		 * In order to indicate that to tools like gdb,
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index ec8d07d88641..0c9b3f62d85f 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1577,6 +1577,7 @@ extern struct pid *cad_pid;
>  #define PF_VCPU			0x00000001	/* I'm a virtual CPU */
>  #define PF_IDLE			0x00000002	/* I am an IDLE thread */
>  #define PF_EXITING		0x00000004	/* Getting shut down */
> +#define PF_USER_WORKER		0x00000008	/* Userspace kernel thread  */
>  #define PF_IO_WORKER		0x00000010	/* Task is an IO worker */
>  #define PF_WQ_WORKER		0x00000020	/* I'm a workqueue worker */
>  #define PF_FORKNOEXEC		0x00000040	/* Forked but didn't exec */
> diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
> index ef02be869cf2..2a8f9b8c3868 100644
> --- a/include/linux/sched/task.h
> +++ b/include/linux/sched/task.h
> @@ -32,6 +32,8 @@ struct kernel_clone_args {
>  	size_t set_tid_size;
>  	int cgroup;
>  	int io_thread;
> +	int no_files;
> +	int user_worker;
>  	struct cgroup *cgrp;
>  	struct css_set *cset;
>  };
> @@ -86,7 +88,8 @@ extern pid_t kernel_clone(struct kernel_clone_args *kargs);
>  struct task_struct *create_io_thread(int (*fn)(void *), void *arg, int node);
>  struct task_struct *fork_idle(int);
>  struct mm_struct *copy_init_mm(void);
> -extern pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags);
> +extern pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags,
> +			   int no_files, int user_worker);
>  extern long kernel_wait4(pid_t, int __user *, int, struct rusage *);
>  int kernel_wait(pid_t pid, int *stat);
>  
> diff --git a/init/main.c b/init/main.c
> index f5b8246e8aa1..18f3b126df93 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -676,7 +676,7 @@ noinline void __ref rest_init(void)
>  	 * the init task will end up wanting to create kthreads, which, if
>  	 * we schedule it before we create kthreadd, will OOPS.
>  	 */
> -	pid = kernel_thread(kernel_init, NULL, CLONE_FS);
> +	pid = kernel_thread(kernel_init, NULL, CLONE_FS, 0, 0);
>  	/*
>  	 * Pin init on the boot CPU. Task migration is not properly working
>  	 * until sched_init_smp() has been run. It will set the allowed
> @@ -689,7 +689,7 @@ noinline void __ref rest_init(void)
>  	rcu_read_unlock();
>  
>  	numa_default_policy();
> -	pid = kernel_thread(kthreadd, NULL, CLONE_FS | CLONE_FILES);
> +	pid = kernel_thread(kthreadd, NULL, CLONE_FS | CLONE_FILES, 0, 0);
>  	rcu_read_lock();
>  	kthreadd_task = find_task_by_pid_ns(pid, &init_pid_ns);
>  	rcu_read_unlock();
> diff --git a/kernel/fork.c b/kernel/fork.c
> index bc94b2cc5995..9528940d83d7 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1458,7 +1458,8 @@ static int copy_fs(unsigned long clone_flags, struct task_struct *tsk)
>  	return 0;
>  }
>  
> -static int copy_files(unsigned long clone_flags, struct task_struct *tsk)
> +static int copy_files(unsigned long clone_flags, struct task_struct *tsk,
> +		      int no_files)
>  {
>  	struct files_struct *oldf, *newf;
>  	int error = 0;
> @@ -1470,6 +1471,11 @@ static int copy_files(unsigned long clone_flags, struct task_struct *tsk)
>  	if (!oldf)
>  		goto out;
>  
> +	if (no_files) {
> +		tsk->files = NULL;
> +		goto out;
> +	}
> +
>  	if (clone_flags & CLONE_FILES) {
>  		atomic_inc(&oldf->count);
>  		goto out;
> @@ -1954,11 +1960,14 @@ static __latent_entropy struct task_struct *copy_process(
>  		goto fork_out;
>  	if (args->io_thread) {
>  		/*
> -		 * Mark us an IO worker, and block any signal that isn't
> -		 * fatal or STOP
> +		 * Mark us an IO worker.
>  		 */
>  		p->flags |= PF_IO_WORKER;
> +	}
> +
> +	if (args->user_worker) {
>  		siginitsetinv(&p->blocked, sigmask(SIGKILL)|sigmask(SIGSTOP));
> +		p->flags |= PF_USER_WORKER;
>  	}
>  
>  	/*
> @@ -2104,7 +2113,7 @@ static __latent_entropy struct task_struct *copy_process(
>  	retval = copy_semundo(clone_flags, p);
>  	if (retval)
>  		goto bad_fork_cleanup_security;
> -	retval = copy_files(clone_flags, p);
> +	retval = copy_files(clone_flags, p, args->no_files);
>  	if (retval)
>  		goto bad_fork_cleanup_semundo;
>  	retval = copy_fs(clone_flags, p);
> @@ -2452,6 +2461,7 @@ struct task_struct *create_io_thread(int (*fn)(void *), void *arg, int node)
>  		.stack		= (unsigned long)fn,
>  		.stack_size	= (unsigned long)arg,
>  		.io_thread	= 1,
> +		.user_worker	= 1,
>  	};
>  
>  	return copy_process(NULL, 0, node, &args);
> @@ -2548,7 +2558,8 @@ pid_t kernel_clone(struct kernel_clone_args *args)
>  /*
>   * Create a kernel thread.
>   */
> -pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags)
> +pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags,
> +		    int no_files, int user_worker)
>  {
>  	struct kernel_clone_args args = {
>  		.flags		= ((lower_32_bits(flags) | CLONE_VM |
> @@ -2556,10 +2567,13 @@ pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags)
>  		.exit_signal	= (lower_32_bits(flags) & CSIGNAL),
>  		.stack		= (unsigned long)fn,
>  		.stack_size	= (unsigned long)arg,
> +		.no_files	= no_files,
> +		.user_worker	= user_worker,
>  	};
>  
>  	return kernel_clone(&args);
>  }
> +EXPORT_SYMBOL_GPL(kernel_thread);
>  
>  #ifdef __ARCH_WANT_SYS_FORK
>  SYSCALL_DEFINE0(fork)
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 5b37a8567168..724c7ec63307 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -339,7 +339,8 @@ static void create_kthread(struct kthread_create_info *create)
>  	current->pref_node_fork = create->node;
>  #endif
>  	/* We want our own signal handler (we take no signals by default). */
> -	pid = kernel_thread(kthread, create, CLONE_FS | CLONE_FILES | SIGCHLD);
> +	pid = kernel_thread(kthread, create, CLONE_FS | CLONE_FILES | SIGCHLD,
> +			    0, 0);
>  	if (pid < 0) {
>  		/* If user was SIGKILLed, I release the structure. */
>  		struct completion *done = xchg(&create->done, NULL);
> diff --git a/kernel/signal.c b/kernel/signal.c
> index a3229add4455..3f901067b266 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -2795,11 +2795,11 @@ bool get_signal(struct ksignal *ksig)
>  		}
>  
>  		/*
> -		 * PF_IO_WORKER threads will catch and exit on fatal signals
> +		 * PF_USER_WORKER threads will catch and exit on fatal signals
>  		 * themselves. They have cleanup that must be performed, so
>  		 * we cannot call do_exit() on their behalf.
>  		 */
> -		if (current->flags & PF_IO_WORKER)
> +		if (current->flags & PF_USER_WORKER)
>  			goto out;
>  
>  		/*
> diff --git a/kernel/umh.c b/kernel/umh.c
> index 36c123360ab8..a6b7b733bd99 100644
> --- a/kernel/umh.c
> +++ b/kernel/umh.c
> @@ -132,7 +132,8 @@ static void call_usermodehelper_exec_sync(struct subprocess_info *sub_info)
>  
>  	/* If SIGCLD is ignored do_wait won't populate the status. */
>  	kernel_sigaction(SIGCHLD, SIG_DFL);
> -	pid = kernel_thread(call_usermodehelper_exec_async, sub_info, SIGCHLD);
> +	pid = kernel_thread(call_usermodehelper_exec_async, sub_info, SIGCHLD,
> +			    0, 0);
>  	if (pid < 0)
>  		sub_info->retval = pid;
>  	else
> @@ -172,7 +173,7 @@ static void call_usermodehelper_exec_work(struct work_struct *work)
>  		 * that always ignores SIGCHLD to ensure auto-reaping.
>  		 */
>  		pid = kernel_thread(call_usermodehelper_exec_async, sub_info,
> -				    CLONE_PARENT | SIGCHLD);
> +				    CLONE_PARENT | SIGCHLD, 0, 0);
>  		if (pid < 0) {
>  			sub_info->retval = pid;
>  			umh_complete(sub_info);


Looks quite reasonable to me. You do of course want to post
it and CC the proper people so it gets review. And add the
vhost changes of course.



> -- 
> 2.25.1
> 
> 
> 
> 
> 
> 


