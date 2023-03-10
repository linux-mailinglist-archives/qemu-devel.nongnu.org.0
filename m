Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7966B3431
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 03:25:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paSQz-0005bd-E4; Thu, 09 Mar 2023 21:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSQx-0005bT-5s
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:39 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSQv-0001v3-5k
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:38 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso3830136pjs.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 18:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678415072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1/ExqKro2p0winabOXE9Xm0U8lx8Tp3UeQkH8EGvmmg=;
 b=eRihkAEDEPon1KUTdG5NuFsqixaRhPwz7vGMdd8EC+wZ59zhF+6nwD7f9rHHendNa9
 VlM1O2iMfek5HaVoRMbfKtdff8h2UvJkfnKmdeMvapHaasz7AdB+puDPvCX56unQqR7O
 Hw+clV4S/pT1Gucr8Vbi/y1GPtXUsxmRFiA7Ea1D0OGswx03CRkNA4zO6lXzWccanIY3
 2nrzWEdHayrlY/22IJQH+b7ZuxaN2WpuiLqGzCFgBzsmN5juXe7FFu4vtRFspeyADO8z
 iuRn0ikordSHneaYCSFvyPFRnu3inMpIgPk87+gmCeBiB/9wYVLm3qWSxOzcbfwhzCfI
 Av2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678415072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1/ExqKro2p0winabOXE9Xm0U8lx8Tp3UeQkH8EGvmmg=;
 b=zbx0FamLiA2H0HS5Kl/MEG43MWZ0gHnL46vyUILWvL6VpsP7EG3Opc7d6hJhP+Oae0
 xufidpNhkiIK5E/LHd+tWPLJS4tD8gudeZEfhzEXOT4Ek3bonNNsVGR/OtuZqwBRGEM+
 29GJlBT8ifjzcPHqJYUMYyb2IkQw/Qwkx681TpFQ/t5vz57/Sc7hen1tmxjDIkiFpsUS
 Mi0hUl86xLzFr8V1ckNJveZq77dJ9J6Te/YeXe6AiG4IpVqOhS7yCEWLf9R6eqTXzr9A
 heIlzoT+wx9A119dj3M0gzkM3G9vEbMqNkYuSXvvKv63ZpTXck6F1XukZqsuR+b/ATuY
 ZgYg==
X-Gm-Message-State: AO0yUKXONB1eY4rjS/PCIbEIYrolBxoxuiFelwcrGdxJ9F3uou01u5wa
 cZ7HmJiLYONzDETnE+jJPmYa5a83g/OGK3k0n3M=
X-Google-Smtp-Source: AK7set+PyuhD6fIoI4XSd0Iehogl0MGxeokBA2GhHkH5NvFbwh0wrxKbIZ/LG9hla+SyX7WGxU8zKw==
X-Received: by 2002:a05:6a20:160a:b0:cc:88af:12ab with SMTP id
 l10-20020a056a20160a00b000cc88af12abmr28585342pzj.28.1678415072420; 
 Thu, 09 Mar 2023 18:24:32 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa78187000000b00571f66721aesm246081pfi.42.2023.03.09.18.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 18:24:31 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [PATCH v7 0/6] migration: reduce time of loading non-iterable vmstate
Date: Fri, 10 Mar 2023 10:24:19 +0800
Message-Id: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

- introduce address_space_to_flatview_rcu()
- squash peter's fix into patch 1
- rebase to latest upstream
- update test results

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
  - Intel(R) Xeon(R) Platinum 8362 CPU
  - Mellanox Technologies MT28841
- VM
  - 32 CPUs 128GB RAM VM
  - 8 16-queue vhost-net device
  - 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate     downtime
before		 112 ms			  	  285 ms
after		 20 ms			  	  194 ms


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

after		 19 ms			  	  100 ms


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
after		 9 ms			 	  36 ms


As we can see from the test results above, both the number of queues and 
the number of devices have a great impact on the time of loading non-iterable 
vmstate. The growth of the number of devices and queues will lead to more 
mr commits, and the time consumption caused by the flatview reconstruction 
will also increase.

Please review, Chuang

[v6]

- add peter's patch.
- split mr_do_commit() from mr_commit().
- adjust the sanity check in address_space_to_flatview().
- rebase to latest upstream.
- replace 8260 with 8362 as testing host.
- update the latest test results.

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




