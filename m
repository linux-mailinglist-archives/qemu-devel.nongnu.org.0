Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109156C972C
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 19:27:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgU7r-0000lE-RU; Sun, 26 Mar 2023 13:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pgU7p-0000kr-Tx
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 13:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pgU7n-0003jD-TU
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 13:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679851546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4zdSNgok1UVs8IalsDpU8fP4JHx2NiXybE+eDqho1xE=;
 b=MXQr9HChNvRxVvbPkG2WqyjnC9SypHTi0FEd85I7kqr+WVVB57Xpfm6TRv7uoqPMM/3FoK
 fzHRceYcxhYpDMpWZWpmz6oNKm2+InTZ6CK1nPfl5iPfCWTQbo+EL0A7lmWJSufILHDatj
 Tya7FgBQ2WWMVtUSITifjnoxtS1KaL0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-GJpf4XcZNfO5c88vK7O1zw-1; Sun, 26 Mar 2023 13:25:44 -0400
X-MC-Unique: GJpf4XcZNfO5c88vK7O1zw-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-ae8fa653140so52821276.1
 for <qemu-devel@nongnu.org>; Sun, 26 Mar 2023 10:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679851543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zdSNgok1UVs8IalsDpU8fP4JHx2NiXybE+eDqho1xE=;
 b=suyHi75mbJ9Z1wlyapOA1+2kAtXnK92hHe1uFkW81IObXScu26t5+ltNlvuI4kZImU
 CzmSUmDYEvoVoduR0ayMFHofAmBX836vDQgtu5kttU2uudaRb8KITV0LwEva9TQti8vC
 pWB3sJHvqldFjBcJrwR6FFoCTdqc2CHSKH9wLcucQIbiGMuEdVMV7ceDdAHiL/nykbN5
 VOOUDfjjvnwMNhB55+ucdd+p4eyGJgEpEH7S+lLxiTRfALAAxozPesqgFXaZJLFc0iYP
 zaZvzh1V4LF3cqY6W3u+0Qvx2Pze+qIHBro8wAfDYOmMS1e9327zo/xDu8U4++NXKhZs
 UOyQ==
X-Gm-Message-State: AAQBX9dCbLX/6Wtt76oqs6krI5VQN7+c35/hGg8W3XFJOQIkfzDWLX00
 4qhqK7D1tNJCZmHo0y23N+mwtCm46KbabKb0XrSJJQMdRiypTUjMaiMO5+t/Zc2Sx+0jj8O2JnB
 fFo0/1Mr8Tq90AHfzqoiNY7Nkepvh4M/Q5Txw+hzxPfMQEEfb+mf4phjT3GqJ5dzlcofIZaMj
X-Received: by 2002:a81:148a:0:b0:545:618f:d4a with SMTP id
 132-20020a81148a000000b00545618f0d4amr7349803ywu.5.1679851542707; 
 Sun, 26 Mar 2023 10:25:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgA4RXJJEdtD2kHkUhLul2DMyMT8yNvigDP4xmlz5W6KmcjsAC2cy4+cn1sRA5AG0UEAZ9Fw==
X-Received: by 2002:a81:148a:0:b0:545:618f:d4a with SMTP id
 132-20020a81148a000000b00545618f0d4amr7349777ywu.5.1679851542300; 
 Sun, 26 Mar 2023 10:25:42 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a818d08000000b00545a0818501sm1529454ywg.145.2023.03.26.10.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 10:25:41 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH for-8.0 0/3] migration: Preempt mode fixes for 8.0
Date: Sun, 26 Mar 2023 13:25:37 -0400
Message-Id: <20230326172540.2571110-1-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

I'm proposing this patchset for current 8.0 rc material.  If we decide to
merge this we should merge this sooner the better..  If we leave this for
next release then 8.0 release will break with preempt migrations to 7.2-
binaries, then also we need to copy stable when merged.  Currently no
stable backport needed if this can land 8.0 (I still attached Fixes for
each of them just to mark out the issue commits, though).

This patchset target to fix two issues for preempt mode (both of them
should be introduced during 8.0 dev cycle):

(1) The rare s390 crash reported by Peter Maydell and later on reproduced
    by Dave (thanks!), see <ZBoShWArKDPpX/D7@work-vm> on qemu-devel.

(2) Preempt mode migration breakage from 8.0 -> pre-7.2 binaries

The 2nd issue was what I found when testing (1), so I think (2) is even
more severe because it constantly breaks migration from new->old binaries,
depending on how much we care about that.

Patch 1 was a pre-requisite of patch 2 on enabling shutdown() to work on
TLS sockets even on the server side.  Should be something we just
overlooked when having the tls code merged but just never bother because we
never used the server side shutdowns.

Patch 2 targets to fix issue (1).  Dave, I didn't yet attach your T-b due
to the flag change.  I think it'll work the same as old, though.

Patch 3 fixes issue (2) which I checked myself along with patch 2.

Logically patch 1 is not bugfix but still a dependency and I see it low
risk to merge even during rc release cycles.  But please reviewers justify
in case for whatever reason this set is not suitable for 8.0 anymore.

Tests I've done with the whole set applied:

- qtests
- different binary tests for preempt, majorly:
  - 8.0 -> 8.0
  - 7.2 -> 8.0 (mach=pc-q35-7.2)
  - 8.0 -> 7.2 (mach=pc-q35-7.2)

Thanks,

Peter Xu (3):
  io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server side
  migration: Fix potential race on postcopy_qemufile_src
  migration: Recover behavior of preempt channel creation for pre-7.2

 hw/core/machine.c        |  1 +
 io/channel-tls.c         |  3 +++
 migration/migration.c    | 19 +++++++++++++++++--
 migration/migration.h    | 41 +++++++++++++++++++++++++++++++++++++++-
 migration/postcopy-ram.c | 30 ++++++++++++++++++++++-------
 5 files changed, 84 insertions(+), 10 deletions(-)

-- 
2.39.1


