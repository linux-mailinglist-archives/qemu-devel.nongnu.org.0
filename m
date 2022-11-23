Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529B636573
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:10:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsJS-0004wJ-9Z; Wed, 23 Nov 2022 11:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxsJJ-0004vt-Cq
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:09:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxsJ7-0002f4-Mf
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669219743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXH8RnTN7Hn9PofQ7C1PjFn7i8XiUiwloyfxrdlnA48=;
 b=Hg3zx1FtmeX9glMemAnDMGL68nkPLz0Fp+urphMG6+auodpvOgp1DvgREhXFOf4JsR1r0V
 CyKFmyXGnVjTGebeRWpxIwT7q2u0hAfs2sH57b//0q/5gdTEAIpO2mdig1tnavGhTMnu1D
 K/20zY6YPjgPYoQgDTIEn50gnsiMrJ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-HJJYbfJNOaqcOAHhVzAFvA-1; Wed, 23 Nov 2022 11:09:01 -0500
X-MC-Unique: HJJYbfJNOaqcOAHhVzAFvA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso5072671wrd.3
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 08:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wXH8RnTN7Hn9PofQ7C1PjFn7i8XiUiwloyfxrdlnA48=;
 b=PXzCu7swx2Ug86nBE5AXqFX6OHjdfjmXCXqaCGcT3nXLRiq1y4cwqcBS/LQGXfaA5P
 LbNw5YKoiguH/BPAiuBIinGZL3KOG7o4itEli0aNj7COAManUdkSfm24rEPpaCzqeOIA
 tE9/R8eOcLUOvZ/yYd5QTMse/Q9SGJX2QvfJ65J2e3TDq6YSN0RfwZk2u+//qEWpKAGZ
 IRZhmM/Vs2bUISGweKn/SbQu3XzpLYBMwqFwukq7resISvFfYl+noW7KsAJXKiMbpIUB
 pt8C+bH8XNdlEVamPXWVnfuyGv75Flkq6A3nYe0TCflNujdYT53xjeTcmlfB5y6RT2ys
 VGiw==
X-Gm-Message-State: ANoB5pknKmDv+DP1N04r6+3SHRCxDxLkZgPDfHjM43dv8t9j0JFjpUP3
 JmFVp/YMx7wnt0WIUL14FRDyzRdbifzXploTHeSVXG689iAZfB+Vdh17ImoSFmvcZ5e0hARalsX
 RU0nm6MgBuPMEyEo=
X-Received: by 2002:a7b:cbc3:0:b0:3cf:a83d:28d1 with SMTP id
 n3-20020a7bcbc3000000b003cfa83d28d1mr24712580wmi.57.1669219740167; 
 Wed, 23 Nov 2022 08:09:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf43ThTGlNSReAb4CLgwZGpn6XxLXkK5UxggzIL6zYgUFYhNPUDIDEPp7UGxS6rnDolIqe+xRQ==
X-Received: by 2002:a7b:cbc3:0:b0:3cf:a83d:28d1 with SMTP id
 n3-20020a7bcbc3000000b003cfa83d28d1mr24712570wmi.57.1669219739920; 
 Wed, 23 Nov 2022 08:08:59 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 l8-20020adfa388000000b002417f35767asm17380963wrb.40.2022.11.23.08.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 08:08:59 -0800 (PST)
Date: Wed, 23 Nov 2022 11:08:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Message-ID: <20221123110755-mutt-send-email-mst@kernel.org>
References: <20221123152134.179929-1-alex.bennee@linaro.org>
 <20221123102522-mutt-send-email-mst@kernel.org>
 <87bkoxbqtd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkoxbqtd.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 23, 2022 at 04:03:49PM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Bennée wrote:
> >> Hi,
> >> 
> >> This hopefully fixes the problems with VirtIO migration caused by the
> >> previous refactoring of virtio_device_started(). That introduced a
> >> different order of checking which didn't give the VM state primacy but
> >> wasn't noticed as we don't properly exercise VirtIO device migration
> >> and caused issues when dev->started wasn't checked in the core code.
> >> The introduction of virtio_device_should_start() split the overloaded
> >> function up but the broken order still remained. The series finally
> >> fixes that by restoring the original semantics but with the cleaned up
> >> functions.
> >> 
> >> I've added more documentation to the various structures involved as
> >> well as the functions. There is still some inconsistencies in the
> >> VirtIO code between different devices but I think that can be looked
> >> at over the 8.0 cycle.
> >
> >
> > Thanks a lot! Did you try this with gitlab CI? A patch similar to your
> > 2/2 broke it previously ...
> 
> Looking into it now - so far hasn't broken locally but I guess there is
> something different about the CI.


yes - pls push to gitlab, create pipeline e.g. with QEMU_CI set to 2

Or with QEMU_CI set to 1 and then run fedora container and then clang-system manually.

> >
> >> Alex Bennée (2):
> >>   include/hw: attempt to document VirtIO feature variables
> >>   include/hw: VM state takes precedence in virtio_device_should_start
> >> 
> >>  include/hw/virtio/vhost.h  | 25 +++++++++++++++++++---
> >>  include/hw/virtio/virtio.h | 43 ++++++++++++++++++++++++++++++++------
> >>  2 files changed, 59 insertions(+), 9 deletions(-)
> >> 
> >> -- 
> >> 2.34.1
> 
> 
> -- 
> Alex Bennée


