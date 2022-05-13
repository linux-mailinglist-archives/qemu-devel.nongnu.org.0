Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B55267A1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:54:45 +0200 (CEST)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYYu-0005Fb-UL
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npYUi-0001J3-C7
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npYUc-00032c-RC
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652460617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGy+0j6OlVBTGq3MJvsHx1UWuV5UJRtTGVdiI9SPUig=;
 b=FR6bquOrwKA8zZ9NoqECy6/ET+eAnU+HG+t+65fFrh2ABoYBgkkkspri0OILnGFmbLTLA+
 iiqZiSAnyL7Hc4VLwzQ/0GmZrXQT7fCuw8FOrHP1zsxqsntb2Ei3pjjw0yV3EXzsxsSCBW
 /pJMTuYdRWkbgMUNdXzN3W9n2L42HJE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-ieKjBRLJNvGmagvlmteVVQ-1; Fri, 13 May 2022 12:50:16 -0400
X-MC-Unique: ieKjBRLJNvGmagvlmteVVQ-1
Received: by mail-io1-f72.google.com with SMTP id
 k14-20020a0566022a4e00b0065ae0c238aeso5124875iov.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZGy+0j6OlVBTGq3MJvsHx1UWuV5UJRtTGVdiI9SPUig=;
 b=dENvKwjl560eCuaaCgWszaULaLuvlkHo4s2C7iVfnShABCdKduN82J6mVRXXRyK5HJ
 eH5KheWaQkkJvsOd6YoWqYl4OcBuQBlE0V0WdMX17mAnGmxSvoZ9sBWeUMmBYzBwSp96
 O6MNWS0fSbPRvST2v9m//mYPcApD/csHeQwZiuIPb1ocXzedd7WzpZxnGXPqt00whgPo
 oGYj2z774A4LYHAQWMAcd4Wq27zm1T0vGpUKphosuU/MV7h+M4wqupl87zYoIDPoQvUE
 5k2uS/DqLJmfpT1+/RUAW9lk5kwYhnCrhUYYINRUGu5Mrhrr/RznQcNo4cst30t1JikQ
 TM0Q==
X-Gm-Message-State: AOAM532obR0iYJcBD0IcSH4Qz4xZgsw8Te1xg1pBjPU71MAotrBtL7kC
 jPGj0zD8iZ+m6GOx0tj11Ob6ZCfPhw9qT4NOW2hd75yDwCzpigHl43+IIKzxcnLUwDmdLYzsbrE
 zHDBLD1BD78jam1w=
X-Received: by 2002:a05:6e02:1b81:b0:2cf:1aa3:679b with SMTP id
 h1-20020a056e021b8100b002cf1aa3679bmr3086236ili.266.1652460615144; 
 Fri, 13 May 2022 09:50:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR0HkO7aQXWpd3gShTRN01uS2QLGvzjft7LEbUM1tO095LvlQTUlJ22+LgvKI7Z3lQ/Kd6bw==
X-Received: by 2002:a05:6e02:1b81:b0:2cf:1aa3:679b with SMTP id
 h1-20020a056e021b8100b002cf1aa3679bmr3086218ili.266.1652460614871; 
 Fri, 13 May 2022 09:50:14 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a6b8d0f000000b0065a47e16f3fsm822612iod.17.2022.05.13.09.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 09:50:14 -0700 (PDT)
Date: Fri, 13 May 2022 12:50:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Chongyun Wu <wucy11@chinatelecom.cn>
Cc: Hyman Huang <huangy81@chinatelecom.cn>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>, f4bug@amsat.org,
 tugy@chinatelecom.cn, dengpc12@chinatelecom.cn,
 yuanmh12@chinatelecom.cn, baiyw2@chinatelecom.cn
Subject: Re: [PATCH v2 1/4] kvm: Dynamically adjust the rate of dirty ring
 reaper thread
Message-ID: <Yn6MPHTO+6Q3QiwQ@xz-m1.local>
References: <cover.1648091539.git.wucy11@chinatelecom.cn>
 <7e786b6ab74e0c62661176fa7aec243c7b9bea8d.1648091540.git.wucy11@chinatelecom.cn>
 <80aa611e-55da-e76c-d09b-bda3a94f3169@chinatelecom.cn>
 <beb71ac6-28b0-77e3-a3aa-e11167d537f5@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <beb71ac6-28b0-77e3-a3aa-e11167d537f5@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sat, Apr 02, 2022 at 03:28:13PM +0800, Chongyun Wu wrote:
> > > +{
> > > +    float ratio = 0.0;
> > > +    uint64_t sleep_time = 1000000;
> > > +    enum KVMDirtyRingReaperRunLevel run_level_want;
> > > +    enum KVMDirtyRingReaperSpeedControl speed_control;
> > > +
> > > +    /*
> > > +     * When the number of dirty pages collected exceeds
> > > +     * the given percentage of the ring size,the speed
> > > +     * up action will be triggered.
> > > +     */
> > > +    s->reaper.ratio_adjust_threshold = 0.1;
> > > +    s->reaper.stable_count_threshold = 5;
> > > +
> > > +    ratio = (float)dirty_count / s->kvm_dirty_ring_size;
> > > +
> > > +    if (s->reaper.ring_full_cnt > ring_full_cnt_last) {
> > > +        /* If get a new ring full need speed up reaper thread */
> > > +        if (s->reaper.run_level != KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED) {
> > > +            s->reaper.run_level++;
> > > +        }
> > > +    } else {
> > > +        /*
> > > +         * If get more dirty pages this loop and this status continus
> > > +         * for many times try to speed up reaper thread.
> > > +         * If the status is stable and need to decide which speed need
> > > +         * to use.
> > > +         */
> > > +        if (ratio < s->reaper.ratio_adjust_threshold) {
> > > +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_NORMAL;
> > > +        } else if (ratio < s->reaper.ratio_adjust_threshold * 2) {
> > > +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST1;
> > > +        } else if (ratio < s->reaper.ratio_adjust_threshold * 3) {
> > > +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST2;
> > > +        } else if (ratio < s->reaper.ratio_adjust_threshold * 4) {
> > > +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST3;
> > > +        } else if (ratio < s->reaper.ratio_adjust_threshold * 5) {
> > > +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_FAST4;
> > > +        } else {
> > > +            run_level_want = KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED;
> > > +        }
> > > +
> > > +        /* Get if need speed up or slow down */
> > > +        if (run_level_want > s->reaper.run_level) {
> > > +            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_UP;
> > > +            *speed_down_cnt = 0;
> > > +        } else if (run_level_want < s->reaper.run_level) {
> > > +            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN;
> > > +            *speed_down_cnt++;
> > > +        } else {
> > > +            speed_control = KVM_DIRTY_RING_REAPER_SPEED_CONTROL_KEEP;
> > > +        }
> > > +
> > > +        /* Control reaper thread run in sutiable run speed level */
> > > +        if (speed_control == KVM_DIRTY_RING_REAPER_SPEED_CONTROL_UP) {
> > > +            /* If need speed up do not check its stable just do it */
> > > +            s->reaper.run_level++;
> > > +        } else if (speed_control ==
> > > +            KVM_DIRTY_RING_REAPER_SPEED_CONTROL_DOWN) {
> > > +            /* If need speed down we should filter this status */
> > > +            if (*speed_down_cnt > s->reaper.stable_count_threshold) {
> > > +                s->reaper.run_level--;
> > > +            }
> > > +        }
> > > +    }
> > > +
> > > +    /* Set the actual running rate of the reaper */
> > > +    switch (s->reaper.run_level) {
> > > +    case KVM_DIRTY_RING_REAPER_RUN_NORMAL:
> > > +        sleep_time = 1000000;
> > > +        break;
> > > +    case KVM_DIRTY_RING_REAPER_RUN_FAST1:
> > > +        sleep_time = 500000;
> > > +        break;
> > > +    case KVM_DIRTY_RING_REAPER_RUN_FAST2:
> > > +        sleep_time = 250000;
> > > +        break;
> > > +    case KVM_DIRTY_RING_REAPER_RUN_FAST3:
> > > +        sleep_time = 125000;
> > > +        break;
> > > +    case KVM_DIRTY_RING_REAPER_RUN_FAST4:
> > > +        sleep_time = 100000;
> > > +        break;
> > > +    case KVM_DIRTY_RING_REAPER_RUN_MAX_SPEED:
> > > +        sleep_time = 80000;
> > > +        break;
> > > +    default:
> > > +        sleep_time = 1000000;
> > > +        error_report("Bad reaper thread run level, use default");
> > > +    }
> > > +
> > > +    return sleep_time;
> > > +}
> > > +I think how to calculate the sleep time needs discuussion,
> > > including why
> > we define 5 levels, why we choose the time constants and in what
> > scenarios this algo works fine.
> 
> 
> > 
> > The other thing is i still think it's nicer we have the simplest
> > algorithm firstly, which should be very easy to verify.

Chongyun,

I saw that you left some empty line above but didn't really answer this
question.  I am with Yong.. there're just too many magic numbers.

I don't have a strong opinion on dropping all of them, maybe your point is
you did tons of testing and you found these numbers are the best (though I
doubt it.. but if it's true please let me know) but at least I think it can
be put into a structure like:

  struct dirty_ring_interval_table {
    /* This can be 0->5; we really don't need those macros.. */
    int level;
    /* This marks over which dirty ratio we use this level */
    float threshold_ratio;
    /* This is the time to sleep if this level is chosen */
    int sleep_us;
    ...
  };

IIUC the whole logic above has a major point in that we shrink the sleep
time more aggresively than growing, I think it can be done much easier than
this algorithm, e.g., we mark a global threshold of say 0.8 dirty ratio out
of the ring size, then:

  (1) if dirty ratio > 0.8 we half the sleep time (delay /= 2)
  (2) if dirty ratio <= 0.2 we increase the sleep time (delay += 20ms)

We also give a limit to the sleep time, say max 1sec min 100ms.  Would that
also work very well already with e.g. 20 LOCs rather than 100+ with lots of
magics and if/else's?

Thanks,

-- 
Peter Xu


