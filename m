Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75120526684
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:51:37 +0200 (CEST)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXZo-0007Fr-JJ
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npXXV-0005r7-JU
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:49:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npXXT-0000fI-Bh
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652456950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IUF9Bk7uqoOALHO/4fCsgxJwjN/2byxdB8K3FynWadM=;
 b=VqJXUlcsLXgUKLULsbVVVMfkf1HPW521puA03zKwSFNSg3fCEOlFFN+AJRGjihG+yQwCeL
 LZbGJ2tTOsd9r15RcZ6MDIakyc9Dh+mdqtNy9q36EhtbQsJhh3lGVMVOHpoc1SecL98gzX
 Dq5+WJiOkHE4RqLY7KisEsLlKeyEk/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-F4dO561_OpCwJ1Jq_-OsPA-1; Fri, 13 May 2022 11:49:09 -0400
X-MC-Unique: F4dO561_OpCwJ1Jq_-OsPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEC1B803B22
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 15:49:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8DB11467E50;
 Fri, 13 May 2022 15:49:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/2] tests/libqtest: fix cleanup of QEMU processes and add
 robustness
Date: Fri, 13 May 2022 16:49:04 +0100
Message-Id: <20220513154906.206715-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

This fixes the existing logic that was supposed to be cleaning up=0D
running QEMU processes when g_assert fires. It then further adds=0D
use of a Linux specific prctl as a safety net if the ABRT handler=0D
couldn't convince QEMU to quit with SIGTERM, or if the test program=0D
crashes with SEGV.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  tests/qtest: fix registration of ABRT handler for QEMU cleanup=0D
  tests/qtest: use prctl(PR_SET_PDEATHSIG) as fallback to kill QEMU=0D
=0D
 tests/qtest/libqtest.c | 21 +++++++++++++++++++--=0D
 1 file changed, 19 insertions(+), 2 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D


