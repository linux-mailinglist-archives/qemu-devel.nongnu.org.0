Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44EC2D4841
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:50:38 +0100 (CET)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3bp-0000iv-4s
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn3NV-0004hN-Mj
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:35:49 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:38223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn3NT-00054m-R9
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:35:49 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-91G8jhpvPj-kVVdiEqS_Wg-1; Wed, 09 Dec 2020 12:35:40 -0500
X-MC-Unique: 91G8jhpvPj-kVVdiEqS_Wg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9CF859;
 Wed,  9 Dec 2020 17:35:38 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29A456F130;
 Wed,  9 Dec 2020 17:35:36 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/ppc: Fix detection of 64-bit MMU models
Date: Wed,  9 Dec 2020 18:35:34 +0100
Message-Id: <20201209173536.1437351-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Stephane Duverger <stephane.duverger@free.fr>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stephane Duverger posted a patch to fix a miscomputation of the=0D
'need_access_type' flag in ppc_tr_init_disas_context(), which can=0D
cause QEMU to abort with 32-bit CPUs.=0D
=0D
This series contains an extended version of Stephane's patch and=0D
introduce an mmu_is_64bit() helper to avoid a similar confusion=0D
in the future.=0D
=0D
Greg Kurz (1):=0D
  target/ppc: Introduce an mmu_is_64bit() helper=0D
=0D
Stephane Duverger (1):=0D
  ppc/translate: Use POWERPC_MMU_64 to detect 64-bit MMU models=0D
=0D
 target/ppc/cpu-qom.h            |  5 +++++=0D
 target/ppc/excp_helper.c        |  4 ++--=0D
 target/ppc/machine.c            |  4 ++--=0D
 target/ppc/mmu-hash64.c         |  2 +-=0D
 target/ppc/mmu_helper.c         | 10 +++++-----=0D
 target/ppc/translate.c          |  4 ++--=0D
 target/ppc/translate_init.c.inc |  2 +-=0D
 7 files changed, 18 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


