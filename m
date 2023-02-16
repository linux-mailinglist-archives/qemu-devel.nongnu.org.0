Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D9699437
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:23:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdHd-0001gg-NB; Thu, 16 Feb 2023 07:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSdHV-0001g5-Oh
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSdHU-0007MK-6d
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676550151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oOkObDG1EoKY4xs4CktS346rhzJlqX4tIEaU3b2S9wo=;
 b=JwzRE1jCi51l5MTgJxQ1LUpqRhu/EORpK667pYX/apj0H6mP07N3rebiAhPvViVX0ecKeo
 FHZjrkxrqghRkzgvTk6iUDLSC31iR5B8oiOj7xT5qTRe6GwPVU+1KaiMIpDee/BJhWQRg0
 nag3eZA4+cpexo8K6W9YXZMUyeimiZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-Y9KBZsu-M0G8xzzxbgOJBQ-1; Thu, 16 Feb 2023 07:22:27 -0500
X-MC-Unique: Y9KBZsu-M0G8xzzxbgOJBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k3-20020a05600c1c8300b003e209b61ebbso767314wms.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOkObDG1EoKY4xs4CktS346rhzJlqX4tIEaU3b2S9wo=;
 b=ZH9EEmVA0LZ5hMtiRZcxsTgfE+oJmeetLXpthwriwsR13c4IRR9YwAnotiTyNc9c5O
 PZpokX9aq3vZhKRGYwDgT52cGADhw1OSzw9g3us3Gj4UFGLsL40n7GBe+BDm6N10gcuS
 EWnwG1CTIkJ5qWEC0vU/0/vlaX4VAe53i6VYVpw0BOv4Yf3eh4pyytTOzesv2YAA9CeO
 0RoQ1mWHqpukRZOQUC6NHUzNu+xyMqw3bFx6gMyfQ3zxW/zMHMWvIFv1JX0QHJwL7YD8
 QgDwV2AsLfhFsgW/9x//j9Gu+rmV9ZB0kQTru2aJvCK+GIYE17HrKlSt7yR8dJz+hfo3
 8B+A==
X-Gm-Message-State: AO0yUKV+qSqco8RXfYKgH84ADX4J5NF4iMW3A8akuR/nbZhSo3R6M5vv
 Cw7t8CGklSDKAJ9bun4ipN0SRrKuxjzHiozzt/q14NgL83JFpMMbfjbOE2HFKp0TlEchsi0oAzy
 wHc8kDwHL5RyPx4E=
X-Received: by 2002:adf:fd87:0:b0:2c5:5916:fc1d with SMTP id
 d7-20020adffd87000000b002c55916fc1dmr6253007wrr.18.1676550146645; 
 Thu, 16 Feb 2023 04:22:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9NnKPasu9sGXZiCNo9g7Jyf4CW1QJ2t1oiaHy46jSU0xizLZjR+qV3HwlSDA/q281lbDjvTw==
X-Received: by 2002:adf:fd87:0:b0:2c5:5916:fc1d with SMTP id
 d7-20020adffd87000000b002c55916fc1dmr6252987wrr.18.1676550146386; 
 Thu, 16 Feb 2023 04:22:26 -0800 (PST)
Received: from redhat.com ([2.52.5.34]) by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c348400b003df5be8987esm5225960wmq.20.2023.02.16.04.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:22:25 -0800 (PST)
Date: Thu, 16 Feb 2023 07:22:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
Message-ID: <20230216072142-mutt-send-email-mst@kernel.org>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
 <20230216070037-mutt-send-email-mst@kernel.org>
 <0fe7b18c-507a-2c11-8440-e9e35294b4ba@redhat.com>
 <92c8b5a0-319f-bca4-3b2e-a7dd68ac8649@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92c8b5a0-319f-bca4-3b2e-a7dd68ac8649@redhat.com>
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

On Thu, Feb 16, 2023 at 01:13:07PM +0100, David Hildenbrand wrote:
> On 16.02.23 13:10, David Hildenbrand wrote:
> > On 16.02.23 13:04, Michael S. Tsirkin wrote:
> > > On Thu, Feb 16, 2023 at 12:47:51PM +0100, David Hildenbrand wrote:
> > > > Having multiple devices, some filtering memslots and some not filtering
> > > > memslots, messes up the "used_memslot" accounting. If we'd have a device
> > > > the filters out less memory sections after a device that filters out more,
> > > > we'd be in trouble, because our memslot checks stop working reliably.
> > > > For example, hotplugging a device that filters out less memslots might end
> > > > up passing the checks based on max vs. used memslots, but can run out of
> > > > memslots when getting notified about all memory sections.
> > > > 
> > > > Further, it will be helpful in memory device context in the near future
> > > > to know that a RAM memory region section will consume a memslot, and be
> > > > accounted for in the used vs. free memslots, such that we can implement
> > > > reservation of memslots for memory devices properly. Whether a device
> > > > filters this out and would theoretically still have a free memslot is
> > > > then hidden internally, making overall vhost memslot accounting easier.
> > > > 
> > > > Let's filter the memslots when creating the vhost memory array,
> > > > accounting all RAM && !ROM memory regions as "used_memslots" even if
> > > > vhost_user isn't interested in anonymous RAM regions, because it needs
> > > > an fd.
> > > > 
> > > > When a device actually filters out regions (which should happen rarely
> > > > in practice), we might detect a layout change although only filtered
> > > > regions changed. We won't bother about optimizing that for now.
> > > 
> > > That caused trouble in the past when using VGA because it is playing
> > > with mappings in weird ways.
> > > I think we have to optimize it, sorry.
> > 
> > We still filter them out, just later.
> 
> To be precise, we still filter out all DIRTY_MEMORY_VGA as we used to. Only
> the device-specific filtering (vhost-user) is modified.


Oh good so the VGA use-case is unaffected.

> -- 
> Thanks,
> 
> David / dhildenb


