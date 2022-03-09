Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0784D394D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:54:54 +0100 (CET)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1SX-0000YQ-3r
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:54:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nS1Ra-00082T-9O
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:53:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nS1RT-0001r7-3M
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646852025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VvPLekGKbZeUSYt17bj+EDYmMcURRefClSI7z9lrbM=;
 b=jCHRxQzHfZ1O4MNoYw68HwOBj1Ahi+lqaM2E4sah+9X4SJFwyc4pVWxPKjjtwY9dGU6pfX
 UZ6u3mGjv8tsV4g9674GVwxCTqGglfj4jEOg+p0t89wZrTmPkQEBDjqR/VbF8wEwGdL/JK
 jik/oOCDYGOoE/V/N0da8el7epMSH58=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-kalXjCxONbil6pmMAFV9hQ-1; Wed, 09 Mar 2022 13:53:44 -0500
X-MC-Unique: kalXjCxONbil6pmMAFV9hQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 10-20020a1c020a000000b0037fae68fcc2so2943115wmc.8
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 10:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3VvPLekGKbZeUSYt17bj+EDYmMcURRefClSI7z9lrbM=;
 b=C5T7F9AWe6z2Vowc5Sel+qQRM5uvokXXv9V7byRLeFaXTmwPPSawev0gmUMcnPeHFZ
 p1xfEj3/tSLZeHNdiV06meLnWbcZg1xfKciRqaAr4zBH5RWX2a2KU6fyToavvgJzItmc
 eD37QZq4BBb8/eIIAOmmZWrubsZvHQo51qPd4wj2+84ebpz3Vaq9m+NUv1jGoOSThWJU
 aKBuYYrJLqxkExW4ORyAMNaRGig6+kYdM05l5kmIveWuxes2Kw7jVWK7TapLFB8ezlM5
 9si+DgzANjgk1lX6UxEvr5WfKtYJk6G9NnGeV78FKPHhYIZPhsq7md6w5JfasPaMsaI1
 5e7w==
X-Gm-Message-State: AOAM5335/Ld59yiq4HklD4wpoO26MTbRt7uv7cXiCrQ2bwB/MFqmJV5b
 ST/FSiFlgB7bVB/th1aKRA0XAc5u40HerMVBfdTlFmLlo8JaXUK8i8c53+bVYC9jeOJtb/C2DbE
 3vx7LhXowoobEpzE=
X-Received: by 2002:a5d:50c5:0:b0:1f0:2111:8f74 with SMTP id
 f5-20020a5d50c5000000b001f021118f74mr766097wrt.211.1646852023161; 
 Wed, 09 Mar 2022 10:53:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU23bpCeGC0fB/dPxyzTjHeTlZiQ7cVPmaMrS3S4VtDc+NscvOeT0c5iMoA2UklVlEHdJ4KQ==
X-Received: by 2002:a5d:50c5:0:b0:1f0:2111:8f74 with SMTP id
 f5-20020a5d50c5000000b001f021118f74mr766087wrt.211.1646852022957; 
 Wed, 09 Mar 2022 10:53:42 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b00389d8c3e2b9sm47243wms.15.2022.03.09.10.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 10:53:42 -0800 (PST)
Date: Wed, 9 Mar 2022 18:53:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: bad virsh save /dev/null performance (600 MiB/s max)
Message-ID: <Yij3tJ8YSp2IvQXl@work-vm>
References: <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm>
 <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
 <YiiS9HnS0LsiY2Hb@work-vm> <YiiU2gCbnJOgpZxp@redhat.com>
 <700779ea-4274-7872-6022-d32457a00160@suse.de>
 <47786b29-b1a2-1f6a-568d-b61398e0f641@suse.de>
 <Yijz9hzJFJoMo7vE@redhat.com> <Yij0cJ3ioN6aiKgA@work-vm>
 <ec3e7602-d40b-9784-e2c5-5db5c087129e@suse.de>
MIME-Version: 1.0
In-Reply-To: <ec3e7602-d40b-9784-e2c5-5db5c087129e@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jim Fehlig <jfehlig@suse.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Claudio Fontana (cfontana@suse.de) wrote:
> On 3/9/22 7:39 PM, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> >> On Wed, Mar 09, 2022 at 07:27:12PM +0100, Claudio Fontana wrote:
> >>>
> >>> One difference I could see looking at the qmp commands issued by libvirt in the "virsh save" case,
> >>> is "detach:true" in the migration command (which seems to have no effect in qemu),
> >>
> >> That is a bug in libvirt - it should not be setting that in QMP.
> >>
> >> To quote the QAPI spec for 'migrate'
> >>
> >>   # @detach: this argument exists only for compatibility reasons and
> >>   #          is ignored by QEMU
> >>
> >>
> >>>
> >>>
> >>> and maybe more interestingly this stuff about the "fd":
> >>>
> >>>
> >>> 2022-03-09 17:29:34.247+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
> >>>  fd=34
> >>> 2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
> >>>  len=73 ret=73 errno=0
> >>> 2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:457 : QEMU_MONITOR_IO_SEND_FD: mon=0x7faa9003ebf0 fd=34 ret=73 errno=0
> >>> 2022-03-09 17:29:34.248+0000: 20387: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7faa9003ebf0 reply={"return": {}, "id": "libvirt-390"}
> >>> 2022-03-09 17:29:34.249+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
> >>>  fd=-1
> >>> 2022-03-09 17:29:34.249+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
> >>>  len=113 ret=113 errno=0
> >>>
> >>>
> >>> in qemu I am currently looking at the code in migration/socket.c
> >>> vs the code in migration/fd.c , wonder if the difference would
> >>> stem from there..
> >>
> >> When saving to a file, libvirt passes in a pre-opened FD for
> >> QEU to use. IIRC this should always be a pipe FD connected to
> >> libvirt's iohelper program, sometimes indirectly via a compression
> >> program.
> > 
> > In which case, what is a simple 'top' showing on the system?
> 
> libvirt_iohelper is the top cpu consumer at 60-something%,
> qemu-system-x86_64 is at 30-40%.

Right, with plain migration qemu just writes directly to the fd
instead of bubbling through the iohelper.
You could probably optimise that, but there's probably one or two
extra copies in the way.

Dave

> C.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


