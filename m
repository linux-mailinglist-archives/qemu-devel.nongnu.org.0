Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D9357CC8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 08:52:20 +0200 (CEST)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUOWY-0007Jp-UV
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 02:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUOVp-0006um-LW
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 02:51:33 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:31598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUOVo-00063z-64
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 02:51:33 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Ld6RpoQ2OKKwhktxShKV6g-1; Thu, 08 Apr 2021 02:51:26 -0400
X-MC-Unique: Ld6RpoQ2OKKwhktxShKV6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0D2E802575;
 Thu,  8 Apr 2021 06:51:24 +0000 (UTC)
Received: from bahia.lan (ovpn-112-226.ams2.redhat.com [10.36.112.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB6EB17CD9;
 Thu,  8 Apr 2021 06:51:20 +0000 (UTC)
Subject: [PATCH] checkpatch: Fix use of uninitialized value
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 08 Apr 2021 08:51:19 +0200
Message-ID: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
Cc: isaku.yamahata@intel.com, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

checkfilename() doesn't always set $acpi_testexpected. Fix the following
warning:

Use of uninitialized value $acpi_testexpected in string eq at
 ./scripts/checkpatch.pl line 1529.

Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acpi =
data files")
Cc: isaku.yamahata@intel.com
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 scripts/checkpatch.pl |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f7053ec9b26..3d185cceac94 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1532,6 +1532,7 @@ sub process {
 =09=09     ($line =3D~ /\{\s*([\w\/\.\-]*)\s*\=3D\>\s*([\w\/\.\-]*)\s*\}/ =
&&
 =09=09      (defined($1) || defined($2)))) &&
                       !(($realfile ne '') &&
+                        defined($acpi_testexpected) &&
                         ($realfile eq $acpi_testexpected))) {
 =09=09=09$reported_maintainer_file =3D 1;
 =09=09=09WARN("added, moved or deleted file(s), does MAINTAINERS need upda=
ting?\n" . $herecurr);



