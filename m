Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799395BF1D7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:14:37 +0200 (CEST)
Received: from localhost ([::1]:54816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanNs-0001Ya-Kk
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5D-0003i5-10
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5A-0001QE-Lb
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=20n+HqHIDt4XMNU3hK6k/ngTrHInght+RhwNTmzdlCg=;
 b=aJPWZb+Zb43FtU3ZrMCfGyQw2bnvjuk8SlIwz9osVll0eMrV3gnhuOd+S9zMVPr5abYMHX
 vRjb352+9iVEzYZOxNUzSCxN7fwAVZye5jdkFnTcia3YO/vcsgEKbB36/xDjjc6hawvk0r
 +GEQTqvKrgzR68wRYxjAmCAPbN0sg6A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-CusPfuOcNJWoAHq6b0Exag-1; Tue, 20 Sep 2022 18:51:10 -0400
X-MC-Unique: CusPfuOcNJWoAHq6b0Exag-1
Received: by mail-qv1-f70.google.com with SMTP id
 y7-20020ad45307000000b004ac7fd46495so3057020qvr.23
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=20n+HqHIDt4XMNU3hK6k/ngTrHInght+RhwNTmzdlCg=;
 b=cDaXb+DQSRP6LPmEbL/raltJxUvkwibHyYtpsBV+pUc3pNo/Csu+fXLkeogFe3FPEI
 xSw0IoTCcOyIIdBlBYtjEzVudClpn6lM/iCE0Y+HpJ31EFPgvZd1lAcYZ5DbFUJNSgzb
 XaBD3QIRZ2EOv0H6E5S8HAcRMc3mnQc+2lnV18WTy7soo8XZEDbAqXJPjBBcP4tZmybZ
 tqfQDSKieRWoR+fOKkvxKa00fMlOdw5WQJYe0q4AU3fAoDEmOKt+iyw2cV5JF1Ku28uL
 zWEfTjKoIXSGdr5+G/nXPstm7WTLVeyz+s/c5uYyqelfABWkxYtp18bPYTJ2Nq5Cu42O
 97Ww==
X-Gm-Message-State: ACrzQf1QOuUwojn6CSJ5V0a+SPgACU42SzVCrxDZsXShxKHwgrkousfP
 TzOBQw0GanjRrs9ZKMpA/xQHyUUtUZVId1We4qJ3/U2KtNmuryMkfV2mUUASwFh02UtZPDAPT3J
 9mVRuR8864j4y4dXjNrVfoAfiEXgicsMmDUY9AZcorsXOPDvBA+khkZQ1PmPHr/Sm
X-Received: by 2002:a05:622a:c5:b0:35c:f238:b0a4 with SMTP id
 p5-20020a05622a00c500b0035cf238b0a4mr7776535qtw.92.1663714269838; 
 Tue, 20 Sep 2022 15:51:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BJoXQOUwRrD6hk9ivLXXNVAVGRoNDFvhcCkPn9z4Qud9ofvFBM5MMM+EtV6WnIxnz2GVNTA==
X-Received: by 2002:a05:622a:c5:b0:35c:f238:b0a4 with SMTP id
 p5-20020a05622a00c500b0035cf238b0a4mr7776488qtw.92.1663714268797; 
 Tue, 20 Sep 2022 15:51:08 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac8440c000000b0035d0655b079sm275470qtn.30.2022.09.20.15.51.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:51:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 00/14] migration: Postcopy Preempt-Full
Date: Tue, 20 Sep 2022 18:50:52 -0400
Message-Id: <20220920225106.48451-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220920223800.47467-1-peterx@redhat.com>
  [PATCH 0/5] migration: Bug fixes (prepare for preempt-full)

Tree is here:
  https://github.com/xzpeter/qemu/tree/preempt-full

RFC:
  https://lore.kernel.org/qemu-devel/20220829165659.96046-1-peterx@redhat.com

This patchset is the v1 formal version of preempt-full series.  The RFC tag
is removed as more tests was done, and all items mentioned in the TODO
items previously in the RFC cover letters are implemented in this patchset.

A few patches are added. Most of the patches are still the same as the RFC
ones but may have some trivial touch ups here and there.  E.g., comment
touch-ups as Dave used to suggest on bitmap_mutex.  If to have a look on
the diff stat we'll see mostly "+" is the same as "-" this time though,
because with the rp-return thread change we can logically drop a lot of
complicated preempt logic previously maintained in migration thread:

  3 files changed, 371 insertions(+), 399 deletions(-)

Feel free to have a look at patch "migration: Remove old preempt code
around state maintainance" where we dropped a lot of old code on preempt
state maintainance of migration thread (but the major part of the preempt
old code still needs to be there, e.g. channel managements) along with the
break-huge parameter (as we never need to break-huge anymore.. because we
already run in parallel).

Comparing to the recently merged preempt mode I called it "preempt-full"
because it threadifies the postcopy channels so now urgent pages can be
fully handled separately outside of the ram save loop.

The existing preempt code has reduced ramdom page req latency over 10Gbps
network from ~12ms to ~500us which has already landed.

This preempt-full series can further reduces that ~500us to ~230us per my
initial test.  More to share below.

Note that no new capability is needed, IOW it's fully compatible with the
existing preempt mode.  So the naming is actually not important but just to
identify the difference on the binaries.

The logic of the series is simple: send urgent pages in rp-return thread
rather than migration thread.  It also means rp-thread will take over the
ownership of the newly created preempt channel.  It can slow down rp-return
thread on receiving page requests, but I don't really see a major issue
with it so far but only benefits.

For detailed performance numbers, please refer to the rfc cover letter.

Please have a look, thanks.

Peter Xu (14):
  migration: Add postcopy_preempt_active()
  migration: Cleanup xbzrle zero page cache update logic
  migration: Trivial cleanup save_page_header() on same block check
  migration: Remove RAMState.f references in compression code
  migration: Yield bitmap_mutex properly when sending/sleeping
  migration: Use atomic ops properly for page accountings
  migration: Teach PSS about host page
  migration: Introduce pss_channel
  migration: Add pss_init()
  migration: Make PageSearchStatus part of RAMState
  migration: Move last_sent_block into PageSearchStatus
  migration: Send requested page directly in rp-return thread
  migration: Remove old preempt code around state maintainance
  migration: Drop rs->f

 migration/migration.c |  47 +--
 migration/multifd.c   |   2 +-
 migration/ram.c       | 721 ++++++++++++++++++++----------------------
 3 files changed, 371 insertions(+), 399 deletions(-)

-- 
2.32.0


