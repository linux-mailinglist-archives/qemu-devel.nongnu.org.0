Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E594433D9D0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:50:39 +0100 (CET)
Received: from localhost ([::1]:55680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCty-0002pN-Rv
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCpC-00084i-Eo
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCp4-0004Se-Ga
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615913130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RluWXXrI6PublAXlA3uk8zdKkC4drNoJaZZWEf1InY0=;
 b=Q7TeUfmG/cQKl4rUu6TpmUAF80VP2KrhScCorQv1T1PL2JcEgoQ6rklua8zw1tKa8sXCvW
 oJtM3brEEFHXntMslRqW5cjr9fOv57ocFhJnSAmo/W/9abKjfyn7q0mrxS14RknVvpaX6O
 fXc2b4oCYjC5gGIgULrlU3vxyePCYow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-gr3Cjm-YO1uUwm_X3eKZMA-1; Tue, 16 Mar 2021 12:45:26 -0400
X-MC-Unique: gr3Cjm-YO1uUwm_X3eKZMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F2C81940927;
 Tue, 16 Mar 2021 16:45:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-185.ams2.redhat.com
 [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FCA65C1A1;
 Tue, 16 Mar 2021 16:44:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] monitor: raise error when 'pretty' option is used with
 HMP
Date: Tue, 16 Mar 2021 16:43:44 +0000
Message-Id: <20210316164355.150519-3-berrange@redhat.com>
In-Reply-To: <20210316164355.150519-1-berrange@redhat.com>
References: <20210316164355.150519-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst       | 7 -------
 docs/system/removed-features.rst | 6 ++++++
 monitor/monitor.c                | 4 ++--
 qemu-options.hx                  | 5 +++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 32bda5f4ef..269fe2bcac 100644
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
index 93384746a1..5fbec3b963 100644
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
index 622d3bfa5a..17dc791d5d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3703,8 +3703,9 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
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
2.30.2


