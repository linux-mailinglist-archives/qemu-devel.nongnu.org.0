Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA5F67C005
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 23:41:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKoRn-0003r1-E3; Wed, 25 Jan 2023 17:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKoRR-0003WO-Mn
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:40:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKoRQ-0003Rr-2x
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674686426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x7OxwPWQzVeukiblOWS1UlUMmh+JKLMk//gEtsjeDxE=;
 b=SsC5yJXujpVVQNA0MiicuC86O+s1aCfS7DMLXzcDWm5Ntr9231MtQjNjkkh/fqot5bXd8M
 QIoGL7EgAKp2Y54EWDATcfvGq2hHgIHSCkOaFhQJUYcnL3KmRe0jpIdvHMBSdv82cmGwIR
 ijVwgR3bKU13OlEVU0s0YiK08g+1/o0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-ND3fqbX5NTO_nIsik0yv5A-1; Wed, 25 Jan 2023 17:40:20 -0500
X-MC-Unique: ND3fqbX5NTO_nIsik0yv5A-1
Received: by mail-qt1-f200.google.com with SMTP id
 bs22-20020ac86f16000000b003b686e0ef0bso8322807qtb.19
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 14:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7OxwPWQzVeukiblOWS1UlUMmh+JKLMk//gEtsjeDxE=;
 b=TKD16IiQyf/JZQtIvMC6Lri7WZajO2/I2st2J+ICU5XBaozMYOiF5y34wAvdruPEvL
 l4pUgRaUauIT5Va4Y+QDEqxLRUCRvwQE4WbEnQUhxqIpg0H9+1RVV3Yn8FD8bHu+/zeA
 zK+NspOGWJqgyeVJMKCnoB5R6jnFKFxzOWkC37tU21QiqJJO/KQEZ2u/n/8SgV0RiORn
 JUdwdFq16FEiBKGH0AC65q9155/XBex96y+WhK0DZRa8pF8wffQsG8Plu6yoPsDgrF/e
 UOIaNKUQxGfnovIhcl5YD7q9qWw12Il3X/lSi9amIaGDFkryC5zN2anSRVh5I223zhqW
 jCrg==
X-Gm-Message-State: AFqh2kp5e0yoSczF2a/Ej+i/wrFq4CNbcLItpqMvbF1PaSaaEzX/b2kA
 KddUt7kY9a/1aqgbjkZUSI+Js+SRCvYeAmsXGeY4RRsg8ccNUay1In3qOyypBk/mp3rvWOF6Bv2
 p7pyp9cFZV3Mk1ZKgQDn8kK2p2rq9ExpgkjnGq23DbUxEgIksMOND8fE4e9Dvm9o/
X-Received: by 2002:ac8:5284:0:b0:3ab:b6cd:3758 with SMTP id
 s4-20020ac85284000000b003abb6cd3758mr49595417qtn.54.1674686418614; 
 Wed, 25 Jan 2023 14:40:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuX78sZ/bN2xBS9CKSJwxGa5IhO4+7l8HXOslnJAnqVkdWOml0mTkCXEZNjZCqze6YTyLwX5g==
X-Received: by 2002:ac8:5284:0:b0:3ab:b6cd:3758 with SMTP id
 s4-20020ac85284000000b003abb6cd3758mr49595389qtn.54.1674686418332; 
 Wed, 25 Jan 2023 14:40:18 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 z10-20020ac8430a000000b003b6325dfc4esm4133279qtm.67.2023.01.25.14.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 14:40:17 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Date: Wed, 25 Jan 2023 17:40:13 -0500
Message-Id: <20230125224016.212529-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The new /dev/userfaultfd handle is superior to the system call with a
better permission control and also works for a restricted seccomp
environment.

The new device was only introduced in v6.1 so we need a header update.

Please have a look, thanks.

Peter Xu (3):
  linux-headers: Update to v6.1
  util/userfaultfd: Add uffd_open()
  util/userfaultfd: Support /dev/userfaultfd

 include/qemu/userfaultfd.h                    |   1 +
 include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
 include/standard-headers/linux/ethtool.h      |  63 +++++++-
 include/standard-headers/linux/fuse.h         |   6 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_blk.h   |  19 +++
 linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   4 +
 linux-headers/linux/kvm.h                     |   1 +
 linux-headers/linux/psci.h                    |  14 ++
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
 migration/postcopy-ram.c                      |  11 +-
 tests/qtest/migration-test.c                  |   3 +-
 util/trace-events                             |   1 +
 util/userfaultfd.c                            |  49 +++++-
 18 files changed, 354 insertions(+), 29 deletions(-)

-- 
2.37.3


