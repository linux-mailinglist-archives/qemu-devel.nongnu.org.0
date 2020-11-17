Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A029F2B5BA3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:20:05 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kex9g-0002q6-48
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8O-0001eo-Kp
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8L-0006H0-4Y
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I6ykc3/aBKD2iU1kZpcRPmtSTzh32Tt9glll84wxTIA=;
 b=WQ2nXw4QNIpy34K+eMQegGEZ66U0xCsDbHIB+WhVbitB2rvW9qi7HoSYaw3dNTzrCFu2eB
 LNHRs+Rs3Gov/Mr37uhaDIRCwS5S+iIOR3bx0hXmzWXXTwV2zrb9smVoMda8KY+WZEkE3c
 mSM3vpzcAcXwPPDWv75RrKNi/dgLoXI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-JmkXUO22P-KSn-G1-o8Cng-1; Tue, 17 Nov 2020 04:18:35 -0500
X-MC-Unique: JmkXUO22P-KSn-G1-o8Cng-1
Received: by mail-wm1-f72.google.com with SMTP id y26so1236074wmj.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I6ykc3/aBKD2iU1kZpcRPmtSTzh32Tt9glll84wxTIA=;
 b=T/+6fXCkY3TzNL2BrSMn8mr8cJytcw9Z6EHk9IfDxUTDENKgRAgpNzQB8yQyo7lTsp
 CQdWiYzBqKYA0MSm6udGwZuOyzyjtTqPzHPcWj/jS24SjbBdXISpdKfG5cPpNAJHZufn
 OtjgKQ2C4KmcTNCBVhLXlCkP/XKudqKdJYk5uoEngDRFbsQWVya2qmAk7svqtu4N/PP4
 4p0V90n/6urAgXoG7Yo+o3UA7CeLT0YnCUPYg8q7gkngch5lsChQaYix1YjHPnyCKKFd
 1/6NnFr0YZcptXuC+zAce5Lx0/89nGqNtJddtq2C4cPyOQKpuyz/xl8Rds3c8uxS37Am
 v5Dg==
X-Gm-Message-State: AOAM5306TV9GvOyYHWUHbVKsMAkWa9n9pTh/N0zFeuV+F/wNgxclRhKx
 BVJdDI95tZfv8oYVsH8Go7HABIHklW54rLP9rKEYHEzSezzHDP9opWeIZbDPSTajPv4mRw25psW
 pZj4FvKVJ056HFA4=
X-Received: by 2002:a1c:4456:: with SMTP id r83mr2087763wma.91.1605604714505; 
 Tue, 17 Nov 2020 01:18:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCg1wgEa0Tk5wysll6dv2ne3uC2OEK8fghs1S1mFlGHMACi2btyo/nhvgyRIp+JQSPpebLwA==
X-Received: by 2002:a1c:4456:: with SMTP id r83mr2087730wma.91.1605604714186; 
 Tue, 17 Nov 2020 01:18:34 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id q16sm26777697wrn.13.2020.11.17.01.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:18:33 -0800 (PST)
Date: Tue, 17 Nov 2020 04:18:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-5.2 00/10] block/export: vhost-user-blk server tests
 and input validation
Message-ID: <20201117041736-mutt-send-email-mst@kernel.org>
References: <20201111124331.1393747-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111124331.1393747-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 12:43:21PM +0000, Stefan Hajnoczi wrote:
> The vhost-user-blk server test was already in Michael Tsirkin's recent vhost
> pull request, but was dropped because it exposed vhost-user regressions
> (b7c1bd9d7848 and the Based-on tag below). Now that the vhost-user regressions
> are fixed we can re-introduce the test case.
> 
> This series adds missing input validation that led to a Coverity report. The
> virtio-blk read, write, discard, and write zeroes commands need to check
> sector/byte ranges and other inputs. This solves the issue Peter Maydell raised
> in "[PATCH for-5.2] block/export/vhost-user-blk-server.c: Avoid potential
> integer overflow".
> 
> Merging just the input validation patches would be possible too, but I prefer
> to merge the corresponding tests so the code is exercised by the CI.


Peter reports this hanging for him so I dropped this for now.
Pls work with him to resolve, and resubmit.
If possible let's defer the addition of new tests and just fix existing
ones for 5.2.

Thanks!

> Based-on: 20201109174355.1069147-1-stefanha@redhat.com ("[PATCH for-5.2] vhost-user: fix VHOST_USER_ADD/REM_MEM_REG truncation")
> 
> Coiby Xu (1):
>   test: new qTest case to test the vhost-user-blk-server
> 
> Stefan Hajnoczi (9):
>   tests/qtest: add multi-queue test case to vhost-user-blk-test
>   libqtest: add qtest_socket_server()
>   vhost-user-blk-test: rename destroy_drive() to destroy_file()
>   vhost-user-blk-test: close fork child file descriptors
>   vhost-user-blk-test: drop unused return value
>   vhost-user-blk-test: fix races by using fd passing
>   block/export: port virtio-blk discard/write zeroes input validation
>   vhost-user-blk-test: test discard/write zeroes invalid inputs
>   block/export: port virtio-blk read/write range check
> 
>  tests/qtest/libqos/libqtest.h        |  25 +
>  tests/qtest/libqos/vhost-user-blk.h  |  48 ++
>  block/export/vhost-user-blk-server.c | 129 +++-
>  tests/qtest/libqos/vhost-user-blk.c  | 129 ++++
>  tests/qtest/libqtest.c               |  76 ++-
>  tests/qtest/vhost-user-blk-test.c    | 965 +++++++++++++++++++++++++++
>  tests/qtest/libqos/meson.build       |   1 +
>  tests/qtest/meson.build              |   2 +
>  8 files changed, 1333 insertions(+), 42 deletions(-)
>  create mode 100644 tests/qtest/libqos/vhost-user-blk.h
>  create mode 100644 tests/qtest/libqos/vhost-user-blk.c
>  create mode 100644 tests/qtest/vhost-user-blk-test.c
> 
> -- 
> 2.28.0
> 


