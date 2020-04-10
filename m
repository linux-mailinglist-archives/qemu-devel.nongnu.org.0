Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97D81A3ED6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Apr 2020 05:44:11 +0200 (CEST)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMkaQ-00055k-VQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 23:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMkXm-00017W-ML
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 23:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMkXl-0007eD-GK
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 23:41:26 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:40687)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alexander.duyck@gmail.com>)
 id 1jMkXl-0007dQ-Bd
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 23:41:25 -0400
Received: by mail-qt1-x841.google.com with SMTP id y25so609344qtv.7
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 20:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=uNBKHb1txzO7VL6PwEiFE6QnzpJ54qA7Ifpk/fi/v1M=;
 b=BOQ9ICH7uK59gjUVqRuWqzAkXn0OeK0sLwVZv3zWWOG2JERvP8ItTHc3iTvvYTO2jE
 nx/p9k0FQ7GWxNGyctcJ1laPUOaqh7VY3KklAT4bKTCPeZ+L0uvXAPm8sahVv8q2T2kb
 SOdGJIWz9ypDsplTcz5WFh02ATwH3ebvPeKYLFHDxc9rT53UGTAOADHyDddhFmN/YC2b
 Jrz/Xv40kPof6MPH91fLr6qbrriafH3RRV/9OrAbX0F7ywbL6XMjEPIUTXcmZF/nYd8O
 nEdQqciBNFdNmHNN5Od260xdxykOv1791oAUV9coGaeOJuH6t0E5xdHTaOXNMFog3To4
 U7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=uNBKHb1txzO7VL6PwEiFE6QnzpJ54qA7Ifpk/fi/v1M=;
 b=naW+IOECfKF/m9+xXFDX4pqzuYJ/Ptsh75vRgpgdV7AueDdGFAS/nUZgiUIpHSeenG
 ViOGhDSACGkHFo7HcibcIiqyRqOpxJT3EAFfIcIEEwXNNfn8t7NpIK95cDpdaEzB5epx
 OSGJBnzr7Ksp3juqu+ALiZ/D7k3XCScU0kSLC+jJNV1E/tzXBZG5fjBZqxLT6yGPj2u2
 IEHI2qbW9T7b24qO071uHjxQPFgG4iTwyrbDWD4RLg2r68bOdVihz0PelINziLWcvgrZ
 YTHOG3CI0dWCMZi57FfRWjBfQ7xto3K47jMK6e8MQfOPyPu4znMjAZgRV8LCsjiLIkN2
 vvUQ==
X-Gm-Message-State: AGi0Pua3nRa4RUSrbcu545hHM5XYxerN98ve1V593kE6TIiDoRGkeDb4
 +nYPapdv8zPu1CgGrsSj/BuCnQuVQS8=
X-Google-Smtp-Source: APiQypLOPtozSrZPf268Y5lex80C4JvqVfEtcBDadESdzrAkE8pVO28Rp8hXG18yLtIGR39BslcZXQ==
X-Received: by 2002:ac8:75d0:: with SMTP id z16mr2627024qtq.281.1586490084259; 
 Thu, 09 Apr 2020 20:41:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id x6sm723301qke.43.2020.04.09.20.41.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Apr 2020 20:41:23 -0700 (PDT)
Subject: [PATCH v19 QEMU 0/4] virtio-balloon: add support for free page
 reporting 
From: Alexander Duyck <alexander.duyck@gmail.com>
To: pbonzini@redhat.com, david@redhat.com, mst@redhat.com
Date: Thu, 09 Apr 2020 20:41:22 -0700
Message-ID: <20200410033729.24738.22879.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
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

This series provides an asynchronous means of reporting free guest pages
to QEMU through virtio-balloon so that the memory associated with those
pages can be dropped and reused by other processes and/or guests on the
host. Using this it is possible to avoid unnecessary I/O to disk and
greatly improve performance in the case of memory overcommit on the host.

I originally submitted this patch series back on February 11th 2020[1],
but at that time I was focused primarily on the kernel portion of this
patch set. However as of April 7th those patches are now included in
Linus's kernel tree[2] and so I am submitting the QEMU pieces for
inclusion.

[1]: https://lore.kernel.org/lkml/20200211224416.29318.44077.stgit@localhost.localdomain/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b0c504f154718904ae49349147e3b7e6ae91ffdc

Changes from v17:
Fixed typo in patch 1 title
Addressed white-space issues reported via checkpatch
Added braces {} for two if statements to match expected coding style

Changes from v18:
Updated patches 2 and 3 based on input from dhildenb
Added comment to patch 2 describing what keeps us from reporting a bad page
Added patch to address issue with ROM devices being directly writable

---

Alexander Duyck (4):
      virtio-balloon: Implement support for page poison tracking feature
      linux-headers: update to contain virito-balloon free page reporting
      virtio-balloon: Provide an interface for free page reporting
      memory: Do not allow direct write access to rom_device regions


 hw/virtio/virtio-balloon.c                      |   85 ++++++++++++++++++++++-
 include/exec/memory.h                           |    4 +
 include/hw/virtio/virtio-balloon.h              |    3 +
 include/standard-headers/linux/virtio_balloon.h |    1 
 4 files changed, 86 insertions(+), 7 deletions(-)

--

