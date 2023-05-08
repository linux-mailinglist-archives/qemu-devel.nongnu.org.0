Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E543E6FB7E6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:05:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw75P-0006CY-Ej; Mon, 08 May 2023 16:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75J-0006CQ-1a
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75H-0007Ih-Fi
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683576226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nkb63jKzE6p+xgioN2nQJ8n4NAaORn4RSP2Ti/XUUI4=;
 b=Qrt4nDTQotX2SRRK29HeEYpUIR5zo0MFXpB41kaVIX4es5MILwyjezOGif6ciAz2TqKEmb
 YMYD2ox+i0vOsfr2l5YqnUpKZSZOE2CcWeaWsE2FOafP9W5rPfs+N4ItYJcZaVV3MajTRR
 Wd6/1osLlYjuLOi+itj8wqqTapHk+c8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-alcWvjQtNDGG8eO_gH6sUw-1; Mon, 08 May 2023 16:03:44 -0400
X-MC-Unique: alcWvjQtNDGG8eO_gH6sUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17056885621
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 20:03:44 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7F351121314;
 Mon,  8 May 2023 20:03:43 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com
Subject: [PATCH 00/11] Fix qemu_strtosz() read-out-of-bounds
Date: Mon,  8 May 2023 15:03:32 -0500
Message-Id: <20230508200343.791450-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series blew up in my face when Hanna first pointed me to
https://gitlab.com/qemu-project/qemu/-/issues/1629

Basically, 'qemu-img dd bs=9.9e999' killed a sanitized build because
of a read-out-of-bounds (".9e999" parses as infinity, but qemu_strtosz
wasn't expecting ERANGE failure).

The overall diffstate is big, mainly because the unit tests needed a
LOT of work before I felt comfortable tweaking semantics in something
that is so essential to command-line and QMP parsing.

Eric Blake (11):
  test-cutils: Avoid g_assert in unit tests
  test-cutils: Use g_assert_cmpuint where appropriate
  test-cutils: Test integral qemu_strto* value on failures
  test-cutils: Add coverage of qemu_strtod
  test-cutils: Prepare for upcoming semantic change in qemu_strtosz
  test-cutils: Add more coverage to qemu_strtosz
  numa: Check for qemu_strtosz_MiB error
  cutils: Set value in all qemu_strtosz* error paths
  cutils: Set value in all integral qemu_strto* error paths
  cutils: Improve qemu_strtod* error paths
  cutils: Improve qemu_strtosz handling of fractions

 hw/core/numa.c           |   11 +-
 tests/unit/test-cutils.c | 1213 ++++++++++++++++++++++++++++++--------
 util/cutils.c            |  180 ++++--
 3 files changed, 1090 insertions(+), 314 deletions(-)


base-commit: 792f77f376adef944f9a03e601f6ad90c2f891b2
-- 
2.40.1


