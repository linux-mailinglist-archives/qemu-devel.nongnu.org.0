Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D13F5315
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 23:55:53 +0200 (CEST)
Received: from localhost ([::1]:48340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIHv6-0004eu-HS
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 17:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIHuG-00040B-04
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIHuC-0001T4-5h
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 17:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629755693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Brp3HiA8GtflGOKL3e39J61gdu9cZALCOrlLefQdcY=;
 b=ECkgPXry88p0NYfTSK6wp+961lpsfmM15+ZdrMj+clF646y+u+HYXkvEtbAQSEV14n1BaG
 83FRHk/lUbYZ1en0fjdF1ctqD4xCvmmxbeB2oDdd5SFZj4XxZCDsXpd/hEdDz1fQ8zEbpR
 8npGJjieuOpEqhvQlTgb7gezHpTlhqo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-v4KH25fnNs2Y9pXbPPaBBw-1; Mon, 23 Aug 2021 17:54:50 -0400
X-MC-Unique: v4KH25fnNs2Y9pXbPPaBBw-1
Received: by mail-ed1-f69.google.com with SMTP id
 d12-20020a50fe8c0000b02903a4b519b413so756464edt.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 14:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Brp3HiA8GtflGOKL3e39J61gdu9cZALCOrlLefQdcY=;
 b=MhPrd+X0UzHQWShfS42wKq75nFbprsA2bTR3AOJon0DhTemMrp1cSQMpbYqSieR8EN
 ZepJ8ZbF1Q/EzTXsV5w9yOun27GjxHbICKb2iEz3oeKxyIOtJDwkSaTbgoDzIEWL26D2
 sXs+KToccoFuLrMS31ZPscVkOzGgSAmbSW6Zn3Sj/3PuuFHmZYqwq2jUp/YWG47Sm3fW
 hHQQDmDHIwwN6h0ZUgQK2/UJ4piypnJDVoFtP/BcUU+0adMiw56xzueiqrsDqhXJet2i
 Ru8Ib+pMT7sOudv79pOEze+/cdJp2g3uyIJmLF9IvBDush6jgCAgknSocKg50ArDeEFT
 NVNw==
X-Gm-Message-State: AOAM533QB3kn4ByNZZ0abMM4WdSih8DIx8PwEaB2Ujxr6V8JDzn3NH3F
 she4HDIvBaifj+dTM0lEqodv9dlSpbJKhth1i6a+ya8RmXJw4nOf3fkkPzgJc490M3FLKTmWAU2
 d497ACQV38ORjchM=
X-Received: by 2002:a17:907:9152:: with SMTP id
 l18mr37647461ejs.190.1629755689081; 
 Mon, 23 Aug 2021 14:54:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr3znEKsifwwTWD68mvod3ikQ4fkZ2zxmfXvpjtObRkxKO8vHqyFTdkXw0FxxCS00ULNdNzA==
X-Received: by 2002:a17:907:9152:: with SMTP id
 l18mr37647431ejs.190.1629755688758; 
 Mon, 23 Aug 2021 14:54:48 -0700 (PDT)
Received: from redhat.com ([2.55.137.225])
 by smtp.gmail.com with ESMTPSA id x15sm7943554ejv.95.2021.08.23.14.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 14:54:48 -0700 (PDT)
Date: Mon, 23 Aug 2021 17:54:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210823175247-mutt-send-email-mst@kernel.org>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
MIME-Version: 1.0
In-Reply-To: <YSQTwth0elaz4T8W@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 05:31:46PM -0400, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 05:07:03PM -0400, Eduardo Habkost wrote:
> > To give just one example:
> > 
> > $ (echo 'info pci';echo quit;) | qemu-system-x86_64 -device virtio-net-pci -device e1000e -monitor stdio | tail -n 20
> >   Bus  0, device   4, function 0:
> >     Ethernet controller: PCI device 1af4:1000
> >       PCI subsystem 1af4:0001
> >       IRQ 0, pin A
> >       BAR0: I/O at 0xffffffffffffffff [0x001e].
> >       BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
> >       BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> >   Bus  0, device   5, function 0:
> >     Ethernet controller: PCI device 8086:10d3
> >       PCI subsystem 8086:0000
> >       IRQ 0, pin A
> >       BAR0: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
> >       BAR1: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
> >       BAR2: I/O at 0xffffffffffffffff [0x001e].
> >       BAR3: 32 bit memory at 0xffffffffffffffff [0x00003ffe].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> > (qemu) quit
> > $ (echo 'info pci';echo quit;) | qemu-system-x86_64 -device e1000e -device virtio-net-pci -monitor stdio | tail -n 20
> >   Bus  0, device   4, function 0:
> >     Ethernet controller: PCI device 8086:10d3
> >       PCI subsystem 8086:0000
> >       IRQ 0, pin A
> >       BAR0: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
> >       BAR1: 32 bit memory at 0xffffffffffffffff [0x0001fffe].
> >       BAR2: I/O at 0xffffffffffffffff [0x001e].
> >       BAR3: 32 bit memory at 0xffffffffffffffff [0x00003ffe].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> >   Bus  0, device   5, function 0:
> >     Ethernet controller: PCI device 1af4:1000
> >       PCI subsystem 1af4:0001
> >       IRQ 0, pin A
> >       BAR0: I/O at 0xffffffffffffffff [0x001e].
> >       BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
> >       BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
> >       BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
> >       id ""
> > (qemu) quit
> > 
> > 
> > If the order of the -device arguments changes, the devices are assigned to
> > different PCI slots.
> 
> Thanks for the example.
> 
> Initially I thought about this and didn't think it an issue (because serious
> users will always specify addr=XXX for -device; I thought libvirt always does
> that), but I do remember that guest OS could identify its hardware config with
> devfn number, so nmcli may mess up its config with before/after this change
> indeed..
> 
> I can use a custom sort to replace qsort() to guarantee that.


You don't have to do that. Simply use the device position on the command
line for comparisons when priority is the same.


> Do you have other examples in mind that I may have overlooked, especially I may
> not be able to fix by a custom sort with only moving priority>=1 devices?
> 
> Thanks,

> -- 
> Peter Xu


