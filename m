Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E66888F6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:26:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNh4u-0007ty-TY; Thu, 02 Feb 2023 16:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNh4t-0007tl-BE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 16:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNh4r-0006vB-L6
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 16:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675373103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Sn0gB2CPH/KZx3/WN3xZkV1rWmuGEjaUYvB3+uushGE=;
 b=FiGuIQIn6sECTDZrKOzpWCpkik29CxBIBHMTYVUnvMv90VGleEFfii86Ul0G+3LSv27taF
 bWYLDhzJwOCK/CoLSmkyAXWKc3/I7zHp2zuhtIDLMSM3kVOuf8lzyWh1i+AZbJFPVnt57E
 TtMg/4Yia9HMsotcPT3oGki3U5sIA3A=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-sKdsk5ZgMEGld8QwZPbnTg-1; Thu, 02 Feb 2023 16:25:02 -0500
X-MC-Unique: sKdsk5ZgMEGld8QwZPbnTg-1
Received: by mail-qv1-f71.google.com with SMTP id
 w2-20020a0cc702000000b0055c8ef137ddso1696056qvi.0
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 13:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sn0gB2CPH/KZx3/WN3xZkV1rWmuGEjaUYvB3+uushGE=;
 b=Vq/iEo1Stq7vTn9amEuJNl6iNRrlPLDOsrOHserjeikR0q+intS7I2N3iVeXuyo0aD
 YbxSQDgP9jpRMhTasZCqNk1n7C2jd3fjC4/itz5w1nKKyRT8xRUG2dJRyABVvBJrEaN4
 Wl5c+/TCwtPiBqfBYKQXy4AsyFphGdkFU+Ew7zg/orzzZwddmO2lmfSHgaa1k1sTiclB
 4KVbF4llgbJn+7QZp36Flk1nlvmObSOGcvUpAs35QiVlHX6CvXPfpCwT255Wbi1flT/8
 i6l7qZ48HhgX2+XSqwtmfumhcQF9gCD2GqsdCh8wKJOQ06XKzX0ZX79mYHw2Ex8+U++9
 oTHQ==
X-Gm-Message-State: AO0yUKUmnEGXotkozLv84BxavtoQ7A4mRqJWaCa3Q84DOTqwIQZBOl8S
 8swVWSJOzZf3MTVmNdfChACHeDg2Zs1IrxQJUk0Fj1Y7fOVcYaKQplKaCsukkICPLo5kSrqfHHf
 LILjHgp8NfuMPgx6gQ9UNMzsvvTrRXt82VsqRuyyv+OQEf8mBsSGtzBG7Cq+SiCx2
X-Received: by 2002:a05:622a:1e10:b0:3b8:68df:fc72 with SMTP id
 br16-20020a05622a1e1000b003b868dffc72mr12277703qtb.2.1675373101037; 
 Thu, 02 Feb 2023 13:25:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8gjzZyrz9nTRHjSutgEIZptKNzUj3Iy0avvqVhPQzfRvx9hCS6GyadqHWe5/whG3Adhc7ZEg==
X-Received: by 2002:a05:622a:1e10:b0:3b8:68df:fc72 with SMTP id
 br16-20020a05622a1e1000b003b868dffc72mr12277664qtb.2.1675373100667; 
 Thu, 02 Feb 2023 13:25:00 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05620a210c00b00725fd2aabd3sm508645qkl.1.2023.02.02.13.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 13:25:00 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: [PATCH v2 0/3] migration: Fix disorder of channel creations
Date: Thu,  2 Feb 2023 16:24:55 -0500
Message-Id: <20230202212458.726496-1-peterx@redhat.com>
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

This patchset is rebased to Juan's latest pull request:
Based-on: <20230202160640.2300-1-quintela@redhat.com>

I can trigger disordered connections with preempt mode postcopy (1 out of a
few attemps), which can cause migration to hang during precopy phase, if
e.g. I set the NIC packet loss rate to 50%.

Patch 1 is IMHO a cleanup that I'd think good to have even without patch
2/3.  Patch 3 actually fixes the ordering issue.  For each of the patch,
please refer to the commit message and comments in-code.

Any comment welcomed, thanks.

Peter Xu (3):
  migration: Rework multi-channel checks on URI
  migration: Add a semaphore to count PONGs
  migration: Postpone postcopy preempt channel to be after main

 migration/migration.c    | 121 ++++++++++++++++++++++++++-------------
 migration/migration.h    |  15 ++++-
 migration/multifd.c      |  12 +---
 migration/postcopy-ram.c |  31 +++++-----
 migration/postcopy-ram.h |   4 +-
 migration/savevm.c       |   6 +-
 6 files changed, 117 insertions(+), 72 deletions(-)

-- 
2.37.3


