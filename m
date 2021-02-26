Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A1326107
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 11:12:45 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFa72-0004Y1-KK
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 05:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZxy-0004Tg-RD
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:03:24 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFZxr-00039k-G9
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 05:03:22 -0500
Received: by mail-ed1-x533.google.com with SMTP id s8so10245434edd.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 02:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35N7WzMVRa8qcKYHlHrA3AZNifNr0JF7+0s1KreMh4Q=;
 b=F2P1M+xiDSy0/N+/zmKQPhTFb0nTgyjrckoWnMAhKM6/JxkVLl3CNpBf0g6CYtY2gA
 0jUG2FmtUGE229O6qRkuKj76NHDRda+pGY5miVh934rWK8RfjLW72UOHSbHIlN0EVHN/
 NJ83rxjeo2oMpqbh9ovd4rgTjP/HUnLFb3FYEQ3ArOKC2m4uONe+TUAK4DG1Ma83bZO+
 qevnWq5geZ8DmW0aAm67e4r7ZUrq5qC7TIMY+fyh+WYRUns3fvLIpTz2bJAvAJHQ7XjO
 bwJQajY03gvV4rFnJEY0B/gGyIcCu5hl0Ob4HxzXTJbcGEErwYIKJfHwHiAigLONlun3
 ZP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35N7WzMVRa8qcKYHlHrA3AZNifNr0JF7+0s1KreMh4Q=;
 b=lx+dvDCPq9hd5TtOr8MvzlxsgVv7kYB4XQgwKP8aAPRsTLxSqVorQavwT8WzZRwvtz
 u8QbfNKmztQFRA/XORdcD9vMO0PnNQEyANXCoGuqv4uM6dx+sWLyDLgBzk9Bj1RLrmPB
 ZNG7ifbIfcOWyJnwN8qk6FyYBsT2H26H7D1lJpbpgNobEsP4CfoHCk/psmrwJuX8PYLh
 3ozDZVSvNgVmt9LJORyghzPF5K9MH0cnCWLv2jqlZWJNEdgSrRo9eoAGby4NC4CJgJJ9
 jAHQQsYn/3cmeUoz+rLx2f7XTYKIH4sdq8yEowsxlGEcZMBvmT/xCKSElsFTHl5n0JyQ
 qUOg==
X-Gm-Message-State: AOAM531xQcnzYB/y3o+GJhaTOlRGuQm7wvpbGPVN5FUC3u9MYGWVn4mR
 ZIB6Ac3JJyzhMxpubp8R17U=
X-Google-Smtp-Source: ABdhPJzB6HDUhGk1O9qazeXk7/qSqeGVx57euB7uDVWTpU4USZZcQHGKFml45oSnJU/QNiemP6vOyg==
X-Received: by 2002:a05:6402:899:: with SMTP id
 e25mr2412523edy.212.1614333793705; 
 Fri, 26 Feb 2021 02:03:13 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a26sm5667554edm.15.2021.02.26.02.03.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Feb 2021 02:03:13 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] net: Pad short frames to minimum size (60 bytes)
Date: Fri, 26 Feb 2021 18:03:03 +0800
Message-Id: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The minimum Ethernet frame length is 60 bytes, and we should pad
frames whose length is smaller to the minimum size.

This commit fixes the issue as seen with various ethernet models,
that ARP requests get dropped, preventing the guest from becoming
visible on the network.

The following 2 commits that attempted to workaround this issue
in e1000 and vmxenet3 before, should be reverted.

  commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
  commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")


Bin Meng (3):
  net: Pad short frames to minimum size (60 bytes)
  Revert "e1000: Pad short frames to minimum size (60 bytes)"
  Revert "vmxnet3: Pad short frames to minimum size (60 bytes)"

 hw/net/e1000.c   | 10 +---------
 hw/net/vmxnet3.c | 10 ----------
 net/net.c        |  9 +++++++++
 3 files changed, 10 insertions(+), 19 deletions(-)

-- 
2.7.4


