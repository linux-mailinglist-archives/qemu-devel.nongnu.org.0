Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94D6BAE50
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 11:57:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOoM-00029u-NW; Wed, 15 Mar 2023 06:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOoJ-00029V-Lc
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOoI-0001wI-11
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678877805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ayRnhVuKLmYA+5c6qMIzzF6zvpmL7nIQ9E2v9XI+F0o=;
 b=QQXCnN6DRvFkeoL2CQnG6DLezlo6VLZgB0Qbwu2Ap4QHUcba1tKHBX9LB9UvlEZbcZaapU
 Kx2CAdS46SLWdt1ltQhyupRKvxrIixqzrYpUnxKke1cB7C3XCb/GuyBPIzRykuen28Htn+
 NAM4jrhvwQR4VZe/Oefo7Towm+YcC9M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-SceYe2aCOYaYYXVY9DZAgg-1; Wed, 15 Mar 2023 06:56:43 -0400
X-MC-Unique: SceYe2aCOYaYYXVY9DZAgg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so612044wms.9
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 03:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ayRnhVuKLmYA+5c6qMIzzF6zvpmL7nIQ9E2v9XI+F0o=;
 b=I+j7/wHXs6bdHqP/8XA1IIng3385ns6DOYjnfMXXQ5xm9l5w7wg1h/XtryN0mHEvVY
 Ri0ZWPmRx+rKTZPuzcryU03Nw3KktNhS8cfTZ2Hg2o2JVm614v583dLqLWduY1k5Twbz
 /7ldeYybrt/Vpwh3DcWVctaDI4cf23BDxj2bY0s0MkAshz2CsGzqeB56KIEguXwbL5U8
 KMiR4Bk/EKW806OJuxZ6TsqZ/SoituDBB2GWYEEPKZe5cQ/0gnlOC1wCNeMJAfQ8ri6M
 zYu8wZ2F3YGOKg+R6Xy8AysprgWqXzB50Ppa9kB62ukrJcfD+c0UouqCsILmqz2JNg9u
 4rHw==
X-Gm-Message-State: AO0yUKUadlowoeOUWxVNqdDXHaA4rubcx+JUC+H4AJXYvaMqtCPprC/x
 ZabIzig60kXeT7omNGLZToir71THuEkLNFop8s/LMxA57sPxiR3kaTzOXv1jY7aM2eoE6RzzQBT
 irPZt5NgdxrbiDNmHf7YPEZaXL7E7tqRmzCNIo9SMTVYPQh2e4qePLLgZXsPvj2Nln90Nu9OElY
 k=
X-Received: by 2002:adf:f68b:0:b0:2cb:d8f1:1d2f with SMTP id
 v11-20020adff68b000000b002cbd8f11d2fmr1957178wrp.17.1678877802114; 
 Wed, 15 Mar 2023 03:56:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set/WaKf6FGHWkScN++/KChA8Qei/+KNX9jhO3lWWK/Tktbeterpn/wAnsNEeDzvZMf0w+dwCKA==
X-Received: by 2002:adf:f68b:0:b0:2cb:d8f1:1d2f with SMTP id
 v11-20020adff68b000000b002cbd8f11d2fmr1957159wrp.17.1678877801656; 
 Wed, 15 Mar 2023 03:56:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f13-20020adff44d000000b002cfe29d2982sm4257803wrp.103.2023.03.15.03.56.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 03:56:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/4] Misc fixes for 2023-03-15
Date: Wed, 15 Mar 2023 11:56:40 +0100
Message-Id: <20230315105640.616081-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The following changes since commit 652737c8090eb3792f8b4c4b22ab12d7cc32073f:

  Update version for v8.0.0-rc0 release (2023-03-14 19:25:05 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to dee2a4d4d2f6adc3c664e37a559d4187deee4818:

  vl: defuse PID file path resolve error (2023-03-15 11:52:25 +0100)

v1->v2: fix missing Signed-off-by, no code changes

----------------------------------------------------------------
small bug fixes

----------------------------------------------------------------
David Woodhouse (1):
      hw/intc/ioapic: Update KVM routes before redelivering IRQ, on RTE update

Fiona Ebner (1):
      vl: defuse PID file path resolve error

Miroslav Rezanina (1):
      Fix build without CONFIG_XEN_EMU

Paolo Bonzini (1):
      docs/devel: clarify further the semantics of RMW operations

 docs/devel/atomics.rst | 18 ++++++++++++------
 hw/intc/ioapic.c       |  3 +--
 softmmu/vl.c           |  9 +++++----
 target/i386/kvm/kvm.c  |  2 ++
 4 files changed, 20 insertions(+), 12 deletions(-)
-- 
2.39.2


