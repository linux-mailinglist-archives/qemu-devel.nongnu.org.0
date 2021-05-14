Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3690380E49
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:37:20 +0200 (CEST)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaoR-0005rx-Rs
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaMJ-0005XR-QO
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:08:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaME-0007rJ-Uh
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LxjtdzbPa/ql+N+GGzHz8d9IgsKkLlFWnOvUnsNIB/I=;
 b=Kf/R6g8MX0AsFv85Y8dD9DW0jVYIQoJO2LddaeFPNTnkar/OINq2v5Xa5/FgX3iHTWJkwk
 ct4Cx8NmWJhsdQfMmQnlkeWJljk37VU2ZtMXg+pvnIfXCwfnAhAtgt6OxypKgY0trHn3O9
 /Cq1JsSo/gWtWZ2+t9Dig4liT5/sL10=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-rAqBwlAoOdSYEYDByLqGOw-1; Fri, 14 May 2021 12:04:59 -0400
X-MC-Unique: rAqBwlAoOdSYEYDByLqGOw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c138-20020a1c9a900000b0290173dd9788cdso243637wme.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LxjtdzbPa/ql+N+GGzHz8d9IgsKkLlFWnOvUnsNIB/I=;
 b=YrFyTyHa8bEcRaBkGw59n4qtQWzdpoH+iYYs7lQGpvxe33NBzz6zqGjp/TDCAtQ+aT
 B+0Lb9YoSlbiAGoMQdxn7ILtRU1hT2RWy7/nMBDYZIu9gROjBxEBqKJT/BDvioh3r75U
 euiOicOwoZWXLcLhiUuiKpjIcGB6Ftw4SLbES/w7WJUxY0V829JkmS7kKvHLrncnipYO
 Lg9549u1OmX0yWypyj/Q7Ne9Qhl7KvxhPmI1R3hgdC6NYpq5Gxa7gmfJdCzyCW4Byb4I
 kAZ1pSnGIa9N1NgrRf3NuWv37tHJ3Htq5HNqcuOGVD2vYOttoIwNT6LFCtImAZXP7gbk
 NOcQ==
X-Gm-Message-State: AOAM532q22xLIz5KrhEBGv8FJHken+ei1qdknDqUrtscx7ha9EaN+LIM
 OBsu96oL7eFX03SXalt3p2wE6D3WGxrmzM0s7X+agkOSYYtjfa5mc1laPpZtMZ6rv8ik+y1u4US
 474BQKRkugB8GL4A/9Q8NXFAYX39iQyqMukhoWFQm1SMR6dSqcsziow/SGn9D
X-Received: by 2002:adf:f683:: with SMTP id v3mr58638839wrp.133.1621008297487; 
 Fri, 14 May 2021 09:04:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqPK8Tz3J3YG3eMoZzCGmUybo/No3UvZK78q2mMaGdRqIZig/7/b0c/fxR0pl1EDKC8o/dRg==
X-Received: by 2002:adf:f683:: with SMTP id v3mr58638786wrp.133.1621008296946; 
 Fri, 14 May 2021 09:04:56 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id s5sm5731821wrw.95.2021.05.14.09.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:56 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] Fix build with 64 bits time_t
Message-ID: <20210514160245.91918-17-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

time element is deprecated on new input_event structure in kernel's
input.h [1]

This will avoid the following build failure:

hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
  198 |     if (gettimeofday(&evdev.time, NULL)) {
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d3d599d5
 - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-Id: <20201203195819.583626-1-fontaine.fabrice@gmail.com>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/246
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-input/main.c | 8 ++++++--
 hw/input/virtio-input-host.c    | 5 ++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
index c15d18c33f..081230da54 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -6,12 +6,13 @@
 
 #include "qemu/osdep.h"
 
-#include <linux/input.h>
+#include <sys/ioctl.h>
 
 #include "qemu/iov.h"
 #include "qemu/bswap.h"
 #include "qemu/sockets.h"
 #include "libvhost-user-glib.h"
+#include "standard-headers/linux/input.h"
 #include "standard-headers/linux/virtio_input.h"
 #include "qapi/error.h"
 
@@ -113,13 +114,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
 static void vi_handle_status(VuInput *vi, virtio_input_event *event)
 {
     struct input_event evdev;
+    struct timeval tval;
     int rc;
 
-    if (gettimeofday(&evdev.time, NULL)) {
+    if (gettimeofday(&tval, NULL)) {
         perror("vi_handle_status: gettimeofday");
         return;
     }
 
+    evdev.input_event_sec = tval.tv_sec;
+    evdev.input_event_usec = tval.tv_usec;
     evdev.type = le16toh(event->type);
     evdev.code = le16toh(event->code);
     evdev.value = le32toh(event->value);
diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
index 85daf73f1a..137efba57b 100644
--- a/hw/input/virtio-input-host.c
+++ b/hw/input/virtio-input-host.c
@@ -193,13 +193,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
 {
     VirtIOInputHost *vih = VIRTIO_INPUT_HOST(vinput);
     struct input_event evdev;
+    struct timeval tval;
     int rc;
 
-    if (gettimeofday(&evdev.time, NULL)) {
+    if (gettimeofday(&tval, NULL)) {
         perror("virtio_input_host_handle_status: gettimeofday");
         return;
     }
 
+    evdev.input_event_sec = tval.tv_sec;
+    evdev.input_event_usec = tval.tv_usec;
     evdev.type = le16_to_cpu(event->type);
     evdev.code = le16_to_cpu(event->code);
     evdev.value = le32_to_cpu(event->value);
-- 
MST


