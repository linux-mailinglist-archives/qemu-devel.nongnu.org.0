Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D493C1938
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:33:57 +0200 (CEST)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YqS-0004oh-30
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1YnT-0001l1-Ev
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1YnR-0001PH-JL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Duqc7Uf9xnVO+AtsX/jnU4LHX+9IWKMXtVr9Ec2lE9A=;
 b=fXHV2A8082SLzCpX4SsUFxGboWm6vnDUCoPxs2frxr2px7zde5zJyschHaCEsu68K3colK
 6/n8Ll5BcNVuPdl8cHNm1LEbdkrx/3+u1yBgzMt9Ffi2AfkUkH2jpQPvfoLedOZTICw7DZ
 9h2qTmLJ3oN9yX7Ebf94mL6KZbBRyvE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-butPAnYmO3ywUnuI0m1now-1; Thu, 08 Jul 2021 14:30:47 -0400
X-MC-Unique: butPAnYmO3ywUnuI0m1now-1
Received: by mail-qk1-f198.google.com with SMTP id
 n77-20020a3740500000b02903b496f6f425so4537104qka.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Duqc7Uf9xnVO+AtsX/jnU4LHX+9IWKMXtVr9Ec2lE9A=;
 b=Bg3ANYhrAOUISpICfa44Fw9zp6eSI2vBOg3wFEhlSo8HkFDCNH2lxv4QuH1sDthyo4
 J1aY0JJ5NNM2azHuUXjI5cjuPNLBFM4qm5ISEVnAaVcBKAnuquvSy+TAuwl5uXdtyNJ6
 Kf75f7Yf2rj2H8gsm2wfFgkdX76zHsuAV0Et76mKeue46rExEppbpGK68O/WOaGBjnT5
 0sgAC1kmjudqUDdhHIlYf77SHYKszN3fBIE8r9pexIU7VStrjCQGmzVCMlmhCQ/Ftz6T
 VoJAqYnWkKstYz/VxWSn97g5QHYbtMlsi6FLVbuCH9Vva4I0qpd5fucliAqqxF7B3Sty
 zU3g==
X-Gm-Message-State: AOAM533L3AuvPUc7SW9AnUnf5ZUyVfk2FWDV4AqZNxmQjU2+VyjDNtzW
 POQxWm+Qa4yS82IK1IeBwyq6S1y5WMWEotmQwKUlxx1hRA4mhlyEz4FwYtVm9Wn+xZ5FrYtv8Jb
 rmcbfXlD/Po0/grM=
X-Received: by 2002:a0c:fbc6:: with SMTP id n6mr30818560qvp.35.1625769046324; 
 Thu, 08 Jul 2021 11:30:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT4rw7OOSy8ytowtuHksXk3kIk8EEHHxU5nOx2O3Fy3gOMdWhMaZrtsWGv4zu+K+vYqxpR+w==
X-Received: by 2002:a0c:fbc6:: with SMTP id n6mr30818535qvp.35.1625769046032; 
 Thu, 08 Jul 2021 11:30:46 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i2sm1386831qko.43.2021.07.08.11.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:30:45 -0700 (PDT)
Date: Thu, 8 Jul 2021 14:30:44 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOdEVI74aWIao3lU@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
 <YN26SDxZS1aShbHi@t490s>
 <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com>
 <YOSaDzCd4ZmcRQHl@t490s>
 <2eb1ccd7105d4823898ea68a614d16f9@intel.com>
 <YOXZ1fzH+qXGJLs1@t490s>
 <e392987d17f345969dd86be513b1702b@intel.com>
MIME-Version: 1.0
In-Reply-To: <e392987d17f345969dd86be513b1702b@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 02:49:51AM +0000, Wang, Wei W wrote:
> On Thursday, July 8, 2021 12:44 AM, Peter Xu wrote:
> > > > Not to mention the hard migration issues are mostly with non-idle
> > > > guest, in that case having the balloon in the guest will be
> > > > disastrous from this pov since it'll start to take mutex for each
> > > > page, while balloon would hardly report anything valid since most guest pages
> > are being used.
> > >
> > > If no pages are reported, migration thread wouldn't wait on the lock then.
> > 
> > Yes I think this is the place I didn't make myself clear.  It's not about sleeping, it's
> > about the cmpxchg being expensive already when the vm is huge.
> 
> OK.
> How did you root cause that it's caused by cmpxchg, instead of lock contention (i.e. syscall and sleep) or
> some other code inside pthread_mutex_lock(). Do you have cycles about cmpxchg v.s. cycles of pthread_mutex_lock()?

We've got "perf top -g" showing a huge amount of stacks lying in
pthread_mutex_lock().

> 
> I check the implementation of pthread_mutex_lock(). The code path for lock acquire is long. QemuSpin looks more efficient.
> (probably we also don’t want migration thread to sleep in any case)

I didn't check it, but I really hoped it should be very close to a spinlock
version when it's not contended.  We should be careful on using spin locks in
userspace, e.g., with that moving clear log into critical section will be too
much and actuall close to "wrong", imho, because the kvm memslot lock inside is
sleepable.

I think it's very fine to have migration thread sleep.  IMHO we need explicit
justification for each mutex to be converted to a spinlock in userspace.  So
far I don't see it yet for this bitmap lock.

Frankly I also don't know how spinlock would work reliably without being able
to disable scheduling, then could the thread got scheduled out duing taking the
spinlock?  Would another thread trying to take this lock spinning on this
sleeping task?

> 
> I think it's also better to see the comparison of migration throughput data (i.e. pages per second) in the following cases, before we make a decision:
> - per-page mutex
> - per-page spinlock
> - 50-ms mutex

I don't have the machines, so I can't do this.  I also see this as separate
issues to solve to use spinlock, as I said before I would prefer some
justification first to use it rather than blindly running tests and pick a
patch with higher number.

I also hope we can reach a consensus that we fix one issue at a time.  This
patch already proves itself with some real workloads, I hope we can merge it
first, either with 50ms period or less.

Per-page locking is already against at least my instinction of how this should
be done; I just regreted I didn't see that an issue when reviewing the balloon
patch as I offered the r-b myself.  However I want to make it work as before
then we figure out a better approach on how the lock is taken, and which lock
we should use.  I don't see it a must to do all things in one patch.

Thanks,

-- 
Peter Xu


