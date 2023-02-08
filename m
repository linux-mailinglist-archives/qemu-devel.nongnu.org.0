Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D6C68F8D0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr3H-0003QE-6w; Wed, 08 Feb 2023 15:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPr3F-0003Pu-E1
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:28:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPr3D-00048i-KK
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oaLu5JeXKA764wdFJ9O0Oog5UEyXrQ+yC82IkQKE628=;
 b=Z0WN2ooVMTiJyzKBUpCnp6cwN73+r4KNEAyh/J/Z13bqFEzk9ZVa8rYW3Hr2YwYpvrizWo
 IcmDGz5s/EA7m/itgrTnKv6yXGwruhQeaFedB7k0/5d2smPj2rXnyPfchoenTQO5ARdV6O
 D+H9VRO8xWn7sOBlyF+7SJm0eQOZG0g=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-8kcAmU3XO12W-TfT01_Kfw-1; Wed, 08 Feb 2023 15:28:17 -0500
X-MC-Unique: 8kcAmU3XO12W-TfT01_Kfw-1
Received: by mail-qv1-f72.google.com with SMTP id
 w2-20020a0cc702000000b0055c8ef137ddso31540qvi.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oaLu5JeXKA764wdFJ9O0Oog5UEyXrQ+yC82IkQKE628=;
 b=7pwzbr+1RdsfH0shDm1xWLB6Vn4jM0bXss4CHZmcgjy3tBbfx/+ygSAMor1SYT4QRH
 3eu6+jvpKPaEIodlfGBXemxj65J9rqZEmJzz9dhZKbx26Ldz+DfnH0BTCg/NRx3z0xZj
 XdB0jtmttZEUARp22cYIttlxgyUkWQeUO5IyQWjguCYla84L1BvLn8mAlxQn/pbeUp1U
 kibFoAiMyjzIDHmyzZcTQJFCSyccnherYKJVBDSU4dBCGiTn9DGxKgnpJSvfjw9ClYr9
 a7MtnlhcM21lksTM6m0RnebC8LBD45+iqYjCRT6ZWsj2JB7CoczK0l05T08BYAousoYu
 XNGw==
X-Gm-Message-State: AO0yUKX3DOA49/ICYiqP/S6nWBpS0IlsCygS3Uf4cfIJcwLA8NJyZpzK
 SBruLm2XiE6TI4IVBRqrDbxlvmB8s4ZxVjmFdMMl8c1A9ipvSlK6jjZ6mnMPnlKr9DN6wRNH1GV
 obQDm7xBy04bdyX853NLLfzFYaWVZ7Z6L5qf7M/ieO2gYKH2Tje5g2vngZzbaHnSZ/ksDaw==
X-Received: by 2002:ac8:59c1:0:b0:3b8:6c6e:4949 with SMTP id
 f1-20020ac859c1000000b003b86c6e4949mr16602688qtf.4.1675888095827; 
 Wed, 08 Feb 2023 12:28:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/EDVqvRR37qZ0pbef22Gc5FFlX+ptzg2zqi7CGgsRhVmL3Xo3ZmM+Xs0QBZXJKTnZv16qsjw==
X-Received: by 2002:ac8:59c1:0:b0:3b8:6c6e:4949 with SMTP id
 f1-20020ac859c1000000b003b86c6e4949mr16602645qtf.4.1675888095495; 
 Wed, 08 Feb 2023 12:28:15 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a37e204000000b0070d11191e91sm12287144qki.44.2023.02.08.12.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 12:28:14 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v3 0/4] migration: Fix disorder of channel creations
Date: Wed,  8 Feb 2023 15:28:09 -0500
Message-Id: <20230208202813.1363225-1-peterx@redhat.com>
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

v3
- Fix indent for uri_supports_multi_channels() [Juan]
- Rename migration_uri_validate() to migration_channels_and_uri_compatible() [Juan]
- Separate the changes to migrate_postcopy_preempt() into separate patch [Juan]

I can trigger disordered connections with preempt mode postcopy (1 out of a
few attemps), which can cause migration to hang during precopy phase, if
e.g. I set the NIC packet loss rate to 50%.

The last patch fixes the real ordering issue.  For each of the patch,
please refer to the commit message and comments in-code.

Any comment welcomed, thanks.

Peter Xu (4):
  migration: Rework multi-channel checks on URI
  migration: Cleanup postcopy_preempt_setup()
  migration: Add a semaphore to count PONGs
  migration: Postpone postcopy preempt channel to be after main

 migration/migration.c    | 122 ++++++++++++++++++++++++++-------------
 migration/migration.h    |  15 ++++-
 migration/multifd.c      |  12 +---
 migration/postcopy-ram.c |  31 +++++-----
 migration/postcopy-ram.h |   4 +-
 migration/savevm.c       |   6 +-
 6 files changed, 118 insertions(+), 72 deletions(-)

-- 
2.37.3


