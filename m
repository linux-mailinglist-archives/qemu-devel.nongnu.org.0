Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA583D384D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:04:02 +0200 (CEST)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6s2D-0007RR-8f
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6s06-000595-Od
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:01:50 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6s04-0003xP-Ve
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:01:50 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h8so1060344ede.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 03:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjCEEUL7K5h1n15ldl/4NhLd+srjyiJ38E6Bd7BtUoM=;
 b=NXVLHlDbInDzkEug1Y2tMNDJZb4/WTVaNrEJj+2XvBJ1OlqH8RI4oATmu5yaWiv1FE
 S6wfvyFRr328KuY5exvB1re5fqmFCPCOal1A+l+GKGdWePdw7Vkbxnal8eiYm+eHiX7S
 bCnVstZQu84OSrNe77Ie6ycHlSiI6/io7SNOexV1GBfa+fCd2qzLlloM31PhtINMap+u
 J/5PmGbiRtI4fHzpcTzId4/wK3S9B3HfudiksTGy5ZvG3hNx3M1fKpWY/ws+3wSbj8y5
 sQcszQbVHZO+WOea7BFDDo26HhvZbtHJbsEq+lSS7ud7dXiHbjNJe6iXCfQqOCoFIt9a
 W+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PjCEEUL7K5h1n15ldl/4NhLd+srjyiJ38E6Bd7BtUoM=;
 b=J1h0sxqXkDBQKUjQOBtkhgtXSBaHxq0Zq0Um5OSYx4qR274xa6obXPmtuojyib63Kp
 tRHqSrZmRdhd8+hz+SO/aBKgC3+L7nZ6MDH25JX4wQ1y0thLRAompq1mjipp+44QjPUy
 R0/sMgV76vmuNn9haVtD/AXwFDBWfLTO0t84L7tpYmTYLlc9M786Buiiq5LVy55gpf1s
 laZpoafuP3cDeiAUKrgITbpIwsJnzgN6gej+zl0ES646oELPkxy+4uEvb97naifeOeaA
 AMSGJMBcqqwC8DP795pNioA2f8BAczYebpqzjQ9bhM78JpegoKimZFbmJxKBmx7m4G7u
 6U2Q==
X-Gm-Message-State: AOAM531mfTWYQ9Bh7ZtPKpJ1fIwDxmek7Cjh8lYUPn5GrFUtk7LnDDjN
 QkuQ5JYei6ysCvkyoe89iiB7ckJEPdk=
X-Google-Smtp-Source: ABdhPJwjeB1nUfbTeOfluwsj0zL8iT/hTK7u+UuXeqd4hj5gLvuJs3VpvS4QmLlwXX34/jcn70cq1g==
X-Received: by 2002:aa7:c458:: with SMTP id n24mr4767440edr.30.1627034506987; 
 Fri, 23 Jul 2021 03:01:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 gn13sm10148509ejc.1.2021.07.23.03.01.46 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 03:01:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] QAPI/QOM bugfix for QEMU 6.1
Date: Fri, 23 Jul 2021 12:01:35 +0200
Message-Id: <20210723100137.978910-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 143c2e0432859826c9e8d5b2baa307355f1a5332:

  Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2021-07-19' into staging (2021-07-19 19:06:05 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream-qapi

for you to fetch changes up to 2f164a6c5e4a9e24a6d33fcd680f322dcf53a44e:

  qom: use correct field name when getting/setting alias properties (2021-07-23 11:57:15 +0200)

----------------------------------------------------------------
Fix for QOM alias properties (e.g. -M pflash0).

----------------------------------------------------------------
Paolo Bonzini (2):
      qapi: introduce forwarding visitor
      qom: use correct field name when getting/setting alias properties

 include/qapi/forward-visitor.h    |  27 ++++
 qapi/meson.build                  |   1 +
 qapi/qapi-forward-visitor.c       | 331 ++++++++++++++++++++++++++++++++++++++
 qom/object.c                      |   9 +-
 tests/unit/meson.build            |   1 +
 tests/unit/test-forward-visitor.c | 193 ++++++++++++++++++++++
 6 files changed, 560 insertions(+), 2 deletions(-)
 create mode 100644 include/qapi/forward-visitor.h
 create mode 100644 qapi/qapi-forward-visitor.c
 create mode 100644 tests/unit/test-forward-visitor.c
-- 
2.31.1


