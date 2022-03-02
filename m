Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4F4CA04D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 10:07:34 +0100 (CET)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPKxJ-0006s2-By
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 04:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPKnM-0000Vk-BJ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:57:18 -0500
Received: from [2607:f8b0:4864:20::42d] (port=40690
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nPKnI-0005qk-28
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 03:57:13 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z15so1324213pfe.7
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 00:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6K3a6jHgKjYDEvW3CaDCBmJjf5E79WV9SbMPZCUa1Wk=;
 b=pELfGJUFtNDZI3uupmfb8YG/wq8CNda2C5LDSQgTC2H2Tnyq9tsXlrjfcHGSM/F6s+
 6Lk+lN/+vORUqc6ShT9JC4aWYSBAFzK7TOc79j7Dy440DGw/zoGbAtpumaVA9rHcIPi7
 pzJSk1oSWtV3ixqxb001RJNaXdJcIVHUNPzJeBtAhDqBf5ldoHq7arty7O3hv7Bmy/lw
 lIwYcp2B/LozU0un73rgZ+bVBxlEYHuZwfLtLQSc4QpNdUS5uQ2F3Skjsr10h+NlQdbR
 SmN9/Z1hwA6PvxeZ9AGe/kdoD0EkjSi46NVJPYiJYktrNIdLLHffUyZRQdJJNkMZBfbg
 NfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6K3a6jHgKjYDEvW3CaDCBmJjf5E79WV9SbMPZCUa1Wk=;
 b=wt7anMd9unx+0vLLYgy2Go4iBAlLrr4XRo5jOsh8H2RtOR7bBVKiIz4anxPBqVifAR
 8JxWON++v2UhFLKM/0FwnFYzeMf2cWNnH1jm8Qln76L/ISiNQAFEOoxLd+RZv8tn/u6a
 1EGUOChf6b+AX69LaRnCZ+nzfffewM6zMBL+br5WbZ24Eg/osuCkmvCgsmfSlPUHdQoU
 jMKTXwd5H9YZKITSewIyYNEORtifBxEw5DGjLddR0v9FpusS0e2jSpES01WIOynfUkwX
 heqobtZ2qsUokkMdJv+sYTuolUyJkOYwfmZzsDGuBPvSkJKg+vrBGYc81hz/QLi+Kcvg
 QvpQ==
X-Gm-Message-State: AOAM5301D0jGEHKV5RTX/uYaFIJaTMPUn+FXSiJHd2xwxrhnN38aP2Hx
 5BZIwvwwlJ5kK6Xj65J42fugIA==
X-Google-Smtp-Source: ABdhPJyk1n6EcKq1q1hsb+5DgALa1fImhizSCiAmXT5Wz5Pu4zPW2s7hDk9DlrzfyoE2VmINjyXlqA==
X-Received: by 2002:a63:4b1e:0:b0:365:8bc:6665 with SMTP id
 y30-20020a634b1e000000b0036508bc6665mr25502295pga.445.1646211427334; 
 Wed, 02 Mar 2022 00:57:07 -0800 (PST)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a056a00149500b004e15a113300sm21075094pfu.198.2022.03.02.00.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 00:57:06 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com
Subject: [PATCH 0/2] QAPI: Support NVMe disk type
Date: Wed,  2 Mar 2022 16:54:08 +0800
Message-Id: <20220302085410.1302157-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Introduce NVMe disk type
- Support NVMe disk type for posix

Zhenwei Pi (2):
  qapi: Introduce NVMe disk bus type
  qga/commands-posix: Support NVMe disk type

 qga/commands-posix.c | 5 ++++-
 qga/qapi-schema.json | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.20.1


