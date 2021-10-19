Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5174D43310E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:29:25 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckUu-0000bx-Ei
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mckTu-0008MQ-EP
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mckTq-0005wv-Lv
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634632096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDJoN0K7hQAjLTqtnMF5ddYMEHLNboJX7gw0R8i5anQ=;
 b=gUn3Hth2jRHlI3CNELndvKIdoMuUEnAqniBSkxm7c4std0PFKT34HLDg5y70vp0mRp0V/Q
 DQYFUoP+RVB6Y2DYjpDBWbFNybtVrKpgm7eF5wyejx25ePBGjoMzOV8dquffZ8hM8qQPaP
 vOozI7GtJ/lqb0rs9IBsZ43PAQE6SXI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-NmJUxH4wNtOMV-B2kos5KQ-1; Tue, 19 Oct 2021 04:28:13 -0400
X-MC-Unique: NmJUxH4wNtOMV-B2kos5KQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so16886211edq.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 01:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XDJoN0K7hQAjLTqtnMF5ddYMEHLNboJX7gw0R8i5anQ=;
 b=scPMMx/z9SCU5DRKtjup2Lgi3pEQ2eXnDLl9wIqPb/FwGbswmVoPd/E87tGBKN06Or
 DSPYYqQRKEv8MUN7ljreeAbB0cCeSpmVDmruC6uGsv8EPSNKExSY1Ee7oLPsCHCvwUYC
 YIpq5w0lcSgV36fTTkzUEDwXgfo3IHLAg0oiMmGf8l5jF0p6qEH3UUzbK6YoR4kUtL1Z
 JDcx5/SVlekTMjtp2a1q8L5wxGMeWM5cYdIjHnOd5NDJe7On6e7QwwC5e/cSsQecr6qH
 oK93hgtwBfVqWgCAwOTtSCJI5oOMtgGIG+IdJ+TfI3j/K1LjSKdmS3XfLqk1x5hly+qO
 ybsQ==
X-Gm-Message-State: AOAM533UTXBCpNBfbABTHDlmVXE5aXduPFsoLlVv9GRFZ+Y6yZajcORd
 pjVsIUtD7LuzotPV3Oxuwh5zRqJVfc7r5L9/7XrKyKJCmtFnPTrTxf9ogPqWNooSyfZw+TJ4USk
 3UPo5doIl3xTU6GA=
X-Received: by 2002:a17:906:a94b:: with SMTP id
 hh11mr37022256ejb.85.1634632092275; 
 Tue, 19 Oct 2021 01:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySWrKFAh88LH9MCjf7SPl+UzldbRiswSZQFoKyTaQr9A6Y4o/LDeBeAYys1TT1WT3MyspBmQ==
X-Received: by 2002:a17:906:a94b:: with SMTP id
 hh11mr37022235ejb.85.1634632092030; 
 Tue, 19 Oct 2021 01:28:12 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id v6sm12526060edc.52.2021.10.19.01.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 01:28:11 -0700 (PDT)
Date: Tue, 19 Oct 2021 10:28:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Adam Lackorzynski <adam@l4re.org>
Subject: Re: [PATCH] multiboot: Use DMA instead port-based transfer
Message-ID: <20211019082809.jev4m6hntaqoasnj@steredhat>
References: <YWM6jboU9fUib6Iy@os.inf.tu-dresden.de>
MIME-Version: 1.0
In-Reply-To: <YWM6jboU9fUib6Iy@os.inf.tu-dresden.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing Paolo since kvm-unit-tests use multiboot.

On Sun, Oct 10, 2021 at 09:10:05PM +0200, Adam Lackorzynski wrote:
>Use DMA transfers in the multiboot loader to copy
>data.
>
>This significantly lowers QEMU's startup latency by
>a factor of about 40, for example, going from 30sec
>to 0.8sec when loading modules of 120MB in size.
>This change has been used successfully for some time.
>
>Signed-off-by: Marcus Hähnel <marcus.haehnel@kernkonzept.com>
>Signed-off-by: Adam Lackorzynski <adam@l4re.org>
>---
> pc-bios/multiboot.bin         | Bin 1024 -> 1536 bytes
> pc-bios/optionrom/multiboot.S |  10 ++---
> pc-bios/optionrom/optionrom.h |  77 ++++++++++++++++++++++++++++++++++
> 3 files changed, 82 insertions(+), 5 deletions(-)

I tested with https://gitlab.com/kvm-unit-tests/kvm-unit-tests running:
  export QEMU=`/path/to/qemu-system-x86_64 -L path/to/pc-bios/optionrom`
  time ./run_test.sh

Before this patch:
real	3m5.578s
user	2m32.231s
sys	0m50.390s

After this patch:
real	2m55.614s
user	2m20.536s
sys	0m50.046s

It's still a good improvement, considering the fact that the images 
aren't big.

Just a consideration, for blobs (kernel and initrd) I fully agree to use 
DMA, but for 32bit variables is it useful?

However, this patch LGTM:

Tested-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


