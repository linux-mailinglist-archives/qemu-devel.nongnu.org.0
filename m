Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244A274C2C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:36:52 +0200 (CEST)
Received: from localhost ([::1]:40818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKqu3-0005vm-8V
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKqsr-00049K-KP
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKqso-0007bR-TS
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91Nfs25MUnlz2lbX63MuZ0javddZdJuS/LqgOXEy65A=;
 b=iST5jX3z/ByDb3C14+/vUIqCb5I520cB/fC2DXRi8n0cbzSlFckV/hZIzAi9dOTf5Xsbsw
 jl20QfgTf2Pd3xJ/3tfhHOhfX0pLjFR8WLcm38xKlYP80AfI8lopfw4r8QMj4Tp3N9qITu
 +bnETMVStMtQ+DvhAMcVAvFrMk6Br2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-q6WJou7sNkSlvYzPqhNYeQ-1; Tue, 22 Sep 2020 18:35:30 -0400
X-MC-Unique: q6WJou7sNkSlvYzPqhNYeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B15A5801AEB;
 Tue, 22 Sep 2020 22:35:29 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1AA160BF4;
 Tue, 22 Sep 2020 22:35:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 02/26] qapi/parser.py: group variable declarations in __init__
Date: Tue, 22 Sep 2020 18:35:01 -0400
Message-Id: <20200922223525.4085762-3-jsnow@redhat.com>
In-Reply-To: <20200922223525.4085762-1-jsnow@redhat.com>
References: <20200922223525.4085762-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing declarations and group them by function so they're easier to
understand at a distance.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 55117f5754..b2984c8ff0 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -50,12 +50,19 @@ def __init__(self, fname, previously_included=None, incl_info=None):
         self._included = previously_included or set()
         self._included.add(os.path.abspath(self._fname))
 
+        # Lexer state (see `accept` for details):
+        self.tok = None
+        self.pos = 0
         self.cursor = 0
+        self.val = None
         self.info = QAPISourceInfo(self._fname, 1, incl_info)
         self.line_pos = 0
+
+        # Parser output:
         self.exprs = []
         self.docs = []
 
+        # Showtime!
         try:
             fp = open(self._fname, 'r', encoding='utf-8')
             self.src = fp.read()
-- 
2.26.2


