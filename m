Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B104ED094
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:01:06 +0200 (CEST)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiFN-00025v-49
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:01:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftD-0008ML-72
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:08 -0400
Received: from [2a00:1450:4864:20::12b] (port=36445
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft9-0003RX-6x
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:02 -0400
Received: by mail-lf1-x12b.google.com with SMTP id bt26so38063244lfb.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UWNOlxI3Y81KZ56+Dl8p8TtuCtCt2TgumvfkhsZcZsc=;
 b=OzW7V6Buepf5PfhTsty/VdzU5pFr0mp12zWLpWda8JQqQg/85X0KU6eDLa1Nrg8kU5
 Y4J94bD9OZS0WFDiTimtQ7wHgORuw0ppBB831orgh3mKvZ85AQqIcPgP3i0kvz5966EW
 nWBDllPCklL0R8iebpJFvBf3QAozBEEALE1CUKZyMVVEmM2uFUli1P7m2nTRTqxCOC8v
 ITfd7WVlfTrKdxHCxKic46THF0WMyV30xJry0my0LUtoirtgGVOQa19QNxBU235siU2a
 PFWjn7htPlNzl2glnJsqBwhpUqRXIxjGsLTMgR5UWkLmsXwvEHjlsw640t4koFuOy0mY
 FCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWNOlxI3Y81KZ56+Dl8p8TtuCtCt2TgumvfkhsZcZsc=;
 b=qKIGMLSyFp1ooHhPchoV7afNsJgvTbAshIfizhTXlHSQrbVpOba0D1K+0yVimVbqZx
 EBquXlvESB4Qs2G9UHxFvIUSSN8jWsiND3j1EI909RL5oGf+vhxLXg7G+dyvINUAnK1k
 6NDxSaF+DDw0q8saRnFWBhGoGlErfywbtS9szcziSgekRDY3eday/+cab5xMYaPCkh1f
 WndZRclX9PoB5KulCIqNxzB4MrHamqbJ7pFysyWFl7FkyvBBM5t9IdvpD6pNdSIvYkok
 IuTSVu7xg9ifXR7WznkjROgfl0y2u6lv1bpeq3vqDSoGUnKOfKsHMhe2IWapD2Jo1Lw0
 AZHA==
X-Gm-Message-State: AOAM532kCfLHLRsinkmlvhQmye4WnJwoN6oimOhraBWZgr/bT6lLUx0w
 Xx/7N8ROGMdqGu0FuZBDhl6Spw==
X-Google-Smtp-Source: ABdhPJxPjgW0XmwTnbsZUor2vYoVIYqL1fEN4na0lPCGA7/EKJJsqYSve3l88TGgl0mqjx8/p9LbZA==
X-Received: by 2002:a05:6512:2202:b0:44a:57b6:50d with SMTP id
 h2-20020a056512220200b0044a57b6050dmr8418266lfu.3.1648675797678; 
 Wed, 30 Mar 2022 14:29:57 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:57 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 42/45] iotests.py: add VM.qmp_check() helper
Date: Thu, 31 Mar 2022 00:28:59 +0300
Message-Id: <20220330212902.590099-43-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm tired of this pattern being everywhere. Let's add a helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index aaa77b5105..329297bfe4 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1101,6 +1101,10 @@ def get_block_graph(self):
     def assert_edges_list(self, edges):
         assert sorted(edges) == sorted(self.get_block_graph())
 
+    def qmp_check(self, *args, **kwargs):
+        result = self.qmp(*args, **kwargs)
+        assert result == {'return': {}}
+
     def assert_block_path(self, root, path, expected_node, graph=None):
         """
         Check whether the node under the given path in the block graph
-- 
2.35.1


