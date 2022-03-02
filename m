Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F714CAADC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:55:00 +0100 (CET)
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSFf-0006N9-B3
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:54:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPSEO-0005hu-5X
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:53:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPSEK-0006Do-Dt
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646240014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kezmZM+zX1tt24UWYNZMeTcqWGjn2VXZQ75ErTwH8lM=;
 b=SxC+2/N6kMUgSHfebEfbgLCJsYM5MJtRCeLupjskz/5Lqm/8sELq/u8uorpP8djiHT1R+u
 rlupbVB29NCtyinYXL/rElN2Ylw480WVG7phOs425oRJXGUsofyBbKRvcc8Efhzg4hDWS4
 kh/MFnqfdcnQvdbuIvcxgzuAAVaF5FM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-e8xqzVPUNh-ATCegNDRcMg-1; Wed, 02 Mar 2022 11:53:31 -0500
X-MC-Unique: e8xqzVPUNh-ATCegNDRcMg-1
Received: by mail-wm1-f72.google.com with SMTP id
 f12-20020a7bcd0c000000b00384993440cfso811212wmj.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 08:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kezmZM+zX1tt24UWYNZMeTcqWGjn2VXZQ75ErTwH8lM=;
 b=vl7tI51rL9grxS++tyhFMr8/CaL0G15q3K8QP+G8YGwmmNojgalknM3mTljSBGAzLM
 aNkX+qgnOcuoNAmgdpLJZcjXrc/OBmqODz4w9u/e7iIaM1jPGZGz3aB1oDJXxIkdEb0X
 KO8UFBTf+lrc5WHH+cF+zKIqMpi0mPqtvfk5V4GaMV+30FmPPx7L5t/CvjKEQztXE3Xm
 lgBOgoU/MYN0E76Eq0V4p1tHaTOjs3MET/epm6vht+XX8qLwvZnxF3VUICk7k2fO96xk
 cXcwa8pcGwpWFPp54n3J4gP+N2lw2gctetauHIcyJN4Gz57ntB5OMHEyiEQc7A7I71F7
 ygvg==
X-Gm-Message-State: AOAM531sZrU60xwJTI4+YwHDPFMXD4IOU6tUGyxtlCUGgwGytrvZuwjn
 3slj6LyiXsjUrm18DE8THBnYZR7MOfpw9tUuJyv9EL0NoPQUsxlsyR+z3rtPn/w+gWgKV5KSo5O
 F+/LbTpZRbJZX81U=
X-Received: by 2002:adf:e804:0:b0:1ea:9c3b:8f41 with SMTP id
 o4-20020adfe804000000b001ea9c3b8f41mr24201002wrm.53.1646240010005; 
 Wed, 02 Mar 2022 08:53:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0E0UN8+0o1nSPf34Zy79YpLu8s5p+297pbq5juTTjYElOqEQ5gTlTM59Dm8lgp+v6s9XGkA==
X-Received: by 2002:adf:e804:0:b0:1ea:9c3b:8f41 with SMTP id
 o4-20020adfe804000000b001ea9c3b8f41mr24200982wrm.53.1646240009612; 
 Wed, 02 Mar 2022 08:53:29 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k10-20020adfe3ca000000b001f0329ba94csm3218935wrm.18.2022.03.02.08.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 08:53:29 -0800 (PST)
Date: Wed, 2 Mar 2022 16:53:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v16 0/7] support dirty restraint on vCPU
Message-ID: <Yh+hB3yP8F358RvM@work-vm>
References: <cover.1645067452.git.huangy81@chinatelecom.cn>
 <Yh97r/DA+ZK4eYUl@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yh97r/DA+ZK4eYUl@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus ArmBruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * huangy81@chinatelecom.cn (huangy81@chinatelecom.cn) wrote:
> > From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Queued via my migration/hmp/etc tree

Hi,
  Unfortunately I've had to unqueue this - it breaks the
qmp-cmd-test:

# starting QEMU: exec ./x86_64-softmmu/qemu-system-x86_64 -qtest unix:/tmp/qtest-142136.sock -qtest-log /dev/fd/2 -chardev socket,path=/tmp/qtest-142136.qmp,id=char0 -mon chardev=char0,mode=control -display none -nodefaults -machine none -accel qtest
[I 1646239093.713627] OPENED
[R +0.000190] endianness
[S +0.000196] OK little
{"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 6}, "package": "v6.2.0-1867-g817703d65a"}, "capabilities": ["oob"]}}{"execute": "qmp_capabilities"}

{"return": {}}{"execute": "query-vcpu-dirty-limit"}

{"error": {"class": "GenericError", "desc": "dirty page limit not enabled"}}**
ERROR:../tests/qtest/qmp-cmd-test.c:84:test_query: assertion failed: (qdict_haskey(resp, "return"))
Bail out! ERROR:../tests/qtest/qmp-cmd-test.c:84:test_query: assertion failed: (qdict_haskey(resp, "return"))
[I +0.195433] CLOSED
Aborted (core dumped)


qmp-cmd-test tries to run every query command; so either you need to:
  a) Add it to the list of skipped command in qmp-cmd-test
  b) Make it not actually error when the limit isn't enabled.

Dave

> > 
> > v16
> > - rebase on master
> > - drop the unused typedef syntax in [PATCH v15 6/7] 
> > - add the Reviewed-by and Acked-by tags by the way 
> > 
> > v15
> > - rebase on master
> > - drop the 'init_time_ms' parameter in function vcpu_calculate_dirtyrate 
> > - drop the 'setup' field in dirtylimit_state and call dirtylimit_process
> >   directly, which makes code cleaner.
> > - code clean in dirtylimit_adjust_throttle
> > - fix miss dirtylimit_state_unlock() in dirtylimit_process and
> >   dirtylimit_query_all
> > - add some comment
> > 
> > Please review. Thanks,
> > 
> > Regards
> > Yong 
> > 
> > v14
> > - v13 sent by accident, resend patchset. 
> > 
> > v13
> > - rebase on master
> > - passing NULL to kvm_dirty_ring_reap in commit
> >   "refactor per-vcpu dirty ring reaping" to keep the logic unchanged.
> >   In other word, we still try the best to reap as much PFNs as possible
> >   if dirtylimit not in service.
> > - move the cpu list gen id changes into a separate patch.   
> > - release the lock before sleep during dirty page rate calculation.
> > - move the dirty ring size fetch logic into a separate patch.
> > - drop the DIRTYLIMIT_LINEAR_ADJUSTMENT_WATERMARK MACRO .
> > - substitute bh with function pointer when implement dirtylimit.
> > - merge the dirtylimit_start/stop into dirtylimit_change.
> > - fix "cpu-index" parameter type with "int" to keep consistency.
> > - fix some syntax error in documents.
> > 
> > Please review. Thanks,
> > 
> > Yong
> > 
> > v12
> > - rebase on master
> > - add a new commmit to refactor per-vcpu dirty ring reaping, which can resolve 
> >   the "vcpu miss the chances to sleep" problem
> > - remove the dirtylimit_thread and implemtment throttle in bottom half instead.
> > - let the dirty ring reaper thread keep sleeping when dirtylimit is in service 
> > - introduce cpu_list_generation_id to identify cpu_list changing. 
> > - keep taking the cpu_list_lock during dirty_stat_wait to prevent vcpu plug/unplug
> >   when calculating the dirty page rate
> > - move the dirtylimit global initializations out of dirtylimit_set_vcpu and do
> >   some code clean
> > - add DIRTYLIMIT_LINEAR_ADJUSTMENT_WATERMARK in case of oscillation when throttling 
> > - remove the unmatched count field in dirtylimit_state
> > - add stub to fix build on non-x86
> > - refactor the documents
> > 
> > Thanks Peter and Markus for reviewing the previous versions, please review.
> > 
> > Thanks,
> > Yong
> > 
> > v11
> > - rebase on master
> > - add a commit " refactor dirty page rate calculation"  so that dirty page rate limit
> >   can reuse the calculation logic. 
> > - handle the cpu hotplug/unplug case in the dirty page rate calculation logic.
> > - modify the qmp commands according to Markus's advice.
> > - introduce a standalone file dirtylimit.c to implement dirty page rate limit
> > - check if dirty limit in service by dirtylimit_state pointer instead of global variable
> > - introduce dirtylimit_mutex to protect dirtylimit_state
> > - do some code clean and docs
> > 
> > See the commit for more detail, thanks Markus and Peter very mush for the code
> > review and give the experienced and insightful advices, most modifications are
> > based on these advices.
> > 
> > v10:
> > - rebase on master
> > - make the following modifications on patch [1/3]:
> >   1. Make "dirtylimit-calc" thread joinable and join it after quitting.
> > 
> >   2. Add finalize function to free dirtylimit_calc_state
> > 
> >   3. Do some code clean work
> > 
> > - make the following modifications on patch [2/3]:
> >   1. Remove the original implementation of throttle according to
> >      Peter's advice.
> >      
> >   2. Introduce a negative feedback system and implement the throttle
> >      on all vcpu in one thread named "dirtylimit". 
> > 
> >   3. Simplify the algo when calculation the throttle_us_per_full:
> >      increase/decrease linearly when there exists a wide difference
> >      between quota and current dirty page rate, increase/decrease
> >      a fixed time slice when the difference is narrow. This makes
> >      throttle responds faster and reach the quota smoothly.
> > 
> >   4. Introduce a unfit_cnt in algo to make sure throttle really
> >      takes effect.
> > 
> >   5. Set the max sleep time 99 times more than "ring_full_time_us".                                                                                                                                                                          
> >                                                                                                                                                                                                                                              
> >   6. Make "dirtylimit" thread joinable and join it after quitting.                                                                                                                                                                           
> >                                                                                                                                                                                                                                              
> > - make the following modifications on patch [3/3]:                                                                                                                                                                                           
> >   1. Remove the unplug cpu handling logic.                                                                                                                                                                                                   
> >                                                                                                                                                                                                                                              
> >   2. "query-vcpu-dirty-limit" only return dirtylimit information of                                                                                                                                                                          
> >      vcpus that enable dirtylimit                                                                                                                                                                                                            
> >                                                                                                                                                                                                                                              
> >   3. Remove the "dirtylimit_setup" function                                                                                                                                                                                                  
> >                                                                                                                                                                                                                                              
> >   4. Trigger the dirtylimit and initialize the global state only                                                                                                                                                                             
> >      when someone enable dirtylimit, and finalize it after the last                                                                                                                                                                          
> >      dirtylimit be canceled.                                                                                                                                                                                                                 
> >                                                                                                                                                                                                                                              
> >   5. Redefine the qmp command vcpu-dirty-limit/query-vcpu-dirty-limit:                                                                                                                                                                       
> >      enable/disable dirtylimit use a single command "vcpu-dirty-limit",
> >      to enable/disabled dirtylimit on specified vcpu only if "cpu-index"
> >      is specified, otherwise, all vcpu will be affected.
> > 
> >   6. Redefine the hmp command vcpu_dirty_limit/info vcpu_dirty_limit
> > 
> > - other points about the code review:
> >   1. "merge the code of calculation dirty page rate"
> >      I think maybe it's not suitable to touch the 'calc-dirty-rate',
> >      because 'calc-dirty-rate' will stop sync log after calculating 
> >      the dirtyrate and the 'dirtylimit-cal' will not untill the last
> >      dirtylimit be canceled, if we merge the GLOBAL_DIRTY_LIMIT into
> >      GLOBAL_DIRTY_DIRTYRATE, the two are interacted with each other.
> > 
> >   2. The new implementaion of throttle algo enlightened by Peter
> >      responds faster and consume less cpu resource than the older,
> >      we make a impressed progress.
> > 
> >      And there is a viewpoint may be discussed, it is that the new 
> >      throttle logic is "passive", vcpu sleeps only after dirty ring,
> >      is full, unlike the "auto-converge" which will kick vcpu instead
> >      in a fixed slice time. If the vcpu is memory-write intensive
> >      and the ring size is large, it will produce dirty memory during
> >      the dirty ring full time and the throttle works not so good, it
> >      means the throttle depends on the dirty ring size. 
> > 
> >      I actually tested the new algo in two case:
> > 
> >      case 1: dirty-ring-size: 4096, dirtyrate: 1170MB/s 
> >      result: minimum quota dirtyrate is 25MB/s or even less
> >              minimum vcpu util is 6%
> > 
> >      case 2: dirty-ring-size: 65536, dirtyrate: 1170MB/s 
> >      result: minimum quota dirtyrate is 256MB/s
> >              minimum vcpu util is 24%
> >      
> >      I post this just for discussion, i think this is not a big deal
> >      beacase if we set the dirty-ring-size to the maximum value(65536),
> >      we assume the server's bandwidth is capable of handling it.
> > 
> >   3. I hard-code the acceptable deviation value to 25MB/s, see the
> >      macro DIRTYLIMIT_TOLERANCE_RANGE. I'm struggling to decide 
> >      whether to let it configurable
> >    
> >   4. Another point is the unplug cpu handle, current algo affects the
> >      unplugged vcpu, if we set dirty limit on it, we should fork 2 
> >      thread "dirtylimit" and "dirtylimit-calc" but do nothing, once the
> >      vcpu is hot-plugged, dirty limit works, i think the logic is ok
> >      but still there can be different advice.
> > 
> > - to let developers play with it easier, i post the hmp usage example:
> >   (qemu) vcpu_dirty_limit -g on -1 500
> >   [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
> >   
> >   (qemu) info vcpu_dirty_limit 
> >   vcpu[0], limit rate 500 (MB/s), current rate 415 (MB/s)
> >   vcpu[1], limit rate 500 (MB/s), current rate 496 (MB/s)
> >   vcpu[2], limit rate 500 (MB/s), current rate 0 (MB/s)
> >   vcpu[3], limit rate 500 (MB/s), current rate 0 (MB/s)
> >   (qemu) vcpu_dirty_limit -g off
> >   [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
> >   
> >   (qemu) info vcpu_dirty_limit 
> >   Dirty page limit not enabled!
> >   
> >   (qemu) vcpu_dirty_limit on 0 300
> >   [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
> >   
> >   (qemu) vcpu_dirty_limit on 1 500
> >   [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
> >   
> >   (qemu) info vcpu_dirty_limit 
> >   vcpu[0], limit rate 300 (MB/s), current rate 342 (MB/s)
> >   vcpu[1], limit rate 500 (MB/s), current rate 485 (MB/s)
> >   
> >   (qemu) vcpu_dirty_limit off 0
> >   [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
> >   
> >   (qemu) info vcpu_dirty_limit 
> >   vcpu[1], limit rate 500 (MB/s), current rate 528 (MB/s)
> >   
> >   (qemu) vcpu_dirty_limit off 1
> >   [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
> >   
> >   (qemu) info vcpu_dirty_limit 
> >   Dirty page limit not enabled!
> > 
> > Thanks very much for the instructive algo suggestion given by Peter,
> > the comment and other code reviews made by Markus.
> > 
> > Please review, thanks!
> > 
> > v9:
> > - rebase on master
> > - fix the meson directory change, keep it untouched.
> > 
> > v8:
> > - rebase on master
> > - polish the error message and remove the "unlikely" compilation syntax
> >   according to the advice given by Markus.
> > - keep the dirty tracking enabled during "dirtylimit-calc" lifecycle
> >   so that the overhead can be reduced according to the advice given by
> >   Peter. 
> > - merge the "set/cancel" qmp commands into one named "vcpu-dirty-limit"
> >   and introduce qmp command "query-vcpu-dirty-limit" to query dirty
> >   limit information about virtual CPU, according to the advice given by
> >   Peter.
> > - check if vcpu index is valid and handle the unplug case before
> >   enabling, disabling dirty limit for virtual CPU.
> > - introduce hmp commands so developers can play with them easier, use
> >   "vcpu_dirty_limit" to enable dirty limit and "info vcpu_dirty_limit"
> >   to query.
> > 
> > The patch [2/3] has not been touched so far. Any corrections and
> > suggetions are welcome. 
> > 
> > Please review, thanks!
> > 
> > v7:
> > - rebase on master
> > - polish the comments and error message according to the
> >   advices given by Markus
> > - introduce dirtylimit_enabled function to pre-check if dirty
> >   page limit is enabled before canceling.
> > 
> > v6:
> > - rebase on master
> > - fix dirtylimit setup crash found by Markus
> > - polish the comments according to the advice given by Markus
> > - adjust the qemu qmp command tag to 7.0
> > 
> > v5:
> > - rebase on master
> > - adjust the throttle algorithm by removing the tuning in 
> >   RESTRAINT_RATIO case so that dirty page rate could reachs the quota
> >   more quickly.
> > - fix percentage update in throttle iteration.
> > 
> > v4:
> > - rebase on master
> > - modify the following points according to the advice given by Markus
> >   1. move the defination into migration.json
> >   2. polish the comments of set-dirty-limit
> >   3. do the syntax check and change dirty rate to dirty page rate
> > 
> > Thanks for the carefule reviews made by Markus.
> > 
> > Please review, thanks!
> > 
> > v3:
> > - rebase on master
> > - modify the following points according to the advice given by Markus
> >   1. remove the DirtyRateQuotaVcpu and use its field as option directly
> >   2. add comments to show details of what dirtylimit setup do
> >   3. explain how to use dirtylimit in combination with existing qmp
> >      commands "calc-dirty-rate" and "query-dirty-rate" in documentation.
> > 
> > Thanks for the carefule reviews made by Markus.
> > 
> > Please review, thanks!
> > 
> > Hyman
> > 
> > v2:
> > - rebase on master
> > - modify the following points according to the advices given by Juan
> >   1. rename dirtyrestraint to dirtylimit
> >   2. implement the full lifecyle function of dirtylimit_calc, include
> >      dirtylimit_calc and dirtylimit_calc_quit
> >   3. introduce 'quit' field in dirtylimit_calc_state to implement the
> >      dirtylimit_calc_quit
> >   4. remove the ready_cond and ready_mtx since it may not be suitable
> >   5. put the 'record_dirtypage' function code at the beggining of the
> >      file
> >   6. remove the unnecesary return;
> > - other modifications has been made after code review
> >   1. introduce 'bmap' and 'nr' field in dirtylimit_state to record the
> >      number of running thread forked by dirtylimit
> >   2. stop the dirtyrate calculation thread if all the dirtylimit thread
> >      are stopped
> >   3. do some renaming works
> >      dirtyrate calulation thread -> dirtylimit-calc
> >      dirtylimit thread -> dirtylimit-{cpu_index}
> >      function name do_dirtyrestraint -> dirtylimit_check
> >      qmp command dirty-restraint -> set-drity-limit
> >      qmp command dirty-restraint-cancel -> cancel-dirty-limit
> >      header file dirtyrestraint.h -> dirtylimit.h
> > 
> > Please review, thanks !
> > 
> > thanks for the accurate and timely advices given by Juan. we really
> > appreciate it if corrections and suggetions about this patchset are
> > proposed.
> > 
> > Best Regards !
> > 
> > Hyman
> > 
> > v1:
> > this patchset introduce a mechanism to impose dirty restraint
> > on vCPU, aiming to keep the vCPU running in a certain dirtyrate
> > given by user. dirty restraint on vCPU maybe an alternative
> > method to implement convergence logic for live migration,
> > which could improve guest memory performance during migration
> > compared with traditional method in theory.
> > 
> > For the current live migration implementation, the convergence
> > logic throttles all vCPUs of the VM, which has some side effects.
> > -'read processes' on vCPU will be unnecessarily penalized
> > - throttle increase percentage step by step, which seems
> >   struggling to find the optimal throttle percentage when
> >   dirtyrate is high.
> > - hard to predict the remaining time of migration if the
> >   throttling percentage reachs 99%
> > 
> > to a certain extent, the dirty restraint machnism can fix these
> > effects by throttling at vCPU granularity during migration.
> > 
> > the implementation is rather straightforward, we calculate
> > vCPU dirtyrate via the Dirty Ring mechanism periodically
> > as the commit 0e21bf246 "implement dirty-ring dirtyrate calculation"
> > does, for vCPU that be specified to impose dirty restraint,
> > we throttle it periodically as the auto-converge does, once after
> > throttling, we compare the quota dirtyrate with current dirtyrate,
> > if current dirtyrate is not under the quota, increase the throttling
> > percentage until current dirtyrate is under the quota.
> > 
> > this patchset is the basis of implmenting a new auto-converge method
> > for live migration, we introduce two qmp commands for impose/cancel
> > the dirty restraint on specified vCPU, so it also can be an independent
> > api to supply the upper app such as libvirt, which can use it to
> > implement the convergence logic during live migration, supplemented
> > with the qmp 'calc-dirty-rate' command or whatever.
> > 
> > we post this patchset for RFC and any corrections and suggetions about
> > the implementation, api, throttleing algorithm or whatever are very
> > appreciated!
> > 
> > Please review, thanks !
> > 
> > Best Regards !
> > 
> > Hyman Huang (7):
> >   accel/kvm/kvm-all: Refactor per-vcpu dirty ring reaping
> >   cpus: Introduce cpu_list_generation_id
> >   migration/dirtyrate: Refactor dirty page rate calculation
> >   softmmu/dirtylimit: Implement vCPU dirtyrate calculation periodically
> >   accel/kvm/kvm-all: Introduce kvm_dirty_ring_size function
> >   softmmu/dirtylimit: Implement virtual CPU throttle
> >   softmmu/dirtylimit: Implement dirty page rate limit
> > 
> >  accel/kvm/kvm-all.c         |  45 +++-
> >  accel/stubs/kvm-stub.c      |   5 +
> >  cpus-common.c               |   8 +
> >  hmp-commands-info.hx        |  13 +
> >  hmp-commands.hx             |  32 +++
> >  include/exec/cpu-common.h   |   1 +
> >  include/exec/memory.h       |   5 +-
> >  include/hw/core/cpu.h       |   6 +
> >  include/monitor/hmp.h       |   3 +
> >  include/sysemu/dirtylimit.h |  37 +++
> >  include/sysemu/dirtyrate.h  |  28 +++
> >  include/sysemu/kvm.h        |   2 +
> >  migration/dirtyrate.c       | 227 +++++++++++------
> >  migration/dirtyrate.h       |   7 +-
> >  qapi/migration.json         |  80 ++++++
> >  softmmu/dirtylimit.c        | 602 ++++++++++++++++++++++++++++++++++++++++++++
> >  softmmu/meson.build         |   1 +
> >  softmmu/trace-events        |   7 +
> >  18 files changed, 1010 insertions(+), 99 deletions(-)
> >  create mode 100644 include/sysemu/dirtylimit.h
> >  create mode 100644 include/sysemu/dirtyrate.h
> >  create mode 100644 softmmu/dirtylimit.c
> > 
> > -- 
> > 1.8.3.1
> > 
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


