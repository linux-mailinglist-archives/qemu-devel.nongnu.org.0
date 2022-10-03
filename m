Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA65F2EDF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:38:15 +0200 (CEST)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIpy-0001Me-Ab
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIfY-0002T4-Gr
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIfV-0001Gv-C1
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664792844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GeT44vMwl1STufa9178V3QMWlm+vQmzBxaefkSu+kvA=;
 b=CQF+SYG377pOxt5vFK/oY0q0mnDAsJaStb7uOAf4/LY7pUOZI9V//KrEtibVQaYPSe9kYN
 U1nVC13mlLHGE6bL+IZ6ekCU/7c8VOS/fcTshf+wX6gmpw8PWZ124mA2MB4iCR+iF3ELpS
 Zs7j32GhiUF+7aD8CPgE6PvaEecFUfw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-2DjnT_O3MqicauxmZZlFMg-1; Mon, 03 Oct 2022 06:27:21 -0400
X-MC-Unique: 2DjnT_O3MqicauxmZZlFMg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12A25101A52A;
 Mon,  3 Oct 2022 10:27:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33021492B04;
 Mon,  3 Oct 2022 10:27:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/2] crypto: fix TLS PSK credentials on Windows  platforms
Date: Mon,  3 Oct 2022 11:27:16 +0100
Message-Id: <20221003102718.600058-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A mixup with DOS/UNIX line endings, combined with lack of error
checking, resulted in us not initializing the PSK credentials on the
client side.

Daniel P. Berrangé (2):
  crypto: check for and report errors setting PSK credentials
  tests: avoid DOS line endings in PSK file

 crypto/tlscredspsk.c                | 16 +++++++++++++---
 tests/unit/crypto-tls-psk-helpers.c | 11 +++++------
 2 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.37.3


