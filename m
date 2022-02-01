Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0164A61B8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:58:16 +0100 (CET)
Received: from localhost ([::1]:48018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwTt-0007ii-MC
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:58:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEusw-0004e9-Ak
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:16:01 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:20707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEuss-00028s-GG
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:15:57 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-CNwASMpTP8qkyXXOG2zjgw-1; Tue, 01 Feb 2022 10:15:37 -0500
X-MC-Unique: CNwASMpTP8qkyXXOG2zjgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A90941898292;
 Tue,  1 Feb 2022 15:15:36 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35DFF10A48CB;
 Tue,  1 Feb 2022 15:15:35 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] tests/9pfs: Fix leak of local_test_path
Date: Tue,  1 Feb 2022 16:15:07 +0100
Message-Id: <20220201151508.190035-2-groug@kaod.org>
In-Reply-To: <20220201151508.190035-1-groug@kaod.org>
References: <20220201151508.190035-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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

local_test_path is allocated in virtio_9p_create_local_test_dir() to hold t=
he path
of the temporary directory. It should be freed in virtio_9p_remove_local_te=
st_dir()
when the temporary directory is removed. Clarify the lifecycle of local_tes=
t_path
while here.

Based-on: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss=
@crudebyte.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/libqos/virtio-9p.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.=
c
index ef96ef006adc..5d18e5eae544 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -39,8 +39,13 @@ static char *concat_path(const char* a, const char* b)
=20
 void virtio_9p_create_local_test_dir(void)
 {
+    g_assert(local_test_path =3D=3D NULL);
     struct stat st;
     char *pwd =3D g_get_current_dir();
+    /*
+     * template gets cached into local_test_path and freed in
+     * virtio_9p_remove_local_test_dir().
+     */
     char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
=20
     local_test_path =3D mkdtemp(template);
@@ -66,6 +71,8 @@ void virtio_9p_remove_local_test_dir(void)
         /* ignore error, dummy check to prevent compiler error */
     }
     g_free(cmd);
+    g_free(local_test_path);
+    local_test_path =3D NULL;
 }
=20
 char *virtio_9p_test_path(const char *path)
--=20
2.34.1


