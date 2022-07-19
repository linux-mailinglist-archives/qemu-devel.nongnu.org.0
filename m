Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED157A2ED
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 17:26:12 +0200 (CEST)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDp6y-0005IZ-0m
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 11:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3U-00080E-Vd
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDp3S-0001jM-Fn
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658244153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5W0EriOW4TtUqK7nH7aWghsdYJOyySWmt4Lg4iixYnE=;
 b=RdloUsuWSubUqfTyXXRtfdKx68y4hoxgLnqlVS6Nk9Vw6HLkbHFU8LlCCTJeZVKVtXLCsM
 RfmW7GqATrVAcIeJSsFxNj3eBQL1/4JqTZmUgWHHUq0PQPk4WJPIdaEF8uYSO6htdaVbq6
 h9onwRzulM7VN/wRF5qT/MCXU7XJSi0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-Itvd0ig_OxWCp112NSyq6w-1; Tue, 19 Jul 2022 11:22:25 -0400
X-MC-Unique: Itvd0ig_OxWCp112NSyq6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3898802D1C;
 Tue, 19 Jul 2022 15:22:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C4F40CFD0A;
 Tue, 19 Jul 2022 15:22:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E5596180061C; Tue, 19 Jul 2022 17:22:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>
Subject: [PULL 4/6] usb: document guest-reset and guest-reset-all
Date: Tue, 19 Jul 2022 17:22:16 +0200
Message-Id: <20220719152218.825707-5-kraxel@redhat.com>
In-Reply-To: <20220719152218.825707-1-kraxel@redhat.com>
References: <20220719152218.825707-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Suggested-by: Michal Prívozník <mprivozn@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Message-Id: <20220711094437.3995927-2-kraxel@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/devices/usb.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 872d9167589b..18e7c8b4d716 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -353,3 +353,32 @@ and also assign it to the correct USB bus in QEMU like this:
         -device usb-ehci,id=ehci                             \\
         -device usb-host,bus=usb-bus.0,hostbus=3,hostport=1  \\
         -device usb-host,bus=ehci.0,hostbus=1,hostport=1
+
+``usb-host`` properties for reset behavior
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``guest-reset`` and ``guest-reset-all`` properties control
+whenever the guest is allowed to reset the physical usb device on the
+host.  There are three cases:
+
+``guest-reset=false``
+  The guest is not allowed to reset the (physical) usb device.
+
+``guest-reset=true,guest-resets-all=false``
+  The guest is allowed to reset the device when it is not yet
+  initialized (aka no usb bus address assigned).  Usually this results
+  in one guest reset being allowed.  This is the default behavior.
+
+``guest-reset=true,guest-resets-all=true``
+  The guest is allowed to reset the device as it pleases.
+
+The reason for this existing are broken usb devices.  In theory one
+should be able to reset (and re-initialize) usb devices at any time.
+In practice that may result in shitty usb device firmware crashing and
+the device not responding any more until you power-cycle (aka un-plug
+and re-plug) it.
+
+What works best pretty much depends on the behavior of the specific
+usb device at hand, so it's a trial-and-error game.  If the default
+doesn't work, try another option and see whenever the situation
+improves.
-- 
2.36.1


