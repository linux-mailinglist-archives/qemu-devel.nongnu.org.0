Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19451AAFC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:37:02 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIvt-0005JY-3C
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqZ-0006NH-6l
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqX-0003li-Mt
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEN4Taxby3cvN7G7eW+9YDyt+80OuqsxRhZFJR8OOG8=;
 b=Mn1MtbiBiEhJrqBDiDAQaDQ8lW85Hl8tUVUWUxMPsA5Nxh1dvaPUZW0v9Yrvr8Onr0ewTi
 rBYW3GbMOPx+PZKORkIplM68xeVUc9drtstvqSvISeSz88KkxV4AWQxtbzxfd2Au01eBmT
 gQjEs6oxOMKbJEkQAGbc6eaHAFLEzV4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-TpHthhfDPtCHyCCPvP1vWA-1; Wed, 04 May 2022 13:31:25 -0400
X-MC-Unique: TpHthhfDPtCHyCCPvP1vWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B91929AB413;
 Wed,  4 May 2022 17:31:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 941DA156A4EA;
 Wed,  4 May 2022 17:31:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 05/16] qobject/json-lexer: disable -Winitializer-overrides
 warnings
Date: Wed,  4 May 2022 21:30:14 +0400
Message-Id: <20220504173025.650167-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220504173025.650167-1-marcandre.lureau@redhat.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Silence the clang warning when building the code with default clang,
outside of QEMU.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qobject/json-lexer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qobject/json-lexer.c b/qobject/json-lexer.c
index 632320d72d5d..955ce0ff2a53 100644
--- a/qobject/json-lexer.c
+++ b/qobject/json-lexer.c
@@ -128,6 +128,8 @@ QEMU_BUILD_BUG_ON(IN_START_INTERP != IN_START + 1);
 #define LOOKAHEAD 0x80
 #define TERMINAL(state) [0 ... 0xFF] = ((state) | LOOKAHEAD)
 
+QEMU_BEGIN_IGNORE_INITIALIZER_OVERRIDES
+
 static const uint8_t json_lexer[][256] =  {
     /* Relies on default initialization to IN_ERROR! */
 
@@ -261,6 +263,8 @@ static const uint8_t json_lexer[][256] =  {
     [IN_START_INTERP]['%'] = IN_INTERP,
 };
 
+QEMU_END_IGNORE_INITIALIZER_OVERRIDES
+
 static inline uint8_t next_state(JSONLexer *lexer, char ch, bool flush,
                                  bool *char_consumed)
 {
-- 
2.36.0.44.g0f828332d5ac


