Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70BC45498A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:03:51 +0100 (CET)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMTW-00058Z-Eq
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:03:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnMRw-0003SV-BF
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:02:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnMRu-0002k1-H6
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637161329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Eqz58ohf1Z4vAkPYToe3RHu4QXNuUQrrLz7fwGrP1Ic=;
 b=L68obcVs9OaaYQJLWJp1cmH+dmuGxCHbdgcsPHXTYGZx3Lh2Dm3NhVWAcwCVIDyh2AU7aA
 eHOqCeVFPfpFs7abLUXdAyU8JOM0ReHL3sLyi53X/IF3PyJ+L3Ks5umgcV4YP4YXXbqMgX
 UtPDvYP0IbjTPQ2qT6bimdu2HHqdaBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-au7LlMLzP36ZOKu7Tl8EWA-1; Wed, 17 Nov 2021 10:02:05 -0500
X-MC-Unique: au7LlMLzP36ZOKu7Tl8EWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC8E824F88;
 Wed, 17 Nov 2021 15:02:04 +0000 (UTC)
Received: from localhost (unknown [10.39.195.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 808C3100EBAD;
 Wed, 17 Nov 2021 15:02:01 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] iotests: Fix crypto algorithm failures
Date: Wed, 17 Nov 2021 16:01:57 +0100
Message-Id: <20211117150159.41806-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

iotests 149, 206, and 210 fail when qemu uses the gnutls crypto backend
(which is the default as of 8bd0931f6) because they try to use
algorithms that this backend does not support.

Have 206 and 210 use different algorithms instead (patch 1), and let 149
be skipped when it encounters an unsupported algorithm (patch 2).


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


