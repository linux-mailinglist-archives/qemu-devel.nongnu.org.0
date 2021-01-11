Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535E2F1187
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:32:49 +0100 (CET)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvRH-0002HO-VA
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyvPN-0000tH-Bg
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:30:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyvPJ-0006As-9u
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610364641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=W0JBleeJ2CZn7j3tQMPHudSO3it6YRePAdEpFpDH4Zg=;
 b=GotH4J2gBgN5SpyBWZH1hTRcFMA1k5dWUDzvYfuWbdsc6/wzKTjE2RvxjuwkvvGunLSrBm
 zEMZx8KE2+1VEp7rgfQyrddvUcZs7wb9FtmX/t8VyyLhNWK/ziMNt2lz2G/AKT+Zp6j01e
 CkkmnspBTcOORGD4VXfMSG3IqwIFrmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-MgvtvyYOMiOW8DeQuEHIOA-1; Mon, 11 Jan 2021 06:30:40 -0500
X-MC-Unique: MgvtvyYOMiOW8DeQuEHIOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A101087D63
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:30:39 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC6101972B
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:30:38 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [RHEL7 qemu-kvm PATCH 0/3] Fixing several GCC 11 warnings
Date: Mon, 11 Jan 2021 12:30:34 +0100
Message-Id: <cover.1610364304.git.mrezanin@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

From: Miroslav Rezanina <mrezanin@redhat.com>

Compiling qemu using GCC 11 we got several new warnings. To allow
build with --enable-werror, we need to solve issues generating these
warnings.

Signed-of-by: Miroslav Rezanina <mrezanin@redhat.com>

Miroslav Rezanina (3):
  Fix net.c warning on GCC 11
  s390x: Fix vm name copy length
  Fix tcg_out_op argument mismatch warning

 net/eth.c                    | 3 +++
 target/s390x/kvm.c           | 2 +-
 target/s390x/misc_helper.c   | 4 +++-
 tcg/aarch64/tcg-target.c.inc | 3 +--
 tcg/sparc/tcg-target.c.inc   | 3 +--
 5 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.18.4


