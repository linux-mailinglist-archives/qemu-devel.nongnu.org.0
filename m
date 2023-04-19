Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041EC6E7977
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 14:15:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp6hL-00029K-GN; Wed, 19 Apr 2023 08:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pp6KN-00053W-Ek
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:50:24 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pp6KB-0005lZ-PI
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:50:23 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-52160b73bdfso86421a12.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 04:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681905008; x=1684497008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9rntbYwHlaFJwQgy9hvlXDRnN4BKyiVp2KQfFRkJdFg=;
 b=K+QZrAia8KF/97hkM5oVMAG7v5zTNjtKuVtCXFqTbDLAoBe4iumfDC1txKcmvfCv+y
 UlnHadSIYSTzxUeMQ+5FhDK/g+fJ4RxsxJkoYx/X0/aJc5AX75bwyMl29TkmdXTPE9B7
 OPW4NOhrpiUVsnU6pH0bkw8Lpw7jISra2jhhE8asve6hGVtzWPu+DJvgjFtxZ6ieCgAp
 hlMSEFL+XByHyPuSFYDdKT9lz+6VAinCu7d/+uKR55EEBB9JJSc9CZgHdh7kFQvOZiuq
 ZgTFLV8KcAi0E8tKvBOu7aksZKSJhbXvMsMDtjKlNOm4tXuJEpeWvALI8mpSbrVDPYzS
 oFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681905008; x=1684497008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9rntbYwHlaFJwQgy9hvlXDRnN4BKyiVp2KQfFRkJdFg=;
 b=hzMVf6ulHKCJm6wc+wuG+/p6eYzjqb+xoZUKkJ7uI+xfs6cGWQJ//0+rb3BkXVreVK
 ZUlHouDXn8P8wvCYWy2vNQ04bOp0sxW9589ZoK3QTtYld4yrq4Xpmks1iPaIQZZLMh8m
 RVROhSAZDo/x3RjQY+etwAWoGNmXJxfK5vN9PQyYOzl8SCuDZxm+89U9gbjBkp6ucxwS
 C1ZzWP2l9WtKHMTQO8BPEtK4NUY/PJZwi2+zV73V2UXPUyWbQnJp5D/F5WFpYKb2RoQ6
 gD0+5oQafBJaCPCVwNyFCmDw9IGkSlvKowTGDQCA3nJkY66UAJyiMNMiAz9JTAvoWbCC
 5YDQ==
X-Gm-Message-State: AAQBX9fMpu4XEnTQnZ0LNnbxKuHjW52F8/LHrimBg94NJVmkSSjuNjJ7
 W6C9w12p0M4avYzRYZlcx1s=
X-Google-Smtp-Source: AKy350ZLI1rU+fYkkE/GrMSzePUvGJ5xFcKt/OYoQi7vikBt1GUsvtwN/tmUfodgDobMA8LjHCCuwQ==
X-Received: by 2002:a17:90a:6fe1:b0:23d:29c7:916f with SMTP id
 e88-20020a17090a6fe100b0023d29c7916fmr2565400pjk.32.1681905007494; 
 Wed, 19 Apr 2023 04:50:07 -0700 (PDT)
Received: from localhost ([159.226.94.115]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170902d90400b001a3d041ca71sm11272358plz.275.2023.04.19.04.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 04:50:06 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: eperezma@redhat.com,
	jasowang@redhat.com
Cc: yin31149@gmail.com,
	18801353760@163.com,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Send all the SVQ control commands in parallel
Date: Wed, 19 Apr 2023 19:49:51 +0800
Message-Id: <cover.1681732982.git.yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=yin31149@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Apr 2023 08:14:05 -0400
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

This patchset allows QEMU to poll and check the device used buffer
after sending all SVQ control commands, instead of polling and checking
immediately after sending each SVQ control command, so that QEMU can
send all the SVQ control commands in parallel, which have better
performance improvement.

I use vdpa_sim_net to simulate vdpa device, refactor
vhost_vdpa_net_load() to call vhost_vdpa_net_load_mac() 30 times,
refactor `net_vhost_vdpa_cvq_info.load` to call vhost_vdpa_net_load()
1000 times, to build a test environment for sending
multiple SVQ control commands. Time in monotonic to
finish `net_vhost_vdpa_cvq_info.load`:

    QEMU                            monotonic time
--------------------------------------------------
not patched                              89202
--------------------------------------------------
patched                                  80455

This patchset resolves the GitLab issue at
https://gitlab.com/qemu-project/qemu/-/issues/1578.

Hawkins Jiawei (2):
  vdpa: rename vhost_vdpa_net_cvq_add()
  vdpa: send CVQ state load commands in parallel

 net/vhost-vdpa.c | 150 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 112 insertions(+), 38 deletions(-)

-- 
2.25.1


