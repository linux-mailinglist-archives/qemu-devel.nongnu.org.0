Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4862182C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:25:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQT9-0006fl-6x; Tue, 08 Nov 2022 10:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osQT1-0006cI-74
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:24:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osQSu-0001iD-Qo
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667921069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J89fdZuxUoU4cG3Aa9maJSlWyxXLzKbnQx7zZg8jrE8=;
 b=Re8ctz65IkrjgCL8SujfR4bZHyGFnLa/yyux8tmaFBcdqTLyAiOQVsE05H7CN8QyZO9qSe
 YEFNPUcaOMeODhR8TqSgeSXdBWhVQEF+a6B/QCaikQre71GqbpyoLePR5oALHto3m2Iy8G
 rJv30rnUOBztCGTkxD1yFpqcoQswrII=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-Ym7rmR47M_OXEFsomexohA-1; Tue, 08 Nov 2022 10:24:28 -0500
X-MC-Unique: Ym7rmR47M_OXEFsomexohA-1
Received: by mail-qt1-f199.google.com with SMTP id
 f4-20020a05622a114400b003a57f828277so5492063qty.22
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 07:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J89fdZuxUoU4cG3Aa9maJSlWyxXLzKbnQx7zZg8jrE8=;
 b=aRew1Ju97jlgUmnNxcpu/5wFOK5ILFuHzRhm/eLNCaMOucRFDvCJeOw940gLLAa+lb
 9MwShSim+USW7X9U3wvo6Dyx8Z4gjqa1KzOav0/tdu7BJzyN6dMcq3wVnvJYNUqtpk/e
 WQIUQCK/ju6kMiEV6rskMA2fcqYnr8UlA+TR+GGk+xCRL9aypjKyCP+rd80kFsdpN5My
 4JDZonEVVgMAMQsi3JJeMN2BF5mYRhd3mpZI8ifUwVAKwCxuu3p0Z3eJP437He5XaAjR
 3OAVXKqkFtV28RGgV8UgEVg8PCu1PeUjioE5OMOrWEFLIXxMCLBVpS2tMyGLMUWt6LiS
 n+QQ==
X-Gm-Message-State: ACrzQf3jw8azviFh9l4LpV5YLNUPjCTMVpdQ7LjrqIzUso/QB3B1qG1l
 lETc8U67GNK9PmO0RH1LqGd6CirqbfXEuYEAxBpFlZSs3taNnOjD7nHMlHMmrIVp+emWA6InsJd
 8nOFo3rrfUlZklq0=
X-Received: by 2002:ad4:5f47:0:b0:4ac:b8de:1484 with SMTP id
 p7-20020ad45f47000000b004acb8de1484mr49687439qvg.77.1667921068219; 
 Tue, 08 Nov 2022 07:24:28 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7TMWt1/5lACJ9NfwV9n5na8oAeuytvir715uR8FIhuIaYMBbFbkI2XopZcsDAnu8/Dw3Ocrg==
X-Received: by 2002:ad4:5f47:0:b0:4ac:b8de:1484 with SMTP id
 p7-20020ad45f47000000b004acb8de1484mr49687416qvg.77.1667921067976; 
 Tue, 08 Nov 2022 07:24:27 -0800 (PST)
Received: from redhat.com ([138.199.52.3]) by smtp.gmail.com with ESMTPSA id
 c8-20020a05620a134800b006ecb9dfdd15sm9212908qkl.92.2022.11.08.07.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 07:24:27 -0800 (PST)
Date: Tue, 8 Nov 2022 10:24:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH  v1 5/9] hw/virtio: introduce virtio_device_should_start
Message-ID: <20221108102011-mutt-send-email-mst@kernel.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <20221108043249-mutt-send-email-mst@kernel.org>
 <8735atg2vh.fsf@linaro.org>
 <20221108052544-mutt-send-email-mst@kernel.org>
 <87y1slelmw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1slelmw.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Nov 08, 2022 at 11:21:26AM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Tue, Nov 08, 2022 at 10:23:15AM +0000, Alex Bennée wrote:
> >> 
> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
> >> 
> >> > On Tue, Nov 08, 2022 at 09:23:04AM +0000, Alex Bennée wrote:
> >> >> The previous fix to virtio_device_started revealed a problem in its
> >> >> use by both the core and the device code. The core code should be able
> >> >> to handle the device "starting" while the VM isn't running to handle
> >> >> the restoration of migration state. To solve this dual use introduce a
> >> >> new helper for use by the vhost-user backends who all use it to feed a
> >> >> should_start variable.
> >> >> 
> >> >> We can also pick up a change vhost_user_blk_set_status while we are at
> >> >> it which follows the same pattern.
> >> >> 
> >> >> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> >> >> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> >> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >> >
> >> > why is this in this patchset?
> >> 
> >> As per my cover letter:
> >> 
> >>   Most of these patches have been posted before as single patch RFCs. A
> >>   couple are already scheduled through other trees so will drop out in
> >>   due course
> >> 
> >> but I keep them in my tree until they are merged so I can continue to
> >> soak test them (and have a stable base for my other WIP trees).
> >
> > That's fine just pls don't double-post them on list, certainly
> > not as part of a patchset.
> 
> Why not? Is this breaking some tooling?

Yes patchset breaks git am if you try to apply part of it.

Reposting creates work for reviewers - why should they have to read the same
patch twice?  In this case it also made me scratch my head trying to
figure out what to do about it.

But, if you are careful and maintain an ordered changelog after "---"
and there it says 
	changes since rfc:
		no changes, subject changed 

then this second part is less of a problem

> -- 
> Alex Bennée


