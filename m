Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF65BD483
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:08:18 +0200 (CEST)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLBp-0002gz-BL
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfq-0002ym-N2
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfo-000356-LT
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvn0kmiceqd2oyNCXiSyFlEG1+Z3hg5qC/XijQrII0Y=;
 b=MEL/gLt7us5/+PTRPckXNXH6IvqlVtfXbIQH9nlgGYjEESHgTSLCeC93yIR8HeqtsRUzFr
 o38/sJX38ygxR4yBrhMHtCa2UsWu1/fgfKKxzvJE33Rxkh4N78oPh4OmOKcPigY7dZ9kQC
 /HO9blRkyW++pHtHbZhuFmHdG1B9OX0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-Jq31EFYzMsCP1yDb4BMSRQ-1; Mon, 19 Sep 2022 13:35:10 -0400
X-MC-Unique: Jq31EFYzMsCP1yDb4BMSRQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p24-20020a05600c1d9800b003b4b226903dso4958769wms.4
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uvn0kmiceqd2oyNCXiSyFlEG1+Z3hg5qC/XijQrII0Y=;
 b=XLNhnSS+VeVAX13VdOrYG1EzpeF5KNcqezTf8QpJQzIosYdu9Yj1BC589/YltWe/6g
 95Yu+VWqVzxO+MmXK/C/qim0HsNnjea/8IMzdWrc9DlUo0WufKOkCd2eZaShzDZJj/7b
 eJpRAMra7dHGAMtH9DB7vTLjx5PsHeVN3oMlpxor7faDfk5PdJVkjxq8xvmHsSpL000E
 l9CcGNCokiMCcPXDYBXQ8Sn3FB+d0qjm4GwGT3AgF1ccuCsITWJAxz4VNYbmiwLUMR34
 lZsXCDZs1PC2idVf/SpZHPd9PQ7l5/w2ThdEqWHKSN01NHCSxpr5EMM7J8xrTL1hjdiR
 QGZw==
X-Gm-Message-State: ACgBeo2vcjFnmgeRxJKKWYBWKrt3WOj8jWbDxaBfhZ8cQABQ4z3P88YM
 dRLrZFWn08Xr3f104DzJY8T1kEizSx9CYd2GbDVAS/8buC3AW0UmWK+PYfeLPST+eZIF8U0sc6D
 xDPfURij3vcw+vo1tHGkYKyQHkCYlq8g8AV4B/7CnQz6AknFhkKdfGsKIAyeR3dcnZPQ=
X-Received: by 2002:a05:600c:2c4d:b0:3b4:867f:1e6f with SMTP id
 r13-20020a05600c2c4d00b003b4867f1e6fmr20394667wmg.75.1663608909099; 
 Mon, 19 Sep 2022 10:35:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR61ZrI0SMdna6IzGJV+74UIRCP2VvUbKNAyUlcGEQfRHNZYw/XgNPqEzn5WNIxf/DGh/Jr+sQ==
X-Received: by 2002:a05:600c:2c4d:b0:3b4:867f:1e6f with SMTP id
 r13-20020a05600c2c4d00b003b4867f1e6fmr20394645wmg.75.1663608908695; 
 Mon, 19 Sep 2022 10:35:08 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe441000000b0022a2bacabbasm14108601wrm.31.2022.09.19.10.35.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] tests: unit: add NULL-pointer check
Date: Mon, 19 Sep 2022 19:34:38 +0200
Message-Id: <20220919173449.5864-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

In CID 1432593, Coverity complains that the result of qdict_crumple()
might leak if it is not a dictionary.  This is not a practical concern
since the test would fail immediately with a NULL pointer dereference
in qdict_size().

However, it is not nice to depend on qdict_size() crashing, so add an
explicit assertion that that the crumpled object was indeed a dictionary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/check-block-qdict.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/check-block-qdict.c b/tests/unit/check-block-qdict.c
index 5a25825093..751c58e737 100644
--- a/tests/unit/check-block-qdict.c
+++ b/tests/unit/check-block-qdict.c
@@ -504,7 +504,7 @@ static void qdict_crumple_test_empty(void)
     src = qdict_new();
 
     dst = qobject_to(QDict, qdict_crumple(src, &error_abort));
-
+    g_assert(dst);
     g_assert_cmpint(qdict_size(dst), ==, 0);
 
     qobject_unref(src);
-- 
2.37.2


