Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5B2DC580
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:42:31 +0100 (CET)
Received: from localhost ([::1]:58014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaoo-0004VY-JU
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpadH-0000K0-49
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpadF-000192-Gl
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CIH7+enPyw1ZYJZrF4HIltd7PcnsRieLkaa7z7IeIU=;
 b=DDgYQ7DG2th4lv/JtnPXY7V9yUwDacY+5txBlJ2ZW+3xZ5IoqqEfFc1yPFsocvBqZJGYOB
 YA1hwDYTOonBk2IZHfarO3fUql1Ak30fqPNOAeWJ9U+wRkBDH8303+VOUGnwmNaJu7kujz
 j4I5X5GK6+q//qiICbTWh7wgYh1aoNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-owJq2X8FO-W28iFGbPPbJw-1; Wed, 16 Dec 2020 12:30:13 -0500
X-MC-Unique: owJq2X8FO-W28iFGbPPbJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 829B3C73A0;
 Wed, 16 Dec 2020 17:30:11 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB23410016F4;
 Wed, 16 Dec 2020 17:30:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 08/12] target/sparc/translate: silence the compiler warnings
Date: Wed, 16 Dec 2020 18:29:45 +0100
Message-Id: <20201216172949.57380-9-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
target/sparc/translate.c: In function ‘gen_st_asi’:
target/sparc/translate.c:2320:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
 2320 |         if (!(dc->def->features & CPU_FEATURE_HYPV)) {
      |            ^
target/sparc/translate.c:2329:5: note: here
 2329 |     case GET_ASI_DIRECT:
      |     ^~~~

The "fall through" statement place is not correctly identified by the compiler.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201211152426.350966-9-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/sparc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 30c73f8d2e..4bfa3179f8 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -2324,8 +2324,8 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
         }
         /* in OpenSPARC T1+ CPUs TWINX ASIs in store instructions
          * are ST_BLKINIT_ ASIs */
-        /* fall through */
 #endif
+        /* fall through */
     case GET_ASI_DIRECT:
         gen_address_mask(dc, addr);
         tcg_gen_qemu_st_tl(src, addr, da.mem_idx, da.memop);
-- 
2.27.0


