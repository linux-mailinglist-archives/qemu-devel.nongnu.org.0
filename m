Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B927A3F52E3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 23:33:05 +0200 (CEST)
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIHZ2-0007vk-AE
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 17:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIHXu-0007H7-Ds
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:31:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIHXs-00036H-2Z
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629754310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZN59DQyGYwkpPRcnubzPGI7PyFb57urseNhhWpNvuFY=;
 b=KEARrfQ9sJvikSJubZEjR5n7bdwcElealiW6WPsIda5CwwWmSMk0ElxWkLqwvkZhv3VwYi
 6hk3Ey2w9I31c3777LhuobuYy3QA5GETF0wpSNtAB0SRPP+Pd13gMWAE9d0uvnGcpwAa0T
 AZVMjkEz6PSuf6RjW/yBuDjh7v7lR30=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-SOu0uutqNeCBCqcyzjCuvw-1; Mon, 23 Aug 2021 17:31:49 -0400
X-MC-Unique: SOu0uutqNeCBCqcyzjCuvw-1
Received: by mail-qt1-f197.google.com with SMTP id
 j23-20020ac86657000000b0029cb70967ebso3996743qtp.14
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 14:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZN59DQyGYwkpPRcnubzPGI7PyFb57urseNhhWpNvuFY=;
 b=J1WqUgpdIKC3bIvmraL1MHW0Uif4W5KBtrBdLB1MP8yU+I+P5njK5IkgYHG9taX655
 fZ14JT1snMJsjrKBBxYqp+XLvun4waVKGmrEzt7dA4ofP2Li2zM+IwZIQm34C0lE0IKx
 u6yAVNho2RRtvw3Y7jQWIM1krhS0t1XZHWLFYDgCNiWASNnah8pyLmq29q7+zKYZXQuw
 2AQPMr6YatG+C0fXsBYmHHOmZ9zlKQkRnn0mM7Rek20t1Rfq1eN6He/JqugTSqeg8f94
 h/s+pfX73nLGl4TjPXnG7JiVPua1FkQWBA83wXGT0/i7FkwNtOqpQEbFMDfq5dq6KtwY
 21NA==
X-Gm-Message-State: AOAM530aaZ0LI5OXxVdfL3xSySUdN9NTB8/eX8w75AEyjUTimnvR1Iqz
 CrhW9efFrdP4M6WIvphMqETNfnRRknHmUxeUrtsj47Utt+dHWZrj5etdegc0xGlRQXyXyRvcbIm
 3i3Y80gHxeM/ejS4=
X-Received: by 2002:a05:6214:23c6:: with SMTP id
 hr6mr34843342qvb.22.1629754309291; 
 Mon, 23 Aug 2021 14:31:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTHa4phr29m5ISTbme3gNYKzmvdiFdAR0Uqngr/9O/nXgVSUMLs30dze1nJTUAGF1FofIK1w==
X-Received: by 2002:a05:6214:23c6:: with SMTP id
 hr6mr34843318qvb.22.1629754309063; 
 Mon, 23 Aug 2021 14:31:49 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id h17sm1924588qtu.68.2021.08.23.14.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 14:31:48 -0700 (PDT)
Date: Mon, 23 Aug 2021 17:31:46 -0400
From: Peter Xu <peterx@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YSQTwth0elaz4T8W@t490s>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210823210703.cikdkhvyeqqypaqa@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 05:07:03PM -0400, Eduardo Habkost wrote:
> To give just one example:
> 
> $ (echo 'info pci';echo quit;) | qemu-system-x86_64 -device virtio-net-pci -device e1000e -monitor stdio | tail -n 20
>   Bus  0, device   4, function 0:
>     Ethernet controller: PCI device 1af4:1000
>       PCI subsystem 1af4:0001
>       IRQ 0, pin A
>       BAR0: I/O at 0xffffffffffffffff [0x001e].
>       BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
>       BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
>       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
>       id ""
>   Bus  0, device   5, function 0:
>     Ethernet controller: PCI device 8086:10d3
>       PCI subsystem 8086:0000
>       IRQ 0, pin A
>       BAR0: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
>       BAR1: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
>       BAR2: I/O at 0xffffffffffffffff [0x001e].
>       BAR3: 32 bit memory at 0xffffffffffffffff [0x00003ffe].
>       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
>       id ""
> (qemu) quit
> $ (echo 'info pci';echo quit;) | qemu-system-x86_64 -device e1000e -device virtio-net-pci -monitor stdio | tail -n 20
>   Bus  0, device   4, function 0:
>     Ethernet controller: PCI device 8086:10d3
>       PCI subsystem 8086:0000
>       IRQ 0, pin A
>       BAR0: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
>       BAR1: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
>       BAR2: I/O at 0xffffffffffffffff [0x001e].
>       BAR3: 32 bit memory at 0xffffffffffffffff [0x00003ffe].
>       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
>       id ""
>   Bus  0, device   5, function 0:
>     Ethernet controller: PCI device 1af4:1000
>       PCI subsystem 1af4:0001
>       IRQ 0, pin A
>       BAR0: I/O at 0xffffffffffffffff [0x001e].
>       BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
>       BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
>       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
>       id ""
> (qemu) quit
> 
> 
> If the order of the -device arguments changes, the devices are assigned to
> different PCI slots.

Thanks for the example.

Initially I thought about this and didn't think it an issue (because serious
users will always specify addr=XXX for -device; I thought libvirt always does
that), but I do remember that guest OS could identify its hardware config with
devfn number, so nmcli may mess up its config with before/after this change
indeed..

I can use a custom sort to replace qsort() to guarantee that.

Do you have other examples in mind that I may have overlooked, especially I may
not be able to fix by a custom sort with only moving priority>=1 devices?

Thanks,

-- 
Peter Xu


