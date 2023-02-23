Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D8E6A0887
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:24:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAdL-0002x8-Cp; Thu, 23 Feb 2023 07:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdI-0002w4-Qu
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdH-0003xo-95
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677155010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TlPzad5feeEw09+f2Wx+S34iHE9O/8LcRpwkEjJewx4=;
 b=ZVDnQIqLvGFt6ziOACI47C57ZqGRQv+Q8Fb5g5/Un+kTNYhXGk7uRE7vJ/JPQXXxWkAn7x
 8x9WWyIvD2I1aBgZsj5cIb0k2L/OIumHBkb7x6jEIv0AxKqlrltWDtQFZLofyGn/rj8grn
 9RoEpWNJSWOhDp6EfSmKtcZonhuA/yc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-1pi_H8A_NPWyVa4BHxuPNw-1; Thu, 23 Feb 2023 07:23:29 -0500
X-MC-Unique: 1pi_H8A_NPWyVa4BHxuPNw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7FE4858F09;
 Thu, 23 Feb 2023 12:23:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FACC492B00;
 Thu, 23 Feb 2023 12:23:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 87BBE21E6A21; Thu, 23 Feb 2023 13:23:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 2/8] docs/devel/qapi-code-gen: Fix a missing 'may',
 clarify SchemaInfo
Date: Thu, 23 Feb 2023 13:23:21 +0100
Message-Id: <20230223122327.1920247-3-armbru@redhat.com>
In-Reply-To: <20230223122327.1920247-1-armbru@redhat.com>
References: <20230223122327.1920247-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Documentation of enumeration value conditions lacks a 'may'.  Fix
that.

Clarify SchemaInfo documentation for struct and union types.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230213132009.918801-3-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 566640edf8..23e7f2fb1c 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -818,8 +818,8 @@ member 'bar' ::
 
 A union's discriminator may not be conditional.
 
-Likewise, individual enumeration values be conditional.  This requires
-the longhand form of ENUM-VALUE_.
+Likewise, individual enumeration values may be conditional.  This
+requires the longhand form of ENUM-VALUE_.
 
 Example: an enum type with unconditional value 'foo' and conditional
 value 'bar' ::
@@ -1158,9 +1158,8 @@ Example: the SchemaInfo for EVENT_C from section Events_ ::
     Type "q_obj-EVENT_C-arg" is an implicitly defined object type with
     the two members from the event's definition.
 
-The SchemaInfo for struct and union types has meta-type "object".
-
-The SchemaInfo for a struct type has variant member "members".
+The SchemaInfo for struct and union types has meta-type "object" and
+variant member "members".
 
 The SchemaInfo for a union type additionally has variant members "tag"
 and "variants".
-- 
2.39.0


