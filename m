Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF494C47A9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:36:53 +0100 (CET)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbiF-0002lz-QC
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:36:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNbJH-0003vL-1k
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNbJ5-0000kz-VD
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645798251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Kp2GIo6mbpPljQZ0DA6NsRoNerotSOm0KmACsIA6JpY=;
 b=YRMeyTXsREl4/tKs1m2fne+cmyBXyY5ItuaAVJJ8bjp4CXtWPKwTd3/ap3+JrhBaoKTDqd
 zXrLB9894isujkO7OocRV00VByFo+QVVOoTTZDj4H8Ma/BCm+HdlS+CyUd9evaIREIWLL7
 7+8Ms9EIbHTDYC2mSDwJQYhSjSQW4sg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-RnbxcyJ_PH-XWjBw64kymQ-1; Fri, 25 Feb 2022 09:10:49 -0500
X-MC-Unique: RnbxcyJ_PH-XWjBw64kymQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 j9-20020a056402238900b004128085d906so2344524eda.19
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 06:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Kp2GIo6mbpPljQZ0DA6NsRoNerotSOm0KmACsIA6JpY=;
 b=jwtPoTAs3qFpM/k58fQg6JwBwbH8Yi3b/RRYfyZqfu+Wew424IAUmcYxERMREZVxwQ
 TMRa+SlbgO7+qwJcNh+CX/JAjZ7b7QqpVgaqHeS3u0YI52HJ9TG5qv4HxRB+rtC7Cb8X
 FMQLnxwdi9lW+qxn2iZ2uQ+BGJQSxYFUBvVwd67ZFeeGsLah8uexAmfvazoC6YAtqkqq
 THXr5cNmfAe1i9FndGXpD6vCEkCsGmg73Zyz7fp+dwWVFLM2xiL2zZ6uWTlBn4fB47k7
 Gh91VtubH4LjwFxV/NCaUAIN77UXAzXY9URYeZOEM25TR54cYHkM4pM6mg2Q9uXsw+Xy
 CgRA==
X-Gm-Message-State: AOAM530lDFzMYP569LMlDxuCg5GMCA8lZ8S4bhsNjASiJR59Mpka9QlD
 7DF3gzS63MQo3Q7CwPKKJBmNDRqoBS7N6E5h0wp/MbKQGk4TxqlWgaaMPz5zem2ATB2T2T3y7u0
 hwt3ls/VS4immJooyO9YCow69e4ASgdKLcM5U/9QJFDKMIw9gdZP28Auo4+qJ
X-Received: by 2002:aa7:d38c:0:b0:413:471a:9d4 with SMTP id
 x12-20020aa7d38c000000b00413471a09d4mr7373586edq.422.1645798248281; 
 Fri, 25 Feb 2022 06:10:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvTrHkEaTvyK/5PmhuaiKrOMaaELLurCu9fF6pCGhFx+oVSvd9PGPiy3bxfFS3zvNqzvpKaA==
X-Received: by 2002:aa7:d38c:0:b0:413:471a:9d4 with SMTP id
 x12-20020aa7d38c000000b00413471a09d4mr7373566edq.422.1645798248021; 
 Fri, 25 Feb 2022 06:10:48 -0800 (PST)
Received: from redhat.com ([2.55.165.55]) by smtp.gmail.com with ESMTPSA id
 cf10-20020a0564020b8a00b00412b19c1aaesm1393995edb.12.2022.02.25.06.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 06:10:47 -0800 (PST)
Date: Fri, 25 Feb 2022 09:10:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qom: assert integer does not overflow
Message-ID: <20220225140955.63949-1-mst@redhat.com>
MIME-Version: 1.0
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Victor Tom <vv474172261@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QOM reference counting is not designed with an infinite amount of
references in mind, trying to take a reference in a loop will overflow
the integer. We will then eventually assert when dereferencing, but the
real problem is in object_ref so let's assert there to make such issues
cleaner and easier to debug.

Some micro-benchmarking shows using fetch and add this is essentially
free on x86.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qom/object.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 4f0677cca9..5db3974f04 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1167,10 +1167,14 @@ GSList *object_class_get_list_sorted(const char *implements_type,
 Object *object_ref(void *objptr)
 {
     Object *obj = OBJECT(objptr);
+    uint32_t ref;
+
     if (!obj) {
         return NULL;
     }
-    qatomic_inc(&obj->ref);
+    ref = qatomic_fetch_inc(&obj->ref);
+    /* Assert waaay before the integer overflows */
+    g_assert(ref < INT_MAX);
     return obj;
 }
 
-- 
MST


