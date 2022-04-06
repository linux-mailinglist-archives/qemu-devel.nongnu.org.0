Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973E94F6C52
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 23:14:01 +0200 (CEST)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncCyW-0008Vn-4I
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 17:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCwa-0006a5-1d
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCwX-0004jk-27
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649279516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=hYaTsTAjEQ/y0JwyNELMbaA7P6SLr/Gs4/ZLdcHew4M=;
 b=O1pkjwkRB+OqbZwlqNUigqOu/e0sxgJ4LEMYyQVaWl2H8m3VQmyWv63BU4OCS2VsJh1TDV
 iiPaHh6TbjmJQBwT58uHOYQzdp7P38JeJBUxNiID5kyN+kWdkMmYXCoSsnXNQaTIJ92FXv
 08D36KaKH2hV/LwMn+5ozh+daHlo0C8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-vJGaGbGgNuKBKPBp19M3pQ-1; Wed, 06 Apr 2022 17:11:53 -0400
X-MC-Unique: vJGaGbGgNuKBKPBp19M3pQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso1878196wmq.3
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 14:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=hYaTsTAjEQ/y0JwyNELMbaA7P6SLr/Gs4/ZLdcHew4M=;
 b=alzWeSLyQYayYHd/DsVZLUxThRUYvDXCCpjNRZ6bghO1PIEuxbCY7leh07aDttpOSY
 uBazKBx7kQfZGVyGdmxmsUtv8Z+eqAnDHsUQTm0iJCkw6bnp6bGQ8DuJN+BLuni23zN/
 rjXDNq+YLiHjypgGCfok9yBtrQOw20xnWoUG5gQQyuYyEp7asH4/9E+fDXHKzxN+NQ0q
 BPog2wi3sPgxLTzpCHPMsuILjSTU1dH9HwOxw+/Eo52he1GyGRQ7ylCXFEcmqsSAUgiq
 1POyDI6pHlc+sjRKpyq1Z+C0sQVOMCx6JhaVxf684HJORQKV/ni/pprLQqOqL8/s1tW/
 QBBw==
X-Gm-Message-State: AOAM531Z8Bs7jxSCwQ1iqCO2Y5AbJyQLP55J7aVlzOTO00qutjyokAr4
 2j6ntMUpgVvYfzzshoGaCF7pCctQx0xtOY1TwG6lenYElYi01gyUOlQeFyxSiaw1f6lpgpqnBAO
 uGJiINbEqBpG5OinE8s/oxGVyE8V9PY/ylxRhMuxc4/XaZjLpOVIdVz2/dDLY
X-Received: by 2002:a5d:4a04:0:b0:206:1b72:ada7 with SMTP id
 m4-20020a5d4a04000000b002061b72ada7mr8240161wrq.516.1649279511772; 
 Wed, 06 Apr 2022 14:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVyWFdsqdz+g2cs+hQEEjjV+e8MmMTY5bJ/Yy++RDOpWXb2Ofu/il40/NbGNctIkxoSubP1w==
X-Received: by 2002:a5d:4a04:0:b0:206:1b72:ada7 with SMTP id
 m4-20020a5d4a04000000b002061b72ada7mr8240145wrq.516.1649279511491; 
 Wed, 06 Apr 2022 14:11:51 -0700 (PDT)
Received: from redhat.com ([2.52.15.99]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm7530173wmq.35.2022.04.06.14.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:11:50 -0700 (PDT)
Date: Wed, 6 Apr 2022 17:11:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] virtio,pc: bugfixes
Message-ID: <20220406211137.38840-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 128e050d41794e61e5849c6c507160da5556ea61:

  hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-07 17:43:14 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to f556b9a0cd20d41493afd403fb7f016c8fb01eb3:

  virtio-iommu: use-after-free fix (2022-04-06 17:11:03 -0400)

----------------------------------------------------------------
virtio,pc: bugfixes

Several fixes all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Halil Pasic (1):
      virtio: fix feature negotiation for ACCESS_PLATFORM

Jason Wang (1):
      intel-iommu: correct the value used for error_setg_errno()

Wentao Liang (1):
      virtio-iommu: use-after-free fix

 hw/i386/intel_iommu.c    |  2 +-
 hw/virtio/virtio-bus.c   | 22 ++++++++++++++--------
 hw/virtio/virtio-iommu.c |  1 +
 3 files changed, 16 insertions(+), 9 deletions(-)


