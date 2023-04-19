Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B96E854E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 00:55:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppGgG-0003IQ-LM; Wed, 19 Apr 2023 18:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppGgA-0003GV-K0; Wed, 19 Apr 2023 18:53:35 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppGg8-0000Tm-C4; Wed, 19 Apr 2023 18:53:33 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id EDBA45FB60;
 Thu, 20 Apr 2023 01:53:08 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:b583::1:16])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id YqmhHB1OqSw0-96mDfDsc; 
 Thu, 20 Apr 2023 01:53:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681944788; bh=JQmWq7xRi20jM5fMRrEVfefVE2yr+lPdXI1RXezDFkQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=CKd54WB2XgNyNuoO8zv7jv0TEv3N3VdjYXZLW7CyIzVJcd0vFCTDy/RxBboR2m5ni
 01FDPsY7Zm8Cc9foSxeopvgAiWvG69VT2OseQINI9v1pNpEpRyCIseILG2uZO/QGHS
 0m6whOc/wvDTI+WUe/nzALKjW0XL+M7GptBiFAtg=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 2/4] scripts/qapi: allow optional experimental enum values
Date: Thu, 20 Apr 2023 01:52:30 +0300
Message-Id: <20230419225232.508121-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419225232.508121-1-vsementsov@yandex-team.ru>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To be used in the next commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 scripts/qapi/types.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index c39d054d2c..18f8734047 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -61,10 +61,12 @@ def gen_enum_lookup(name: str,
 
         special_features = gen_special_features(memb.features)
         if special_features != '0':
+            feats += memb.ifcond.gen_if()
             feats += mcgen('''
         [%(index)s] = %(special_features)s,
 ''',
                            index=index, special_features=special_features)
+            feats += memb.ifcond.gen_endif()
 
     if feats:
         ret += mcgen('''
-- 
2.34.1


