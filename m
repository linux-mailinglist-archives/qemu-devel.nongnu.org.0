Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02422940CA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 18:47:30 +0200 (CEST)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUunJ-0003Aa-Nd
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 12:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUuCe-0004FM-SD
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:09:36 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUuCc-0005OT-H0
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:09:35 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-cSbZA4QbOlCYs4MaCOX5ag-1; Tue, 20 Oct 2020 12:09:30 -0400
X-MC-Unique: cSbZA4QbOlCYs4MaCOX5ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4437A803F42;
 Tue, 20 Oct 2020 16:09:29 +0000 (UTC)
Received: from bahia.lan (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9613C5B4A1;
 Tue, 20 Oct 2020 16:09:28 +0000 (UTC)
Subject: [PATCH v2 3/5] tests/9pfs: Set alloc in fs_create_dir()
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 18:09:27 +0200
Message-ID: <160321016764.266767.3763279057643874020.stgit@bahia.lan>
In-Reply-To: <160320977352.266767.5622969302437522296.stgit@bahia.lan>
References: <160320977352.266767.5622969302437522296.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 11:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fs_create_dir() is a top level test function. It should set alloc.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/virtio-9p-test.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 52d102a3fc9f..cc52ae9a77b3 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1019,6 +1019,7 @@ static void fs_readdir_split_512(void *obj, void *dat=
a,
 static void fs_create_dir(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p =3D obj;
+    alloc =3D t_alloc;
     struct stat st;
     char *root_path =3D virtio_9p_test_path("");
     char *new_dir =3D virtio_9p_test_path("01");



