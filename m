Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6C3909F7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:52:43 +0200 (CEST)
Received: from localhost ([::1]:37170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lld6Z-0005gK-04
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lld0V-0006Vh-Fk
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:29 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lld0R-00073Z-5H
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:27 -0400
Received: by mail-qk1-x72f.google.com with SMTP id i5so24420581qkf.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JdWOsBlpnMFFPWRiDaBuBOOIWhJnQhQ4upYPz6pjLTY=;
 b=ctl8C0Wu1IWWUuGzuN17wJ9PnZ8lzxRq9YzzS9FmT05OQndNuM/m2N/75qvMMTdlF5
 IUfcuTnm3pnspVoiKosEe+7wguI/JjfJoYUrV7VOzG3ib8Vf2rsmtcT1LZupFtPIIyFs
 w4J8JM4v7RxHySiK1bBtgEdEnJ3fx3yrpMLtbj9o4rWOFN6IcgeCIxaEzn2M+FKZ1r4C
 QHlwNpJs9aysm466uWv/4rYtleF0yef0vBdHU8p5zdR7C7jXnAcDGeo5Ygpd+5ApOPiT
 yHGtX6c8Dvwx/IkKe/uh+KLUDyrjBse1l9EGF35eXipKkKYhEDRQqo5wZPWw7fw4v4Fq
 4SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JdWOsBlpnMFFPWRiDaBuBOOIWhJnQhQ4upYPz6pjLTY=;
 b=gTGFmwZ94ZKGtlqtI8768oZsHpAuE//+fX4A2LEagdzgLMSewBFT0U03YcPocA8ymG
 Qka4cFaVisHDI9Xov0X1lzzkoWQmfdnEKN2K25axnHhshlGpt3raN3RzeaLR25wh30X+
 JPIhq9iDQk9reynl5KtVXC5uN8PFJ6KdlxNf2Ly/Zm7Qfw3OFW44xfKrNXh3wmLLRPQ0
 nI8BYVI3AAlCmRIxhsRsxNqO24uxSUp37f9ZgyMS3OyZr0rneaW5KVlHrPGUhsA48Dmx
 7rjycauyFr/bBs7c+aeudKImsbpgRbHpip1TDK8CypacgT52Cn7AadLtlEFtAkbtodaf
 tmZw==
X-Gm-Message-State: AOAM530zl9q6faH2kHrggy30T9ziYgNDl7hDx28UiU4aJ3m/WpHqk4+g
 /AgtNBOo/bF+BZWrhfuxNWSKrjRZUSM=
X-Google-Smtp-Source: ABdhPJz9Z/FkDbzVB9LYbltr3gKKK02sxaMyLiSL2nmlj3Q2rJzgC24gjRO6sluORyp7ur4IBaA9jg==
X-Received: by 2002:a05:620a:e02:: with SMTP id
 y2mr23609666qkm.54.1621971980362; 
 Tue, 25 May 2021 12:46:20 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id o5sm87206qtl.85.2021.05.25.12.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 12:46:19 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] testing block device blocksizes
Date: Tue, 25 May 2021 19:46:04 +0000
Message-Id: <20210525194607.553291-1-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=kit.westneat@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, Kit Westneat <kit.westneat@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches add a few parameters to blkdebug to allow modification of
the block device block sizes, both logical and physical. It also adds a
test that uses the parameter to verify correct UNMAP behavior in devices
with 4k blocks.

v2: fixes style issues
v3: adds parameters to qapi

Kit Westneat (3):
  block/blkdebug: add blocksize parameter
  tests/qtest/virtio-scsi-test: add unmap large LBA with 4k blocks test
  block/blkdebug: add log-blocksize and phys-blocksize parameters

 block/blkdebug.c               | 56 ++++++++++++++++++++++++++++++++++
 qapi/block-core.json           | 11 +++++++
 tests/qtest/virtio-scsi-test.c | 50 ++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)

-- 
2.26.3


