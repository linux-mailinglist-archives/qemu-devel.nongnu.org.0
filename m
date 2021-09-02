Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D73FF1D2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:53:05 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpxY-0004bG-G3
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvQ-0001r2-OK
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvM-0000GG-Tb
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630601448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eGHUQIvX/JArvB4+KJ+gL18UNLlwL1F2ZTEfqh6Mms=;
 b=SuFeVcpU7a/AtapXrO/jgjhH1FPTrkDNIsXRe4suRZdYoVkb3ueKt9eJKbqb3K52YZ45Tj
 PeBYOms6DK8bLWFshSY8TElMt4o8Tv57FIXglkOvdV5qnfpC/Z0CkPzL3XBBz/MWOCiqz2
 ZeBmlw/Kw1mzuwLGl4Am3o1yYodG+Mk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-nWCKUwssPcy1iQL1eiiXVQ-1; Thu, 02 Sep 2021 12:50:47 -0400
X-MC-Unique: nWCKUwssPcy1iQL1eiiXVQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so747612wri.17
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 09:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/eGHUQIvX/JArvB4+KJ+gL18UNLlwL1F2ZTEfqh6Mms=;
 b=D2LfKM2MLO7dI/2WbgBIejM4okTeZPRFh30kX9UHiMjtITb/kCCqzsvyVhj6SCToc+
 WbSe7mfsiMwjOAUzfz07mv8Tv8amxlqXX+sL1RbgMjOncauBPpNJu+WB82OB6s8QMUjz
 2fhshg3wWRVmHNh+zUWJzGcRiP1ZrDUk4najL6gh4L78Scn3BcN4G9UT4ygFPs2zg2Z+
 fPMlUj0fO54+4tyVfjl6vVV9dgdrEjcZx+gMoVAethXCE5sMkEkm7oCnL5Rzp+nUCh4q
 hG98KhO83HzZT0AiW0mgiKz6x79gGPpVnWm2QaIqaGEUJTrjCrSSzPiXkaDoYWUL+1S/
 Aftw==
X-Gm-Message-State: AOAM532+FAbHZo1y4DwK9jrvXBqFUdaquD3SGK+wQ1jkXGg+1cM7GW3y
 bZmD0oboFYs0kHyNDOEZb5xSgR7qarLuar7bIUK5D7lOeJrvU0AALW1lZRK3m+5lbLCbi9+N/9a
 fvuY3ioyLFWoRTR31+U1gb5OlqEHrrtvhUxmtiWS2yHTEw7qP+6y/W1u7zV4F28ds
X-Received: by 2002:a5d:4564:: with SMTP id a4mr4751622wrc.81.1630601445950;
 Thu, 02 Sep 2021 09:50:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUN/r+OzlPsXuR7hUMv5dVYJDYJQg9pcwlQiunXkOKzRqH6E1GuQIemVsqaKxx27E2RfvbTw==
X-Received: by 2002:a5d:4564:: with SMTP id a4mr4751600wrc.81.1630601445779;
 Thu, 02 Sep 2021 09:50:45 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j20sm2238091wrb.5.2021.09.02.09.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:50:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/virtio: Document virtio_queue_packed_empty_rcu is
 called within RCU
Date: Thu,  2 Sep 2021 18:50:35 +0200
Message-Id: <20210902165039.432786-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902165039.432786-1-philmd@redhat.com>
References: <20210902165039.432786-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While virtio_queue_packed_empty_rcu() uses the '_rcu' suffix,
it is not obvious it is called within rcu_read_lock(). All other
functions from this file called with the RCU locked have a comment
describing it. Document this one similarly for consistency.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a7..a5214bca612 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -634,6 +634,7 @@ static int virtio_queue_split_empty(VirtQueue *vq)
     return empty;
 }
 
+/* Called within rcu_read_lock().  */
 static int virtio_queue_packed_empty_rcu(VirtQueue *vq)
 {
     struct VRingPackedDesc desc;
-- 
2.31.1


