Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2972D60E53C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 18:08:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oniuJ-00033c-3s; Wed, 26 Oct 2022 12:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oniuA-00031i-DS
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oniu8-0003Qy-I2
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 12:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666800319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ztBP1qMYf+hyScyFNcfBG006wJpY+Pb7WIehybbH0k=;
 b=aFQZyK1e9cEJDQTn7hNN4JoyX3DbkRmjZqu0ve9Bi7faDp1/Fz67KPS7slnQWWOi5dZPr/
 SddY1Rsz7Dd9T3zrbSKZskXEh/LZ2bDICAo41IZPkbraW+Yb591VKXVElj0iV3VnaZtqcf
 dmhRPNU3aK6Uv0YlgthZz0DI9dtCdM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-wWIqcFAwMfC_Tl7LnY9hrg-1; Wed, 26 Oct 2022 12:05:17 -0400
X-MC-Unique: wWIqcFAwMfC_Tl7LnY9hrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB2CC87B2A5;
 Wed, 26 Oct 2022 16:05:16 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FDC1C15BAB;
 Wed, 26 Oct 2022 16:05:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 0/2] arm: enable MTE for QEMU + kvm
Date: Wed, 26 Oct 2022 18:05:09 +0200
Message-Id: <20221026160511.37162-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

After wayyy too long (last version was sent in *July*), a respin of my
kvm/mte series. Still no migration support. I've been hacking around on
a device for transferring tags while stopped, but don't really have anything
to show, probably because I get distra- <ohh, what's that?>

...I guess you get the point :(

Anyway, I wanted to post this as non-RFC; likely too late for 7.2, but maybe
for 8.0 (and I'd get a chance to make at least pre-copy migration work; I'm open
to suggestions for that. Support for post-copy needs kernel-side changes.) Tested
on the FVP models; qtests only on a non-MTE KVM host.

Changes v2->v3:
- rebase to current master
- drop some parts of the qtests that didn't actually work
- really minor stuff
- drop RFC

Cornelia Huck (2):
  arm/kvm: add support for MTE
  qtests/arm: add some mte tests

 docs/system/arm/cpu-features.rst |  21 +++++
 target/arm/cpu.c                 |  18 ++---
 target/arm/cpu.h                 |   1 +
 target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
 target/arm/internals.h           |   1 +
 target/arm/kvm64.c               |   5 ++
 target/arm/kvm_arm.h             |  12 +++
 target/arm/monitor.c             |   1 +
 tests/qtest/arm-cpu-features.c   |  76 ++++++++++++++++++
 9 files changed, 256 insertions(+), 12 deletions(-)

-- 
2.37.3


