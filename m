Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9D3EE3B8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 03:36:59 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFo2E-0007tb-41
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 21:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFo1I-0007DR-Ja
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFo1H-0001L0-4S
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629164158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+W16UANu4YazlgM/m0Jfvt4RZ6mLvbdLBD8SbNKOG90=;
 b=RdtTuevPlvP8t1rDbY3kcQkdqtlju0AJEpE/BQURRZVGiSccVBM9tVA6R+vV5XfHrs8S2W
 EOgk1KPD3yNjPvkPCtJMSFPpeamDjabtDbko9pOKg3SL+A6HseMuWUoIhjluPEzOo0KXO6
 eKws3389fMwEK7celZ0n5WicdbkAucI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-oj1SJgDvOU2U9EiYHrj6kg-1; Mon, 16 Aug 2021 21:35:56 -0400
X-MC-Unique: oj1SJgDvOU2U9EiYHrj6kg-1
Received: by mail-qt1-f200.google.com with SMTP id
 g17-20020ac870d10000b02902928f62e229so10302214qtp.18
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 18:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+W16UANu4YazlgM/m0Jfvt4RZ6mLvbdLBD8SbNKOG90=;
 b=eKZ0m7jVd8hgvZkzCfvikBnwxBDjXQ9gXK4KtT1wvDm+n3xUyXdyPyr0sC6EjC2nlb
 R57udBYq3572of6soEV/rnDHlDTNHN5/3bRRTccqOYpvJXOle9cDeOQPkGBWUTw7L+/k
 buMAstynvoX2WHW7qKoe5gt22mcB9k3swaATHOL2St/O42EvEK8i8DxjF2NHrFoHM2BZ
 QKPPmF8aGb4F3vt+jzzJltXXbdZQdHmR6uGy15U5QVIOcSrEkW2XOGTL6K4jnP0y0l8A
 F40xvDmQm/Dobf21O0qit/hDULBsTo+ajoddvCnNpYwhBj18tS/FDVtEP22cs4bX1/0O
 TGYw==
X-Gm-Message-State: AOAM532lkV33M2wVwrT7zLTw8ma+eSV1yQDvu0q9u24CRVme+RF94/i+
 /U8MmN15G0L2sO3ekuhiMyOiHjhj+CXx1grqMl41taeg28WjrOp22rZutButVcO/AJJ783TvQsj
 LQZ3R5+wtGcFgpYPHQ7CxDvSK+23lDd7JqujUj+HbpWw3eaxu8chJmUPCs319VJFF
X-Received: by 2002:ac8:5984:: with SMTP id e4mr878132qte.228.1629164155841;
 Mon, 16 Aug 2021 18:35:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/VwyyruSbqIT3tFDL4tOsOj2kQ8dP/KGM91Vniq0ZqeboEVis0WVqGEtw5hyk0+kyVf3yjg==
X-Received: by 2002:ac8:5984:: with SMTP id e4mr878103qte.228.1629164155515;
 Mon, 16 Aug 2021 18:35:55 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id b15sm391867qka.107.2021.08.16.18.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:35:54 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 0/2] memory: Add tracepoints for log_sync
Date: Mon, 16 Aug 2021 21:35:51 -0400
Message-Id: <20210817013553.30584-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[this is a resend to hopefully drop '\r' in cover letter caused by git-publish
 that I should have just fixed; nothing changed inside]

It can help to identify which step is slow for migration dirty sync process.
We have migration_bitmap_sync_* trace events but it's still a bit coarse.

This should help us to cut migration_bitmap_sync() into finer grained small
steps when measurement is needed.

Please review, thanks.

Peter Xu (2):
  memory: Name all the memory listeners
  memory: Add tracepoint for dirty sync

 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-all.c               | 7 +++++--
 hw/i386/xen/xen-hvm.c             | 2 ++
 hw/intc/openpic_kvm.c             | 1 +
 hw/remote/proxy-memory-listener.c | 1 +
 hw/vfio/common.c                  | 1 +
 hw/vfio/spapr.c                   | 1 +
 hw/virtio/vhost-vdpa.c            | 1 +
 hw/virtio/vhost.c                 | 2 ++
 hw/virtio/virtio.c                | 1 +
 hw/xen/xen_pt.c                   | 2 ++
 include/exec/memory.h             | 8 ++++++++
 include/sysemu/kvm_int.h          | 2 +-
 softmmu/memory.c                  | 2 ++
 softmmu/physmem.c                 | 1 +
 softmmu/trace-events              | 1 +
 target/arm/kvm.c                  | 1 +
 target/i386/hax/hax-mem.c         | 1 +
 target/i386/kvm/kvm.c             | 2 +-
 target/i386/nvmm/nvmm-all.c       | 1 +
 target/i386/whpx/whpx-all.c       | 1 +
 21 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.31.1


