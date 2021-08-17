Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C483EE396
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 03:33:26 +0200 (CEST)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFnym-0004Sf-LU
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 21:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFnx0-0002WI-BK
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFnwx-0006tr-8k
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629163888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pE7P3agLwOPWluVBb52078lhqX+AT6WhfeZcXU0THwA=;
 b=IItoSyEBt15xmO+cry7TpQ6aA+cXjEZ6nV9JevknxQGz6tVVhPHllgnVfOsj0nV9mZAlxg
 VZlcFl21UMaUs7dkLQ5mMWIrQu4L0ZSsBf8tO8v9R+rgUpWfp83m2femDZMVkjyfPVScSe
 r3ZCFPbB3dg7YDvKkOiIpM3F0Nf/jC0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-8L4ZdekrM_CcISsrn9Z3vQ-1; Mon, 16 Aug 2021 21:31:25 -0400
X-MC-Unique: 8L4ZdekrM_CcISsrn9Z3vQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 u6-20020ad448660000b02903500bf28866so14267149qvy.23
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 18:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mZHGMz0PYEkVRRihmO/6l0rPZNE0rL06N2jq/pzDmyU=;
 b=r22SWOSLQzCPNjH49nb4thzOkebbCAOvi7o5ieC7bz03ZWOfb03ffhORdPVx59SK37
 x6tAunYw82g6jTcrKNuIFmeFh5M4Bk8blb0b48p0igrSS3nTHL+d4eW95jYGdqeC+DI0
 ryzNoaBI4GDpplWVNf0MNerKft9tdkDyVlLEp78lp8KM0Z6yiXEw33Be0ncpHW2dMFzO
 ranNOXNUfwimBJd9AK7QbP9amekbgdedXerDggwYBM3lj/NiWqsg8m16uJrhz0mXkP5u
 gjtqwqsz1NapUnudF3/FU/kaOe1IOOzFxraTzNXt4JguD/wMLCbVKl6nWv3xeNXhxi3F
 l8Pg==
X-Gm-Message-State: AOAM5336iKZ67CL0MnDjMHFrbmnD69TTN8YQ1i8UrQSvvysblNmDRgfv
 JCmFS8eADCBVM74cQgrPRYqNoHjJ3O+bZDjQgVc25pq8MWuxNttUWArihyIzaRUAXXjOmfPpIfX
 DghvyoTWiRABgKMizvQ2X3uAhYlQEqet6rmI3LPlCdBZfzGFONNXntIm7Dcf95ob/
X-Received: by 2002:a37:652:: with SMTP id 79mr1311963qkg.197.1629163884863;
 Mon, 16 Aug 2021 18:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGuAjNcTSl0516LtaTUkCJUP1C/dmKGiXWV6B1D2qcm+TEcb8320JHoLGERDRDyrNAwj61hQ==
X-Received: by 2002:a37:652:: with SMTP id 79mr1311929qkg.197.1629163884495;
 Mon, 16 Aug 2021 18:31:24 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id y185sm423384qkb.36.2021.08.16.18.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:31:23 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] memory: Add tracepoints for log_sync
Date: Mon, 16 Aug 2021 21:31:19 -0400
Message-Id: <20210817013121.29941-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

It can help to identify which step is slow for migration dirty sync process=
.=0D
We have migration_bitmap_sync_* trace events but it's still a bit coarse.=
=0D
=0D
This should help us to cut migration_bitmap_sync() into finer grained small=
=0D
steps when measurement is needed.=0D
=0D
Please review, thanks.=0D
=0D
Peter Xu (2):=0D
  memory: Name all the memory listeners=0D
  memory: Add tracepoint for dirty sync=0D
=0D
 accel/hvf/hvf-accel-ops.c         | 1 +=0D
 accel/kvm/kvm-all.c               | 7 +++++--=0D
 hw/i386/xen/xen-hvm.c             | 2 ++=0D
 hw/intc/openpic_kvm.c             | 1 +=0D
 hw/remote/proxy-memory-listener.c | 1 +=0D
 hw/vfio/common.c                  | 1 +=0D
 hw/vfio/spapr.c                   | 1 +=0D
 hw/virtio/vhost-vdpa.c            | 1 +=0D
 hw/virtio/vhost.c                 | 2 ++=0D
 hw/virtio/virtio.c                | 1 +=0D
 hw/xen/xen_pt.c                   | 2 ++=0D
 include/exec/memory.h             | 8 ++++++++=0D
 include/sysemu/kvm_int.h          | 2 +-=0D
 softmmu/memory.c                  | 2 ++=0D
 softmmu/physmem.c                 | 1 +=0D
 softmmu/trace-events              | 1 +=0D
 target/arm/kvm.c                  | 1 +=0D
 target/i386/hax/hax-mem.c         | 1 +=0D
 target/i386/kvm/kvm.c             | 2 +-=0D
 target/i386/nvmm/nvmm-all.c       | 1 +=0D
 target/i386/whpx/whpx-all.c       | 1 +=0D
 21 files changed, 36 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


