Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E724557FB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 10:28:09 +0100 (CET)
Received: from localhost ([::1]:33916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mndiC-0005qD-7c
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 04:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mndh8-0004YM-6D
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 04:27:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mndh3-000474-QC
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 04:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637227615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yoMlMbjOLou7oWY05JOs5t/+3A/OE0/XrWc6UJLPEeo=;
 b=TOSQgAGq8csyM1EwdJ+xTrF83mOr62osS0RYiPxaSrlY7CyGJ+EGQsaidai1czmrICDmh9
 DxLeZs1A+NSqY0b/TTyJnZmPcY0l9JrEjbG0nUUnq2AlNwsJQah5YUev2tdFt8hshg1qgJ
 SX5AXVbIkVzIkOfk23TmI8J+QF1K7P0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-N4cR7ip5NoyAQKf72rTpTA-1; Thu, 18 Nov 2021 04:26:50 -0500
X-MC-Unique: N4cR7ip5NoyAQKf72rTpTA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so916125wrc.22
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 01:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yoMlMbjOLou7oWY05JOs5t/+3A/OE0/XrWc6UJLPEeo=;
 b=NXwA0n0y06Uq6oBCtGHqtxPQMdYwOm4vqV9eWjAyLixhQ/wXRK2cnuMaB+ig85EfnA
 91GGGE/J2nrt8rwH7MrHA6FyrHJHV1JomhNyESd4WN+ODDgt+YCrCdtKvsMEoYz5wjh7
 RjVhVLle3UaU6Cz/U+aMCWQO93sNi4akc3jBF6PMVpUWTp1p0eYmbTbihmvyiR6NJhLJ
 LtlvLcmoVbEtbS8kjsDPj4iQCiC9mhHEQEi7F+x0g+eOhDDVEavsvUVorEl4AqCXFw1P
 FFkBfH8F7T+/UR+E8i+goc7hE8pPh0Zy9idHtpSnO6xTmjKZiRGJyd0DrEjAC5ZL5ASu
 jl/g==
X-Gm-Message-State: AOAM533bchLniJsjCyoFrqf9T9ZUbiuOXTInnlpzOtrfWS+li0Zw33U8
 ZZdkLRAAgfhluSjMxD6x5QLon6VPjPBSJorbJ1JTBwWgCUsBsuN+2H92wiW4GxV7SiXBSzKIpUd
 ta58XsipJ7uYlZbk=
X-Received: by 2002:a1c:158:: with SMTP id 85mr8136594wmb.182.1637227609065;
 Thu, 18 Nov 2021 01:26:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa2dBfMALigBiCZfMy9jB2psa0L2wg93WTeGPOfEzmc7dh/x402YcCfAVbViM+0KR9iuAdxw==
X-Received: by 2002:a1c:158:: with SMTP id 85mr8136566wmb.182.1637227608818;
 Thu, 18 Nov 2021 01:26:48 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id p62sm2410722wmp.10.2021.11.18.01.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 01:26:48 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v1 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
In-Reply-To: <499bdfeea4b19ef44a36e0fbb5be3e0d51765430.1637214721.git.huangy81@chinatelecom.cn>
 (huangy's message of "Thu, 18 Nov 2021 14:07:20 +0800")
References: <cover.1637214721.git.huangy81@chinatelecom.cn>
 <cover.1637214721.git.huangy81@chinatelecom.cn>
 <499bdfeea4b19ef44a36e0fbb5be3e0d51765430.1637214721.git.huangy81@chinatelecom.cn>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 18 Nov 2021 10:26:47 +0100
Message-ID: <87tug9rezs.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> introduce the third method GLOBAL_DIRTY_RESTRAINT of dirty
> tracking for calculate dirtyrate periodly for dirty restraint.
>
> implement thread for calculate dirtyrate periodly, which will
> be used for dirty restraint.
>
> add dirtyrestraint.h to introduce the util function for dirty
> restrain.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

Some comentes:

> +void dirtyrestraint_calc_start(void);
> +
> +void dirtyrestraint_calc_state_init(int max_cpus);

dirtylimit_? instead of restraint.

We have a start function, but I can't see a finish/end/stop functions.

> +#define DIRTYRESTRAINT_CALC_TIME_MS         1000    /* 1000ms */
> +
> +struct {
> +    DirtyRatesData data;
> +    int64_t period;
> +    bool enable;

Related to previous comment.  I can't see where we set enable to 1, but
nowhere were we set it back to 0, so this never finish.

> +    QemuCond ready_cond;
> +    QemuMutex ready_mtx;

This is a question of style, but when you only have a mutex and a cond
in one struct, you can use the "cond" and "mutex" names.

But as said, it is a question of style, if you preffer do it this way.

> +static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
> +                                     CPUState *cpu, bool start);

You have put the code at the beggining of the file, if you put it at the
end of it, I think you can avoid this forward declaration.

> +static void dirtyrestraint_calc_func(void)
> +{
> +    CPUState *cpu;
> +    DirtyPageRecord *dirty_pages;
> +    int64_t start_time, end_time, calc_time;
> +    DirtyRateVcpu rate;
> +    int i =3D 0;
> +
> +    dirty_pages =3D g_malloc0(sizeof(*dirty_pages) *
> +        dirtyrestraint_calc_state->data.nvcpu);
> +
> +    dirtyrestraint_global_dirty_log_start();
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(dirty_pages, cpu, true);
> +    }
> +
> +    start_time =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    g_usleep(DIRTYRESTRAINT_CALC_TIME_MS * 1000);
> +    end_time =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    calc_time =3D end_time - start_time;
> +
> +    dirtyrestraint_global_dirty_log_stop();
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(dirty_pages, cpu, false);
> +    }
> +
> +    for (i =3D 0; i < dirtyrestraint_calc_state->data.nvcpu; i++) {
> +        uint64_t increased_dirty_pages =3D
> +            dirty_pages[i].end_pages - dirty_pages[i].start_pages;
> +        uint64_t memory_size_MB =3D
> +            (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
> +        int64_t dirtyrate =3D (memory_size_MB * 1000) / calc_time;
> +
> +        rate.id =3D i;
> +        rate.dirty_rate  =3D dirtyrate;
> +        dirtyrestraint_calc_state->data.rates[i] =3D rate;
> +
> +        trace_dirtyrate_do_calculate_vcpu(i,
> +            dirtyrestraint_calc_state->data.rates[i].dirty_rate);
> +    }
> +
> +    return;

unnecesary return;

> +}
> +
> +static void *dirtyrestraint_calc_thread(void *opaque)
> +{
> +    rcu_register_thread();
> +
> +    while (qatomic_read(&dirtyrestraint_calc_state->enable)) {
> +        dirtyrestraint_calc_func();
> +        dirtyrestraint_calc_state->ready =3D true;

           You really need this to be a global variable?  You can pass
           it on the opaque, no?

Later, Juan.


