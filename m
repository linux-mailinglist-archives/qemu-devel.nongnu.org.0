Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48863BDC6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:17:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozxfj-0003EW-1q; Tue, 29 Nov 2022 05:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozxfX-00038t-Jx
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:16:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozxfS-0006QG-V4
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669717005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zztyP6QbJvP07eqX+BuKmahgYeBY9pi0/LDCxLZawk=;
 b=FuZeg+blB4IikOcjI0ILU69ztVEonLW9yYPZc2N/hIfQvUfuXq5M4nrU0Ii8i0AV8p40xP
 JBz8OvgulQBVSZ63IyRCO6tKRFjGdrV2XykmJ/luEhz3VRb8bj8bLyWoJNUG56bUKUgEDF
 +HPvl6uh7KWDBNUQPJJueJkZEae5P9w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-QVmqoTmJMw-GD2A8PROipw-1; Tue, 29 Nov 2022 05:16:43 -0500
X-MC-Unique: QVmqoTmJMw-GD2A8PROipw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h10-20020adfaa8a000000b0024208cf285eso2031899wrc.22
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 02:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0zztyP6QbJvP07eqX+BuKmahgYeBY9pi0/LDCxLZawk=;
 b=lTBEfUAMOQxG7yaECOzXDulsR881O98pRlbC1khF+OHO8g0PF4SPv9eDOV+Y+o7XLE
 YkvFhwlmvUUeOgf9vf+QjmDm7KezLMGr29N8GnjSNQqDDbqxKrFV21YKFeFio2uwPIXh
 8Hkv7N4WEK0dxgu8Z0Aw1x9pBdvdTRUxXL7GdJ5/eNnuWhm2wRirsHDODs1ZenytqN3W
 MJwI2hLOF+bUsl/6VRjK/tXR+cdFtCGqTXGeU5DqIemg1EtDM39l1rdhyTMxTv7vnCZw
 CcmkV9M4bcX+tygtT96Qf1BK4ccDg0CMHbChf8r0l4vcYqMd0qh09IHx3oChuYirojxq
 pwnw==
X-Gm-Message-State: ANoB5plsOke5JDQDClmBtgxgewQLuwFdCe2FgKBGy+s/t8VxQ58NshbY
 ksS6UB+473KGyqW9O6KEyiLnt+s/64ACSvz2HIsZCZj+DJSz1TKKarh4cO6yi4zqP58Upcr2mBI
 PN0GFWaafJ8uf+i0=
X-Received: by 2002:adf:ea81:0:b0:241:bcc1:7643 with SMTP id
 s1-20020adfea81000000b00241bcc17643mr23612389wrm.673.1669717002415; 
 Tue, 29 Nov 2022 02:16:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7b2Cyk31ymkz4j6pK08cmZHmzZQpoL0N33WQfJRaccKSxTBDhXwWLa5VRzGikwaUHQdnumqA==
X-Received: by 2002:adf:ea81:0:b0:241:bcc1:7643 with SMTP id
 s1-20020adfea81000000b00241bcc17643mr23612366wrm.673.1669717002066; 
 Tue, 29 Nov 2022 02:16:42 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b003c6f1732f65sm1641123wmo.38.2022.11.29.02.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 02:16:41 -0800 (PST)
Date: Tue, 29 Nov 2022 10:16:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Stefan Liebler <stli@linux.ibm.com>
Subject: Re: [PATCH] virtiofsd: Add `sigreturn` to the seccomp whitelist
Message-ID: <Y4XcByAJBWaCo0sP@work-vm>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <Y4UCPQ0E2ZY15aEq@work-vm> <87wn7ef6cm.fsf@linux.ibm.com>
 <Y4XT/ZxuyU7F5h1n@work-vm>
 <1a94f96b-d9b6-44af-cedb-aa17eb1a3a84@de.ibm.com>
 <618edde1-31d8-9db8-48d9-137fe81b788b@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <618edde1-31d8-9db8-48d9-137fe81b788b@de.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

* Christian Borntraeger (borntraeger@de.ibm.com) wrote:
> 
> 
> Am 29.11.22 um 10:52 schrieb Christian Borntraeger:
> > 
> > 
> > Am 29.11.22 um 10:42 schrieb Dr. David Alan Gilbert:
> > > * Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> > > > 
> > > > > * Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
> > > > > > The virtiofsd currently crashes on s390x. This is because of a
> > > > > > `sigreturn` system call. See audit log below:
> > > > > > 
> > > > > > type=SECCOMP msg=audit(1669382477.611:459): auid=4294967295 uid=0 gid=0 ses=4294967295 subj=system_u:system_r:virtd_t:s0-s0:c0.c1023 pid=6649 comm="virtiofsd" exe="/usr/libexec/virtiofsd" sig=31 arch=80000016 syscall=119 compat=0 ip=0x3fff15f748a code=0x80000000AUID="unset" UID="root" GID="root" ARCH=s390x SYSCALL=sigreturn
> > > > > 
> > > > > I'm curious; doesn't that mean that some signal is being delivered and
> > > > > you're returning?  Which one?
> > > > 
> > > > code=0x80000000 means that the seccomp action SECCOMP_RET_KILL_PROCESS
> > > > is taken => process is killed by a SIGSYS signal (31) [1].
> > > > 
> > > > At least, that’s my understanding of this log message.
> > > > 
> > > > [1] https://man7.org/linux/man-pages/man2/seccomp.2.html
> > > 
> > > But isn't that the fallout rather than the cause ? i.e. seccomp
> > > is sending a SIGSYS because the process used sigreturn, my question
> > > is why did the process call sigreturn in the first place - it must
> > > have received a signal to return from?
> > 
> > Good question. virtiofsd seems to prepare itself for
> > 
> > int fuse_set_signal_handlers(struct fuse_session *se)
> > {
> >      /*
> >       * If we used SIG_IGN instead of the do_nothing function,
> >       * then we would be unable to tell if we set SIG_IGN (and
> >       * thus should reset to SIG_DFL in fuse_remove_signal_handlers)
> >       * or if it was already set to SIG_IGN (and should be left
> >       * untouched.
> >       */
> >      if (set_one_signal_handler(SIGHUP, exit_handler, 0) == -1 ||
> >          set_one_signal_handler(SIGINT, exit_handler, 0) == -1 ||
> >          set_one_signal_handler(SIGTERM, exit_handler, 0) == -1 ||
> >          set_one_signal_handler(SIGPIPE, do_nothing, 0) == -1) {
> >          return -1;
> >      }
> > 
> > 
> > 
> > Given that rt_sigreturn was already on the seccomp list it seems
> > to be expected that those handlers are called.
> 
> For me, it seems to happen on shutdown:
>                 Stack trace of thread 1:
>                 #0  0x000003ffc06f348a __kernel_sigreturn (linux-vdso64.so.1 + 0x48a)
>                 #1  0x000003ffc06f3488 __kernel_sigreturn (linux-vdso64.so.1 + 0x488)
>                 #2  0x000003ff9af1be96 __GI___futex_abstimed_wait_cancelable64 (libc.so.6 + 0x9be96)
>                 #3  0x000003ff9af211b4 __pthread_clockjoin_ex (libc.so.6 + 0xa11b4)
>                 #4  0x000003ff9af2106e pthread_join@GLIBC_2.2 (libc.so.6 + 0xa106e)
>                 #5  0x000002aa35d2fe36 fv_queue_cleanup_thread (virtiofsd + 0x2fe36)
>                 #6  0x000002aa35d3152c stop_all_queues (virtiofsd + 0x3152c)
>                 #7  0x000002aa35d2869c main (virtiofsd + 0x2869c)
>                 #8  0x000003ff9aeb4872 __libc_start_call_main (libc.so.6 + 0x34872)
>                 #9  0x000003ff9aeb4950 __libc_start_main@@GLIBC_2.34 (libc.so.6 + 0x34950)
>                 #10 0x000002aa35d290a0 .annobin_libvhost_user.c_end.startup (virtiofsd + 0x290a0)

<shrug> I guess it could be a SIGCHLD or SIGPIPE or something during
shutdown; I guess especially since we have the SIGPIPE registered.

Dave

> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


