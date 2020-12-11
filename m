Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1D72D7985
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:37:06 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkTh-0007ud-1x
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHx-0004fm-E0
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHs-000646-Jy
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETkviDoS0sSEt8TvkS32nDVZw6oCU/Om8bI8qrLo5fU=;
 b=TLAdTZ25FNdJGdN4wdzSIotYpWckoEUnY9s72qGrNDdGQQ2CNflPeau56bYh3A02RphAkP
 CoMZ1wHpGzCvpvwn1X/2H8246QuktwPW97AOqQT/rGxO/nayYOp2Uxi/H2w1tBqAvpqvH7
 lEvdLTLGVh5Ks2ip1VgPOapGrjcQ2hM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-7FtVjrpkOna9Ip2Bw7DWlA-1; Fri, 11 Dec 2020 10:24:47 -0500
X-MC-Unique: 7FtVjrpkOna9Ip2Bw7DWlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B9A31014E63;
 Fri, 11 Dec 2020 15:24:46 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB47100239F;
 Fri, 11 Dec 2020 15:24:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 08/12] target/sparc/translate: silence the compiler warnings
Date: Fri, 11 Dec 2020 16:24:22 +0100
Message-Id: <20201211152426.350966-9-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201030004046.2191790-6-kuhn.chenqun@huawei.com>
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


