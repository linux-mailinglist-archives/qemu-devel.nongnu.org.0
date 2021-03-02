Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ACC32A0E1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:29:33 +0100 (CET)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH55g-0003fn-TJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52i-0001aW-VM; Tue, 02 Mar 2021 08:26:28 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52h-0001an-FE; Tue, 02 Mar 2021 08:26:28 -0500
Received: by mail-pg1-x52a.google.com with SMTP id t25so13822283pga.2;
 Tue, 02 Mar 2021 05:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UnFrFUxkrm8ifQ/YJRFM4cazuOSYeHnmhMFpysUYja8=;
 b=FZJF++J5rULq03pBtUuuZF5DBJRbOHZ/k4NNgBSUlhO/sQI/Q07r5mJsvMWbEJbBN9
 17fIgBfWKORpJwLRlC+VYN/4Z/S1xyO9tEA4lpaG86QQn82Ll0q98MTWH4h+PtbUNkGZ
 /eCM1BxhvnerBmcrIlbpTw8oB6wTsyCXvjsZ7uoLrZefPteRfAmRintvr5gYFEFdFVan
 g3a+WKkoYLa6WPD8CBmpAjePSomOSDqV8184L03qkcZosymtEf5O0qkUEBtIRCJ8lw1F
 JD81VEymMT65pQjSRm0pFCAVioJyHPjO5ZjH7WL4VOmF8L7MpVOnPymBBS7EFf1aAuBY
 yzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UnFrFUxkrm8ifQ/YJRFM4cazuOSYeHnmhMFpysUYja8=;
 b=WMJxw0s2AR9XCiSd8mzYCDCs0y3D9JZifqNzqlomzxtFEJiY58026Eek0x6ySE2wVf
 ReSTQl/hRxZldjcLloEfcvvJxGBeVAMZcco1ZVZVlznwJ2ESys0//SQ2KhZqc5De0aa4
 PKMRc4ZbHv8ohAaQbDekd0rDMmgwO5fEFZcKsM2hghH/DD3FeL72jI2tyZut3wgfTeSY
 pcGsOH9Fq06zVeRt3vdJbXLGa17Pd5/Y2f8v65pMCQ1FiP+wUae6VagzWsw3XPEN+pJX
 OQdshuqxNVQyFt5ofYpq2YT8hnoOyCuEPXoCTT67/r8E4pVrXP8glSM3PaPi7/kUAiCO
 CPNw==
X-Gm-Message-State: AOAM533RIk8gioNJfWpz/QVnGp0xJdpPidSPRUHzoN/fD7W9t2Ffwm2Z
 sNkfvN4cmhmvFndO/LdV1VzW17UTvwmlrA==
X-Google-Smtp-Source: ABdhPJz1kOSx1zPMNp77kAUmR1NSGIuuNc+bmghBuyM2EmRi+VyLYtExIQUie7ZRCSA86VhG9jkinw==
X-Received: by 2002:aa7:8a46:0:b029:1ed:cefd:7f7 with SMTP id
 n6-20020aa78a460000b02901edcefd07f7mr3279773pfa.46.1614691585522; 
 Tue, 02 Mar 2021 05:26:25 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u7sm20166956pfh.150.2021.03.02.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:26:24 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 0/8] hw/block/nvme: support namespace attachment
Date: Tue,  2 Mar 2021 22:26:09 +0900
Message-Id: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52a.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series supports namespace attachment: attach and detach.  This is
the fourth version of series with replacing changed namespace list to
bitmap to indicate changed namespace IDs.

Please review.

Thanks,

Since V3:
  - Replace changed ns list to bitmap to not only represent relationship
    between controller and namespace, but also avoid duplications of
    nsids in the list.  (Klaus)

Since V2:
  - Added command effects (namespace inventory changed) for namespace
    attach command.  (Keith)
  - Added [7/8] patch to support asynchronus event when namespace
    inventory is updated.  (Keith)
  - Added review and tested tag from Klaus to all the patches, but [6/8]
    and [7/8].

Since V1:
  - Fix to take 'ctrl' which is given from the command rather than 'n'.
    (Klaus)
  - Add a [7/7] patch to support CNS 12h Identify command (Namespace
    Attached Controller list).

Minwoo Im (8):
  hw/block/nvme: support namespace detach
  hw/block/nvme: fix namespaces array to 1-based
  hw/block/nvme: fix allocated namespace list to 256
  hw/block/nvme: support allocated namespace type
  hw/block/nvme: refactor nvme_select_ns_iocs
  hw/block/nvme: support namespace attachment command
  hw/block/nvme: support changed namespace asyncrohous event
  hw/block/nvme: support Identify NS Attached Controller List

 hw/block/nvme-ns.c     |   1 +
 hw/block/nvme-ns.h     |   2 +
 hw/block/nvme-subsys.h |  28 +++-
 hw/block/nvme.c        | 300 ++++++++++++++++++++++++++++++++++++-----
 hw/block/nvme.h        |  37 +++++
 hw/block/trace-events  |   3 +
 include/block/nvme.h   |  14 ++
 7 files changed, 349 insertions(+), 36 deletions(-)

-- 
2.27.0


