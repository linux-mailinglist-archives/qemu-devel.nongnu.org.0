Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE66FE08D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:40:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkyz-0000RS-Kw; Wed, 10 May 2023 10:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkyv-0000CU-Gr
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkys-00043W-QA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683729573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+dvP5lS2hpZsjzZV7ngELiEW07Qstit8jIGjqevqemw=;
 b=JKGpBb41nnkt9Vw6Xldz2HiO0jgZp+gio+v/Tjp3KHcfM7KXYgbSvlVO9TKGwT2G3rb/8g
 PiiNzjBeaXf7QWQdEsG09Xi2Y6EGHVweSr+h0r5d6VOgREPEGgS/mC8rNhNn+HfKSWH6Vl
 FwEdSFl2BbxGhnpUqhMzCf7UKgaLrjk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-jtWp80XBOleVTYG-SzDglw-1; Wed, 10 May 2023 10:39:30 -0400
X-MC-Unique: jtWp80XBOleVTYG-SzDglw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D7CB885623;
 Wed, 10 May 2023 14:39:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03E024078907;
 Wed, 10 May 2023 14:39:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC 0/3] Getting rid of "uint" and friends
Date: Wed, 10 May 2023 16:39:22 +0200
Message-Id: <20230510143925.4094-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi

After my last PULL request failed:

Build failures.

https://gitlab.com/qemu-project/qemu/-/jobs/4257605099#L2241

   85 | void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint normal_num);
      |                                                              ^~~~
      |                                                              u_int

it was because it had an "uint" instead of an "uint32_t".

So Richard asked me if I knew where it came from to try to poison it.

It cames from (this is Fedora38 x86_64, but I guess modern linux are similar):

/usr/include/system/types.h

...

/* Old compatibility names for C types.  */
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;

So I decided to get rid of them.  And searching through the tree I found:
- that I had already have had this problem in the past

commit 85c93c57f162e47025441ce39e2aadd0c1e0914f
Author: Yonggang Luo <luoyonggang@gmail.com>
Date:   Sat Sep 5 14:38:13 2020 +0800

    tests: fixes test-vmstate.c compile error on msys2

    ../tests/test-vmstate.c: In function 'int_cmp':
    ../tests/test-vmstate.c:884:5: error: unknown type name 'uint'; did you mean
 'uInt'?
      884 |     uint ua = GPOINTER_TO_UINT(a);
          |     ^~~~
          |     uInt

- that someone had fixed things like this while I was not looking:

commit d7df0b41dc38327388c3f19fdf4246793d4a1e4b
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Thu Jan 17 15:43:53 2019 +0400

    slirp: prefer c99 types over BSD kind

    Replace:
    - u_char -> uint8_t
    - u_short -> uint16_t
    - u_long -> uint32_t
    - u_int -> unsigned
    - caddr_t -> char *

and

commit 08dc07a32b76943417b465d2d2c464c13b566a82
Author: Stefan Weil <weil@mail.berlios.de>
Date:   Thu Jul 22 22:15:24 2010 +0200

    slirp: Remove declarations which are no longer needed

I tried sooner than that date. I digged myself in a hole and decided
to stop even trying. So hat trick, folks.

- that ARM got for some reason the only u_int32_t on the tree

- that s390-ccw is very proud to define its own ulong

- that linux-user still uses uint and ulong (no ushort)
  I can understand abi_uint and abi_ulong, but uint and ulong?  in 2023?

Should we fix this?
Should we left it as it is?

Comments people!

Later, Juan.

(*): No, I have no clue either why/where/how __USE_MISC got defined.

Juan Quintela (3):
  ARM: Use normal types
  linux-user: Drop uint and ulong
  s390-ccw: Getting rid of ulong

 bsd-user/arm/target_arch_reg.h   |  2 +-
 linux-user/mmap.c                |  2 +-
 linux-user/syscall.c             |  8 ++++----
 pc-bios/s390-ccw/helper.h        |  2 +-
 pc-bios/s390-ccw/s390-ccw.h      |  7 +++----
 pc-bios/s390-ccw/virtio-blkdev.c | 12 ++++++------
 pc-bios/s390-ccw/virtio-scsi.c   |  4 ++--
 pc-bios/s390-ccw/virtio-scsi.h   |  2 +-
 pc-bios/s390-ccw/virtio.c        | 12 ++++++------
 pc-bios/s390-ccw/virtio.h        |  4 ++--
 10 files changed, 27 insertions(+), 28 deletions(-)

-- 
2.40.1


