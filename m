Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E651D5AD1DE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:55:12 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAh5-0000zO-SJ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVA0B-0005Mm-0x
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVA06-00065w-Vf
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662376245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uvn0kmiceqd2oyNCXiSyFlEG1+Z3hg5qC/XijQrII0Y=;
 b=GRp1H8cMuXEvx2UaNxLtx5HGUG7ytbudzG/HEDx8vnTt9EwpzNHAvVUuCUpKepFlXNfYty
 8BsJ2kcrf+Xod6wW1b3xC9Se+f48m5NC+xHixNQ8LUI/b8qOkeZ7U1xwT1IflN/Hs9f8pl
 eO8/yEwBPtYSF7LVUH2vDmvai3uSuiU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-502-sgmlVqoiNhSUSVd2aopnsw-1; Mon, 05 Sep 2022 07:10:42 -0400
X-MC-Unique: sgmlVqoiNhSUSVd2aopnsw-1
Received: by mail-ed1-f72.google.com with SMTP id
 r11-20020a05640251cb00b004484ec7e3a4so5629131edd.8
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=uvn0kmiceqd2oyNCXiSyFlEG1+Z3hg5qC/XijQrII0Y=;
 b=zFysmDrDBbzjnmHJGaJ3adaUxMwfCiXQSbEDwVjSlnqXvsOlMghlNY6G/LYO2InnWd
 Jq5kXKTGtpvRx/2rFiiBOanu9NnlTykEWfe4x87pjNWqxffgI2D1CySh9kNaVxeEHNCI
 UC8ExfKBak5NnO0244ruJ6B7DyoFLLBtH76RVjsLG44yYBDnsJGRsaASxx/HUgcWwxTM
 TLJSJhijf1QMb5f695dFnmoDGNbDy8SmbeapdqwHFu0pO3j80YTxl/lroF/lTehHoyJY
 uJ0zdZIgqiqlurOhr+Qkciune80mcinFjxbauK3h+z3M6lsHXwi1799z9/0bWT1iqOZR
 oaBg==
X-Gm-Message-State: ACgBeo23PAiCcm+q7TQnjsL0/E4xAFz54tRFTxby3cEivn2QppV6lRcP
 XIPNfV4CsBPqcVuNWAQm6SJhtokBHOfol2DM5K05XCMUnVBbErFJ9uttNmvGeViW56R+pTCubE0
 ZoOKEluRpTYfJBiU3sCAMiqS0kMoD9Cx3DBXIiwsag+cJGB4XJaqu6a6W3/RCqu7uRi0=
X-Received: by 2002:a17:907:272a:b0:741:8105:49e2 with SMTP id
 d10-20020a170907272a00b00741810549e2mr25580560ejl.171.1662376240677; 
 Mon, 05 Sep 2022 04:10:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6nhLFTVzosOvnDxomhboUgPm9lirvcgFcQ/OXolY5WfaoxWT6h3S016WnTcLfgXWxs7daiYw==
X-Received: by 2002:a17:907:272a:b0:741:8105:49e2 with SMTP id
 d10-20020a170907272a00b00741810549e2mr25580550ejl.171.1662376240432; 
 Mon, 05 Sep 2022 04:10:40 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a50ee08000000b00447c646ad1asm6271233eds.57.2022.09.05.04.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 04:10:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com
Subject: [PATCH] tests: unit: add NULL-pointer check
Date: Mon,  5 Sep 2022 13:10:38 +0200
Message-Id: <20220905111038.33324-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


