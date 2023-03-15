Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC746BAE37
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 11:52:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOjd-0006rS-Hg; Wed, 15 Mar 2023 06:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOja-0006r7-Tl
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:51:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOjZ-0000xs-BF
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678877512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7pY7obvvJQPEESehGSpCvAofpqMcP8E1ooW1x11hP9Y=;
 b=Hyii8hXUuxi3akxf1WzHnfyuXvAeJjpumZyMbxl33MvrCGWDNLHweP39scepLDrsGdUXgc
 PtTaKLrBElD1kMqupTqpE62dgEpLfpByfJU/J0f1TbmG7gsjXl4ElvdgacyU1KKcoMWRHG
 VLEk8a+DTZqtdW/0cpArhUz2AHbjLPg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-gTfwsG2tPnqBP4Ver6nxJw-1; Wed, 15 Mar 2023 06:51:51 -0400
X-MC-Unique: gTfwsG2tPnqBP4Ver6nxJw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v4-20020adfc5c4000000b002cff4b4ba24so217276wrg.20
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 03:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7pY7obvvJQPEESehGSpCvAofpqMcP8E1ooW1x11hP9Y=;
 b=L82dMlOQRzf7EPHAV3ZK4Ewg+IOSnfwtU0DgPrqVJwViaD/p96+9dWc6XvyxrZOHdh
 Z1nIKoXydh0wvqoy7CVM+FxJvdLxYc/rPNGzixTIOtAofQGXmgAiEdT4YYAnX+jcaCQe
 GqyoaFILPpsnZM9XSTwhdEiuLnGMbznYxGcPSh7aLU8JjZFXEX2h5WTtbnPkzlQabukZ
 JxMoclZlifMv2kvvh8bKDrEpFw6egcDO8mSoib0azw95H1gIbqJBTLkIfuwgHCYUm4pt
 izw4mEeoeHeNdM4/Vg/nQrn9chP3Eir3ATu+K/NtzxeG9N9WiFGJp/YKNQubQg0/9Jt+
 7uHA==
X-Gm-Message-State: AO0yUKXeEX2hCBJuD+EXiCPSSsI/fa8RKxn2iQCp29mvEz8jzNx6bRTc
 lgcmr1GngylSdQ9NDefGeA0AzsEyMHTBzyzIkr0VDR0KHZ3z3lIWL5WG9Lq2kEkz6j5Szs/rVPt
 Q0I8btX6byPmaYszI/+Guy5HusBgfwBeJjED/aLp1smQY8ByM7KygLUSO849R/LIv52MnLVhOV0
 w=
X-Received: by 2002:a05:600c:4f50:b0:3ea:bc08:42ad with SMTP id
 m16-20020a05600c4f5000b003eabc0842admr17997324wmq.2.1678877509624; 
 Wed, 15 Mar 2023 03:51:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set/tK4/uzvlBqAI9cTK5UYsteXhuq+vwhxJkgWSp671sJ9Xl2HUMWY3c3gX7kJXLdj7HgBglUw==
X-Received: by 2002:a05:600c:4f50:b0:3ea:bc08:42ad with SMTP id
 m16-20020a05600c4f5000b003eabc0842admr17997314wmq.2.1678877509261; 
 Wed, 15 Mar 2023 03:51:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c224700b003ed22578e59sm1391280wmm.36.2023.03.15.03.51.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 03:51:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Misc fixes for 2023-03-15
Date: Wed, 15 Mar 2023 11:51:44 +0100
Message-Id: <20230315105148.611544-1-pbonzini@redhat.com>
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

for you to fetch changes up to 7be89e077d20eb81aae79a0273c312867fb0a6ab:

  vl: defuse PID file path resolve error (2023-03-15 11:48:51 +0100)

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


