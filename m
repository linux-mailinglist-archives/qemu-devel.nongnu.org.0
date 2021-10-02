Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E3B41FABF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:02:26 +0200 (CEST)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWbqb-00017e-3x
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblU-00017a-PW
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblQ-0004Sk-LP
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPxya/GwezsjBUFS3MoXaKBld+mVWE2AFjBhCgBEpXY=;
 b=BMZo6XnliQPfX0cw15yJfzItS3OIkeG84w3aUutb5fjfdyG0Z1pqKVd5dkv1I+bXMwfaPz
 9BvqL7lH/vsKbzxLZE68pZvFUCbe5zxS8b7zzaLlIhOo1xP437j9UFlV6UbVmY1ceprO7N
 HLC8QPJmO2IV4avi7pleGBxD34CfxH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-OqL5cCvqPESRALHNfSO0tA-1; Sat, 02 Oct 2021 05:56:59 -0400
X-MC-Unique: OqL5cCvqPESRALHNfSO0tA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7345E1084684;
 Sat,  2 Oct 2021 09:56:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48562100AE2C;
 Sat,  2 Oct 2021 09:56:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9488E1138469; Sat,  2 Oct 2021 11:56:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] qapi/parser: Silence too-few-public-methods warning
Date: Sat,  2 Oct 2021 11:56:54 +0200
Message-Id: <20211002095655.1944970-13-armbru@redhat.com>
In-Reply-To: <20211002095655.1944970-1-armbru@redhat.com>
References: <20211002095655.1944970-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Eh. Not worth the fuss today. There are bigger fish to fry.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210930205716.1148693-13-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 0265b47b95..1b006cdc13 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -461,8 +461,10 @@ class QAPIDoc:
     """
 
     class Section:
+        # pylint: disable=too-few-public-methods
         def __init__(self, parser: QAPISchemaParser,
                      name: Optional[str] = None, indent: int = 0):
+
             # parser, for error messages about indentation
             self._parser = parser
             # optional section name (argument/member or section name)
@@ -498,6 +500,7 @@ class NullSection(Section):
         """
         Immutable dummy section for use at the end of a doc block.
         """
+        # pylint: disable=too-few-public-methods
         def append(self, line: str) -> None:
             assert False, "Text appended after end_comment() called."
 
-- 
2.31.1


