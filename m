Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B67644882
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 17:00:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2aMr-0005rE-0B; Tue, 06 Dec 2022 11:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2aMe-0005qD-0S
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:00:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2aMb-0006fT-JS
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670342406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zu0rAwAuE6QwDoYs10JsbnnPiKWtKFHCPDXVoorD0sE=;
 b=XdMVCyRDG1t/CodLhBFROKrnPYs//iaBhPNImMegIuwo32iFj09kOQBL3UBQL4xdLJqu0a
 ZLJeE09ihBw/i/tneA1REBror2cLrqM9DQGCUpUpBwdRUeSpdWARqWQx6tS2tux1MlkjxV
 zbH9jJ7GbklyERV2+5gUCxkkfZJA1Zs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126--a4jLLfsNZqyYx3rUB7YHw-1; Tue, 06 Dec 2022 11:00:05 -0500
X-MC-Unique: -a4jLLfsNZqyYx3rUB7YHw-1
Received: by mail-qk1-f197.google.com with SMTP id
 f13-20020a05620a408d00b006fc740f837eso21687455qko.20
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 08:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zu0rAwAuE6QwDoYs10JsbnnPiKWtKFHCPDXVoorD0sE=;
 b=cBLuU3xj3NVcLz9YBRN+be5PbXVzLseC+kzAC58UBUPNcf2RTBCZaKtXPP0r8MOf9N
 LXAYrv6HIdj0upfFZ0WW00P6f8Nx6hbMjA0B5xXP2nXa6xaNAfvSS8rx3gfKmKba1PUC
 rO4iWk9Z1PooBL+ZGJipg9rDLN3TMsE00nOf2ytomTVWuMbNx7x2ertxhvalxQoDzk83
 QSkvxuNtLbaX+L2ftR+SgV4XzfgwVkH9nXAtnKpC8EmEEvPl5KcD32hE/jDNGio9yUGx
 5ooeun19bNRStlMzSSuIvlN6CCkJ6Cv9U3COpF48/u8QPRwOAls/BjvhcOxws5U3dAui
 zWEg==
X-Gm-Message-State: ANoB5pk1+qLINzxAPVHl8+7BAHVR1x9Qi6Fh16wVSdUh73ooQEl/HzSV
 Xgc33jPIyoKblHhBiXmz1GF9nDgshblZvtgGEFfR3Eqgp/tDHtDm3M4p9ovlSLQBPbN8ZhqThSi
 c9udfFEi9Gp4pLgM=
X-Received: by 2002:a0c:fe0e:0:b0:4c6:ecc4:a26b with SMTP id
 x14-20020a0cfe0e000000b004c6ecc4a26bmr44590973qvr.70.1670342404731; 
 Tue, 06 Dec 2022 08:00:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5okReLYbxRC41ENfgYV0bzXFQGfRkuSuCQ3BpYUz22FyiP35MS9UZJs5kKmlkHj/2p40GNzQ==
X-Received: by 2002:a0c:fe0e:0:b0:4c6:ecc4:a26b with SMTP id
 x14-20020a0cfe0e000000b004c6ecc4a26bmr44590949qvr.70.1670342404404; 
 Tue, 06 Dec 2022 08:00:04 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 cf16-20020a05622a401000b003996aa171b9sm11577161qtb.97.2022.12.06.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 08:00:03 -0800 (PST)
Date: Tue, 6 Dec 2022 11:00:02 -0500
From: Peter Xu <peterx@redhat.com>
To: Shivam Kumar <shivam.kumar1@nutanix.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, david@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, kvm@vger.kernel.org,
 Yong Huang <huangy81@chinatelecom.cn>
Subject: Re: [RFC PATCH 0/1] QEMU: Dirty quota-based throttling of vcpus
Message-ID: <Y49nAjrD0uxUp+Ll@x1n>
References: <20221120225458.144802-1-shivam.kumar1@nutanix.com>
 <0cde1cb7-7fce-c443-760c-2bb244e813fe@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0cde1cb7-7fce-c443-760c-2bb244e813fe@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Hi, Shivam,

On Tue, Dec 06, 2022 at 11:18:52AM +0530, Shivam Kumar wrote:

[...]

> > Note
> > ----------
> > ----------
> > 
> > We understand that there is a good scope of improvement in the current
> > implementation. Here is a list of things we are working on:
> > 1) Adding dirty quota as a migration capability so that it can be toggled
> > through QMP command.
> > 2) Adding support for throttling guest DMAs.
> > 3) Not enabling dirty quota for the first migration iteration.

Agreed.

> > 4) Falling back to current auto-converge based throttling in cases where dirty
> > quota throttling can overthrottle.

If overthrottle happens, would auto-converge always be better?

> > 
> > Please stay tuned for the next patchset.
> > 
> > Shivam Kumar (1):
> >    Dirty quota-based throttling of vcpus
> > 
> >   accel/kvm/kvm-all.c       | 91 +++++++++++++++++++++++++++++++++++++++
> >   include/exec/memory.h     |  3 ++
> >   include/hw/core/cpu.h     |  5 +++
> >   include/sysemu/kvm_int.h  |  1 +
> >   linux-headers/linux/kvm.h |  9 ++++
> >   migration/migration.c     | 22 ++++++++++
> >   migration/migration.h     | 31 +++++++++++++
> >   softmmu/memory.c          | 64 +++++++++++++++++++++++++++
> >   8 files changed, 226 insertions(+)
> > 
> 
> It'd be great if I could get some more feedback before I send v2. Thanks.

Sorry to respond late.

What's the status of the kernel patchset?

From high level the approach looks good at least to me.  It's just that (as
I used to mention) we have two similar approaches now on throttling the
guest for precopy.  I'm not sure what's the best way to move forward if
without doing a comparison of the two.

https://lore.kernel.org/all/cover.1669047366.git.huangy81@chinatelecom.cn/

Sorry to say so, and no intention to create a contention, but merging the
two without any thought will definitely confuse everybody.  We need to
figure out a way.

From what I can tell..

One way is we choose one of them which will be superior to the other and
all of us stick with it (for either higher possibility of migrate, less
interference to the workloads, and so on).

The other way is we take both, when each of them may be suitable for
different scenarios.  However in this latter case, we'd better at least be
aware of the differences (which suites what), then that'll be part of
documentation we need for each of the features when the user wants to use
them.

Add Yong into the loop.

Any thoughts?

-- 
Peter Xu


