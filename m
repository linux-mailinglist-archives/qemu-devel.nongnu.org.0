Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D7391413
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:49:22 +0200 (CEST)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llqAD-0007WS-80
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1llq99-0006UU-Bm
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1llq93-00010f-Fv
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622022488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VJaG/NGdG6rEQK+zSD5byZ36LeOD31EGuVEeiaJUCY=;
 b=Ama7hR+erOYRd+c34v6bnAodgNP3F7Sejy6VzbDwvBpW3q6TAVG3VzBeDnFSeCwdIA1LjH
 Am0iGtJ3YeUqrmaZvMjrs5az8IgH4Liw8SQb6AMSKSx2NQf3sfI9kHRMog4chn5GxvotuV
 EH0OYp/gp8irCRjjQu4myW6gQ2X+Gvc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-g3QNCgzZPeqPREU-ttyJvw-1; Wed, 26 May 2021 05:48:04 -0400
X-MC-Unique: g3QNCgzZPeqPREU-ttyJvw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so146121wre.6
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 02:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/VJaG/NGdG6rEQK+zSD5byZ36LeOD31EGuVEeiaJUCY=;
 b=foBR/+o1rLUHDD/dJVKj+LrqLDJP01C9IK8STCo19f/KUVFBYln2UvqWw8J4wRFxFg
 bPSygmt/0untXOW90sz+Mn5NFuuMvOmr9TD9Zo4JAE/osNbojjGuy2dMbIcHaFssuo3D
 kq04DKwTRL0IHKvYqdEzLGEe9EvHftt+0XB0W45i1u72g877nMz0YIYj2kr5UaHX2KY6
 fc7knFndKA/Tk7+PsWtggCDDEyPNscMlunkHw6gBBPTxsBTNZz91OZRQhTynbNEqY4t1
 B+zOfiDY2cQObWbeJOr168sAAoxsDM1+7X/tFVfFbJEBUUWsLSZEsYSEPqn7A526E+wH
 hWFg==
X-Gm-Message-State: AOAM531kgvPgRHZblK1ql27V82efcQA/G4HtCumnvHD9JHfUpatr3cwM
 RRwLoGMzoLYDMljRuiKvDxf24zcpMURc6iI1UQL8nxLzhi3S+v4/Fo19K1SIGE3Caz2M04l1iLm
 FZR6p5JF0haYRNtM=
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr27615243wma.54.1622022483043; 
 Wed, 26 May 2021 02:48:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4E5r5M2BDUNBbiNCbZ2p8NtT/DGQ3VkpPvSikrDHtpebmw9siwtuuyETGZBM8YTz3SBo7gA==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr27615234wma.54.1622022482873; 
 Wed, 26 May 2021 02:48:02 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id l188sm1145331wmf.27.2021.05.26.02.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 02:48:02 -0700 (PDT)
Date: Wed, 26 May 2021 05:47:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [Bug 1924912] VirtIO drivers don't work on Windows: "GLib: Too
 many handles to wait for!" crash
Message-ID: <20210526054632-mutt-send-email-mst@kernel.org>
References: <161875180735.23175.14682430598239905387.malonedeb@wampee.canonical.com>
 <161875645795.6320.1996793877758730269.malone@soybean.canonical.com>
 <9bb9996e-d7ac-44c5-2fd3-13f2a4d1c802@weilnetz.de>
 <b48d2719-d334-2c16-be32-f3df52d415c7@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <b48d2719-d334-2c16-be32-f3df52d415c7@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Stefan Weil <sw@weilnetz.de>, Bug 1924912 <1924912@bugs.launchpad.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So it's a virtio console issue on a windows host.

[#0 init_stage2(2:2)]: VirtIOConsole: Found @ PCI [0000:00:04:00]
[#0 init_stage2(2:2)]: Trying to unregister unused handler (?)
[#0 init_stage2(2:2)]: VirtIOConsole: Multi port is not yet supported!
[#0 init_stage2(2:2)]: VirtIOConsole: cols: 0, rows: 0, max nr ports 0
qemu-system-i386.exe: warning: GLib: Too many handles to wait for!

Laurent?


On Mon, Apr 19, 2021 at 04:30:23PM +0200, Laurent Vivier wrote:
> Le 19/04/2021 à 12:39, Stefan Weil a écrit :
> > I can confirm the issue also with latest official QEMU sources.
> > 
> > Related issue URLs:
> > 
> > https://github.com/tesseract-ocr/tesseract/issues/2838
> > 
> > https://bugs.launchpad.net/qemu/+bug/1924912
> > 
> > Instructions and files required to reproduce the issue:
> > 
> > https://qemu.weilnetz.de/test/bugs/1924912/
> > 
> > Michael, Laurent, maybe you have an idea how to narrow down this issue?
> 
> Could it be related to the number of file descriptors that can differ between linux an windows?
> 
> We have a series of patches that sets the number of queues to the number of vCPU:
> 
> a4eef0711b2c vhost-user-blk-pci: default num_queues to -smp N
> 9445e1e15e66 virtio-blk-pci: default num_queues to -smp N
> 6a558822849f virtio-scsi-pci: default num_queues to -smp N
> 4e5163bd8444 virtio-scsi: introduce a constant for fixed virtqueues
> 1436f32a84c3 virtio-pci: add virtio_pci_optimal_num_queues() helper
> 
> And I think it can have inpact on the number of open file descriptors.
> 
> You can try by specifiying "num_queues=1" with the virtio interfaces on the QEMU command line.
> (ot choose a machine type earlier than 5.2)
> 
> Thanks,
> Laurent


