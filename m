Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB7D1A2C11
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 00:57:36 +0200 (CEST)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMJdX-0003gW-Ry
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 18:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMJbT-0000YW-BA
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 18:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMJbS-0001Jj-35
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 18:55:27 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alexander.duyck@gmail.com>)
 id 1jMJbR-0001JL-T5
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 18:55:26 -0400
Received: by mail-pf1-x442.google.com with SMTP id k15so3150817pfh.6
 for <qemu-devel@nongnu.org>; Wed, 08 Apr 2020 15:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=IOMlbjfXWuE+0u1ners+vpffTKgzzJDssD1Ouo69X0c=;
 b=LhAFwM4aCGpSxxCshU7Zfg64BFB9F27L0JucH8w+dt9Uwb0uE+X9qJH98HrrqfvKgG
 CKpEtypwUeAsuQAgTlDoy2NWi2LwUHmAl5kUgnYgTuSXdYAD/rmCBNXcUasSVHlGKz3t
 ie/fi7pYrywW/dsrpPTiTMBhwVCT3ijasqKqX651aTQb9IWhDcdJz2IqasWfjZDP2zwh
 Gpb9RGD2SDnWB+Mkf8uHvQclkqp/NUCbAED55mVhqmQwwNPiOsM56G9XgrmZcsqiZDJ7
 nWuKQZXotUaa1D73SaJPlzaQ7YQ8iwXDVLoJho1hPsmXR7WzYQIfz9rPJwWtsKS+28pV
 kqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=IOMlbjfXWuE+0u1ners+vpffTKgzzJDssD1Ouo69X0c=;
 b=k8KblQb7NcDAm2WirHUBRyVWCIjW35jh2sbZdYbQviEe4ofO0yqAqM98VACe9wk5CG
 nzMW0AGLx5Bp2/Q66jMVpTqsBjChCNyy4pFp/KiIhUSaEHYyoS+tL3vHeeVaL15MUJlg
 qLculI2TDebp41lCwrUXf5313NqaP0UZ+OhVtBf0NJV/Ei5COGNeo80OD4oM0EsCqDLV
 uzNp35DW14kQEXTAkByCWrtBicELjfEZsvUcZ8ur+TQup/UX08W3+4uj3v4So5towqLr
 j2G8BEh+ZaOqjUyD7wri0Z0BePq+nm/rGsmQDFEuIMfI/FyDAgs7w7EGdL1pftH/QB1N
 L3hQ==
X-Gm-Message-State: AGi0PuYSKnvB0Ot370tbTwDLVjwfKhV4YGe1YhI+CEjGPKn3Q3Fr97zR
 PLFgUrZzYb18Vk5594QY2VU=
X-Google-Smtp-Source: APiQypKrZ2uyBWMmsCGQE0B+HyeVZ6Jmpcf6wKIvD1X/N1KgcpxuDhA9d6fFi1oB63V3/9t1r5ibew==
X-Received: by 2002:a63:4850:: with SMTP id x16mr9170021pgk.317.1586386524582; 
 Wed, 08 Apr 2020 15:55:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id z7sm516712pju.37.2020.04.08.15.55.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 15:55:24 -0700 (PDT)
Subject: [PATCH v18 QEMU 2/3] virtio-balloon: Add support for providing free
 page reports to host
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Wed, 08 Apr 2020 15:55:23 -0700
Message-ID: <20200408225523.18764.86514.stgit@localhost.localdomain>
In-Reply-To: <20200408225302.18764.209.stgit@localhost.localdomain>
References: <20200408225302.18764.209.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Duyck <alexander.h.duyck@linux.intel.com>

Add support for the page reporting feature provided by virtio-balloon.
Reporting differs from the regular balloon functionality in that is is
much less durable than a standard memory balloon. Instead of creating a
list of pages that cannot be accessed the pages are only inaccessible
while they are being indicated to the virtio interface. Once the
interface has acknowledged them they are placed back into their respective
free lists and are once again accessible by the guest system.

Unlike a standard balloon we don't inflate and deflate the pages. Instead
we perform the reporting, and once the reporting is completed it is
assumed that the page has been dropped from the guest and will be faulted
back in the next time the page is accessed.

This patch is a subset of the UAPI patch that was submitted for the Linux
kernel. The original patch can be found at:
https://lore.kernel.org/lkml/20200211224657.29318.68624.stgit@localhost.localdomain/

Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 include/standard-headers/linux/virtio_balloon.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/include/standard-headers/linux/virtio_balloon.h b/include/standard-headers/linux/virtio_balloon.h
index 9375ca2a70de..1c5f6d6f2de6 100644
--- a/include/standard-headers/linux/virtio_balloon.h
+++ b/include/standard-headers/linux/virtio_balloon.h
@@ -36,6 +36,7 @@
 #define VIRTIO_BALLOON_F_DEFLATE_ON_OOM	2 /* Deflate balloon on OOM */
 #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
 #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
+#define VIRTIO_BALLOON_F_REPORTING	5 /* Page reporting virtqueue */
 
 /* Size of a PFN in the balloon interface. */
 #define VIRTIO_BALLOON_PFN_SHIFT 12


