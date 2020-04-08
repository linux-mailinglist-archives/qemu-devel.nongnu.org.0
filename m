Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128D31A29A0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 21:50:22 +0200 (CEST)
Received: from localhost ([::1]:40032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMGiL-0003C9-56
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 15:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMGh2-0001t2-Ng
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 15:49:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alexander.duyck@gmail.com>) id 1jMGh0-0002ze-Ir
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 15:49:00 -0400
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:42717)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alexander.duyck@gmail.com>)
 id 1jMGgz-0002xd-EC
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 15:48:58 -0400
Received: by mail-qv1-xf42.google.com with SMTP id ca9so4314389qvb.9
 for <qemu-devel@nongnu.org>; Wed, 08 Apr 2020 12:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=IOMlbjfXWuE+0u1ners+vpffTKgzzJDssD1Ouo69X0c=;
 b=FSHTEzfDUkxuEf+1W+sAmhhANtyGhE2YTFAJ7s6ItmMRQBRjeLfpNek7JbCxKqBOGl
 pZIBzW7H+HoqeC9ZRVanOA3vQZ/JwZ8gdTDutljLbjhbdpHkL0jNSLVNV+VXVnch+DlS
 VfxSLQDQFpL3+bgRMTao3XGBA4vPV9Zkfa8ASsf290XcKcc/EqNmUbJr7yCtkgVXtME5
 RydLmrTqQIAG4+lc92eRht/UdPyrvHjB0PlN9Keg3B2Q+X/mhoqJCWrs9Gl/jnS5jh/h
 lG+4XcqwNqm+O6+ZsWzaLmzytGnz1F7XFwOouWvo3+kZjlVAlWU9/6LSI7rUSvHluM2H
 4kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=IOMlbjfXWuE+0u1ners+vpffTKgzzJDssD1Ouo69X0c=;
 b=N0fV1a6Pu/SS/0DCZw7ONG0Pxi8w/35MpREiSk4zbCtI8EEts+pCpPwseIJE53q5nb
 76Kltq7xAaJsk9HVU5ghUMUJDebC8qONFeBX6B1uBLou/6dm4KwZKXELbItcUUqIaBqn
 lHKWkvx+jw3MNMaefhhGLZ8ugH2HLNyLGANZjjhQZSa8YkkyKtuRiz+RFRmydocBoNQE
 7psVhURiT2yiJLxFpU3ITsRq9/uPIVuKenvrU0RgpRrZRylgFzkhJ1xsYK+4djEkEPJk
 u0YM/Q2uyM25laz+LkCtiMPcOr4kVesFOBkt6MrKC/PoWa7nYPNfJjR1SPRBYaI39bk+
 yWbQ==
X-Gm-Message-State: AGi0PuayjMSxStUvYjbNX9H5rvVjDx2IlWt5BpegOYm1qp0cv/No64EN
 L6RCtM+oyOgkGTa8e5N7Z5E=
X-Google-Smtp-Source: APiQypLxqlqQbYr9Q/QLFHhDDdEyvKmib9sd99MAtR/9zYg8l14bZSWItjNRYdlySyIZEFfG0vRP+w==
X-Received: by 2002:ad4:41c2:: with SMTP id a2mr8916779qvq.112.1586375336732; 
 Wed, 08 Apr 2020 12:48:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id t24sm5019928qkj.23.2020.04.08.12.48.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 12:48:55 -0700 (PDT)
Subject: [PATCH v17 RESUBMIT QEMU 2/3] virtio-balloon: Add support for
 providing free page reports to host
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Wed, 08 Apr 2020 12:48:54 -0700
Message-ID: <20200408194854.24143.51548.stgit@localhost.localdomain>
In-Reply-To: <20200408194628.24143.51644.stgit@localhost.localdomain>
References: <20200408194628.24143.51644.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f42
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


