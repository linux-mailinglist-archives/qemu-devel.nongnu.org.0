Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24206469336
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:13:12 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muAze-0001eI-ON
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muAxn-0000nO-3o
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:11:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muAxX-0005po-Mo
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638785458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=miEtXspyXTxrIY4MXzokGJiRnugGBAq9n/hIzXnpxRI=;
 b=X9mm99qQxtfJbTDCeJ94AvLjfEZWAWs/SKCCmPQ2UKS7cG1vOMFxCjNOYgSh0MIu9xjbl9
 2ZDtZu/E/Y03UmfBaJPCAbe2RcWPRPW/Fa2GouWvKAkW6YYAAs7Rv1/SnUcxYRc3YCvTmi
 +e64M+zTCW1o0lJCKDQIi+AaMXfG2sc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-_dFhBVvYN_a0kl2kCtjBGA-1; Mon, 06 Dec 2021 05:10:57 -0500
X-MC-Unique: _dFhBVvYN_a0kl2kCtjBGA-1
Received: by mail-pf1-f199.google.com with SMTP id
 i26-20020aa7909a000000b004a4c417bfa8so6229277pfa.23
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 02:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=miEtXspyXTxrIY4MXzokGJiRnugGBAq9n/hIzXnpxRI=;
 b=H4Deb2lOkHlQKjP/AwkzMatOXsyL1GmhDWt78XRD6r1gYMO51y6A2ulC6/leK6w1v3
 ika4MCGlXD5JeynFTKZGMOxE9u8wl4R6cFVY/h1ZWJoiyr/BlsHvZ98dP1bf339KY1Gc
 HMMAEbtZtf9qwie/8qeLsAKJHHyv1/AafYNpOfFmvlIj1UwWYU/5SnVN/Cjlk1UAFH0w
 M10gbRk3Rcch0ARMQDiWk3YV7QefM7kwJvlwRRXxmmL0aVVFdg5PzuAm8pHLn+NaVABm
 hRHDtYIQIh1RSOFvhgyWNgCQIV3hvxeGAAnAH5fznwqka9gF5iljHkqmGuBATCEgcfut
 gTmw==
X-Gm-Message-State: AOAM530l8amq+QZJGcPtzxeppLHIxDh4pzvugjkD8zwAAmeYMhQveuAm
 qeryotvGGLoZsuavtH18LMF9w8RGbOwIa0dGJazVv4wE6nhiUX08+ftp+3LiLiKWdPAn1JmqJXn
 Sgfocscpv4b6RXfY=
X-Received: by 2002:a17:903:2445:b0:142:2471:644e with SMTP id
 l5-20020a170903244500b001422471644emr42527004pls.48.1638785455901; 
 Mon, 06 Dec 2021 02:10:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyI+6UXeZWZK/PAIeXfsUkJMqoHOUZ+Nr5CUas6+qtzp1+3Ign8/4t72cqnMej22MLoyl52LQ==
X-Received: by 2002:a17:903:2445:b0:142:2471:644e with SMTP id
 l5-20020a170903244500b001422471644emr42526969pls.48.1638785455554; 
 Mon, 06 Dec 2021 02:10:55 -0800 (PST)
Received: from xz-m1.local ([223.72.74.110])
 by smtp.gmail.com with ESMTPSA id na13sm10405931pjb.11.2021.12.06.02.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:10:54 -0800 (PST)
Date: Mon, 6 Dec 2021 18:10:04 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v9 2/3] cpu-throttle: implement vCPU throttle
Message-ID: <Ya3hfN+xKie2geL+@xz-m1.local>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <155c8ef6b68c06829f971d356732783c671f661a.1638495274.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <155c8ef6b68c06829f971d356732783c671f661a.1638495274.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 09:39:46AM +0800, huangy81@chinatelecom.cn wrote:
> +static uint64_t dirtylimit_pct(unsigned int last_pct,
> +                               uint64_t quota,
> +                               uint64_t current)
> +{
> +    uint64_t limit_pct = 0;
> +    RestrainPolicy policy;
> +    bool mitigate = (quota > current) ? true : false;
> +
> +    if (mitigate && ((current == 0) ||
> +        (last_pct <= DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE))) {
> +        return 0;
> +    }
> +
> +    policy = dirtylimit_policy(last_pct, quota, current);
> +    switch (policy) {
> +    case RESTRAIN_SLIGHT:
> +        /* [90, 99] */
> +        if (mitigate) {
> +            limit_pct =
> +                last_pct - DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE;
> +        } else {
> +            limit_pct =
> +                last_pct + DIRTYLIMIT_THROTTLE_SLIGHT_STEP_SIZE;
> +
> +            limit_pct = MIN(limit_pct, CPU_THROTTLE_PCT_MAX);
> +        }
> +       break;
> +    case RESTRAIN_HEAVY:
> +        /* [75, 90) */
> +        if (mitigate) {
> +            limit_pct =
> +                last_pct - DIRTYLIMIT_THROTTLE_HEAVY_STEP_SIZE;
> +        } else {
> +            limit_pct =
> +                last_pct + DIRTYLIMIT_THROTTLE_HEAVY_STEP_SIZE;
> +
> +            limit_pct = MIN(limit_pct,
> +                DIRTYLIMIT_THROTTLE_SLIGHT_WATERMARK);
> +        }
> +       break;
> +    case RESTRAIN_RATIO:
> +        /* [0, 75) */
> +        if (mitigate) {
> +            if (last_pct <= (((quota - current) * 100 / quota))) {
> +                limit_pct = 0;
> +            } else {
> +                limit_pct = last_pct -
> +                    ((quota - current) * 100 / quota);
> +                limit_pct = MAX(limit_pct, CPU_THROTTLE_PCT_MIN);
> +            }
> +        } else {
> +            limit_pct = last_pct +
> +                ((current - quota) * 100 / current);
> +
> +            limit_pct = MIN(limit_pct,
> +                DIRTYLIMIT_THROTTLE_HEAVY_WATERMARK);
> +        }
> +       break;
> +    case RESTRAIN_KEEP:
> +    default:
> +       limit_pct = last_pct;
> +       break;
> +    }
> +
> +    return limit_pct;
> +}
> +
> +static void *dirtylimit_thread(void *opaque)
> +{
> +    int cpu_index = *(int *)opaque;
> +    uint64_t quota_dirtyrate, current_dirtyrate;
> +    unsigned int last_pct = 0;
> +    unsigned int pct = 0;
> +
> +    rcu_register_thread();
> +
> +    quota_dirtyrate = dirtylimit_quota(cpu_index);
> +    current_dirtyrate = dirtylimit_current(cpu_index);
> +
> +    pct = dirtylimit_init_pct(quota_dirtyrate, current_dirtyrate);
> +
> +    do {
> +        trace_dirtylimit_impose(cpu_index,
> +            quota_dirtyrate, current_dirtyrate, pct);
> +
> +        last_pct = pct;
> +        if (pct == 0) {
> +            sleep(DIRTYLIMIT_CALC_PERIOD_TIME_S);
> +        } else {
> +            dirtylimit_check(cpu_index, pct);
> +        }
> +
> +        quota_dirtyrate = dirtylimit_quota(cpu_index);
> +        current_dirtyrate = dirtylimit_current(cpu_index);
> +
> +        pct = dirtylimit_pct(last_pct, quota_dirtyrate, current_dirtyrate);

So what I had in mind is we can start with an extremely simple version of
negative feedback system.  Say, firstly each vcpu will have a simple number to
sleep for some interval (this is ugly code, but just show what I meant..):

===============
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index eecd8031cf..c320fd190f 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2932,6 +2932,8 @@ int kvm_cpu_exec(CPUState *cpu)
             trace_kvm_dirty_ring_full(cpu->cpu_index);
             qemu_mutex_lock_iothread();
             kvm_dirty_ring_reap(kvm_state);
+            if (dirtylimit_enabled(cpu->cpu_index) && cpu->throttle_us_per_full)
+                usleep(cpu->throttle_us_per_full);
             qemu_mutex_unlock_iothread();
             ret = 0;
             break;
===============

I think this will have finer granularity when throttle (for 4096 ring size,
that's per-16MB operation) than current way where we inject per-vcpu async task
to sleep, like auto-converge.

Then we have the "black box" to tune this value with below input/output:

  - Input: dirty rate information, same as current algo

  - Output: increase/decrease of per-vcpu throttle_us_per_full above, and
    that's all

We can do the sampling per-second, then we keep doing it: we can have 1 thread
doing per-second task collecting dirty rate information for all the vcpus, then
tune that throttle_us_per_full for each of them.

The simplest linear algorithm would be as simple as (for each vcpu):

  if (quota < current)
    throttle_us_per_full += SOMETHING;
    if (throttle_us_per_full > MAX)
      throttle_us_per_full = MAX;
  else
    throttle_us_per_full -= SOMETHING;
    if (throttle_us_per_full < 0)
      throttle_us_per_full = 0;

I think your algorithm is fine, but thoroughly review every single bit of it in
one shot will be challenging, and it's also hard to prove every bit of the
algorithm is helpful, as there're a lot of hand-made macros and state changes.

I actually tested the current algorithm of yours, the dirty rate fluctuates a
bit (when I specified 200MB/s, it can go into either a few tens of MB/s or
300MB/s, normally less), neither does it respond fast (the initial throtle from
500MB/s -> 200MB/s should need 1 minute or something), so it seems not ideal
anyway. In that case I prefer we start with simple.

So IMHO we can start with this simple scheme first then it'll start working
with much less line of codes, afaict.  With that scheme ready in the 1st or
initial patches, it'll be easier to either apply any better algorithm
(e.g. your current one, if you're confident with that) or other things then
it'll be much easier to review too if you could consider split your patch like
that.

Normally per my knowledge for the need on migration, we could consider add an
integral algorithm into this linear algorithm that I said above, and it should
help us reach a very stable and constant state of throttling already.  But
we'll need to try it out, as I never tried.

What do you think?

-- 
Peter Xu


