Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5131C61B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 06:01:03 +0100 (CET)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBsTu-0002YW-Ry
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 00:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQZ-0006Rh-Vg
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQX-0007rH-R2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613451453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBswHeP/LqjNLtNDbukJ/DOYbD3+9QP9BSjOznKS4ew=;
 b=Us2vIEP+e2qRJFfSxEc2lMMp6pqKipQmL7F+kLtEKJXp9goKIuXQIUyvINLczgCTkrMig/
 dnSA40Rq7+j27M+hOKdhdQt+8Dy7HiphMTxdwUw5eZp2E0XnQqMYEUqC6WCKh+bd5zxdGJ
 BCKalw/Jgnq/Cv4GSUguzLSc1/HdNso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-ekMu_glDPgWRZFJ7VBEI9w-1; Mon, 15 Feb 2021 23:57:30 -0500
X-MC-Unique: ekMu_glDPgWRZFJ7VBEI9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA355801975;
 Tue, 16 Feb 2021 04:57:29 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-129.rdu2.redhat.com
 [10.10.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2344B710DB;
 Tue, 16 Feb 2021 04:57:25 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/9] Acceptance Tests: fix population of public key in
 cloudinit image
Date: Mon, 15 Feb 2021 23:57:04 -0500
Message-Id: <20210216045705.9590-9-crosa@redhat.com>
In-Reply-To: <20210216045705.9590-1-crosa@redhat.com>
References: <20210216045705.9590-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the path of the ssh public key is being set, but its
content is obviously what's needed.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210203172357.1422425-18-crosa@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 687c5dc0cf6..51e9055c986 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -290,13 +290,15 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
             self.phone_home_port = network.find_free_port()
+            with open(ssh_pubkey) as pubkey:
+                pubkey_content = pubkey.read()
             cloudinit.iso(cloudinit_iso, self.name,
                           username='root',
                           password='password',
                           # QEMU's hard coded usermode router address
                           phone_home_host='10.0.2.2',
                           phone_home_port=self.phone_home_port,
-                          authorized_key=ssh_pubkey)
+                          authorized_key=pubkey_content)
         except Exception:
             self.cancel('Failed to prepare the cloudinit image')
         return cloudinit_iso
-- 
2.26.2


