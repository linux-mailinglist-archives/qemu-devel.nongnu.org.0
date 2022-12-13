Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E52E64B669
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 14:37:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55RP-0000yI-5N; Tue, 13 Dec 2022 08:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p55RL-0000xl-Lr
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:35:23 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p55RI-0002wf-PH
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:35:23 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so3543454pjr.3
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kJo5Z9tJlibXdiGKhm8XGeIvT+nXxOqd08QcIB2owpE=;
 b=2/Onu/+B3sXxaAozCAcGLCjd2GdoztsBtw9SFFR+nm9K/+FRymD20bA8MDaDFWLZGI
 Sr9Z9MzRDNCxdA9Y584nUZ9iLQKsXVf+YSNH0hyzPeYBhmjvpFdiEkxjUCFWPYVTtFCk
 nQd0v1jd95VVs4zmXY9s09GxthC8pop7E56BuBD/3wwAiN9NPkoFTwi2Hqo5/IU5bOED
 q3wFKTEZB263wbmKF2eoql+B0s09Jf57pGZlEerPqoD1z5BKvA90ZeGGHG+PYkNyOHzF
 pyQUZD0KnRp2/hmVEoPnGb7rrTLBZVXDGRwT/wTJzzmIchk7S2l27HG/IlRpaklYdhG/
 qOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kJo5Z9tJlibXdiGKhm8XGeIvT+nXxOqd08QcIB2owpE=;
 b=GFA8b48g5CK68YAwb9Sq9h630u6g6KQjKULHz1CqYUZqYYIfvKF98osOMZ6VzPMWeb
 mbcuto9ycXZPcAtLGJ6ouyMj9Z5dYywZ1UO02K5JgLWb7dGZJEkjQn4oQKRnJcyjL3oQ
 Wf+bXYP5mvwT/HIk18P/WMGVVSf3gPXx8OolqZPvrwykRWsonGmD/XA2KERsWv7T5o37
 Gukwx3PShEu3wwyzF/STJQfLNffXEQgyErzO/MEsJrjGeCO7iTpH4aCzGhS75Qf+cQBY
 8E30B76/dV9G+DQ5IdFtBrd9xDbr4/3ZDVa11Nmfdix4a6yaC9RzHUoxWqq4M+mCFglz
 6OqQ==
X-Gm-Message-State: ANoB5pkJiv7A2962v/NY31iSvlA29DphJyOmzpYdPaKsZLF3arjHvgIt
 4rV99ZJoI0Pq7UaKxQXBbsBG2twhu8VgPc2q
X-Google-Smtp-Source: AA0mqf4N4O8LhSPtYEN6HMS94mw3VO7XQ5Kza2QszsfT1PXdcVhVcV4jv+o80zseTdMYiqm2xx57uQ==
X-Received: by 2002:a17:902:b209:b0:188:f0d6:ed30 with SMTP id
 t9-20020a170902b20900b00188f0d6ed30mr22762541plr.41.1670938518277; 
 Tue, 13 Dec 2022 05:35:18 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a170903229200b00182a9c27acfsm8440033plh.227.2022.12.13.05.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 05:35:17 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, mst@redhat.com,
 zhouyibo@bytedance.com
Subject: [RFC v3 0/3] migration: reduce time of loading non-iterable vmstate
Date: Tue, 13 Dec 2022 21:35:07 +0800
Message-Id: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1034.google.com
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

Hi!

In this version:

- move virtio_load_check_delay() from virtio_memory_listener_commit() to 
  virtio_vmstate_change().
- add delay_check flag to VirtIODevice to make sure virtio_load_check_delay() 
  will be called when delay_check is true.

Please review, Chuang.

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


