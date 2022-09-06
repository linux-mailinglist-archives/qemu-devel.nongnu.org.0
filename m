Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC45AE439
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:29:35 +0200 (CEST)
Received: from localhost ([::1]:54266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUti-0004zd-DB
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9b-0006fF-NI
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9Y-0006MB-6B
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jtZRTL+uoaxtDq3ZagbvDRbYo2oxXg/Yk/Pbhq+TCbo=;
 b=MmZ3limmj04v6TT+V7L5oXQx1ftQVOrqINb+kKFl7jwBLt/GDsziy+oGM9N73BPB3wF2IM
 NwMf5mpnygb0JZNa2Z6VVLxH0WkCGbRuH8gixrDRVetCKrLrBkGEZY0Ydfl/keHXWNONM7
 z4Vpb46HIEafS8Gqv5ICfTycRIXL0OE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-VZQiJLYNPXGVRyHnHjrkqA-1; Tue, 06 Sep 2022 04:41:49 -0400
X-MC-Unique: VZQiJLYNPXGVRyHnHjrkqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 694E03801F53
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8CB6C15BB3;
 Tue,  6 Sep 2022 08:41:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 00/11] crypto: improve robustness of LUKS metadata validation
Date: Tue,  6 Sep 2022 09:41:36 +0100
Message-Id: <20220906084147.1423045-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Richard pointed out that we didn't do all that much validation against
bad parameters in the LUKS header metadata. This series adds a bunch
more validation checks along with unit tests to demonstrate they are
having effect against maliciously crafted headers.

Daniel P. Berrangé (11):
  crypto: sanity check that LUKS header strings are NUL-terminated
  crypto: enforce that LUKS stripes is always a fixed value
  crypto: enforce that key material doesn't overlap with LUKS header
  crypto: validate that LUKS payload doesn't overlap with header
  crypto: strengthen the check for key slots overlapping with LUKS
    header
  crypto: check that LUKS PBKDF2 iterations count is non-zero
  crypto: split LUKS header definitions off into file
  crypto: split off helpers for converting LUKS header endianess
  crypto: quote algorithm names in error messages
  crypto: ensure LUKS tests run with GNUTLS crypto provider
  crypto: add test cases for many malformed LUKS header scenarios

 crypto/block-luks-priv.h       | 143 ++++++++++++++++
 crypto/block-luks.c            | 228 +++++++++++--------------
 tests/unit/test-crypto-block.c | 302 ++++++++++++++++++++++++++++++++-
 3 files changed, 542 insertions(+), 131 deletions(-)
 create mode 100644 crypto/block-luks-priv.h

-- 
2.37.2


