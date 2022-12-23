Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4B65515C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 15:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ixf-0001gd-Pi; Fri, 23 Dec 2022 09:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8ixW-0001fS-BQ
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:23:39 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8ixU-0000l4-3i
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:23:38 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u7so5076555plq.11
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 06:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=66qW6ZOowuT+jf9sAw+C3GtY6tJtBcRKwtTlRo+A9iE=;
 b=5vU8EQbV7A5asgpimwpmyCY1jnqycU9SgbqD73cczy8Ld0lv+IWAV2mYwE21nZO5NJ
 ueJReuQPQYW9IUsrNsGMnTMZxxLxGwBEyqc5InZuE5X5fOecbiHGsHjuQsvr/bq9eNzh
 zXWK3eRoGaNlbczDygqRb7pgIpJOViDeks0Jq/X8Aij8yhKdiuK1OORiwA/der41H6fJ
 JajWQzrigsI3Fgn4eR9BefMcDWkWVelmrnxcsmr8Q0LCO4kCXV8r3HdaIb+JZg16y750
 qf9BLlXaa8dSZNvGS9VwDYjf8hF0l2wM1Vg71VFsVnVQMHKJ4BKiauvtKoNel59XNdC5
 56qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66qW6ZOowuT+jf9sAw+C3GtY6tJtBcRKwtTlRo+A9iE=;
 b=z6NyJ/RUvZxQqIf8LwJLd1LyJ4srEljpr7934JFO5aFc/iaDx0jQDA1tjVfwuDLbUA
 MII7stEK+nRKNCVF2PwY/NyuXsnjwNtRM3TUjiCZAQy2QHzfVpUvCtn1V+mmJWT2X+/x
 9VY+doUmpRtEqsDvde7g2hzzZuoyNr09+co+0k6J4+3y9Kgz4eWYf7yB36T0DBuIPXAY
 Np87Uh9eM1Y9RdHDj3eZ1bfAkWu1tXp+eXNY2aebB/lnamuoYy755Qcu770I7YYK2hTl
 FQwe0EkDsgLwu1U+NMbs7Mc8ceR+SQ2zMP9iczoorAPDF6j1oKulluDnOXRvSw/anUiq
 676g==
X-Gm-Message-State: AFqh2kpUiOGNDsN0XVnrc2aXXiOGPXTwGGWCaDrDLy8ENKKztdEbNdEz
 vubT3M3Oy0XIpZ/YyslR/BIHyoF8I7BmRnt7
X-Google-Smtp-Source: AMrXdXswfzADfzknAHs+jTkdffM6BVLiiHXf5ObP+a6RIwqjsyyfA/ZN3hcVQxg/GRStCGQUD3QE+Q==
X-Received: by 2002:a17:90b:e03:b0:219:c8f8:dbee with SMTP id
 ge3-20020a17090b0e0300b00219c8f8dbeemr11205398pjb.29.1671805406792; 
 Fri, 23 Dec 2022 06:23:26 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a17090a6d9000b00223fa0148b8sm4751734pjk.41.2022.12.23.06.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 06:23:26 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [RFC v4 0/3] migration: reduce time of loading non-iterable vmstate
Date: Fri, 23 Dec 2022 22:23:04 +0800
Message-Id: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In this version:

- attach more information in the cover letter.
- remove changes on virtio_load().
- add rcu_read_locked() to detect holding of rcu lock.

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Here are the test1 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 8 16-queue vhost-net device
  - 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 150 ms			  740+ ms
after		about 30 ms			  630+ ms

(This result is different from that of v1. It may be that someone has 
changed something on my host.., but it does not affect the display of 
the optimization effect.)


In test2, we keep the number of the device the same as test1, reduce the 
number of queues per device:

Here are the test2 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 8 1-queue vhost-net device
  - 16 1-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 90 ms			 about 250 ms

after		about 25 ms			 about 160 ms



In test3, we keep the number of queues per device the same as test1, reduce 
the number of devices:

Here are the test3 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8260 CPU
  - NVIDIA Mellanox ConnectX-5
- VM
  - 32 CPUs 128GB RAM VM
  - 1 16-queue vhost-net device
  - 1 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		about 20 ms			 about 70 ms
after		about 11 ms			 about 60 ms


As we can see from the test results above, both the number of queues and 
the number of devices have a great impact on the time of loading non-iterable 
vmstate. The growth of the number of devices and queues will lead to more 
mr commits, and the time consumption caused by the flatview reconstruction 
will also increase.

Please review, Chuang.

[v3]

- move virtio_load_check_delay() from virtio_memory_listener_commit() to 
  virtio_vmstate_change().
- add delay_check flag to VirtIODevice to make sure virtio_load_check_delay() 
  will be called when delay_check is true.

[v2]

- rebase to latest upstream.
- add sanity check to address_space_to_flatview().
- postpone the init of the vring cache until migration's loading completes. 

[v1]

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Here are the test results:
test vm info:
- 32 CPUs 128GB RAM
- 8 16-queue vhost-net device
- 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate
before		about 210 ms
after		about 40 ms


