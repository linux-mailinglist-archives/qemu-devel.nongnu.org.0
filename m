Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBAB4A615B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:28:26 +0100 (CET)
Received: from localhost ([::1]:34020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEw13-0003Vx-Bn
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:28:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEusw-0004e8-Cl
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:16:01 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:31858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEusf-00028T-17
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:15:57 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-8A5Hv0SjPLCMqAuPRWa_WQ-1; Tue, 01 Feb 2022 10:15:36 -0500
X-MC-Unique: 8A5Hv0SjPLCMqAuPRWa_WQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCFD28143E5;
 Tue,  1 Feb 2022 15:15:34 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 894D210A4B2E;
 Tue,  1 Feb 2022 15:15:09 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] tests/9pfs: Fix leak and add some more g_auto*
 annotations
Date: Tue,  1 Feb 2022 16:15:06 +0100
Message-Id: <20220201151508.190035-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the continuation of:=0D
=0D
https://lore.kernel.org/qemu-devel/20220201111137.732325b4@bahia/T/#t=0D
=0D
v3: - fix leak in its own patch=0D
=0D
Greg Kurz (2):=0D
  tests/9pfs: Fix leak of local_test_path=0D
  tests/9pfs: Use g_autofree and g_autoptr where possible=0D
=0D
 tests/qtest/libqos/virtio-9p.c | 20 +++++++++++---------=0D
 1 file changed, 11 insertions(+), 9 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


