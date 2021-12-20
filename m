Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA447B114
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:29:20 +0100 (CET)
Received: from localhost ([::1]:51392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLXK-00070J-1s
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:29:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQR-0001xu-6H
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQG-0006IP-4E
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VOx0LcoC3Bee85jAlOlPQmbyS/z69KIn22qNgP33irU=;
 b=XbSrCfo1waIwXV0n/MrAVOPMKkU3gMzRs87tCJ7PH6gix7Eueb6XVDiS8rTHREP1mf0DBD
 NMtxrIJpXSErMJPzPwA5IVMlyePi6EHoq5J894tC0RWnUJvQKh4gB0Gp1fT2el6jqkhyyH
 dAcRqsbTdbKhoMnNAU6PCv1UPR/UQe8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-6atW10bRN0aO7hQrDy6a4Q-1; Mon, 20 Dec 2021 03:54:10 -0500
X-MC-Unique: 6atW10bRN0aO7hQrDy6a4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so1694710wma.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOx0LcoC3Bee85jAlOlPQmbyS/z69KIn22qNgP33irU=;
 b=ypdJ+saYwd41v8etiZJAWumSmr0l0dlNcdv9LGpMygL8mynN63aca3g5seseKrGED7
 IV6142BfOCc9ESwDD4ZiKBHcRlGNMhkTBLUds3us/YsOAfGv95mNZChH7Rwb8QrajlAW
 Jii5O5NOMwymcYPqLHEStgu1vKU2QOJGRu8URdbzQkyzJBghKXvoq+rOhq34GZnQfjze
 CAgGtruM2EDsRugTbQqCrKJj5czW6QG5VBJ94v2QGrNAIACF8wnq9AjCQ2du780o8YSv
 RXkTAyEI1yNDbIV4xvEyRM+jkGdy+8gWo2r+Hm7TsxxeLPc1tFA6/uSdFZ5hfFqwWMCi
 +1qA==
X-Gm-Message-State: AOAM532CUSq6N0ShCaEnSuxr99N0Zz9/K5u7v35kn89QJVKL3p/7TY7i
 XHEb3UdZCo8OUDIDTJ5z1QHOnIMboH4Mm4dKeyoNQsejQ5zj4iDtnjEY68MJYCamOKadWYxYbrk
 qQzz0lTcQdMiXm6N4UYi5uv9jU8/HqtsN1b3kejs6VhiN+Of9HxmHywfE8K531pYR
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr7463836wml.127.1639990449063; 
 Mon, 20 Dec 2021 00:54:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8QRYfZKyA8z75OU4aFRMf6LRASWOPQrEE2xFUCalBMymbG9TWNQm8fJMRmEySOQJS8rChTg==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr7463671wml.127.1639990446507; 
 Mon, 20 Dec 2021 00:54:06 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:05 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] migration: Postcopy cleanup on ram disgard
Date: Mon, 20 Dec 2021 16:53:47 +0800
Message-Id: <20211220085355.2284-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- add r-bs for Dave
- move mig_cmd_args reference later than index bound check [Dave]
- use chars in tracepoints instead of number of steps [Dave]
- add one patch for postcopy-run tracing

Some queued patches for ram disgard cleanup, and some debug probes.

QEMU's ram disgard logic is probably a bit hard to predict because we send a
bunch of packets to notify the disgarded ranges rather than sending the bitmap.
The packets to send depending on the bitmap layout.

Initially I thought it could be a problem but in reality it's fine so far per
my initial measurement.  So I'm flushing the cleanup/trace patches out because
I think they're still helpful.

Please have a look, thanks.

Peter Xu (8):
  migration: Drop dead code of ram_debug_dump_bitmap()
  migration: Don't return for postcopy_chunk_hostpages()
  migration: Drop postcopy_chunk_hostpages()
  migration: Do chunk page in postcopy_each_ram_send_discard()
  migration: Drop return code for disgard ram process
  migration: Dump sub-cmd name in loadvm_process_command tp
  migration: Finer grained tracepoints for POSTCOPY_LISTEN
  migration: Tracepoint change in postcopy-run bottom half

 migration/migration.c  |   5 +-
 migration/ram.c        | 103 ++++++-----------------------------------
 migration/ram.h        |   4 +-
 migration/savevm.c     |  24 ++++++++--
 migration/trace-events |   7 ++-
 5 files changed, 38 insertions(+), 105 deletions(-)

-- 
2.32.0


