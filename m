Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12B6F0D2A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:31:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8Fs-0002vH-1n; Thu, 27 Apr 2023 16:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps8Fp-0002tc-Ar; Thu, 27 Apr 2023 16:30:13 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps8Fm-0004oI-NG; Thu, 27 Apr 2023 16:30:13 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id C031A5FA89;
 Thu, 27 Apr 2023 23:30:01 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b438::1:2b])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id lTP2w70Oh0U0-r26N1L8v; Thu, 27 Apr 2023 23:30:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682627401; bh=IEArJaNrjLGyYzRy4rI5w377T+mYvbr62NS8qBd/kG8=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=l0wGe7S6CXNXcV6AyRpJSmY0J48ssofoPM0I+Nqm6NlnPDIwN8M9WTMAvg4WbMjRc
 Y/ypZ67vsOp54sYpUhX2frSH1+16v+m5ePdeemgEN6DTTplM3dcMVCQtq7YmJ5JrA5
 XWday4pmjeJ2L1WOs3Ngno4eg6sLoQ/0TtAe5C34=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com, lukasstraub2@web.de,
 vsementsov@yandex-team.ru
Subject: [PATCH v3 2/4] scripts/qapi: allow optional experimental enum values
Date: Thu, 27 Apr 2023 23:29:44 +0300
Message-Id: <20230427202946.1007276-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
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

We have 'if' feature for some things in QAPI, including enum values.
But currently it doesn't work for experimental enum values, as in
generated QEnumLookup structure, the description for additional
features (for example - "unstable") is not surrounded by corresponding
"#ifdef"s.

So let's fix it.

We are going to use it in the next commit, to make unstable x-colo
migration capability optional:

  { 'name': 'x-colo', 'features': [ 'unstable' ], 'if': 'CONFIG_COLO' }

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


