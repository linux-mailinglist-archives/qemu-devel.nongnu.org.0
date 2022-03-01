Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA124C9865
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:34:13 +0100 (CET)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPB4O-0006nL-A5
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:34:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAtj-0002zX-Iz; Tue, 01 Mar 2022 17:23:11 -0500
Received: from [2a00:1450:4864:20::531] (port=36788
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAti-0003V3-2P; Tue, 01 Mar 2022 17:23:11 -0500
Received: by mail-ed1-x531.google.com with SMTP id cm8so23913780edb.3;
 Tue, 01 Mar 2022 14:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=anSVurh0JIkoccgIu5fRrD6ZqVlFqFRz+ls7EZWn0Rg=;
 b=fV/OQcdkda2YBXT7KW2Jhd8+8QVXdn69Hz+0WjbYp5zhQTnRLFUY26YTATUbAioyf7
 GMcalZR5wVQJWXKHEKR8gHeCGWQD0ZuFWvndxRY1jgChNAzXewgkgzVvR022DSFjT0Xy
 2Na8G0OpJok6s4cObi3RjNjSa5uGImQAjk4bENTI9SP0CzfWAz/t1UOEmikQyRNr09MD
 xHBUe53PHgXZoCkayFFoj+ib24sL2w01lzLtPbIe6xVl9hq2X1x+wqeYGlzpBrOuh7i1
 LUaZv07CfFGdhHEoXaWqX+hzebTZx9+A5OlBIwMUhlFtLgK1oWbTn1rXLlQhgQV08/Lj
 ugNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=anSVurh0JIkoccgIu5fRrD6ZqVlFqFRz+ls7EZWn0Rg=;
 b=7FAG8x92TemlPt+urrIsg/VHQDzm0CUUvGfFjjA6yOLZkmKiYkUhvHh0i7J44rVYqO
 o/QbggMNM8fgBvTWV41+lFuIn7QqMKw6A+iYXkxubHHl0ATvY9kmDoLdQaDtuEz37bIH
 zkYoMdkb7QW/GaTXhk+axU5EzEQZi3VexDo+aB7cZaI3KuSN/sh21wrEi6Upr5KEkSi7
 P/YAJKLrDVZ0OokUI2kIuGNDxR6wOz3uV48aJlQaavpfEuUqEbmTOAP0G3/VqF+NJNkU
 rdCAeO+We/ZK7eKWhRGpC76eq4UgxHccpcKOdLzR8B04mGxmeSyhHXyMpMF6j+mNRXvI
 0Owg==
X-Gm-Message-State: AOAM5315XuLd+yzxJTOG6vw2pMDl4+wNDJENshJvF6QtKw25abFh6ckY
 pS4hDHdNKwLJihaHOlHNS7AHjVPh5sY=
X-Google-Smtp-Source: ABdhPJx/JYeMu1KSnqjUmI8FC74asR5j4ZQOeel/HWDz9DXrQ1eXWVfHJBjS6Tqr61X2mzkSzM5qmg==
X-Received: by 2002:a05:6402:40d0:b0:412:f86a:efd1 with SMTP id
 z16-20020a05640240d000b00412f86aefd1mr26747173edb.194.1646173388395; 
 Tue, 01 Mar 2022 14:23:08 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 lb14-20020a170907784e00b006d5c0baa503sm5685908ejc.110.2022.03.01.14.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:23:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH vRESEND] virtio/virtio-balloon: Prefer Object* over void*
 parameter
Date: Tue,  1 Mar 2022 23:23:01 +0100
Message-Id: <20220301222301.103821-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301222301.103821-1-shentey@gmail.com>
References: <20220301222301.103821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*opaque is an alias to *obj. Using the ladder makes the code consistent with
with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
makes the cast more typesafe.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index e6c1b0aa46..163d244eb4 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -242,7 +242,7 @@ static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     Error *err = NULL;
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     int i;
 
     if (!visit_start_struct(v, name, NULL, 0, &err)) {
@@ -277,7 +277,7 @@ static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
 {
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     visit_type_int(v, name, &s->stats_poll_interval, errp);
 }
 
@@ -285,7 +285,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
 {
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     int64_t value;
 
     if (!visit_type_int(v, name, &value, errp)) {
@@ -1015,12 +1015,12 @@ static void virtio_balloon_instance_init(Object *obj)
     s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
 
     object_property_add(obj, "guest-stats", "guest statistics",
-                        balloon_stats_get_all, NULL, NULL, s);
+                        balloon_stats_get_all, NULL, NULL, NULL);
 
     object_property_add(obj, "guest-stats-polling-interval", "int",
                         balloon_stats_get_poll_interval,
                         balloon_stats_set_poll_interval,
-                        NULL, s);
+                        NULL, NULL);
 }
 
 static const VMStateDescription vmstate_virtio_balloon = {
-- 
2.35.1


