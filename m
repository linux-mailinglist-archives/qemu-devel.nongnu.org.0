Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846004509F4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:46:44 +0100 (CET)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf7z-0008WR-LA
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:46:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezK-0001PI-Oc
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezH-00059q-RH
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UAC8cFjmevmjKiAFrG4ySzRdHBE4bsHOmnhcPVqLlc=;
 b=hNo/NKxH0HyiGj1LctUOBDF4nrKRwNKAwinkcJlzYXukw6lAPUvMgBj98fWSlfYiekUOXt
 b9KUyPo+NwW1m1ZINJ9K7nsLqrr1URpRgx6B4zjGgYTqhbguokaQuQWyq4hGK+egrKlEdZ
 +riDZN+rUwr/hhEyCpK5B8L7U2C57PA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-qihW5Gp3NACG2sCIjmvrTg-1; Mon, 15 Nov 2021 11:37:41 -0500
X-MC-Unique: qihW5Gp3NACG2sCIjmvrTg-1
Received: by mail-ed1-f72.google.com with SMTP id
 q17-20020aa7da91000000b003e7c0641b9cso2909885eds.12
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/UAC8cFjmevmjKiAFrG4ySzRdHBE4bsHOmnhcPVqLlc=;
 b=ijnjoZCkwqW+RC+AYX0BlYSIlmHZzbT9pQ7mU4Q2hoS2TGqX4Cpb9Fc5Tkxam4WxBY
 yahYDJ0QgNFIFwQ0sxNZFryav5dGMrACkrh9/DwR2yFE8R/agm/BoRFnFcv8g9xNKI3F
 zzmkyXkqOyAj/kBUm445e0pDkMy7TBUiN8cbT4o1CzO8kzTClOWnljgkfuuV+HZugM3f
 DkI+6dNpOKEJjNFcQkzdKRAqm7KctZXeh73Apg1Z9TioXZEufU7wv5Cu7FMjqzhci2H/
 YQjYUVc/xNBpwmMPtB/i5G6vF2cLZfx5GCAM1+Fi/OcYldzHScvLwQ0WgNVRJBTUT6T9
 NOvA==
X-Gm-Message-State: AOAM5302FbFCg3mXFpIMwcniDSQlHgABHbkceKPp+QScCoRgWSsUlxyV
 uVNhnddnxEoXQqVBM/AaQylnZ2u7YM0EvDVVDxk40V3RENU9ggvPgDh/hqBKgKEMdbe+fnc7pz/
 4nXczFFU41aDv2xzkw3Z5aQTKYX8mkg4oMY3+BVj2RlSYzb3UO72EikpjR+fi
X-Received: by 2002:aa7:ca4f:: with SMTP id j15mr58348edt.178.1636994260367;
 Mon, 15 Nov 2021 08:37:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzniA2cpbt0IMK5WJx6QNAtOwRwd86q2E+XFtFyyID09hJbjGm2C6gz8Q8nvfcjBN/GDpYuyQ==
X-Received: by 2002:aa7:ca4f:: with SMTP id j15mr58309edt.178.1636994260208;
 Mon, 15 Nov 2021 08:37:40 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id u16sm7704302edr.43.2021.11.15.08.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:37:39 -0800 (PST)
Date: Mon, 15 Nov 2021 11:37:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
Message-ID: <20211115163607.177432-3-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Reported by Coverity (CID 1465222).

Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: add error handling in qdev_set_id")
Cc: Damien Hedde <damien.hedde@greensocs.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211102163342.31162-1-stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/qdev-monitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index f8b3a4cd82..588a62b88d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -593,8 +593,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
         if (prop) {
             dev->id = id;
         } else {
-            g_free(id);
             error_setg(errp, "Duplicate device ID '%s'", id);
+            g_free(id);
             return NULL;
         }
     } else {
-- 
MST


