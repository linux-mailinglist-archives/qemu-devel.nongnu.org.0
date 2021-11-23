Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B573045AA92
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:53:44 +0100 (CET)
Received: from localhost ([::1]:45366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZzD-0000fC-Ab
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZwx-0006Lk-FM
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZwt-0006jz-UL
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rtHdKEN5B3S7yPC7Pxpq+vHAHayOSrq54Jl1HSYJDhI=;
 b=YD6YIcZ5MtBmC6n/gxV9I38ucXEYFVaztMdkpIXpI5NZSe3l/rJdimefHwYW3PYCZlY/lv
 qG8RQKE3GbIQPep/LyczAGHnvGFNRZ6ZE2r/mZsW5pVaM0Xvl53P0Y2iNXomSr46+dWMkZ
 XwbmBb51IMz+dZZlZCohD3ApAzEV6Xo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-zzvzjGdrN5yUinQrzm8rNg-1; Tue, 23 Nov 2021 12:51:17 -0500
X-MC-Unique: zzvzjGdrN5yUinQrzm8rNg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so8799626wmj.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1vayxVZjnj1YRQCCm1V9Pfyif0TYwIXyvANP0D6mjJQ=;
 b=HQzdezt/YBHTx3ukPGmgi32QO5j2kjKB5XH+U/Xo5MH7MLNGwuT3G7p1wEyj4i4ksy
 gHgw7rvAypXmoGhC11huQNak+tmpq/Y58r7h1Sjw5zpdkwBn042uqTH6YT47sJrGehbu
 3BKOPsc1Jbxn3isafIfTujw0CUgzHrFexxrwOMJfQo9QR95/glzGzWYM3SvDT2WLspHO
 FFaYiNXOFIpKj8QDvtRdLXN845P19rmOJ0XOq9vKl2x3hJ4qbqcmrsCURavX15M9vnmG
 QxSJ0H10t8f3ICzxLvz4/WDpXH95xiCG3Bzs66npQW8S9dF5zW6E1zWkOxFp4kT5kvGU
 hC9g==
X-Gm-Message-State: AOAM531JNuPN6UntWFyaSz3hCVKSGaQSm1BwGNu03PxKl5sxMmL7Uk4x
 6BrwEDZ+fNX/aEbIpVjYHvW50C9UKS+cv2MlYQiQPyJFV2ELzBm9LZLYfzDxbIoN8Bs3U/MHqB/
 3Hrj2CD8mx82gLaDnJ5sab1XcOtuHZdklV5hKn68x9fz5NiZsFIFz2UzAagMnTDS2E9Y=
X-Received: by 2002:adf:f44e:: with SMTP id f14mr9513293wrp.37.1637689875725; 
 Tue, 23 Nov 2021 09:51:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8K3RgEoz0pi2tMQ71ZV6IEoY1OvYCvxXxi0RKRb4fB4ZkOOJ5ANvoHQLzFmYVaByar5vtXg==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr9513252wrp.37.1637689875484; 
 Tue, 23 Nov 2021 09:51:15 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id q4sm12445115wrs.56.2021.11.23.09.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:14 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/23] Migration: Transmit and detect zero pages in the
 multifd threads
Date: Tue, 23 Nov 2021 18:50:50 +0100
Message-Id: <20211123175113.35569-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi=0D
=0D
Since Friday version:=0D
- More cleanups on the code=0D
- Remove repeated calls to qemu_target_page_size()=0D
- Establish normal pages and zero pages=0D
- detect zero pages on the multifd threads=0D
- send zero pages through the multifd channels.=0D
- reviews by Richard addressed.=0D
=0D
It pases migration-test, so it should be perfect O:+)=0D
=0D
ToDo for next version:=0D
- check the version changes=0D
  I need that 6.2 is out to check for 7.0.=0D
  This code don't exist at all due to that reason.=0D
- Send measurements of the differences=0D
=0D
Please, review.=0D
=0D
[=0D
=0D
Friday version that just created a single writev instead of=0D
write+writev.=0D
=0D
]=0D
=0D
Right now, multifd does a write() for the header and a writev() for=0D
each group of pages.  Simplify it so we send the header as another=0D
member of the IOV.=0D
=0D
Once there, I got several simplifications:=0D
* is_zero_range() was used only once, just use its body.=0D
* same with is_zero_page().=0D
* Be consintent and use offset insed the ramblock everywhere.=0D
* Now that we have the offsets of the ramblock, we can drop the iov.=0D
* Now that nothing uses iov's except NOCOMP method, move the iovs=0D
  from pages to methods.=0D
* Now we can use iov's with a single field for zlib/zstd.=0D
* send_write() method is the same in all the implementaitons, so use=0D
  it directly.=0D
* Now, we can use a single writev() to write everything.=0D
=0D
ToDo: Move zero page detection to the multifd thrteads.=0D
=0D
With RAM in the Terabytes size, the detection of the zero page takes=0D
too much time on the main thread.=0D
=0D
Last patch on the series removes the detection of zero pages in the=0D
main thread for multifd.  In the next series post, I will add how to=0D
detect the zero pages and send them on multifd channels.=0D
=0D
Please review.=0D
=0D
Later, Juan.=0D
=0D
Juan Quintela (23):=0D
  multifd: Delete useless operation=0D
  migration: Never call twice qemu_target_page_size()=0D
  multifd: Rename used field to num=0D
  multifd: Add missing documention=0D
  multifd: The variable is only used inside the loop=0D
  multifd: remove used parameter from send_prepare() method=0D
  multifd: remove used parameter from send_recv_pages() method=0D
  multifd: Fill offset and block for reception=0D
  multifd: Make zstd compression method not use iovs=0D
  multifd: Make zlib compression method not use iovs=0D
  multifd: Move iov from pages to params=0D
  multifd: Make zlib use iov's=0D
  multifd: Make zstd use iov's=0D
  multifd: Remove send_write() method=0D
  multifd: Use a single writev on the send side=0D
  multifd: Unfold "used" variable by its value=0D
  multifd: Use normal pages array on the send side=0D
  multifd: Use normal pages array on the recv side=0D
  multifd: recv side only needs the RAMBlock host address=0D
  multifd: Rename pages_used to normal_pages=0D
  multifd: Support for zero pages transmission=0D
  multifd: Zero pages transmission=0D
  migration: Use multifd before we check for the zero page=0D
=0D
 migration/multifd.h      |  52 +++++++---=0D
 migration/migration.c    |   7 +-=0D
 migration/multifd-zlib.c |  71 +++++--------=0D
 migration/multifd-zstd.c |  70 +++++--------=0D
 migration/multifd.c      | 214 +++++++++++++++++++++++----------------=0D
 migration/ram.c          |  22 ++--=0D
 migration/savevm.c       |   5 +-=0D
 migration/trace-events   |   4 +-=0D
 8 files changed, 231 insertions(+), 214 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


