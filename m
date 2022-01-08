Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C34880D1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 03:08:24 +0100 (CET)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n619b-0007In-PG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 21:08:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bc-0006HZ-1x
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Ba-0002rX-An
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I9fRFWidMhAfy5/v5TIFdNUDGEE35GIYo1QYqVMvWCg=;
 b=cAJG8kBjBhflQ/OQBJCMr7+yMJwWUNUce8nxpTAYmywWuoN7rDpVWNXgqOtpOKKo08nmJh
 fAdOwaQWTZACN5CqS6Ipym436Y0DGQ1mZ9Ct3DsW6FHe6VHswFqSvDyQ7U2OwwvrmtoHqM
 8RvE9c4dGMmdjl8VdCaHMequmgxY7OQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-xYagrVK0NiSlvOHbJU8MIw-1; Fri, 07 Jan 2022 20:06:20 -0500
X-MC-Unique: xYagrVK0NiSlvOHbJU8MIw-1
Received: by mail-wm1-f72.google.com with SMTP id
 e19-20020a05600c4e5300b003458be97976so2505328wmq.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I9fRFWidMhAfy5/v5TIFdNUDGEE35GIYo1QYqVMvWCg=;
 b=qYWIAN4yQVaPoFEowscpKp32xi5rpGwp02JH6Vbuv+17gqJ5dW/Eyagogqy2azClfV
 3ACdTir0dvfzMgcOgZo6FCrHixxvUL8kZA+OfnlnnoTKpbk4InHStffQXTJrYlG1QzKM
 tFzLMtMMD2r089J5D+iOt3BaVtM8SUywLgYIUuXxUFHMEKobB4ecgc9iuYfOhC+oaW6G
 KEWOh+m4UzPYYNM2Cg+00D0x1UcKgkRlYpAWgVp+fRxk/FZhnWjPkmw2csQ+dNJDijY5
 dDCE6BUdPgu6SwxIo2jZC+0KnbtqQMIwClZsFdmJINebMvjMcqAWnN8OqDbvyxziYwhZ
 tvZQ==
X-Gm-Message-State: AOAM532YyjQB+9HRqff7kOWrE7MWrWSdSZTzwVyfyTvvWtwelYvuhJJk
 QcI7fSOluHydXgaMgXbw7HvX8CuOSiKpjZMS29Qix6eOghSOVrVOWNlUAD31vM3SU+E+PQG/G7w
 8MJDcKxLWHuyhAzFExlpncYrYxc8JsxMtWT7JJOqj949B5RbUISOym3NnTYnr
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr2834575wrn.263.1641603978676; 
 Fri, 07 Jan 2022 17:06:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb/nJFJS1e/iajc+t/ilB9savQLs/vWW83ThymnPom06VMdowgG7YOI8D3olWR9VV1jfWkRQ==
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr2834564wrn.263.1641603978434; 
 Fri, 07 Jan 2022 17:06:18 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id j11sm102232wmq.23.2022.01.07.17.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:18 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 49/55] docs: reSTify virtio-balloon-stats documentation and
 move to docs/interop
Message-ID: <20220108003423.15830-50-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The virtio-balloon-stats documentation might be useful for people that
are implementing software that talks to QEMU via QMP, so this should
reside in the docs/interop/ directory. While we're at it, also convert
the file to restructured text and mention it in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220105115245.420945-1-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS                                   |  1 +
 docs/interop/index.rst                        |  1 +
 .../virtio-balloon-stats.rst}                 | 58 ++++++++++---------
 3 files changed, 32 insertions(+), 28 deletions(-)
 rename docs/{virtio-balloon-stats.txt => interop/virtio-balloon-stats.rst} (66%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6aa0335560..c98a61caee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1932,6 +1932,7 @@ virtio-balloon
 M: Michael S. Tsirkin <mst@redhat.com>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
+F: docs/interop/virtio-balloon-stats.rst
 F: hw/virtio/virtio-balloon*.c
 F: include/hw/virtio/virtio-balloon.h
 F: softmmu/balloon.c
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index c59bac9834..b7632acb7b 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -22,3 +22,4 @@ are useful for making QEMU interoperate with other software.
    vhost-user
    vhost-user-gpu
    vhost-vdpa
+   virtio-balloon-stats
diff --git a/docs/virtio-balloon-stats.txt b/docs/interop/virtio-balloon-stats.rst
similarity index 66%
rename from docs/virtio-balloon-stats.txt
rename to docs/interop/virtio-balloon-stats.rst
index 1732cc8c8a..b9a6a6edb2 100644
--- a/docs/virtio-balloon-stats.txt
+++ b/docs/interop/virtio-balloon-stats.rst
@@ -1,4 +1,4 @@
-virtio balloon memory statistics
+Virtio balloon memory statistics
 ================================
 
 The virtio balloon driver supports guest memory statistics reporting. These
@@ -9,10 +9,12 @@ Before querying the available stats, clients first have to enable polling.
 This is done by writing a time interval value (in seconds) to the
 guest-stats-polling-interval property. This value can be:
 
-  > 0  enables polling in the specified interval. If polling is already
+  > 0
+       enables polling in the specified interval. If polling is already
        enabled, the polling time interval is changed to the new value
 
-  0    disables polling. Previous polled statistics are still valid and
+  0
+       disables polling. Previous polled statistics are still valid and
        can be queried.
 
 Once polling is enabled, the virtio-balloon device in QEMU will start
@@ -22,7 +24,7 @@ interval.
 To retrieve those stats, clients have to query the guest-stats property,
 which will return a dictionary containing:
 
-  o A key named 'stats', containing all available stats. If the guest
+  * A key named 'stats', containing all available stats. If the guest
     doesn't support a particular stat, or if it couldn't be retrieved,
     its value will be -1. Currently, the following stats are supported:
 
@@ -37,7 +39,7 @@ which will return a dictionary containing:
       - stat-htlb-pgalloc
       - stat-htlb-pgfail
 
-  o A key named last-update, which contains the last stats update
+  * A key named last-update, which contains the last stats update
     timestamp in seconds. Since this timestamp is generated by the host,
     a buggy guest can't influence its value. The value is 0 if the guest
     has not updated the stats (yet).
@@ -61,32 +63,32 @@ It's also important to note the following:
    respond to the request the timer will never be re-armed, which has
    the same effect as disabling polling
 
-Here are a few examples. QEMU is started with '-device virtio-balloon',
-which generates '/machine/peripheral-anon/device[1]' as the QOM path for
+Here are a few examples. QEMU is started with ``-device virtio-balloon``,
+which generates ``/machine/peripheral-anon/device[1]`` as the QOM path for
 the balloon device.
 
-Enable polling with 2 seconds interval:
+Enable polling with 2 seconds interval::
 
-{ "execute": "qom-set",
-             "arguments": { "path": "/machine/peripheral-anon/device[1]",
-			 "property": "guest-stats-polling-interval", "value": 2 } }
+  { "execute": "qom-set",
+               "arguments": { "path": "/machine/peripheral-anon/device[1]",
+               "property": "guest-stats-polling-interval", "value": 2 } }
 
-{ "return": {} }
+  { "return": {} }
 
-Change polling to 10 seconds:
+Change polling to 10 seconds::
 
-{ "execute": "qom-set",
-             "arguments": { "path": "/machine/peripheral-anon/device[1]",
-			 "property": "guest-stats-polling-interval", "value": 10 } }
+  { "execute": "qom-set",
+               "arguments": { "path": "/machine/peripheral-anon/device[1]",
+               "property": "guest-stats-polling-interval", "value": 10 } }
 
-{ "return": {} }
+  { "return": {} }
 
-Get stats:
+Get stats::
 
-{ "execute": "qom-get",
-  "arguments": { "path": "/machine/peripheral-anon/device[1]",
-  "property": "guest-stats" } }
-{
+  { "execute": "qom-get",
+               "arguments": { "path": "/machine/peripheral-anon/device[1]",
+               "property": "guest-stats" } }
+  {
     "return": {
         "stats": {
             "stat-swap-out": 0,
@@ -98,12 +100,12 @@ Get stats:
         },
         "last-update": 1358529861
     }
-}
+  }
 
-Disable polling:
+Disable polling::
 
-{ "execute": "qom-set",
-             "arguments": { "path": "/machine/peripheral-anon/device[1]",
-			 "property": "stats-polling-interval", "value": 0 } }
+  { "execute": "qom-set",
+               "arguments": { "path": "/machine/peripheral-anon/device[1]",
+               "property": "stats-polling-interval", "value": 0 } }
 
-{ "return": {} }
+  { "return": {} }
-- 
MST


