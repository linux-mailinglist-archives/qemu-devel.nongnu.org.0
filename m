Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1461DD22
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 19:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orNie-0000aU-UZ; Sat, 05 Nov 2022 14:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orNid-0000a7-AI
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 14:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orNia-0007rF-Pt
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 14:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667672192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=93s5qdJxonnoCx3L1YPubbwevY7mwbjeR/dCAuqq+Y4=;
 b=GeLL0GjHXmO16k+99a+6mOalefhjlktihPl/4t/gBm6uSXpRiEkTgLAgUvebpfAemV+kTd
 xNAnTA7Kb5gXyJa4Hil1U98ABK9QFgwlEtWd0sbxfDs219gKw2trx/mLpsS2rpkAZgxJLr
 P7JYTm5TN5AzsbXCLn5+gNH90tW/zow=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-xTR7tsUVP0WOrVyyyWkWEg-1; Sat, 05 Nov 2022 14:16:31 -0400
X-MC-Unique: xTR7tsUVP0WOrVyyyWkWEg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so1806885wms.9
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 11:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93s5qdJxonnoCx3L1YPubbwevY7mwbjeR/dCAuqq+Y4=;
 b=GKhKwsdFiHjRUPUxxJQtJ1ocfpKOWhrOv9w7DdsKi0a1XKflyPBzgMRLGhEbypQufc
 igrrIzEzwboCJvkNcCraOSHzYY70d3qG/3YFIZQhG66sEQAHSYtuFuk9j1XppU8KrpTG
 KVPOZvtvuzC7UViB6sKgT11XZ8+6asqlOHaHOZ6oWXZ+6fXrNgbEEEeA8IsfBidxY6g8
 8W6Xv41jgISa37/HKqrJdd7sNG/L4KzQ3MNO0terHq6bBdepGKxkFNn73Q8jCyQ8+c/n
 DPD6LLD73ZoEL62lufaToqhCcnWishKpc9kElquQe9KEHqrjkYNq0PHXJxap/Ic4ZbNl
 baeQ==
X-Gm-Message-State: ACrzQf0GlGqdB/dwgG/FoB33JmMQNTRvgFpaTPMsc0SzT/cvroCfb6kW
 RANw5UW71krsRQdH6VGnYt4lDxWTEEtiyRV5TqTcoTr1S8zKCGm+BQgRKDS1UMwgwK3ZVCNaps+
 0Am7ZZ7TqtJJ2XtnHPAH1FDiHRLgUiPoGfc6LcepLFRqD98h4FdzulCH3v3Nj
X-Received: by 2002:a05:600c:5009:b0:3cf:a02d:8697 with SMTP id
 n9-20020a05600c500900b003cfa02d8697mr2619338wmr.147.1667672189372; 
 Sat, 05 Nov 2022 11:16:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5iB8WxpC3I3vhz+9TY2m7qhhtunM8U9GYkvLH4UKjWGKSSS3MSZGJyTKXcaeN4Kbp7evFsiw==
X-Received: by 2002:a05:600c:5009:b0:3cf:a02d:8697 with SMTP id
 n9-20020a05600c500900b003cfa02d8697mr2619314wmr.147.1667672189082; 
 Sat, 05 Nov 2022 11:16:29 -0700 (PDT)
Received: from redhat.com ([169.150.226.216]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003b4868eb71bsm7478066wmp.25.2022.11.05.11.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 11:16:28 -0700 (PDT)
Date: Sat, 5 Nov 2022 14:16:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
Subject: [PATCH RFC 0/3] virtio fix up started checks
Message-ID: <20221105172453.445049-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is an attempt to fix up device started checks.
Unfortunately this causes failures in CI
and I could not figure it out.

The simplest way to test is to set QEMU_CI to 2
on gitlab, then push there.

Alternatively, push to gitlab, then
create pipeline while setting QEMU_CI to 1,
then run amd64-fedora-container and then clang-system -
that slows things down enough to make the failures
trigger.

See: https://gitlab.com/mstredhat/qemu/-/jobs/3279537476


Alex, Viresh, need your help here. Thanks!

Alex, pls note that same failures are triggered by your RFC - if we know the
root cause we can discuss solutions. So if you prefer pls go ahead and
debug that. Thanks!

Michael S. Tsirkin (3):
  virtio: distinguish between started and running
  gpio: use virtio_device_running
  virtio: revert changes to virtio_device_started

 include/hw/virtio/virtio.h   | 7 ++++++-
 hw/virtio/vhost-user-fs.c    | 2 +-
 hw/virtio/vhost-user-gpio.c  | 4 ++--
 hw/virtio/vhost-user-i2c.c   | 4 ++--
 hw/virtio/vhost-user-rng.c   | 4 ++--
 hw/virtio/vhost-user-vsock.c | 2 +-
 hw/virtio/vhost-vsock.c      | 2 +-
 7 files changed, 15 insertions(+), 10 deletions(-)

-- 
MST


