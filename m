Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753857E13C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:05:58 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErPo-0004FA-NN
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMW-0008D9-LJ
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMT-0006Ew-I1
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658491348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MWwtli2inRFLcqVUGsbZCyqw0kGwjbsHqr/Q8Oo6uy4=;
 b=PgGoZmLUdntOjyKZKYeeFuOGkkTP/Xpr6+PgXXL78lJmSyrvamUrY/4T39PP0JdCe8DXf1
 wechV1DaWhHkcfov6vKEgrLOqQKw7xJ2SNKp+hAdTAnYJ9xsKmxCpxjOiJDaRyFHoNnAS6
 tMBPMHI1IV8AoIg+MYjew63dJoiLlYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-wcGu2R98O8-xGxnMBe8PGQ-1; Fri, 22 Jul 2022 08:02:27 -0400
X-MC-Unique: wcGu2R98O8-xGxnMBe8PGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0144A803520;
 Fri, 22 Jul 2022 12:02:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 772391121314;
 Fri, 22 Jul 2022 12:02:25 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/3] target: RFC: display deprecation flag for '-cpu help'
Date: Fri, 22 Jul 2022 13:02:21 +0100
Message-Id: <20220722120224.2311982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When querying '-cpu help' there is no presentation of fact that a
CPU may be deprecated. The user just has to try it and see if they
get a depecation message at runtime.  The QMP command for querying
CPUs report a deprecation bool flagreason.

The Icelake-Client CPU (removed in 6df39f5e583ca0f67bd934d1327f9ead2e3bd49c)
handled this by modifying the '.notes' section to add the word
'deprecated':

            {
                .version = 2,
                .note = "no TSX, deprecated",
                .alias = "Icelake-Client-noTSX",
                .props = (PropValue[]) {
                    { "hle", "off" },
                    { "rtm", "off" },
                    { /* end of list */ }
                },
            },

This relies on the person deprecating the CPU to remember to do this,
and is redundant when this info is already expressed in the
'.deprecation_note' field.

This short series suggests just modifying the '-cpu help'
formatter so that it displays '(deprecated)' next to any
CPUs

eg

$ qemu-system-x86_64 -cpu help:
Available CPUs:
x86 486                   (alias configured by machine type) (deprecated)

This series touched x86_64, s390x, and aarch64 because that's all I
personally needed from a downstream POV, but any & all of the targets
would benefit from this. They have each implemented the '-cpu help'
logic independantly though, and unifying that code is not entirely
straightforward.

Changed in v2:

  - Just include "deprecated" as a flag, not full description
    which made the output too verbose and long lines.

Daniel P. Berrangé (3):
  target/i386: display deprecation status in '-cpu help'
  target/s390x: display deprecation status in '-cpu help'
  target/arm: display deprecation status in '-cpu help'

 target/arm/helper.c       |  7 ++++++-
 target/i386/cpu.c         |  5 +++++
 target/s390x/cpu_models.c | 23 ++++++++++++++++++-----
 3 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.36.1


