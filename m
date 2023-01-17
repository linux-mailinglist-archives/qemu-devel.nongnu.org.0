Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F7066DCF3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:56:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkYs-0000hI-I7; Tue, 17 Jan 2023 06:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pHkYp-0000gu-OO
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:55:28 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pHkYm-00088q-VW
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:55:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id y5so23252550pfe.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BWURWf0X1u4etX1D7YDDqi0+9sMLbXlWkGCykCBcMp0=;
 b=CF/0HSLNBnuFLxsT2WxZPNOuQ7XJgvd0eY572dyMSojR8kfDdhHmnqrKPZs6JpHOR+
 Z2dSABtdqg01/WJ1HiFOjzxqPlmipJN4zbW8uRK/mQqtyvY3p5gFEIXV3hNVE1pDI4aU
 mHmL0YXDa/pYMYw/v71QfMeGrCI9ENQccbBqEeUubcqFb472R4CDF8InyLwCWkTKRK9+
 ckXgEdTPFxt6rhXBo+FCgG9rI4ejEbR4pCtHG3k7RKAnk+GRyGScv3t8hoGdjDdSaKQE
 KEaj9rU0l0gyguTi+SqoqGqN5hDBAVJTDv/DxNnmbwTiZ9NWfjo0LH5n4kV2Aw5ImhMM
 90TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BWURWf0X1u4etX1D7YDDqi0+9sMLbXlWkGCykCBcMp0=;
 b=rfsvKJnHkoseLmLAxsaZdRY6rxgWQLa4XR3SMWMB3T5pLET3BbZDyrlnlIQ9Fs2LOF
 XLmecvPgOlo4HAa13yaZJ2CGjIPIzFQ9PrBXpbQFeSg67X9/79LfD/70rBWUSVIC0LcX
 OKKsXYBtseUafPM4zNmh7qmpOI6uC/9IEozcTIhOnRyC7Nzw2WpT/QNh+MJ8FVxKfj4M
 GOhAETlw3q7EKrNrMOdI8AfRvUVB+jUfnFQggbT4/2LTOtJ7VbKTwDA+WlPUGywjlAiS
 gvKeiV7o1Yd76PeK4GDmXi7GPzObzaRecB5zBWcwlrTJ05uj/3OcIxOs+k+2ntpwYcBx
 JYdA==
X-Gm-Message-State: AFqh2koCB4W2QhF/90FSf/oCdLnAxdcb303HUeIKXBN9oELplW7GR5eA
 F1h02lRbu8lsF4nMMMWx3WdPtVbsxOcqDxC9
X-Google-Smtp-Source: AMrXdXsXH3u1XkjmgCMXhxK7r69fWJdIvdx+4egXc2OorEn0dW9jgf2MwvNtBwVW2bzWMhCG0N8ghw==
X-Received: by 2002:a05:6a00:1d89:b0:58b:bc3a:6234 with SMTP id
 z9-20020a056a001d8900b0058bbc3a6234mr2273036pfw.11.1673956518134; 
 Tue, 17 Jan 2023 03:55:18 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 c196-20020a621ccd000000b0058a666aea32sm14003708pfc.147.2023.01.17.03.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:55:17 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [RFC v5 0/3] migration: reduce time of loading non-iterable vmstate
Date: Tue, 17 Jan 2023 19:55:08 +0800
Message-Id: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

- rename rcu_read_locked() to rcu_read_is_locked().
- adjust the sanity check in address_space_to_flatview().
- improve some comments.

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


