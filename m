Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3C6BE2FE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:21:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5JG-0006zP-Ov; Fri, 17 Mar 2023 04:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JD-0006yO-0C
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:31 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5J9-0006Qk-1R
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:30 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso7616216pjf.0
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679041157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NpCsNo7PqwmiIa6w4bvSTdNGI5uTVb1cZFtW8FdtOAc=;
 b=REKzPKwzOHtl/nxo2xB4lfph95yB1XyTuVKfyDM/EW+zukj/81X8a66Us5HFmBbI5s
 UC8JWMZ6eDkO3W1IfAgaFlkcf34goFlZSreU0uK69ueSuXccuImd7lVSEcqqBdkGedRB
 x9o7pOnx/I7InytgnW8gDXFoYKxPZqRiSdpPIicg9tLfcq/NibCKglE/6+I+sdwjNiTX
 xTsMbcqHNES1XvVbhCPvx4xFRW2/0AkFm1bXGWQiwYHH//0czwSM9g1VldybJeWdbjBa
 O/k/gTGFW6V4SSAA+mkPUYNXw83WlWGcIxHpyv2W0t4Nu1BfDqRGtn3bf9G9Vq+H+yC9
 /5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NpCsNo7PqwmiIa6w4bvSTdNGI5uTVb1cZFtW8FdtOAc=;
 b=tBflsWqF/wjS/JGZzlHiMseMphilAbamNhA8sXz3aoWqIVNqvgaM5ifQB8rH3HgUPd
 azlfleRpKasXMw/o3hTF4nRlJnOBj/TSTQwMclLDk7Naa5ji0z16NyEXgpAcRCFGxG2k
 hAYI2sVs3K6H9CTH4o9KWzwddzganuopwveMQgCz6+NxI6W+5ILOa5ru5WoQGoYSSUDi
 mfPpExLlxi/AqzYDNNUPMz8OGu1enG6fhZXNKs+qAV91Yz0dByK1PSJSvrEYsdtWU+lk
 7gV9+gzNn09IaFKdrlfCJWo+lqMDqkt2e8RquNLM4DGutKDZj31jon+94IAvRJg1aYbk
 cw1g==
X-Gm-Message-State: AO0yUKVIx2ykvPLwNj1THUaFrosSv0nplUboO4ZuEjXf/F6Y8ZZxr4vG
 8CRiJT3jVddFSK5YcTmyrhs4oZgjMlD682TDh2A=
X-Google-Smtp-Source: AK7set/arfRlOq5fwE2UEXGe0KedxMe6H4G7PrCFLtvcovEJ6Ilo7YpqbyPlpr6+WPy1+QA1+p48+Q==
X-Received: by 2002:a05:6a20:3d96:b0:d3:f695:1cd9 with SMTP id
 s22-20020a056a203d9600b000d3f6951cd9mr8266445pzi.58.1679041156173; 
 Fri, 17 Mar 2023 01:19:16 -0700 (PDT)
Received: from MacBook-Pro.local.bytedance.net ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a631e64000000b0050be8e0b94csm873304pgm.90.2023.03.17.01.19.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:19:15 -0700 (PDT)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: [PATCH v8 0/6] migration: reduce time of loading non-iterable vmstate
Date: Fri, 17 Mar 2023 16:18:58 +0800
Message-Id: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x102f.google.com
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

- delete useless line change.
- update comments and commit messages.

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

[v7]

- introduce address_space_to_flatview_rcu().
- squash peter's fix into patch 1.
- rebase to latest upstream.
- update test results.

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




