Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33BB5BF17E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:47:25 +0200 (CEST)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamxZ-0001v0-4S
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsq-0007NM-9b
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsX-000835-1V
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663713484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yagrdsQeIfZZR5dWChkkwefgDg9Q7WQfqymME+KCuCk=;
 b=cJVlocEfNzrVd7D1fPbl81L+dvRS2zGdEtAfNGh24CX/lICGD6rYVXxzfbNOKG4NLiLDSW
 QIqI4IvEqRsDWpmGW5kjTfW8XYTa8obRSujauEFtBUTB4SggSvkoTR8IO+Bi2xIfo8Ad71
 0tgkAgzLAW/Li9P+85wns+KYohqkZNM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-aYYRRne7P5mMkKOu-XNf7w-1; Tue, 20 Sep 2022 18:38:03 -0400
X-MC-Unique: aYYRRne7P5mMkKOu-XNf7w-1
Received: by mail-qk1-f199.google.com with SMTP id
 az15-20020a05620a170f00b006cece4cd0beso3082856qkb.22
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=yagrdsQeIfZZR5dWChkkwefgDg9Q7WQfqymME+KCuCk=;
 b=FPz6QijPWrS+q/XWqs1M7lAxVUj7LFst7pwxW+ohXCd6IcfFCZTZ8+KIJ2c/N/PS2q
 XFkPjUoTb1IYb4RUBm9YIsgjbDKHRhBkoBOz4rvJ0WT6CCPmU7xT00TH0qhLxzHgixHa
 XhTLQRoVGbr0LqpucBtyR+k95DNW4XRPnQhlNHvNtrOj0NHZjrLQqacO6LiVEk2+sUKU
 JOBkymt2yD5U0LCMKKQYcPYy+NTA97d7vuMr9ioa8utSS4gaHCw6HuTzaMULP85GJ9qT
 5kbutNXTBSb36APeF9AJYIdncESLxnMKBBexXhYFbVzgNeI8njlexRktFGdUx91c9YM4
 tyLQ==
X-Gm-Message-State: ACrzQf00qSGfDtF9Bj25cZCXCN2stuLj313d9XOpVUPmVs/ZJecTki1Z
 pwAx1MiOBuvAUjY9D6viIjWk0wKvhlFDkEeJPERGbMIO5An4OMsa3BWShWZXx8prT0nRiIOoAB9
 noaVuRfxhhndlvAkkK6cA4sOLYWOCoF8+End2LJMLu+TAYnPCcY8TujofPJvBr01x
X-Received: by 2002:a0c:90a2:0:b0:47b:6b36:f94a with SMTP id
 p31-20020a0c90a2000000b0047b6b36f94amr21525364qvp.26.1663713482638; 
 Tue, 20 Sep 2022 15:38:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cyOuKCFEt8ijCbzi6GwyJzP2DQhPKz2uce77tjgNna021MpjwROpBvlS69rwsxgHZm89Gjg==
X-Received: by 2002:a0c:90a2:0:b0:47b:6b36:f94a with SMTP id
 p31-20020a0c90a2000000b0047b6b36f94amr21525348qvp.26.1663713482381; 
 Tue, 20 Sep 2022 15:38:02 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006bbb07ebd83sm697499qkb.108.2022.09.20.15.38.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:38:02 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 0/5] migration: Bug fixes (prepare for preempt-full)
Date: Tue, 20 Sep 2022 18:37:55 -0400
Message-Id: <20220920223800.47467-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset does bug fixes that I found when testing preempt-full.

Patch 1 should fix a possible deadloop when I hit when testing the
preempt-full code.  I didn't verify it because it's so hard to trigger, but
the logic should be explained in the patch.

Patch 2 fixes a race condition I can easily trigger with the latest
preempt-full code when running with recovery+tls test.  The bug hides quite
deep and took time to debug.  Fundamentally it's about qemufile API, I hope
someday we can have something better than that but still so far there's no
strong enough reason to rework the whole thing.

Patch 3-4 are two patches to disable either postcopy or preempt mode only
for xbzrle/compression.

Patch 5 is something nice to have to optimize the bitmap ops.

The last two patches are actually part of my preempt-full RFC series.

I picked these patches out explicitly from preempt-full series, because at
least patches 1-4 fix real bugs in current code base, so they should get
more focus.

Thanks,

Peter Xu (5):
  migration: Fix possible deadloop of ram save process
  migration: Fix race on qemu_file_shutdown()
  migration: Disallow xbzrle with postcopy
  migration: Disallow postcopy preempt to be used with compress
  migration: Use non-atomic ops for clear log bitmap

 include/exec/ram_addr.h | 11 +++++-----
 include/exec/ramblock.h |  3 +++
 include/qemu/bitmap.h   |  1 +
 migration/migration.c   | 16 +++++++++++++++
 migration/qemu-file.c   | 27 ++++++++++++++++++++++---
 migration/ram.c         | 16 +++++++++++----
 util/bitmap.c           | 45 +++++++++++++++++++++++++++++++++++++++++
 7 files changed, 107 insertions(+), 12 deletions(-)

-- 
2.32.0


