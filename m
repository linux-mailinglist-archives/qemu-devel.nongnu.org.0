Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030014FB462
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 09:10:32 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndoBy-0007Gd-ST
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 03:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo0t-00082H-8o
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo0r-00076B-Gs
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XuiPtqiNp70l6k/9Wj2s6RLZomeeJIdiwy3C1lzF84A=;
 b=djZqRHGxrzlI/eufd92kYYPcK9IKTUeyXeipLeF1/reKSfXzDT2QMZUeQULmlWRVQ8tTei
 H12rLrqwVXgMw96+jiZAXn/FEvQ5uj/eyzvdkmXd8d4+LxPrGSFVIqTz+O7Ht4rYZXJ1UL
 S358D8qEFQ50qxafCUGhTCiuViC2Nfc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-ln_GFj8cNhCUH5xDJ2iGQw-1; Mon, 11 Apr 2022 02:58:55 -0400
X-MC-Unique: ln_GFj8cNhCUH5xDJ2iGQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11D513C14104;
 Mon, 11 Apr 2022 06:58:55 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB0A4029AD;
 Mon, 11 Apr 2022 06:58:50 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/5] target/arm: Support variable sized coprocessor registers
Date: Mon, 11 Apr 2022 14:58:37 +0800
Message-Id: <20220411065842.63880-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, agraf@csgraf.de,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are two arrays for each CPU, to store the indexes and values of the
coprocessor registers. Currently, 8 bytes fixed storage space is reserved
for each coprocessor register. However, larger coprocessor registers have
been defined and exposed by KVM. Except SVE registers, no coprocessor
register exceeds 8 bytes in size. It doesn't mean large coprocessor registers
won't be exploited in future. For example, I'm looking into SDEI virtualization
support, which isn't merged into Linux upstream yet. I have plan to add
several coprocessor ("firmware pseudo") registers to assist the migration.

This series adds one more array, to track the position or location in the
storage array (@cpreg_values) for the corresponding coprocessor register.
The storage space for one particular coprocessor register is always to
8 bytes so that we needn't worry about the alignment issue. In this way,
the coprocessor register size can be variable.

I had some internal discussion with Eric and Drew. They suggested to
send one mail to qemu-arm@nongnu.org, asking if there is any challenges
to support variable sized coprocessor registers. So another intention
of this series is to invoke the discussion.

PATCH[1-3] adds one more array (@cpreg_value_indexes) to track the location
in the storage array (@cpreg_values) for coprocessor registers. The storage
space for one particular coprocessor register is determined by the additional
array, which is named as indirect addressing mode. Each coprocessor register
is still having 8 bytes fixed storage space, so that thd old mechanism
(direct addressing mode) and indirect address mode can co-exist, event in
migration circumstance. PATCH[4] migrates the additional array. PATCH[5]
initializes @cpreg_value_indexes for KVM.

Gavin Shan (5):
  target/arm/tcg: Indirect addressing for coprocessor register storage
  target/arm/hvf: Indirect addressing for coprocessor register storage
  target/arm/kvm: Indirect addressing for coprocessor register storage
  target/arm: Migrate coprocessor register indirect addressing
    information
  target/arm/kvm: Support coprocessor register with variable size

 target/arm/cpu.h     | 12 +++++--
 target/arm/helper.c  | 27 +++++++++-----
 target/arm/hvf/hvf.c | 20 +++++++++--
 target/arm/kvm.c     | 85 ++++++++++++++++++++++++++++++++++++++------
 target/arm/machine.c | 30 ++++++++++++----
 5 files changed, 145 insertions(+), 29 deletions(-)

-- 
2.23.0


