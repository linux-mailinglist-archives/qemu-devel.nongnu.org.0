Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED247EC52
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 07:57:34 +0100 (CET)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0eWC-0004Aa-Ls
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 01:57:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePD-0001BR-9L
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0eP8-0005i8-L5
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640328611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xxehAdMv0U4ikixDA8W3wFBtD+72He39d/3O69WmgbM=;
 b=YS733MD5CMFWqGF+09lzpp4lyG01mnXRRAXPOJZbozpdhTdzWiYaAuezDiuGyL+Q1WvYWm
 mJIPI9wSo3z47bmQPYNVdf2eVxmjORixBzUAMMfuGeB41yihvOiFJHvLvcpYILZgdJJztq
 dH4n0pWmcF/YcYAWWKXuGeFnwGE2ORQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-4zmciqkXPjCJHntulN8wnA-1; Fri, 24 Dec 2021 01:50:10 -0500
X-MC-Unique: 4zmciqkXPjCJHntulN8wnA-1
Received: by mail-wr1-f70.google.com with SMTP id
 o20-20020adfa114000000b001a2abc089d8so1443880wro.4
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 22:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xxehAdMv0U4ikixDA8W3wFBtD+72He39d/3O69WmgbM=;
 b=XFSpJTqTnV/5QM7kT6TUE3WacLiYJw2nuXY1yHjqEk969U66Fjl2sqCWXbT2slI1D5
 b7n3WY5+cpJyg9R5SJXrN1/FPJi+0YhajAGf4vmE63YHZz7U9omS3bujx8tLcgDDjZET
 ejH4dsyOXNCo/yE24d8l/8pbzkcAMSqqZffHwoJ0IuoanMSM75nGHQZPkcNFhAHkF7tf
 AaCdJyrO09euy5Xj6NCII0B0JeCmsSHxuwJh9kPsJJoB1w4/r2J5AaLxd3Caqd/POI4a
 p3yZ2L2C1bPN1qSvbpW8j9FVOSDMpC9E7Q+KmjQ7OvcnQiD5WUgZJWQPq31V7RgWdimG
 fJnw==
X-Gm-Message-State: AOAM530B8bOm+d2AdVemaUkd4Z7q5ochj9yoXEnS/jtbvXOH4D78wOP1
 L8LVMCm+XjRo5CvPwrfa+l8uPPdng2KsY3gLqPBRdBXNU2HGV7XvslkDmoj1w2+5OosxRQIu4n0
 g6RiN6Zk8FWtwyH2F2P/YJdpfFuyxOvPPX0+MqNEd3irvnsNHDl1t5syD6i4EhbQm
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr3827928wrd.234.1640328608804; 
 Thu, 23 Dec 2021 22:50:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbO5DnENHVR1oPvLQ3ByVf5Unt73qayTUk+J6HSlryl6F/16TBKbbDIfyVCmCAe5kpB8unnw==
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr3827915wrd.234.1640328608489; 
 Thu, 23 Dec 2021 22:50:08 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id h14sm2174425wmq.16.2021.12.23.22.50.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Dec 2021 22:50:08 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] migration: Postcopy cleanup on ram disgard
Date: Fri, 24 Dec 2021 14:49:52 +0800
Message-Id: <20211224065000.97572-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
- s/disgard/discard/, s/exit/return/ [DavidE]

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


