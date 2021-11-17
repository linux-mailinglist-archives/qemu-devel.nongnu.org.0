Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E74549C8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:19:51 +0100 (CET)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMj0-0005QI-AN
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:19:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnMgX-0003DB-0l
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:17:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnMgU-0004tp-BM
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637162233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YVP9mZFOm/YTBwAZxwTR4gH9Io/ojC0HCVsTTHvBT18=;
 b=FbG06lHvn2HtmXX9xrpsPErGWX5lUC+8anPepq7YRqDOJdzNCjvs7flFtyPFAPC5UIIYqB
 FO1smozWK52SactfS0VOhiSzXV3qufSZ8Om3RCa6Ur2Z9SY9TSeUwms6yKt5p/iA+ljJ2c
 sN+CRGIpJBfmWgASZz+XIAzRasnFT14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-rV7E03tDObeg393V3JD0Lw-1; Wed, 17 Nov 2021 10:17:10 -0500
X-MC-Unique: rV7E03tDObeg393V3JD0Lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 818E4804140;
 Wed, 17 Nov 2021 15:17:09 +0000 (UTC)
Received: from localhost (unknown [10.39.195.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26C1919D9B;
 Wed, 17 Nov 2021 15:17:08 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] iotests: Fix crypto algorithm failures
Date: Wed, 17 Nov 2021 16:17:05 +0100
Message-Id: <20211117151707.52549-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

iotests 149, 206, and 210 fail when qemu uses the gnutls crypto backend
(which is the default as of 8bd0931f6) because they try to use
algorithms that this backend does not support.

Have 206 and 210 use different algorithms instead (patch 1), and let 149
be skipped when it encounters an unsupported algorithm (patch 2).


v2:
- Fixed the `check_cipher_support()` function introduced in patch 2
  (forgot to pass `config`, though it worked even without, apparently
  because `config` is a global-scope variable....)

- Also a good opportunity to CC Dan, who I forgot on v1


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/2:[----] [--] 'iotests: Use aes-128-cbc'
002/2:[0008] [FC] 'iotests/149: Skip on unsupported ciphers'


Hanna Reitz (2):
  iotests: Use aes-128-cbc
  iotests/149: Skip on unsupported ciphers

 tests/qemu-iotests/149     | 23 ++++++++++++++++++-----
 tests/qemu-iotests/206     |  4 ++--
 tests/qemu-iotests/206.out |  6 +++---
 tests/qemu-iotests/210     |  4 ++--
 tests/qemu-iotests/210.out |  6 +++---
 5 files changed, 28 insertions(+), 15 deletions(-)

-- 
2.33.1


