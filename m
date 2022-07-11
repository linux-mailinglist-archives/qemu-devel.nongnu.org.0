Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC525706DE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:21:44 +0200 (CEST)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvED-0005id-J7
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAuNR-0005Bk-Tb
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:27:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oAuNO-0001Be-9R
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657549625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AbErK0bCIAQSkWRANxlcsQH4wjElnnliu1hTmkvJ0+o=;
 b=NP7Dloauy+1x1fcSYtRBLJIyDJlHth6mml5nGYVafgdVshPcI6ogMxFaOg6Nhkuo3CGOKu
 jE8uTkKBHb81WVNS+Z2xpEXwNXwb+oS/7qBKPAmCAzZlXvw1jemasUvXrGv+TPC0p/RriZ
 2Nv+9K1kISOLy0rd+JjxtWLJSziwNB4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-zsVWRLNlOM6xBUsdpj1Vxw-1; Mon, 11 Jul 2022 10:27:04 -0400
X-MC-Unique: zsVWRLNlOM6xBUsdpj1Vxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m20-20020a05600c4f5400b003a03aad6bdfso2733051wmq.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 07:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AbErK0bCIAQSkWRANxlcsQH4wjElnnliu1hTmkvJ0+o=;
 b=eBuf5XouruF9Hq2am0URyAxOL5FGIfCYgBU0s3ljN+R2eYT4J8Bqz/F7Y14BuLkFdD
 twV2ukOY24PBruon9EjoEc4yes1XOhlfFxbzsEHYw8jGmBT1xbSYzTZYPx1FYSYScphJ
 q1scqe59OfHlRxtifXwYm2bcVo1VcGioug1P0NlbEW+K6eb6KDoilBcgJuUTCAIk79IH
 5NtTDlalKq46lu2ETto3RxpKrFDQ5B4ugRX2NO5V5SR7BDst/vjMc2d0uU2cEFKtzSI4
 lqc35//6bOna2pdTKJLtp5XwavSYRQapHDXAVp9tb3+20H2LGJw3IHICO1cXfGmqJaPj
 ZkfA==
X-Gm-Message-State: AJIora/Cf9Dxe/lV0kKmZSaAjpmS4+xmjDfgw5T2da5Dleq9Gk9cJhcq
 uBxW1UuNW5tC7OuMm8ALNhCx/WNxN272xFJsm0EvFljlWrGsb2SEFGnLDFi9jDp0LnoLU5+ZpqW
 ohj1nFq2Bcx2Tnkg=
X-Received: by 2002:adf:f20e:0:b0:21d:8aa6:69da with SMTP id
 p14-20020adff20e000000b0021d8aa669damr16905746wro.66.1657549623075; 
 Mon, 11 Jul 2022 07:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6JrSxYzE7lTcuRNdNCGMDPUqq72htqeelx3kHencLRcEto4bMByJBBBcklphe8DQX6EU83A==
X-Received: by 2002:adf:f20e:0:b0:21d:8aa6:69da with SMTP id
 p14-20020adff20e000000b0021d8aa669damr16905726wro.66.1657549622871; 
 Mon, 11 Jul 2022 07:27:02 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 y5-20020adff6c5000000b0021d83071683sm5922049wrp.64.2022.07.11.07.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 07:27:01 -0700 (PDT)
Date: Mon, 11 Jul 2022 15:26:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eauger@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Message-ID: <YswzM/Q75rkkj/+Y@work-vm>
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm>
 <CAFEAcA-e4Jvb-wV8sKc7etKrHYPGuOh=naozrcy2MCoiYeANDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-e4Jvb-wV8sKc7etKrHYPGuOh=naozrcy2MCoiYeANDQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 11 Jul 2022 at 14:24, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> > But, ignoring postcopy for a minute, with KVM how do different types of
> > backing memory work - e.g. if I back a region of guest memory with
> > /dev/shm/something or a hugepage equivalent, where does the MTE memory
> > come from, and how do you set it?
> 
> Generally in an MTE system anything that's "plain old RAM" is expected
> to support tags. (The architecture manual calls this "conventional
> memory". This isn't quite the same as "anything that looks RAM-like",
> e.g. the graphics card framebuffer doesn't have to support tags!)

I guess things like non-volatile disks mapped as DAX are fun edge cases.

> One plausible implementation is that the firmware and memory controller
> are in cahoots and arrange that the appropriate fraction of the DRAM is
> reserved for holding tags (and inaccessible as normal RAM even by the OS);
> but where the tags are stored is entirely impdef and an implementation
> could choose to put the tags in their own entirely separate storage if
> it liked. The only way to access the tag storage is via the instructions
> for getting and setting tags.

Hmm OK;   In postcopy, at the moment, the call qemu uses is a call that
atomically places a page of data in memory and then tells the vCPUs to
continue.  I guess a variant that took an extra blob of MTE data would
do.
Note that other VMMs built on kvm work in different ways; the other
common way is to write into the backing file (i.e. the /dev/shm
whatever atomically somehow) and then do the userfault call to tell the
vcpus to continue.  It looks like this is the way things will work in
the split hugepage mechanism Google are currently adding.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


