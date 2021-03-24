Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6863473D9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:44:47 +0100 (CET)
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOz8A-0008NR-R1
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOz5I-0007TF-4J
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:41:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOz5F-0004BA-3a
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616575300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I4Kw9XgbAEsp9nyEvKNpkDj2cDQHP71Hr1biyppb8Dk=;
 b=VIb2/Mmq8gR/aTOtWGi8IG3n02GhgLIkRLzbjdLsvuS+ILSAaXqPVrmRF0OplI86eT/rDf
 Ny66ImSj+zB3T2PW128XoOXPsf5G1toubvO7+Nu9VxkCdGliw0ufwP3wRk1sGiySqOZ09w
 wYQk+6HV3fqOFdO3bedTKlq7ePVHul0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-FkM4ReM1MeyNIborTPS5Ng-1; Wed, 24 Mar 2021 04:41:38 -0400
X-MC-Unique: FkM4ReM1MeyNIborTPS5Ng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756751084D69;
 Wed, 24 Mar 2021 08:41:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FC2977E21;
 Wed, 24 Mar 2021 08:41:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CE25011327E1; Wed, 24 Mar 2021 09:41:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qom: Fix default values in help
Date: Wed, 24 Mar 2021 09:41:30 +0100
Message-Id: <20210324084130.3986072-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, thuth@redhat.com,
 marcandre.lureau@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Output of default values in device help is broken:

    $ ./qemu-system-x86_64 -S -display none -monitor stdio
    QEMU 5.2.50 monitor - type 'help' for more information
    (qemu) device_add pvpanic,help
    pvpanic options:
      events=<uint8>         -  (default: (null))
      ioport=<uint16>        -  (default: (null))
      pvpanic[0]=<child<qemu:memory-region>>

The "(null)" is glibc printing a null pointer.  Other systems crash
instead.  Having a help request crash a running VM can really spoil
your day.

Root cause is a botched replacement of qstring_free() by
g_string_free(): to get the string back, we need to pass true to the
former, but false to the latter.  Fix the argument.

Fixes: eab3a4678b07267c39e7290a6e9e7690b1d2a521
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qom/object_interfaces.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index c3324b0f86..bd8a947a63 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -159,7 +159,7 @@ char *object_property_help(const char *name, const char *type,
     }
     if (defval) {
         g_autofree char *def_json = g_string_free(qobject_to_json(defval),
-                                                  true);
+                                                  false);
         g_string_append_printf(str, " (default: %s)", def_json);
     }
 
-- 
2.26.3


