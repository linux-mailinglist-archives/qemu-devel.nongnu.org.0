Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1391A340223
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:34:12 +0100 (CET)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMp2h-0001ip-41
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMowI-0003UL-1s
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:27:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMow7-0001Rq-U4
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWS4DMv1IBggkdPTa3da7lVes+2y4dL53i6HNpjUe+o=;
 b=ZVQyt3vTbvX905XAjxmOH++OIIz6g2xJh98xtNL7u3QnCM2srV6PwpspnDUDKpwaeTAx5s
 oxwOIWGyJC785kBt5qyuTISsUgiaHXNFeTDMy303U7++XIBpVCbRaRZQl+0R2VOQ29/zL6
 VypQCU7cJWndjD1Xi/nTm2Pl9t68LvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-Ju67iyLsMk2WZ72tBSDyJw-1; Thu, 18 Mar 2021 05:27:21 -0400
X-MC-Unique: Ju67iyLsMk2WZ72tBSDyJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C422F80006E;
 Thu, 18 Mar 2021 09:27:19 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-61.ams2.redhat.com
 [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A25162A6F;
 Thu, 18 Mar 2021 09:26:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] monitor: raise error when 'pretty' option is used with
 HMP
Date: Thu, 18 Mar 2021 09:25:01 +0000
Message-Id: <20210318092512.250725-3-berrange@redhat.com>
In-Reply-To: <20210318092512.250725-1-berrange@redhat.com>
References: <20210318092512.250725-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
index 0e1fdf5c14..8f4d756e35 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -53,13 +53,6 @@ needs two devices (``-device intel-hda -device hda-duplex``) and
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
index aa612c2846..372aadceae 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -51,6 +51,12 @@ host controller or ``-usb`` if necessary).
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
index 640496e562..636bcc81c5 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -716,8 +716,8 @@ int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp)
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
index 9128dec510..671b310ab8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3740,8 +3740,9 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
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


