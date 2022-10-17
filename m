Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8644601039
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:28:31 +0200 (CEST)
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQAQ-00080W-T1
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okQ2r-000811-0v; Mon, 17 Oct 2022 09:20:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okQ2p-0001Q6-7u; Mon, 17 Oct 2022 09:20:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id h12so11001430pjk.0;
 Mon, 17 Oct 2022 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScFM06TafGFnAEEgchR2vZkgEMudoWFnssv9K/jOdDI=;
 b=pJzQ3baBbL646LT20331wc/krPjTvJmhIwsvSUpI/lyxyLWyANYBa59GFBzfT7j1JJ
 JziAVN7pC5L0N2k+SAB6GQ//AV0kI3bUEmKPN9kx8NnmDTdKXCc2mq0IFWCo7frr1vxd
 VBxh160hFKT6lmOtig3AOjFMOZke8EoMAXu1k73EssNYN+U0T42yzcN78jTbi/wbpgUK
 SsAcOYwV4WZayD7WilcSIbbYr9v1yi00UEDUzloI8TY2rhWvTUlBGf/mX9xjs8JdpFG4
 TcGFcwgz0Q6uqEmqZCW/5oE6SH1OjcYGvFfQE5+CTM8YRfKarwHfWATkmWVTxa0/hirM
 vksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ScFM06TafGFnAEEgchR2vZkgEMudoWFnssv9K/jOdDI=;
 b=EwP3pvOo+56G+pDXK2kObDeRR43xiyJuE7SPKFZnTpJ784xrBJakjiyjFaFmANo34/
 oJILy8TJQiNy2ojeemvL6AsZIlPwv/ZDp4aFWMNe1uRMAYYwhqYqudTixdQXlbGvgRLE
 RQsSETU+uFUepge3dlXwEWVcs2vCC+G+m1sv/nyCmYwG2vxfgGx1S6TXgmqw46D2Kv2G
 KnwRerbhRgiT9mSD/wINUTy7dDGkF43tkeNYkRyDfBpY7tZVnjKdVocChd+pBCjTxXJY
 PhRcchGEns/uYuIHgb69gstIbl7PUdTWRUp43XbgjFu0M4ISBESQVEM9Kt4MM6xv1oup
 yy2A==
X-Gm-Message-State: ACrzQf1oGV51E58KYgxnpP9qDODPWduMoAXVFtl2HEsEu8XqNDaCDbxT
 R5bF5Fu57XpnijNNJIF0nV5mIvShw4hOGw==
X-Google-Smtp-Source: AMsMyM7XhelSPNNhQneo+HoOPWIp9JRwSEwDiVIel3iDLAhFZKtwNqTpsf9xqmfMg7o9OOtEpwGuMw==
X-Received: by 2002:a17:90a:c782:b0:202:c73e:5488 with SMTP id
 gn2-20020a17090ac78200b00202c73e5488mr32744326pjb.202.1666012837323; 
 Mon, 17 Oct 2022 06:20:37 -0700 (PDT)
Received: from ubuntu.. ([65.20.73.185]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090332c600b001806f4fbf25sm6634255plr.182.2022.10.17.06.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 06:20:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Shengjiang Wu <shengjiang.wu@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 2/2] tests/qtest: vhost-user-test: Fix
 [-Werror=format-overflow=] build warning
Date: Mon, 17 Oct 2022 21:20:23 +0800
Message-Id: <20221017132023.2228641-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017132023.2228641-1-bmeng.cn@gmail.com>
References: <20221017132023.2228641-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

When tmpfs is NULL, a build warning is seen with GCC 9.3.0.
It's strange that GCC 11.2.0 on Ubuntu 22.04 does not catch this,
neither did the QEMU CI.

While we are here, improve the error message as well.

Reported-by: Shengjiang Wu <shengjiang.wu@windriver.com>
Fixes: e6efe236c1d1 ("tests/qtest: vhost-user-test: Avoid using hardcoded /tmp")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---

Changes in v2:
- improve the error message

 tests/qtest/vhost-user-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index e8d2da7228..bf9f7c4248 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -571,8 +571,8 @@ static TestServer *test_server_new(const gchar *name,
 
     tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
-                       err->message);
+        g_test_message("Can't create temporary directory in %s: %s",
+                       g_get_tmp_dir(), err->message);
         g_error_free(err);
     }
     g_assert(tmpfs);
-- 
2.34.1


