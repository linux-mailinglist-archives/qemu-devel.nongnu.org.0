Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F656A956C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2pQ-0001pO-HX; Fri, 03 Mar 2023 05:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pN-0001oo-Fo
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:53 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY2pL-0007vU-Eu
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:39:53 -0500
Received: by mail-pg1-x52d.google.com with SMTP id q23so1177489pgt.7
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677839984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4BzaOk1gT7H5DRPqJzDEOWCjvlJB6obm7n6Zvz5fx58=;
 b=JNzBql0E9YIqk43lLg6TRDMqjc5nQ1P1+crVoBIRqZ8UjQCEWKMUKtod5VYJoXUTf2
 DkRdK/FkmIF1gp9XOBz535Q3Qq7q3I4H8sg6wnqrEt0XqKxrjZHjUDicsMpm6dm8AqD4
 gOi8iATfTIgqgAdKEIavxwFsv6RubFQsi7ut3yPmYZB/4hAa0oatWLwLZ7oWvwW/yjaL
 N4Z/TADr1fqlteVWQQspePB4UyZjxuHVZ6xFFn5w2qnX9DoFMltHpqyPqkhjd+pRrjux
 r5Bhpn6pu+Ka0ZwhTzp4F7hQuJtDuRACIm0oG/3MDDTl+lKmOqwaIHJ2PnU0JhTM9hpW
 YrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4BzaOk1gT7H5DRPqJzDEOWCjvlJB6obm7n6Zvz5fx58=;
 b=gfT6reMgZqRv1TdFjFWo1hdKOsnKYPm+xTB2gfn7C0p5U6bn3tKX9PAED226yGnfM/
 57/c2hSNcf3JT+iIKWrBocrgoHSO6FaZnCZD98JsI6SF3Qca1dvvdN662QtwWOrA6W8M
 wNyXma/gjFI/B0k6JolKP70NANieGSnrwo49jmUvDM6gNuHTHBg16QnxZlotgCcA1gKC
 o4WOP7XueQrkk2s3OWnPN6V9Gc/N0x6a4szDcfD9BDlsH/8g/ANEG2nECTkZIwHPWtNT
 XQWv6uXF4lwqMbKykvE1kmsSpXjDOI/Wtac9OU8vG/IzAo/K+rOeArZOQXw//99I8E51
 PD8A==
X-Gm-Message-State: AO0yUKWfSfek5NCEdfxydrfjH9QHCL7sZXObPGBXNCqrjtv4nYm/hTlM
 8byFgmBZ4IlXN2Qw/9sVtHN+de4aEat6/+Pz
X-Google-Smtp-Source: AK7set8ak8Ujrbmt0UgZ+aRcCyysuaY0YlWsoO5uDDPHDRBIjKQMHoUy+IZArvs3OpKvztsMrEfzsg==
X-Received: by 2002:aa7:9901:0:b0:5a8:482f:c32e with SMTP id
 z1-20020aa79901000000b005a8482fc32emr1874934pff.27.1677839984156; 
 Fri, 03 Mar 2023 02:39:44 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 6-20020aa79106000000b0059085684b54sm1316420pfh.140.2023.03.03.02.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:39:43 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [PATCH v6 0/5] migration: reduce time of loading non-iterable vmstate
Date: Fri,  3 Mar 2023 18:39:30 +0800
Message-Id: <20230303103935.370903-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x52d.google.com
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




