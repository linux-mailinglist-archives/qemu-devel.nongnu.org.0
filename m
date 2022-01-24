Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A385949779D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 04:12:45 +0100 (CET)
Received: from localhost ([::1]:56362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBpme-0005u0-AH
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 22:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nBpjC-0004bZ-Ff
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 22:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nBpj8-0000cZ-O3
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 22:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642993744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43mKIdLbeOnj0UxeM0h5hVzbSwV1pOl3jm8LByqYvWM=;
 b=N8qnO9nBuikAkAnJmOCdUUH7pyZBICVI5MfFMLLNziLZT6RfWkGNWOtYYEcVulJvlfMKEA
 tIo8lWf0U/LLXiEEFg8U6ZbkEoQCAOHYWifknVJYn4vreIjjZEW+M/8Ej0o4PqYaIrTUjd
 jRrBtqMfWgIjCshyIAcaF4ZgHPj6C14=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-XMuFoHw6Ne-eF_DHDRI-Ew-1; Sun, 23 Jan 2022 22:09:03 -0500
X-MC-Unique: XMuFoHw6Ne-eF_DHDRI-Ew-1
Received: by mail-pj1-f71.google.com with SMTP id
 j9-20020a17090a7e8900b001b58e473d48so1278970pjl.5
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 19:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=43mKIdLbeOnj0UxeM0h5hVzbSwV1pOl3jm8LByqYvWM=;
 b=SVT4jzkJte4SC7neb99HSCs0rJzgYzO1rq5MJvuarvoKlHjlXEVtEZebUnKMskr+Oq
 8zTd/dg9/CrYAMvTpQRyPna/+cOuEz3p35a6jNGK8IKFuryV5gqPWCt5YpDI68HeE/FY
 nTVr2LLfgDQwPll7GdYyr3yOrHHNPD7oUngdqHDXke9tWJsmDyELmWtA0VQ3ljgew8pz
 7EXFXeKevzzJtYfzVbnXV/82BjiVghQmEJb4SXFHEj8Jwssmy6hiSYC8pkeLK2JNJXvz
 /56vYHpcDlnTo4cza3nqkiuWIoejMawFFg3xIT2f0u/CMIuZ3NN3zDko5L9xjhsgy0PG
 k+pQ==
X-Gm-Message-State: AOAM5302G5B4E0jB4Cux+jpt4IIEcuOcKwCM6dC1VBOQJ+NXIosdE/mK
 7FSHYW6a4MUluXSwEdyvSyOYHQWNrCY7Kgp5irfX7/u4S4l43iZj/HFd5JnFNh5aqOo09XHpmF7
 PhMOJ/nCvG+QSXK0=
X-Received: by 2002:a63:da4e:: with SMTP id l14mr10585551pgj.220.1642993741858; 
 Sun, 23 Jan 2022 19:09:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHyaskx5nLJgfpAc++xOSbCuybmMrWsaHn2UnpPnir2Gbi7YBHZiEpfqVCL8pzJ9kodpAElA==
X-Received: by 2002:a63:da4e:: with SMTP id l14mr10585532pgj.220.1642993741498; 
 Sun, 23 Jan 2022 19:09:01 -0800 (PST)
Received: from xz-m1.local ([94.177.118.73])
 by smtp.gmail.com with ESMTPSA id y3sm10509525pge.60.2022.01.23.19.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 19:09:00 -0800 (PST)
Date: Mon, 24 Jan 2022 11:08:54 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v11 1/4] migration/dirtyrate: refactor dirty page rate
 calculation
Message-ID: <Ye4YRsXDfvjuoPsh@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <7cc032ae98e29471de57c00d3c0bd0fc5129ae23.1641316375.git.huangy81@chinatelecom.cn>
 <YeTSIh2Osx7Yrjle@xz-m1.local>
 <bbfa9f72-c673-255c-73b6-d17406d54374@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <bbfa9f72-c673-255c-73b6-d17406d54374@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 22, 2022 at 11:22:37AM +0800, Hyman Huang wrote:
> 
> 
> 在 2022/1/17 10:19, Peter Xu 写道:
> > On Wed, Jan 05, 2022 at 01:14:06AM +0800, huangy81@chinatelecom.cn wrote:
> > > From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > > 
> > > +
> > > +static void vcpu_dirty_stat_collect(VcpuStat *stat,
> > > +                                    DirtyPageRecord *records,
> > > +                                    bool start)
> > > +{
> > > +    CPUState *cpu;
> > > +
> > > +    CPU_FOREACH(cpu) {
> > > +        if (!start && cpu->cpu_index >= stat->nvcpu) {
> > > +            /*
> > > +             * Never go there unless cpu is hot-plugged,
> > > +             * just ignore in this case.
> > > +             */
> > > +            continue;
> > > +        }
> > 
> > As commented before, I think the only way to do it right is does not allow cpu
> > plug/unplug during measurement..
> > 
> > Say, even if index didn't get out of range, an unplug even should generate very
> > stange output of the unplugged cpu.  Please see more below.
> > 
> > > +        record_dirtypages(records, cpu, start);
> > > +    }
> > > +}
> > > +
> > > +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
> > > +                                 int64_t init_time_ms,
> > > +                                 VcpuStat *stat,
> > > +                                 unsigned int flag,
> > > +                                 bool one_shot)
> > > +{
> > > +    DirtyPageRecord *records;
> > > +    int64_t duration;
> > > +    int64_t dirtyrate;
> > > +    int i = 0;
> > > +
> > > +    cpu_list_lock();
> > > +    records = vcpu_dirty_stat_alloc(stat);
> > > +    vcpu_dirty_stat_collect(stat, records, true);
> > > +    cpu_list_unlock();
> > 
> > Continue with above - then I'm wondering whether we should just keep taking the
> > lock until vcpu_dirty_stat_collect().
> > 
> > Yes we could be taking the lock for a long time because of the sleep, but the
> > main thread plug thread will just wait for it to complete and it is at least
> > not a e.g. deadlock.
> > 
> > The other solution is we do cpu_list_unlock() like this, but introduce another
> > cpu_list_generation_id and boost it after any plug/unplug of cpu, aka, when cpu
> > list changes.
> > 
> > Then we record cpu generation ID at the entry of this function and retry the
> > whole measurement if at some point we found generation ID changed (we need to
> > fetch the gen ID after having the lock, of course).  That could avoid us taking
> > the cpu list lock during dirty_stat_wait(), but it'll start to complicate cpu
> > list locking rules.
> > 
> > The simpler way is still just to take the lock, imho.
> > 
> Hi, Peter, i'm working on this as you suggetion, and keep taking the
> cpu_list_lock during dirty page rate calculation. I found the deadlock when
> testing hotplug scenario, the logic is as the following:
> 
> calc thread				qemu main thread
> 1. take qemu_cpu_list_lock
> 					1. take the BQL
> 2. collect dirty page and wait		2. cpu hotplug
> 					3. take qemu_cpu_list_lock
> 3. take the BQL
> 
> 4. sync dirty log			
> 
> 5. release the BQL
> 
> I just recall that is one of the reasons why i handle the plug/unplug
> scenario(another is cpu plug may wait a little bit long time when dirtylimit
> in service).

Ah I should have noticed the bql dependency with cpu list lock before..

I think having the cpu plug waiting for one sec is fine, because the mgmt app
should be aware of both so it shouldn't even happen in practise (not good
timing to plug during pre-migration).  However bql is definitely another
story..  which I agree.

> 
> It seems that we have two strategies, one is just keep this logic untouched
> in v12 and add "cpu_list_generation_id" implementaion in TODO list(once this
> patchset been merged, i'll try that out)， another is introducing the
> "cpu_list_generation_id" right now.
> 
> What strategy do you prefer to?

I prefer having the gen_id patch.  The thing is it should be less than 10 lines
and the logic should be fairly straightforward.  While if without it, it seems
always on risk to use this new feature.

I hope I didn't overlook any existing mechanism to block cpu plug/unplug for
some period, though, or we should use it.

> 
> Uh... I think the "unmatched_cnt" also kind of like this too, becauce once
> we remove the "unmatched count" logic, the throttle algo is more likely to
> oscillate and i prefer to add the "unmatched_cnt" in TODO list as above.

Could we tune the differential factor to make it less possible to oscillate?

I still can't say I like "unmatched cnt" idea a lot..  From a PID pov (partial,
integral, differential) you've already got partial + differential, and IMHO
that "unmatched cnt" solution was trying to mimic an "integral" delta.  Instead
of doing an mean value calculation (as in most integral system does) the
"unmatched cnt" solution literally made it an array of 2 and it dropped the 1st
element..  Hence a decision was made only from the 2nd data you collected.

From that POV I think it's cleaner you add a real (but simple) integral algo
into it?  It can be e.g. an array of 3, then when you do the math you use the
average of the three dirty rates.  Would that work (and also look a bit
cleaner)?

Thanks,

-- 
Peter Xu


