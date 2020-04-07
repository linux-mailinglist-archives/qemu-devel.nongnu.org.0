Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019371A0D0B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 13:46:49 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLmgq-0005S1-0X
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 07:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jLmfa-0003lQ-5U
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jLmfZ-0008IV-6F
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:45:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50418
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jLmfZ-0008Hr-2Q
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 07:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586259928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCF4fUBaZZBRV7HxeYvrs0Oa24SfGlc/AdUK/2/5O4E=;
 b=g6avaygPrY0N+t6LkaFF9OEhbs1dsM+QoO0mosXQndPhr50vpPIGj2Wmx4MeDgFJriUCvz
 lckAG7EoazXPw0mDmJa6AJTleEcHUr3x4gwstl2QFvtoNFz2eQ+a8qtwJ8MGojZj6JUKHC
 feGUpegCOp1IKkBWwhyGeO6i3u82vQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-X6RoHFiqMSKEfYVIqj44SA-1; Tue, 07 Apr 2020 07:45:25 -0400
X-MC-Unique: X6RoHFiqMSKEfYVIqj44SA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 057C8107ACC4;
 Tue,  7 Apr 2020 11:45:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3A5C0DAB;
 Tue,  7 Apr 2020 11:45:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3CF0411384A9; Tue,  7 Apr 2020 13:45:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] json: Fix check for unbalanced right curly brace
Date: Tue,  7 Apr 2020 13:45:23 +0200
Message-Id: <20200407114523.27583-2-armbru@redhat.com>
In-Reply-To: <20200407114523.27583-1-armbru@redhat.com>
References: <20200407114523.27583-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Simran Singhal <singhalsimran0@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Simran Singhal <singhalsimran0@gmail.com>

We immediately diagnose unbalanced right curly brace:

    $ qemu-kvm --nodefaults --nographic --qmp stdio
    {"QMP": {"version": {"qemu": {"micro": 91, "minor": 2, "major": 4},
    "package": "v5.0.0-rc1-1-gf6ce4a439a08"}, "capabilities": ["oob"]}}
    }
    {"error": {"class": "GenericError", "desc": "JSON parse error,
    expecting value"}}

except within square bracket:

    [}

The check for unbalanced braces has a typo.  Fix it.

Fixes: 8d3265b3d00db1071d1d3bf8433b4818088fdeb5
Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200402182848.GA3023@simran-Inspiron-5558>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Commit message rewritten to explain what's broken]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qobject/json-streamer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qobject/json-streamer.c b/qobject/json-streamer.c
index 47dd7ea576..b93d97b995 100644
--- a/qobject/json-streamer.c
+++ b/qobject/json-streamer.c
@@ -85,7 +85,7 @@ void json_message_process_token(JSONLexer *lexer, GString=
 *input,
     g_queue_push_tail(&parser->tokens, token);
=20
     if ((parser->brace_count > 0 || parser->bracket_count > 0)
-        && parser->bracket_count >=3D 0 && parser->bracket_count >=3D 0) {
+        && parser->brace_count >=3D 0 && parser->bracket_count >=3D 0) {
         return;
     }
=20
--=20
2.21.1


