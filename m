Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E704F360B60
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 16:04:32 +0200 (CEST)
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX2bf-0001n8-Tm
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 10:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX2WM-00055g-Ci
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX2WJ-0001vk-MM
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618495137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=79D64EDYatXP1tKUpdAe46Dkc7NOh3xNBvwM0m8CDvo=;
 b=O1Rfl7vZ0dcQFv192t+12zMPM4hx90hXHyAdFB0EoWQ2kFx8cwFAziUh6B2NitTC8JO4U+
 6czn1pPUuWryefhbYYLqq6iVwOW9TXlZd3PCXGHzY1CtSPR2+wfx/riO9ZZ9U+hgnntao+
 uJCtgpQ1ggT+P6KgiDAIxVrMvKYZQ1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-tr47MuGVMNG7RB89q-sHFQ-1; Thu, 15 Apr 2021 09:58:56 -0400
X-MC-Unique: tr47MuGVMNG7RB89q-sHFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5EDF1006710;
 Thu, 15 Apr 2021 13:58:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-159.ams2.redhat.com
 [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFAA260CCB;
 Thu, 15 Apr 2021 13:58:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] block,
 migration: improve debugging of migration bdrv_flush failure
Date: Thu, 15 Apr 2021 14:58:46 +0100
Message-Id: <20210415135851.862406-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I spent a while debugging a tricky migration failure today which was=0D
ultimately caused by fdatasync() getting EACCESS. The existing probes=0D
were not sufficient to diagnose this, so I had to resort to GDB. This=0D
improves probes and block error reporting to make future diagnosis=0D
possible without GDB.=0D
=0D
Daniel P. Berrang=C3=A9 (5):=0D
  migration: add trace point when vm_stop_force_state fails=0D
  softmmu: add trace point when bdrv_flush_all fails=0D
  block: preserve errno from fdatasync failures=0D
  block: add trace point when fdatasync fails=0D
  block: remove duplicate trace.h include=0D
=0D
 block/file-posix.c     | 10 +++++-----=0D
 block/trace-events     |  1 +=0D
 migration/migration.c  |  1 +=0D
 migration/trace-events |  1 +=0D
 softmmu/cpus.c         |  7 ++++++-=0D
 softmmu/trace-events   |  3 +++=0D
 6 files changed, 17 insertions(+), 6 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


