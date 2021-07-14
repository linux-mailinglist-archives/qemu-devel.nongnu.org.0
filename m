Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B93C8623
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:28:13 +0200 (CEST)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3frw-00088J-AT
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fcb-0006jt-Ur
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fcZ-00008Q-RQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX70GM7iPcVN2VHP2PayfpuVvJsvGiDLRcAOQ0HBm3E=;
 b=Rz9wyGAQl/nBjP9VdsKGJkoizo36N0mMjcbrTGXYsAD+XsYOTWT6Pm6s8qtas2o+0KLddg
 aX8sGogvcWOqn3zIrVFtYMhrP3DjCqReqnoTvAwn9dJboexQPuMkXaOPe0A471yCFiIUsV
 uWxdstY0ABO3pEyHb2rE6eR0UwqTexI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-rmaOks0vM_qoWqw7u8yqmg-1; Wed, 14 Jul 2021 10:12:17 -0400
X-MC-Unique: rmaOks0vM_qoWqw7u8yqmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61CCC10C1ADC;
 Wed, 14 Jul 2021 14:12:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6E9560583;
 Wed, 14 Jul 2021 14:11:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] tests/migration: fix unix socket migration
Date: Wed, 14 Jul 2021 15:08:54 +0100
Message-Id: <20210714140858.2247409-23-berrange@redhat.com>
In-Reply-To: <20210714140858.2247409-1-berrange@redhat.com>
References: <20210714140858.2247409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

The test aborts and error message as the following be throwed:
"No such file or directory: '/var/tmp/qemu-migrate-{pid}.migrate",
when the unix socket migration test nearly done. The reason is
qemu removes the unix socket file after migration before
guestperf.py script do it. So pre-check if the socket file exists
when removing it to prevent the guestperf program from aborting.

See also commit f9cc00346d3 ("tests/migration: fix unix socket batch
migration").

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Hyman <huangy81@chinatelecom.cn>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/migration/guestperf/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 7c991c4407..87a6ab2009 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -423,7 +423,7 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
             progress_history = ret[0]
             qemu_timings = ret[1]
             vcpu_timings = ret[2]
-            if uri[0:5] == "unix:":
+            if uri[0:5] == "unix:" and os.path.exists(uri[5:]):
                 os.remove(uri[5:])
 
             if os.path.exists(srcmonaddr):
-- 
2.31.1


