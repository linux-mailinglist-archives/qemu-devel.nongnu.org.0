Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D883F323D7F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:16:54 +0100 (CET)
Received: from localhost ([::1]:53008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEu29-0003ml-Pb
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtyS-0001tG-Hz
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:13:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtyP-0004qG-LD
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKOjyUhx7RA2dTsSSojbjSBEl5q4SaZOZuRyvXpvXA0=;
 b=SH4WnOvImo7D/lXr4dfy5y+rejWXkuGR6lVc5hSSUiGbRzRFAuwHp63A4vIF6JTVV1EoqX
 IQAB1HTOqGei1VUdizXC2O5nBz9HAlOutP0+ewVHh5GOYUg/ypnCO1cukppSd8v3KzRsd3
 3BHeiR41irPJwwJ9qpUoq1KIu5PBYrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-TWhyyE6uMs-vKY4Yv5kJtQ-1; Wed, 24 Feb 2021 08:12:56 -0500
X-MC-Unique: TWhyyE6uMs-vKY4Yv5kJtQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C63238030BB;
 Wed, 24 Feb 2021 13:12:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C47DA10016F6;
 Wed, 24 Feb 2021 13:12:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/14] monitor: raise error when 'pretty' option is used with
 HMP
Date: Wed, 24 Feb 2021 13:11:30 +0000
Message-Id: <20210224131142.1952027-3-berrange@redhat.com>
In-Reply-To: <20210224131142.1952027-1-berrange@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is only semantically useful for QMP.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst       | 7 -------
 docs/system/removed-features.rst | 6 ++++++
 monitor/monitor.c                | 4 ++--
 qemu-options.hx                  | 5 +++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 786b997fe7..dfd8a8c497 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -62,13 +62,6 @@ needs two devices (``-device intel-hda -device hda-duplex``) and
 ``pcspk`` which can be activated using ``-machine
 pcspk-audiodev=<name>``.
 
-``-mon ...,control=readline,pretty=on|off`` (since 4.1)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``pretty=on|off`` switch has no effect for HMP monitors, but is
-silently ignored. Using the switch with HMP monitors will become an
-error in the future.
-
 RISC-V ``-bios`` (since 5.1)
 ''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 0424b9a89d..3ca13d2844 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -44,6 +44,12 @@ block cache, ``-accel tcg,tb-size=``.
 The ``acl`` option to the ``-vnc`` argument has been replaced
 by the ``tls-authz`` and ``sasl-authz`` options.
 
+``-mon ...,control=readline,pretty=on|off`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``pretty=on|off`` switch has no effect for HMP monitors and
+its use is rejected.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/monitor/monitor.c b/monitor/monitor.c
index e94f532cf5..515efb015e 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -720,8 +720,8 @@ int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp)
             return -1;
         }
         if (opts->pretty) {
-            warn_report("'pretty' is deprecated for HMP monitors, it has no "
-                        "effect and will be removed in future versions");
+            error_setg(errp, "'pretty' is not compatible with HMP monitors");
+            return -1;
         }
         monitor_init_hmp(chr, true, &local_err);
         break;
diff --git a/qemu-options.hx b/qemu-options.hx
index 6c34c7050f..a934d5c787 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3702,8 +3702,9 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
     "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 SRST
 ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
-    Setup monitor on chardev name. ``pretty`` turns on JSON pretty
-    printing easing human reading and debugging.
+    Setup monitor on chardev name. ``pretty`` is only valid when
+    ``mode=control``, turning on JSON pretty printing to ease
+    human reading and debugging.
 ERST
 
 DEF("debugcon", HAS_ARG, QEMU_OPTION_debugcon, \
-- 
2.29.2


