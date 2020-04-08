Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D131A299E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 21:50:15 +0200 (CEST)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMGiE-0002x3-FX
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 15:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMGgn-0001kU-06
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 15:48:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMGgl-0002pN-TA
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 15:48:44 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:43663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alexander.duyck@gmail.com>)
 id 1jMGgl-0002p7-Mq
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 15:48:43 -0400
Received: by mail-qk1-x743.google.com with SMTP id 13so1542091qko.10
 for <qemu-devel@nongnu.org>; Wed, 08 Apr 2020 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=bc9P8XcEYxwvHz+G0NOfyFWQr2Ypg4f0NV9uovZ2gqk=;
 b=s2FVMj2jUh9OCO6xfya7P4G3zFsvVFDoWmy64quoGNpuAKboKvgc2ow3VDLnKC+w62
 qIt7uahLQGhyCrsMLclAQEQ3c2jqkvgEmz9eyDvbAki8v+iO0QcK0+4nKeis141OTwbk
 JQ9zbLFtJpN8hbZ9KwJsd408cPlpio5Lonukyr9OeApuGXdzbFW/wiP7qXZnR3BeIZHJ
 6o7C997MWYy0mkcQ5XcQSUB8aTz6nrPoOFPBxwz+1X7CF5lDcVzkH4V6pSP51lPcDEvn
 Ebnf8Pi2FlauamjeIFmp+PRY4SOSM58AGiNXirWGaQuscIMGnl1jo/n+ZBNmGRPetUbL
 Lcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=bc9P8XcEYxwvHz+G0NOfyFWQr2Ypg4f0NV9uovZ2gqk=;
 b=Mu+gcD3bfQLmmJQLfNxs17nCjGpLaVdinCw/SvI260+kuwiJV7/YleYuElVsd2DNXi
 MLZ+BZXuHSqgI+qpXB8FhZ/7+NZsdIAXqP2N+zZWr3cTgcksnXr4jZbaLduCuFfJGqRS
 tsXiNbuimB/r1zz2oYa7AxvNXPc+nIl5PxQpjnxoDz54dclInsS3qa/oxQmOLbOA0oPh
 ma2lDf/OqCmsFPss1qcYPCJ7acb2jdacei6h/+G29IdiyBXtXIfyfKdPlmuP791bdkKH
 PVGzGJK6FzUInAByoUmrFSc3cw+LBYAKeOrcMJdc4cZwfrZmAEMaLPM7YzDcrpJ36vLm
 WNIw==
X-Gm-Message-State: AGi0Pubhuvw+T1CEEyrVt8rsMVQCUNWZ3stKIhE5mIbDCRdb9N12lxm7
 Id0VN6VlSvRDakzJ2S/lK+s=
X-Google-Smtp-Source: APiQypJ0UTeSwyaDH/PC4bIg7havEh01SAsBQH3oZuUzFFifEm5C45J0mbKeinkgnK3hSl1Pzsz1wg==
X-Received: by 2002:a37:bb01:: with SMTP id l1mr1435828qkf.37.1586375322527;
 Wed, 08 Apr 2020 12:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id j14sm2303474qtv.27.2020.04.08.12.48.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 12:48:41 -0700 (PDT)
Subject: [PATCH v17 RESUBMIT QEMU 0/3] virtio-balloon: add support for
 providing free page reporting
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Wed, 08 Apr 2020 12:48:40 -0700
Message-ID: <20200408194628.24143.51644.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
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

I originally submitted this patch series[1] back on February 11th 2020,
but at that time I was focused primarily on the kernel portion of this
patch set. However as of April 7th those patches are now included in
Linus's kernel tree[2] and so I thought I should resubmit the QEMU side of
this for inclusion so that the feature will be available in QEMU hopefully
by the time the 5.7 kernel tree is released.

[1]: https://lore.kernel.org/lkml/20200211224416.29318.44077.stgit@localhost.localdomain/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b0c504f154718904ae49349147e3b7e6ae91ffdc

---

Alexander Duyck (3):
      virtio-balloon: Implement support for page poison tracking feature
      virtio-balloon: Add support for providing free page reports to host
      virtio-balloon: Provide a interface for free page reporting


 hw/virtio/virtio-balloon.c                      |   67 ++++++++++++++++++++++-
 include/hw/virtio/virtio-balloon.h              |    3 +
 include/standard-headers/linux/virtio_balloon.h |    1 
 3 files changed, 66 insertions(+), 5 deletions(-)

--

