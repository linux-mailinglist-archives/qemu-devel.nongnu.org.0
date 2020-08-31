Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398E02581D7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 21:35:47 +0200 (CEST)
Received: from localhost ([::1]:34548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCpaj-0006hK-La
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 15:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kCpZX-0005YJ-H7
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 15:34:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21518
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kCpZV-0005ek-31
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 15:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598902467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YQWthbnL/F8A9JG87S9VWHvNqxsIM98exPrIcod4sws=;
 b=T9aOyu3fQqH4pxh02B3U6HPr7uEhqdaIEsPnWyY0FZG347GH/d1IV9GqcV0LnH4GPFom6z
 dL1U8Fsm5zsgLtgayVQJDrBUOVENJQOL5n3FxN1fMAza0aWIa9464L513xqvjuRzaU6ouX
 eRnfaMWUbHOGQi3yOLZ3uEVbqm+Dklw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-ei-P5MgSPnS9WN3J5PB5aA-1; Mon, 31 Aug 2020 15:34:25 -0400
X-MC-Unique: ei-P5MgSPnS9WN3J5PB5aA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84DCE18A2243;
 Mon, 31 Aug 2020 19:34:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-112.ams2.redhat.com [10.36.112.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE3F37EB7B;
 Mon, 31 Aug 2020 19:34:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, drjones@redhat.com,
 andrew.murray@arm.com, sudeep.holla@arm.com, maz@kernel.org,
 will@kernel.org, haibo.xu@linaro.org
Subject: [kvm-unit-tests RFC 0/4] KVM: arm64: Statistical Profiling Extension
 Tests
Date: Mon, 31 Aug 2020 21:34:10 +0200
Message-Id: <20200831193414.6951-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 15:34:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements tests exercising the Statistical Profiling
Extensions.

This was tested with associated unmerged kernel [1] and QEMU [2]
series.

Depending on the comments, I can easily add other tests checking
more configs, additional events and testing migration too. I hope
this can be useful when respinning both series.

All SPE tests can be launched with:
./run_tests.sh -g spe
Tests also can be launched individually. For example:
./arm-run arm/spe.flat -append 'spe-buffer'

The series can be found at:
https://github.com/eauger/kut/tree/spe_rfc

References:
[1] [PATCH v2 00/18] arm64: KVM: add SPE profiling support
[2] [PATCH 0/7] target/arm: Add vSPE support to KVM guest

Eric Auger (4):
  arm64: Move get_id_aa64dfr0() in processor.h
  spe: Probing and Introspection Test
  spe: Add profiling buffer test
  spe: Test Profiling Buffer Events

 arm/Makefile.common       |   1 +
 arm/pmu.c                 |   1 -
 arm/spe.c                 | 463 ++++++++++++++++++++++++++++++++++++++
 arm/unittests.cfg         |  24 ++
 lib/arm64/asm/barrier.h   |   1 +
 lib/arm64/asm/processor.h |   5 +
 6 files changed, 494 insertions(+), 1 deletion(-)
 create mode 100644 arm/spe.c

-- 
2.21.3


