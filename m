Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D1620D3C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 11:27:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osLoc-0006sB-Tj; Tue, 08 Nov 2022 05:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osLoZ-0006qQ-4W
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 05:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osLoT-0000tD-0S
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 05:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667903192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaGpyzEsaywLzkXCuhajbfBDu+LI31GM/ICcfuuDpKM=;
 b=b5EQd3AvbilP8O/26uNyXAmpRPjFAJn+dhbpju0PNUBJ3TEuvtpIWo17ngvdWcSzvzibEk
 HB0fl3+Fs/0nxF1/09Spklw1Xb+yCdE20o6mQZjfvwMc9s4eK6GFzmZTnMZ3xgsKe4ZKnf
 OOmVCR8n9dnaWEN27jAC6SYR+d7Va2Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-oWq-q--4MHabpzwWqHmMLQ-1; Tue, 08 Nov 2022 05:26:31 -0500
X-MC-Unique: oWq-q--4MHabpzwWqHmMLQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 h1-20020a0ceda1000000b004b899df67a4so9294909qvr.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 02:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gaGpyzEsaywLzkXCuhajbfBDu+LI31GM/ICcfuuDpKM=;
 b=ruly0Ch7866WaWC8X+CK/AF4inAkNZDBgCwDyJaNy0gI+b5LI9X9YZn/1ojgncJSnS
 f09Sd8/JvO+lMUcHTe+Is7j+MJ2bwpqiryCYJBpIyhh/r2k/Jwxo/uFdE+5EF/eYKkix
 BTn95NuI64OCq8XliFw6abj/tFCTGEEo5mxkRBNPiLyXzJUv0jF5OchxREvbdcoQpsrY
 cawsa2qzNZOrOQp2WCoY/7RbbWgG2Axr50XGvHeqN7Pee7uzO0OGwCAJo5HMhAArxO4F
 alt1r5rmsj0mfeWRwS2N3yUMAKdkndP9O8uaXXqFzGgLopCn13zJ3B9xFaL0KRY/80n5
 5Tng==
X-Gm-Message-State: ACrzQf3fWcyJiYdFzp0mnA3jS8xQvr+MBtWZ9Z7L1kjHC50XnR7oAy6C
 SnN9qD/TzF0Cr81bb6ONEvtpZFQ71wQqgqyWVpacLOZAlUzEvix3oRsrGXmYw3jbpTiRSOFw4mo
 jXf40KmEIxibcL2k=
X-Received: by 2002:a0c:a959:0:b0:4bb:938e:ff52 with SMTP id
 z25-20020a0ca959000000b004bb938eff52mr867839qva.94.1667903191087; 
 Tue, 08 Nov 2022 02:26:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5no1C+TgFj4SxsBRdwhwIpgZ32e39+8P+niHgdFxRJbILGM6OPanZPaI2xJq9qD335A3HAqQ==
X-Received: by 2002:a0c:a959:0:b0:4bb:938e:ff52 with SMTP id
 z25-20020a0ca959000000b004bb938eff52mr867833qva.94.1667903190829; 
 Tue, 08 Nov 2022 02:26:30 -0800 (PST)
Received: from redhat.com ([138.199.52.3]) by smtp.gmail.com with ESMTPSA id
 cc25-20020a05622a411900b0039a9b55b829sm7851339qtb.29.2022.11.08.02.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 02:26:30 -0800 (PST)
Date: Tue, 8 Nov 2022 05:26:23 -0500
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
Message-ID: <20221108052544-mutt-send-email-mst@kernel.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <20221108043249-mutt-send-email-mst@kernel.org>
 <8735atg2vh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735atg2vh.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Nov 08, 2022 at 10:23:15AM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Tue, Nov 08, 2022 at 09:23:04AM +0000, Alex Bennée wrote:
> >> The previous fix to virtio_device_started revealed a problem in its
> >> use by both the core and the device code. The core code should be able
> >> to handle the device "starting" while the VM isn't running to handle
> >> the restoration of migration state. To solve this dual use introduce a
> >> new helper for use by the vhost-user backends who all use it to feed a
> >> should_start variable.
> >> 
> >> We can also pick up a change vhost_user_blk_set_status while we are at
> >> it which follows the same pattern.
> >> 
> >> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> >> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >
> > why is this in this patchset?
> 
> As per my cover letter:
> 
>   Most of these patches have been posted before as single patch RFCs. A
>   couple are already scheduled through other trees so will drop out in
>   due course
> 
> but I keep them in my tree until they are merged so I can continue to
> soak test them (and have a stable base for my other WIP trees).

That's fine just pls don't double-post them on list, certainly
not as part of a patchset.

> -- 
> Alex Bennée


