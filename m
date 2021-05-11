Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16EA37A337
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:14:22 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOT8-0005FU-1J
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lgNpF-0007EB-Iv
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:33:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lgNpD-0003S6-4C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620721986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SlUKnHkkSb2wfag5Ba79PYlqybDZ9I93WOIrn2ayHs=;
 b=IegqJqM2vN/f+P3HUGo0JewV1TN9j5IWGflrrcEfMMy0sE2rUSXTWV8x38kQv/PXCxy3De
 9amGuPLETGEk8YcJHbkRDlQ09/REamIkfEeDlSMhdP5JmCyVMfk73yRiFUAAaJ6odOTotr
 RWLKL3B/xg00I/zihxrGuUf1ZFxMZRQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-rbbmy0j2MByrJ4XT3OErnw-1; Tue, 11 May 2021 04:33:04 -0400
X-MC-Unique: rbbmy0j2MByrJ4XT3OErnw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so8416361wre.22
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+SlUKnHkkSb2wfag5Ba79PYlqybDZ9I93WOIrn2ayHs=;
 b=EAWSjgvWITZud5EZgMii2xCFMbs9hXCJoqi6WL16Vj9BhyiLM4jyVwhlLZX1Vj5dbf
 1l5lMA3NuKC3xKefhQeoCxrGsNqC6xlxr397zLfUstU7yb9HqgHn4e3HzWEcZl68BNKv
 +RS1xh38vMQjxc0R0cRZhPHWRLOlcL9CqgHPTKCgKLApYuO7Shj6twcOOp27VaajFEKN
 ST4JZjwQHwRmY5a68M9EVIYzlr5AGeMIiuEDc91HBhhdLWa+G19c/5kKjT8CENjrr1su
 JxI4xvtgnGB1yFAIutIeRttAwUZ2vay6xYUk0r4ALTArSytj5KdCda2WSwGonfBQEz8i
 4VEA==
X-Gm-Message-State: AOAM5339nU+9a25qh9/U8ltb32nOk3uWDReNjql9doI4k0pEnHH6oIi9
 v8V6pmKand/S5eFPlvNN6l1wfLF8je9ejTKkZF/VpXaQpbCXWvH82G3I7p+OVwZutvzziZ6getN
 dtxxGzfiGCoJxTJ0=
X-Received: by 2002:a1c:f407:: with SMTP id z7mr30632340wma.20.1620721983209; 
 Tue, 11 May 2021 01:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNZBak5ZG8csK0kecmtuAiQ/YZxsc99DppcY020sBo2Khox6EQYBaC9aUinpNsNQb8MlVXIA==
X-Received: by 2002:a1c:f407:: with SMTP id z7mr30632323wma.20.1620721983012; 
 Tue, 11 May 2021 01:33:03 -0700 (PDT)
Received: from redhat.com ([2a10:8004:640e:0:d1db:1802:5043:7b85])
 by smtp.gmail.com with ESMTPSA id a9sm23042974wmj.1.2021.05.11.01.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 01:33:02 -0700 (PDT)
Date: Tue, 11 May 2021 04:33:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] scripts: add a script to list virtio devices in a system
Message-ID: <20210511043002-mutt-send-email-mst@kernel.org>
References: <20210506193341.140141-1-lvivier@redhat.com>
 <6b7500f7-2e24-6da1-028e-d7e77ca17f27@redhat.com>
 <51a6753f-2d98-2aee-4d88-0c49e87e0cea@redhat.com>
MIME-Version: 1.0
In-Reply-To: <51a6753f-2d98-2aee-4d88-0c49e87e0cea@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 07, 2021 at 08:17:33AM +0200, Laurent Vivier wrote:
> On 06/05/2021 21:50, Philippe Mathieu-Daudé wrote:
> > On 5/6/21 9:33 PM, Laurent Vivier wrote:
> >> Add "lsvirtio" that lists all virtio devices in a system
> >> the same way lspci does for the PCI cards.
> >>
> >> For instance:
> >>
> >>  $ ./lsvirtio
> >>  0000:01:00.0 virtio0 Red Hat, Inc. (PCI) Virtio Network Card
> >> 	 Subsystem: virtio
> >> 	 Modalias: virtio:d00000001v00001AF4
> > 
> > "ModAlias" maybe?
> > 
> >> 	 Status: ACKNOWLEDGE DRIVER_OK DRIVER FEATURES_OK
> >> 	 Feature: CSUM
> >> 	 Feature: GUEST_CSUM
> >> 	 Feature: CTRL_GUEST_OFFLOADS
> >> 	 Feature: MAC
> >> 	 Feature: GUEST_TSO4
> >> 	 Feature: GUEST_TSO6
> >> 	 Feature: GUEST_ECN
> >> 	 Feature: GUEST_UFO
> >> 	 Feature: HOST_TSO4
> >> 	 Feature: HOST_TSO6
> >> 	 Feature: HOST_ECN
> >> 	 Feature: HOST_UFO
> >> 	 Feature: MRG_RXBUF
> >> 	 Feature: STATUS
> >> 	 Feature: CTRL_VQ
> >> 	 Feature: CTRL_RX
> >> 	 Feature: CTRL_VLAN
> >> 	 Feature: GUEST_ANNOUNCE
> >> 	 Feature: CTRL_MAC_ADDR
> >> 	 Feature: RING_INDIRECT_DESC
> >> 	 Feature: RING_EVENT_IDX
> >> 	 Feature: VERSION_1
> >> 	 Kernel driver in use: virtio_net
> >>          Interfaces: enp1s0
> >>
> >>  0000:03:00.0 virtio1 Red Hat, Inc. (PCI) Virtio Console
> >> 	 Subsystem: virtio
> >> 	 Modalias: virtio:d00000003v00001AF4
> >> 	 Status: ACKNOWLEDGE DRIVER_OK DRIVER FEATURES_OK
> >> 	 Feature: MULTIPORT
> >> 	 Feature: RING_INDIRECT_DESC
> >> 	 Feature: RING_EVENT_IDX
> >> 	 Feature: VERSION_1
> >> 	 Kernel driver in use: virtio_console
> >>          Interfaces: vport1p1
> >>  ...
> >>
> >> This is useful to have the list of virtio devices when they are not
> >> mapped by a PCI card:
> >>
> >>  $ ./lsvirtio
> >>  virtio-mmio.121 virtio0 Virt (MMIO) Virtio 9P transport
> >> 	 Subsystem: virtio
> >> 	 Modalias: virtio:d00000009v554D4551
> >> 	 Status: FEATURES_OK ACKNOWLEDGE DRIVER DRIVER_OK
> >> 	 Feature: MOUNT_TAG
> >> 	 Feature: RING_INDIRECT_DESC
> >> 	 Feature: RING_EVENT_IDX
> >> 	 Feature: VERSION_1
> >> 	 Kernel driver in use: 9pnet_virtio
> >>          Interfaces: home0
> >>
> >>  virtio-mmio.122 virtio1 Virt (MMIO) Virtio GPU Device
> >> 	 Subsystem: virtio
> >> 	 Modalias: virtio:d00000010v554D4551
> >> 	 Status: FEATURES_OK ACKNOWLEDGE DRIVER DRIVER_OK
> >> 	 Feature: EDID
> >> 	 Feature: RING_INDIRECT_DESC
> >> 	 Feature: RING_EVENT_IDX
> >> 	 Feature: VERSION_1
> >> 	 Kernel driver in use: virtio_gpu
> >>          Interfaces: fb0
> >>  ...
> >>
> >> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >> ---
> >>  scripts/lsvirtio | 317 +++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 317 insertions(+)
> >>  create mode 100755 scripts/lsvirtio
> > 
> > Can you add an entry for the file in MAINTAINERS?
> 
> Yes, but where?
> 
> It would go under virtio section, but I'm not sure Michael wants to maintain it.

I don't have a problem with getting patches for it.

> Perhaps "Python scripts" section?
> 
> > Otherwise:
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > 
> 
> Thanks,
> Laurent


