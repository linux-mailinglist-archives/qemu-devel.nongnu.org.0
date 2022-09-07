Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08E5B0578
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:39:52 +0200 (CEST)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvHS-0003vL-O3
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oVvEM-0006uN-Oe
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:36:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oVvEJ-0006tq-1e
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662557789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=21uJa0QucTUiCyk17LMZU+HEGYfEAeUfNwlaUjAwXlU=;
 b=dUqSl96azadbKX6uLKilPN2zYN7wsXCBJV40mhJxf7hZuq+vCjM9PAnOq+0Lg31XowrHDG
 EK/WkHrflJyXJKKaBrATd4l1W0hnlvAYdSnEK41+3BD2fJge1gAxYcfWseBr+ezlp5Bq7o
 5gbDA2D8QZpgubrXyTdDDYI5YHvoxXY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-Blz-R3NzOSKEY2Pt2PTreQ-1; Wed, 07 Sep 2022 09:36:28 -0400
X-MC-Unique: Blz-R3NzOSKEY2Pt2PTreQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 b17-20020adfc751000000b00228732b437aso2931744wrh.5
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 06:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=21uJa0QucTUiCyk17LMZU+HEGYfEAeUfNwlaUjAwXlU=;
 b=pg8weDrMIUKAjYFHM6ecDu4OjVS2lBHmAtvCckMrGwDSbX8aq/MAPLQPKGIE5BP7e9
 B0VeEUG90U4NOWDYKImaiyj1i2505wlrXM6ZSorez0QNayMtLHxplZOz0rtdWKnqa0JH
 +6JGgkOoQExbx66GSdL2JqxF7UXFzbxhj6jzc+1788rjTGuYdp8ECrwLjWohFqiIJrVE
 08EDbStZWfDD+ZWIiJO00wtWIfW02ZUeTl7W6Q985uA3Pv5CQW45HfDWy6eEqWZFxZJy
 3b+RMRO4n1xXQ6ait3Wvas24ilfCgM3NAu4KXLJiBV6lzFOn4R4qJnRjQ28RV1bsow2R
 Qi4Q==
X-Gm-Message-State: ACgBeo2wRvapgkjfEV9Gs1E0tCK2eBPL0boMMcMmSHRkAxi+bcO8AxOc
 MK1GWPiZ3u+4OSqs6PvENQr27Jvd+KGAlCLTMrKcSpxYhkYT8JwHqPbjs7huXv2IYhR7UiTE9tl
 KlhztuMnTyrMUkac=
X-Received: by 2002:a5d:59c1:0:b0:229:8fb3:f0f0 with SMTP id
 v1-20020a5d59c1000000b002298fb3f0f0mr1332569wry.154.1662557787019; 
 Wed, 07 Sep 2022 06:36:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7zCx3E0FwUBkE79kOly/SIoV+o9GzRLOcQYxUCKYLts+vinMuvCvCpEnQRzWhJGYR5psfXDQ==
X-Received: by 2002:a5d:59c1:0:b0:229:8fb3:f0f0 with SMTP id
 v1-20020a5d59c1000000b002298fb3f0f0mr1332556wry.154.1662557786804; 
 Wed, 07 Sep 2022 06:36:26 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q185-20020a1c43c2000000b003a5f783abb8sm25234820wma.30.2022.09.07.06.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 06:36:26 -0700 (PDT)
Date: Wed, 7 Sep 2022 14:36:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: armbru@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com
Subject: Re: PING: Re: [PATCH v4 1/1] monitor: Support specified vCPU registers
Message-ID: <YxieWNO6via9nv3C@work-vm>
References: <20220802073720.1236988-1-pizhenwei@bytedance.com>
 <20220802073720.1236988-2-pizhenwei@bytedance.com>
 <Yvo1UdBtKxyaFas8@work-vm>
 <d9d4b049-df33-b720-f40e-98cc39d77281@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9d4b049-df33-b720-f40e-98cc39d77281@bytedance.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

* zhenwei pi (pizhenwei@bytedance.com) wrote:
> PING!

It's OK, I've got it lined up for a pull I'll do in a few days time.

Dave

> On 8/15/22 20:00, Dr. David Alan Gilbert wrote:
> > * zhenwei pi (pizhenwei@bytedance.com) wrote:
> > > Originally we have to get all the vCPU registers and parse the
> > > specified one. To improve the performance of this usage, allow user
> > > specified vCPU id to query registers.
> > > 
> > > Run a VM with 16 vCPU, use bcc tool to track the latency of
> > > 'hmp_info_registers':
> > > 'info registers -a' uses about 3ms;
> > > 'info registers 12' uses about 150us.
> > > 
> > > Cc: Darren Kenny <darren.kenny@oracle.com>
> > > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > > ---
> > >   hmp-commands-info.hx |  8 +++++---
> > >   monitor/misc.c       | 10 ++++++++--
> > >   2 files changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> > > index 188d9ece3b..e012035541 100644
> > > --- a/hmp-commands-info.hx
> > > +++ b/hmp-commands-info.hx
> > > @@ -100,9 +100,11 @@ ERST
> > >       {
> > >           .name       = "registers",
> > > -        .args_type  = "cpustate_all:-a",
> > > -        .params     = "[-a]",
> > > -        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
> > > +        .args_type  = "cpustate_all:-a,vcpu:i?",
> > > +        .params     = "[-a|vcpu]",
> > > +        .help       = "show the cpu registers (-a: show register info for all cpus;"
> > > +                      " vcpu: specific vCPU to query; show the current CPU's registers if"
> > > +                      " no argument is specified)",
> > >           .cmd        = hmp_info_registers,
> > >       },
> > > diff --git a/monitor/misc.c b/monitor/misc.c
> > > index 3d2312ba8d..6436a8786b 100644
> > > --- a/monitor/misc.c
> > > +++ b/monitor/misc.c
> > > @@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
> > >   static void hmp_info_registers(Monitor *mon, const QDict *qdict)
> > >   {
> > >       bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
> > > +    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
> > >       CPUState *cs;
> > >       if (all_cpus) {
> > > @@ -315,13 +316,18 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
> > >               cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
> > >           }
> > >       } else {
> > > -        cs = mon_get_cpu(mon);
> > > +        cs = vcpu >= 0 ? qemu_get_cpu(vcpu) : mon_get_cpu(mon);
> > >           if (!cs) {
> > > -            monitor_printf(mon, "No CPU available\n");
> > > +            if (vcpu >= 0) {
> > > +                monitor_printf(mon, "CPU#%d not available\n", vcpu);
> > > +            } else {
> > > +                monitor_printf(mon, "No CPU available\n");
> > > +            }
> > >               return;
> > >           }
> > > +        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
> > >           cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
> > >       }
> > >   }
> > > -- 
> > > 2.20.1
> > > 
> 
> -- 
> zhenwei pi
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


