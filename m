Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA025C558
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 17:28:33 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDrA8-0001vp-B1
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 11:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDr8Z-00005P-QS
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:26:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDr8X-0000D2-Hy
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599146811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ela2dBsFTykng41E7aq8ufboQddcW9Vw3rt4nAA9llc=;
 b=NmBA/tLwcGlf7+DolVNF+vjFC2O1T/B4z1OKNvJQIpcS+f1+nxEXXnXNSJYrWA7t7gtRNq
 LlE0siZqXIyvaboaiUEC6+2n8513sWTCmTHNEcVsws4r2QEkqwY+O/ejdrrNTFdxbTGyog
 hh3jX1dz5a+9KiyhO5qSJjDEA1djY8k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-PzFLLFYNPt2NdoVYgWtc3A-1; Thu, 03 Sep 2020 11:26:50 -0400
X-MC-Unique: PzFLLFYNPt2NdoVYgWtc3A-1
Received: by mail-qt1-f198.google.com with SMTP id p43so2316856qtb.23
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 08:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3SM1TLg7mC0rr1rHdWGbz6H72rDytERpF/kUaa062o=;
 b=gVaopB5+FZxZTsjwCPX5wKSQTsOhRKhLYubo/VtGHAdbnvaaNOT3Fv7x4uB4hqtUtx
 R7zb2tK3aWzV235gOfKhzR0NcHlXLVPbB7rxLJm9LPiAUImFNaGbkkenDBHW55gAnBzN
 f5gRlL8YW3tXL1PXuKoT5yPkrerJoX5KdF8Apvc400uClO3reNuo7ah2tF1BHm2mGuOG
 yB4lGdhRG7PVbjJJzCN8EAs/l28bxJWYyKiPrb7axChzRFLUCTrQUEfxsZqACh4qTJNs
 m5a0PU8cNM8fXDZkljpPwbzuPFXpgc4hFukdhkknbEewOFmFWvxIY9QuVS6T1g40vEzH
 kgIw==
X-Gm-Message-State: AOAM5308Unkhq4jKhiy5lSOcSfk9UNVPrsoufe7F8UZnriltYs7DYFpi
 tclDLPf0dHwJ3pvy2Q+86BHjkd04g843p0Gr8OjTAgFlwL6NL0AS/Jk2MRpQvMds+EI6pEq1BP+
 HmUWW1JKWg3+4HBM=
X-Received: by 2002:a0c:f704:: with SMTP id w4mr3405823qvn.79.1599146809262;
 Thu, 03 Sep 2020 08:26:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzie40GufkAiG2wB9/ghcnWlZjQAdKItcDtuKIH89E1hW3AauedPSR02MHTKsYN86G8RIO61Q==
X-Received: by 2002:a0c:f704:: with SMTP id w4mr3405794qvn.79.1599146808945;
 Thu, 03 Sep 2020 08:26:48 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca. [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id l38sm2319889qtl.58.2020.09.03.08.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 08:26:47 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] migration/postcopy: Sync faulted addresses after network
 recovered
Date: Thu,  3 Sep 2020 11:26:41 -0400
Message-Id: <20200903152646.93336-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Xiaohui Li <xiaohli@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've seen conditional guest hangs on destination VM after postcopy recover=
ed.=0D
However the hang will resolve itself after a few minutes.=0D
=0D
The problem is: after a postcopy recovery, the prioritized postcopy queue o=
n=0D
the source VM is actually missing.  So all the faulted threads before the=
=0D
postcopy recovery happened will keep halted until (accidentally) the page g=
ot=0D
copied by the background precopy migration stream.=0D
=0D
The solution is to also refresh this information after postcopy recovery.  =
To=0D
achieve this, we need to maintain a list of faulted addresses on the=0D
destination node, so that we can resend the list when necessary.  This work=
 is=0D
done via patch 1-4.=0D
=0D
With that, the last thing we need to do is to send this extra information t=
o=0D
source VM after recovered.  Very luckily, this synchronization can be=0D
"emulated" by sending a bunch of page requests (although these pages have b=
een=0D
sent previously!) to source VM just like when we've got a page fault.  Even=
 in=0D
the 1st version of the postcopy code we'll handle duplicated pages well.  S=
o=0D
this fix does not even need a new capability bit and it'll work smoothly on=
 old=0D
QEMUs when we migrate from them to the new QEMUs.=0D
=0D
Please review, thanks.=0D
=0D
Peter Xu (5):=0D
  migration: Rework migrate_send_rp_req_pages() function=0D
  migration: Introduce migrate_send_rp_message_req_pages()=0D
  migration: Pass incoming state into qemu_ufd_copy_ioctl()=0D
  migration: Maintain postcopy faulted addresses=0D
  migration: Sync requested pages after postcopy recovery=0D
=0D
 migration/migration.c    | 71 +++++++++++++++++++++++++++++++++++-----=0D
 migration/migration.h    | 23 +++++++++++--=0D
 migration/postcopy-ram.c | 46 +++++++++++---------------=0D
 migration/savevm.c       | 56 +++++++++++++++++++++++++++++++=0D
 migration/trace-events   |  3 ++=0D
 5 files changed, 163 insertions(+), 36 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


