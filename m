Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BCA2841FE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 23:17:57 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPXro-0008N1-P4
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 17:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXkX-0008HG-Uq
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 17:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXkW-0007S4-3P
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 17:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601932222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iQEv3zt3p82NBPGH5arb7e91tJI4oUtytLb1EkHJy4=;
 b=OOI0Cp4VFL/kRAYH3U+whtser6XXfufkIXvyZxj5SycY14AOmn+DaxJci1HpRlVKEdeCB1
 7E4T8ECBYnDIA3wboHGTbdD2ShMru2EBodSFfX/L3cSKqF5ewSSxtyxfHoVrT1WIpAKtwY
 4owowVXyhiEbofo07n226S09Xcs1elI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-HHsBiQw6M_qaHk8d8fq6gA-1; Mon, 05 Oct 2020 17:10:20 -0400
X-MC-Unique: HHsBiQw6M_qaHk8d8fq6gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0CFB1015C9D;
 Mon,  5 Oct 2020 21:10:18 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C8305C1BD;
 Mon,  5 Oct 2020 21:10:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/21] qom: Improve error message displayed with missing object
 properties
Date: Mon,  5 Oct 2020 17:09:49 -0400
Message-Id: <20201005211000.710404-11-ehabkost@redhat.com>
In-Reply-To: <20201005211000.710404-1-ehabkost@redhat.com>
References: <20201005211000.710404-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Instead of only displaying the property missing, also display
the object name. This help developer to quickly figure out the
mistake without opening a debugger.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200920155340.401482-1-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qom/object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index c335dce7e4a..10653552334 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1291,7 +1291,8 @@ ObjectProperty *object_property_find_err(Object *obj, const char *name,
 {
     ObjectProperty *prop = object_property_find(obj, name);
     if (!prop) {
-        error_setg(errp, "Property '.%s' not found", name);
+        error_setg(errp, "Property '%s.%s' not found",
+                   object_get_typename(obj), name);
     }
     return prop;
 }
-- 
2.26.2


