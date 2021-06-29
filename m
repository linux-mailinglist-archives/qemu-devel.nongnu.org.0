Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284FD3B77A6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:16:25 +0200 (CEST)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIHX-0003eU-LV
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyIFJ-0001fh-DW
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyIFG-0000A3-P2
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624990441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CwUGeHATUmw8btZaQCptlZzv51Rakq6qVGtocPf390w=;
 b=SXUscsTTVSugfRBYNy8EVtMPTvqssNPTAGpOHwXWqnpO3wCJUxVfNlTBoNkOMvHFqOk1LV
 aFa3MTJ7dnPBWqQF1ZS9ygZO5jEch7Cyh4d+1hXbE3PmMsSPGpkxV76ydlW5nzaC/hdOrC
 eBM0KJVZS9yTH9uTKJ3YYG1WCFLjOdk=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-21xKsFewM4GAJM3AB61GPg-1; Tue, 29 Jun 2021 14:14:00 -0400
X-MC-Unique: 21xKsFewM4GAJM3AB61GPg-1
Received: by mail-il1-f198.google.com with SMTP id
 m7-20020a924b070000b02901ee89e4ffbfso26277ilg.21
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ftvdIqGiuSR85yP9b7XAPEt0nBi5dIr6Ulbp8ag7QAE=;
 b=cDT1gbmeBp2gjnxKwvtcwDdT3mPnLbVnCmuFF7alG9PlYYDKUvE/6PrkC1Ugt6Jh/T
 hWNP1yBj2GAxm5eoEXGc4M0acjKIhQhgxCSx9BPpJfmp+8z38D7sCN/WfRn2h8cL8HgL
 wVf5WD6vaL3NbWieUeq4A4aOq6Ag/4mTQRfLrNgY7Wo3kX2VFwHZy7NA/1QFnwIdcxR8
 dxOFf9PnKq6eWN6IKn0FPiLny4eW/EZ9b6guG8qu4slRCOhdfDT84rLJOzO0fFqYCtTQ
 8GjSUFgFQIkAn7NdYQk+6jSN0JgNwBxo7jfn/eIdU9kcvWJjAR5xWRLoNh4uX5K+mkZK
 vXGQ==
X-Gm-Message-State: AOAM533jOfZPIIPmajEhwAgIu6+bg9rD03DlHOVX/XFZ5efvAW1u88Wk
 rlcVSYAOm1dNuqf96wAWAz2LMbXRvP5DhBrH8bffElTSzXULeIUnTW/TlOX4yKQFQCFOtmliJEl
 WZ4Mmcynw/r4NTmBYy/ojFQ3V0dhdtnHq3eyKnscjb2u54uy8c1TbGXYUdaM0REVI
X-Received: by 2002:a05:6e02:109:: with SMTP id
 t9mr22598359ilm.235.1624990439157; 
 Tue, 29 Jun 2021 11:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/5Xg6IEAOPqeId2IWuzdf/4hbmvER/2DizpCmS5kDLxmDU4oVxAPtrLfe4scGYHs3P0l99w==
X-Received: by 2002:a05:6e02:109:: with SMTP id
 t9mr22598333ilm.235.1624990438881; 
 Tue, 29 Jun 2021 11:13:58 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i6sm4436824ilm.85.2021.06.29.11.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:13:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] migration: Two fixes around yank and postcopy recovery
Date: Tue, 29 Jun 2021 14:13:54 -0400
Message-Id: <20210629181356.217312-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peterx@redhat.com, Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 1st patch should fix yank with unregister instance; I think it should a=
lso=0D
fix the issue that Leonardo used to fix in this patch:=0D
=0D
https://lore.kernel.org/qemu-devel/20210629050522.147057-1-leobras@redhat.c=
om/=0D
=0D
The 2nd patch fixes postcopy recovery cannot retry if e.g. the 1st attempt=
=0D
provided a wrong port address.=0D
=0D
Note that the multifd zstd test may fail if run migration-test with sudo on=
=0D
master (which seems to be a known issue now), and it'll still fail after th=
ese=0D
two patches applied, however all running tests keep usual.=0D
=0D
(Leo: please let me know if this series didn't fix the issue you used to fi=
x)=0D
=0D
Please review, thanks.=0D
=0D
Peter Xu (2):=0D
  migration: Move yank outside qemu_start_incoming_migration()=0D
  migration: Allow reset of postcopy_recover_triggered when failed=0D
=0D
 migration/migration.c | 24 ++++++++++++++++++------=0D
 1 file changed, 18 insertions(+), 6 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


