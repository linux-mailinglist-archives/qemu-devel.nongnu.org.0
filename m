Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CE6A95B0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:58:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY36D-0006lQ-Aj; Fri, 03 Mar 2023 05:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY366-0006dK-P8
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:11 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY364-00041h-Jz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:10 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so5722049pjg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677841025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hfpUwdHAap0Ay6Xu2Yq4TUBEnPo+H18PQaksECxF8R4=;
 b=V/nxhq1k5V351PcPPpIopsp97LURf0nCnW+qAGDMilI+TC3AV4si68DTtbXYZzwLP9
 mWIO4eD2NyxqPyEUgwLW3K5rOk1sljzfp6YB+LCNyzNJ/XmjpGYBHhX2hr4iSOFf8xVB
 8lXsN0gRyW/nDybqOUG+ZPjEW7DpT7jIjIXQk/kUpT6pY976D0PCMYACYzC/n423iF00
 OGi95hLPp0Z7ZRknV2vbEdasOK9BkizCrmqJ+j7DDOlUZb+zcMBk6mlA5JeSY6tpPZUQ
 doe2Geyx+6V+iQISUg4aE2QyRDXm/wc6NqM6uCS1y3DaV/JKtvy3rfN+WGkqt5CDGg/P
 yYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677841025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hfpUwdHAap0Ay6Xu2Yq4TUBEnPo+H18PQaksECxF8R4=;
 b=C8oeSFE4M2am2/LDjhd7VY/dvT0K48+jRDHlgxFW2yHmenDMKXEqo2W/+iumQiGpGX
 zGX0YjucI1R3xzJR20EOSJNYJRwWvBZNuLmJbqhl9DpTQSdDbmjmeU+oRXjk6Pq9uHx/
 cHmqdteNyhA6oKuJjOiW5FWPC2txLjMNdBIKXb8dH6T+LdLXbQvNUmzgjSCD2+fG/87w
 Z4NT0XZcuapjVuVI5vVi1mibjVAKPRcd3bcfSyAKfYp/wDJRPsdicIOvYhol+NRFmCqx
 EAHtr0RVA6in+32xAmvD/DTit2NVsHfmLxwVcS0aS1A5cJKPSjNRR5l0DgnbIy0m43sa
 3A8Q==
X-Gm-Message-State: AO0yUKVcm8kFhri2LzCuDwgUruDEhc01jaPtIEwQtP2lzjLRFYO/TUve
 xu3YbKpR9QqierdqCQh3cDzZ1z0KIPExUGyS
X-Google-Smtp-Source: AK7set83cjxlhodVfD/ATSzHpJXlZfVZc3D5be16gx3CaBrnDa+/9DDeHrlFdjjlcBNjf8uVGEzRLQ==
X-Received: by 2002:a17:90b:3b49:b0:237:d59d:5f89 with SMTP id
 ot9-20020a17090b3b4900b00237d59d5f89mr1395422pjb.4.1677841024795; 
 Fri, 03 Mar 2023 02:57:04 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a63a54f000000b004fadb547d0csm1248000pgu.61.2023.03.03.02.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:57:03 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [PATCH RESEND v6 0/5] migration: reduce time of loading non-iterable
 vmstate
Date: Fri,  3 Mar 2023 18:56:50 +0800
Message-Id: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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



Sorry to forget to update the test results in the last patch of v6.

In this version:

- add peter's patch.
- split mr_do_commit() from mr_commit().
- adjust the sanity check in address_space_to_flatview().
- rebase to latest upstream.
- replace 8260 with 8362 as testing host.
- update the latest test results.

Here I list some cases which will trigger do_commit() in address_space_to_flatview():

1.virtio_load->virtio_init_region_cache
2.virtio_load->virtio_set_features_nocheck
3.vapic_post_load
4.tcg_commit
5.ahci_state_post_load

During my test, virtio_init_region_cache() will frequently trigger
do_commit() in address_space_to_flatview(), which will reduce the
optimization  effect of v6 compared with v1.

------------------------------------------------------------------------

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of	
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

This time I replace 8260 with 8362 as testing host, use latest spdk as
vhost-user-blk backend. The downtime results are different from the previous,
but it doesn't affect the improvement comparison of loading vmstate.

Here are the test1 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8362 CPU
  - Mellanox Technologies MT28841
- VM
  - 32 CPUs 128GB RAM VM
  - 8 16-queue vhost-net device
  - 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		 112 ms			  	  285 ms
after		 44 ms			  	  208 ms


In test2, we keep the number of the device the same as test1, reduce the 
number of queues per device:

Here are the test2 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8362 CPU
  - Mellanox Technologies MT28841
- VM
  - 32 CPUs 128GB RAM VM
  - 8 1-queue vhost-net device
  - 16 1-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		 65 ms			 	  151 ms

after		 30 ms			  	  110 ms


In test3, we keep the number of queues per device the same as test1, reduce 
the number of devices:

Here are the test3 results:
test info:
- Host
  - Intel(R) Xeon(R) Platinum 8362 CPU
  - Mellanox Technologies MT28841
- VM
  - 32 CPUs 128GB RAM VM
  - 1 16-queue vhost-net device
  - 1 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		 24 ms			  	  51 ms
after		 12 ms			 	  38 ms


As we can see from the test results above, both the number of queues and 
the number of devices have a great impact on the time of loading non-iterable 
vmstate. The growth of the number of devices and queues will lead to more 
mr commits, and the time consumption caused by the flatview reconstruction 
will also increase.

Please review, Chuang

[v5]

- rename rcu_read_locked() to rcu_read_is_locked().
- adjust the sanity check in address_space_to_flatview().
- improve some comments.

[v4]

- attach more information in the cover letter.
- remove changes on virtio_load.
- add rcu_read_locked() to detect holding of rcu lock.

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




