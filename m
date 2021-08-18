Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445573F0C52
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:00:34 +0200 (CEST)
Received: from localhost ([::1]:48524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRjj-0001ta-QI
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRSC-0007pI-SB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRSB-00071l-37
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629315741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kpDpeyz473u7imbDos9X86Rl8gRlDt6Q3AuNXvOdrm4=;
 b=Zpp9WL3gWSfx4MX849hw+S3fX3+2bQqh2aCiHBfD8lguIDebEsedx56F+8jkOdByHZr5nK
 l9AvnGnT5/TbT19AVf+umUGFV2nYI/lR00/SypbTeQN3lp4tEXU5w2f3/dqtBTJ7zJXehh
 POjs+sp2CLyEtU3oBcz2q2X+w0ShoJg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545--kH2vUkfPtqcyxlWdVBVdA-1; Wed, 18 Aug 2021 15:42:20 -0400
X-MC-Unique: -kH2vUkfPtqcyxlWdVBVdA-1
Received: by mail-qk1-f200.google.com with SMTP id
 62-20020a3706410000b02903d2cdd9acf0so2496864qkg.21
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kpDpeyz473u7imbDos9X86Rl8gRlDt6Q3AuNXvOdrm4=;
 b=nCoAckNhLygKkFm2SsU1AAsttlCM41EYIUQyNxScUd2I+gy4B/kvdEcJFUeZcGxFVW
 LCz4HbxMrVTqxcJKp2ZgGhq3GULEUaWaHsK5Szz5XzXzsOL5kuQfPfNGWKaOnNWKTy0r
 Fx6W+u/5kVRs6bvkPnWTYhhVXDV4mcG6vVfUSz4vr1QpRuvljt45r7eCF4J2eMyjNaN6
 VrTypTh/LNVBVGHQZaaohf9XE2Bz7uL+cYSM1ymXuTvW5tBbQ4WM8TJfRJsmMtW07Xcr
 8PoGjQL6QgXF1X/TPntf79ESNq6l3BUr/xKo4XJoejsyuiIgJ7VidFGY2K0qbDU2p+Vb
 qZKw==
X-Gm-Message-State: AOAM530Gw567mBsDqfiiI9vOkbrGzcGvNIcaTsQE24aCKU7KllC7evOa
 nVXo7VOJ9DOgtlGxqzhlUzTWAaLg0rSq7GkVtXmGi/XiLD+6dMQvWIw7T3V1+OufzKLNJqqKCPW
 H7p98Scukj6VDd059P7LTbbXkUHslyHQk5EbANavUB4LzsHv0SQLauEfHeG4HnWao
X-Received: by 2002:a05:622a:5d3:: with SMTP id
 d19mr9311467qtb.211.1629315739857; 
 Wed, 18 Aug 2021 12:42:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH8IRPX4K8zGbglPszulodpzYji9uOcZyQGaYzEhR3a7+Grhe6DNhMqZ3XnNerMluLXvej7Q==
X-Received: by 2002:a05:622a:5d3:: with SMTP id
 d19mr9311439qtb.211.1629315739536; 
 Wed, 18 Aug 2021 12:42:19 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id y185sm419779qkb.36.2021.08.18.12.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:42:18 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] vl: Prioritize device realizations
Date: Wed, 18 Aug 2021 15:42:13 -0400
Message-Id: <20210818194217.110451-1-peterx@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 peterx@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a long pending issue that we haven't fixed.  The issue is in QEMU we
have implicit device ordering requirement when realizing, otherwise some of the
device may not work properly.

The initial requirement comes from when vfio-pci starts to work with vIOMMUs.
To make sure vfio-pci will get the correct DMA address space, the vIOMMU device
needs to be created before vfio-pci otherwise vfio-pci will stop working when
the guest enables the vIOMMU and the device at the same time.

AFAIU Libvirt should have code that guarantees that.  For QEMU cmdline users,
they need to pay attention or things will stop working at some point.

Recently there's a growing and similar requirement on vDPA.  It's not a hard
requirement so far but vDPA has patches that try to workaround this issue.

This patchset allows us to realize the devices in the order that e.g. platform
devices will be created first (bus device, IOMMU, etc.), then the rest of
normal devices.  It's done simply by ordering the QemuOptsList of "device"
entries before realization.  The priority so far comes from migration
priorities which could be a little bit odd, but that's really about the same
problem and we can clean that part up in the future.

Libvirt can still keep its ordering for sure so old QEMU will still work,
however that won't be needed for new qemus after this patchset, so with the new
binary we should be able to specify qemu cmdline as wish on '-device'.

Logically this should also work for vDPA and the workaround code can be done
with more straightforward approaches.

Please review, thanks.

Peter Xu (4):
  qdev-monitor: Trace qdev creation
  qemu-config: Allow in-place sorting of QemuOptsList
  qdev: Export qdev_get_device_class()
  vl: Prioritize realizations of devices

 include/monitor/qdev.h     |  2 ++
 include/qemu/config-file.h |  4 ++++
 softmmu/qdev-monitor.c     |  4 +++-
 softmmu/trace-events       |  3 +++
 softmmu/vl.c               | 35 +++++++++++++++++++++++++++
 util/qemu-config.c         | 48 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 95 insertions(+), 1 deletion(-)

-- 
2.31.1


