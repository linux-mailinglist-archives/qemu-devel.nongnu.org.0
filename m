Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094A26A74B2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:57:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXSYk-0003qa-1P; Wed, 01 Mar 2023 14:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pXSYb-0003nv-Nk
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:56:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pXSYX-0000tr-QF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677700564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBE1Y6YjfEBU0ZJ8mPUXQBZYbsPHO+w43pGTgJweJ/Y=;
 b=Yp7OTPIfgrF2KaDy/+EmDZoHV6fVRU4QNktQcwjdcQNgBB40266C5Dz44yo7x/A0fTpqu/
 FW/hwMxV7ZaMFVu+jknyoJG5NkukJGlSTm8H2ry0qyKUzjfOACrfIjk+xJgIjUY6D3TQaV
 mVH4ypZw0vb0CN7agoAgmMijG+qnw5E=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-dv7rbkNcNf2IDj7MuGMXvQ-1; Wed, 01 Mar 2023 14:56:03 -0500
X-MC-Unique: dv7rbkNcNf2IDj7MuGMXvQ-1
Received: by mail-il1-f197.google.com with SMTP id
 g14-20020a92dd8e000000b00316ea7ce6d3so8550399iln.15
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 11:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBE1Y6YjfEBU0ZJ8mPUXQBZYbsPHO+w43pGTgJweJ/Y=;
 b=n3Q1HIbqrpyHQvcbjYebDYwpOLMZ6hZcfomnKQwNBfAS7gjW3yC/G0BU1OSnDzBUgt
 tBe2C77tb/lYhfJh9PBBYe+RVyHDxgEK4EQeZ6EMfGt7mgFSZ7Vslux+72AClx+dISDd
 C8iJo2h8Dl+dOmqFGludeL/ATeKmEbjlOcLG2Semg4UYeTgdNg8L153kaQ2yirPccRrZ
 D+fa6QPLRw7L4D3f5KXtJSSSKsq7Fn1Fo1y94MQSC+yOgs1ggCrUS7eeyj/SwjQcspc2
 QNpR0wO4EiO+ySNnPpRpoSQwP1D4+JrXKuv3wCfbgm03WpkGHV/dVRgeJZibUO1mGLMt
 UXrw==
X-Gm-Message-State: AO0yUKUVfNqiUB23Ni44h36oYOXR/CzMGYJnrtvDLllHvIVS7+MebhXK
 IMF+qAf0L/at0FbZcB5M4K3sNZ8q8UyciF22yATlDjXcO+VbdqEV00H1ECPuryn3EAH068NSlJd
 jnn7WCH1o8AEBbzA=
X-Received: by 2002:a92:c261:0:b0:313:ee3f:2b2b with SMTP id
 h1-20020a92c261000000b00313ee3f2b2bmr7657753ild.8.1677700562628; 
 Wed, 01 Mar 2023 11:56:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9DWVSr1ZeSgtis6czrcRA2pDZMLPEDF0kQCwzTdHe7nr8TIAY4F3UgCEyIi358pvSXh9znjw==
X-Received: by 2002:a92:c261:0:b0:313:ee3f:2b2b with SMTP id
 h1-20020a92c261000000b00313ee3f2b2bmr7657726ild.8.1677700562361; 
 Wed, 01 Mar 2023 11:56:02 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k6-20020a02a706000000b003c48d97bea7sm4038047jam.147.2023.03.01.11.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 11:56:01 -0800 (PST)
Date: Wed, 1 Mar 2023 12:55:59 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Message-ID: <20230301125559.613c85e9.alex.williamson@redhat.com>
In-Reply-To: <b142b581-65c3-285d-bc68-fabc8d5ab0b7@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
 <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
 <20230227091444.6a6e93cd.alex.williamson@redhat.com>
 <Y/znqJvtxtUEmsHi@nvidia.com>
 <20230227104308.14077d8a.alex.williamson@redhat.com>
 <b142b581-65c3-285d-bc68-fabc8d5ab0b7@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 1 Mar 2023 20:49:28 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 27/02/2023 19:43, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Mon, 27 Feb 2023 13:26:00 -0400
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >  
> >> On Mon, Feb 27, 2023 at 09:14:44AM -0700, Alex Williamson wrote:
> >>  
> >>> But we have no requirement to send all init_bytes before stop-copy.
> >>> This is a hack to achieve a theoretical benefit that a driver might be
> >>> able to improve the latency on the target by completing another
> >>> iteration.  
> >> I think this is another half-step at this point..
> >>
> >> The goal is to not stop the VM until the target VFIO driver has
> >> completed loading initial_bytes.
> >>
> >> This signals that the time consuming pre-setup is completed in the
> >> device and we don't have to use downtime to do that work.
> >>
> >> We've measured this in our devices and the time-shift can be
> >> significant, like seconds levels of time removed from the downtime
> >> period.
> >>
> >> Stopping the VM before this pre-setup is done is simply extending the
> >> stopped VM downtime.
> >>
> >> Really what we want is to have the far side acknowledge that
> >> initial_bytes has completed loading.
> >>
> >> To remind, what mlx5 is doing here with precopy is time-shifting work,
> >> not data. We want to put expensive work (ie time) into the period when
> >> the VM is still running and have less downtime.
> >>
> >> This challenges the assumption built into qmeu that all data has equal
> >> time and it can estimate downtime time simply by scaling the estimated
> >> data. We have a data-size independent time component to deal with as
> >> well.  
> > As I mentioned before, I understand the motivation, but imo the
> > implementation is exploiting the interface it extended in order to force
> > a device driven policy which is specifically not a requirement of the
> > vfio migration uAPI.  It sounds like there's more work required in the
> > QEMU migration interfaces to properly factor this information into the
> > algorithm.  Until then, this seems like a follow-on improvement unless
> > you can convince the migration maintainers that providing false
> > information in order to force another pre-copy iteration is a valid use
> > of passing the threshold value to the driver.  
> 
> In my previous message I suggested to drop this exploit and instead 
> change the QEMU migration API and introduce to it the concept of 
> pre-copy initial bytes -- data that must be transferred before source VM 
> stops (which is different from current @must_precopy that represents 
> data that can be transferred even when VM is stopped).
> We could do it by adding a new parameter "init_precopy_size" to the 
> state_pending_{estimate,exact} handlers and every migration user could 
> use it (RAM, block, etc).
> We will also change the migration algorithm to take this new parameter 
> into account when deciding to move to stop-copy.
> 
> Of course this will have to be approved by migration maintainers first, 
> but if it's done in a standard way such as above, via the migration API, 
> would it be OK by you to go this way?

I still think we're conflating information and requirements by allowing
a device to impose a policy which keeps QEMU in pre-copy.  AIUI, what
we're trying to do is maximize the time separation between the
initial_bytes from the device and the end-of-stream.  But knowing the
data size of initial_bytes is not really all that useful.

If we think about the limits of network bandwidth, all data transfers
approach zero time, but the startup latency of the target device that
we're trying to maximize here is fixed.  By prioritizing initial_bytes,
we're separating in space the beginning of target device setup from the
end-of-stream, but that's only an approximation of time, which is what
QEMU really needs to know to honor downtime requirements.

So it seems like what we need here is both a preface buffer size and a
target device latency.  The QEMU pre-copy algorithm should factor both
the remaining data size and the device latency into deciding when to
transition to stop-copy, thereby allowing the device to feed actually
relevant data into the algorithm rather than dictate its behavior.
Thanks,

Alex


