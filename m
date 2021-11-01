Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E14424B4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:24:54 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhbh-0008Le-SL
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgz7-0002Bq-EZ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:45:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgz5-0004J8-7T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hiU4jBSs673nJuzmbI+9Px2L2jLlgIA8UvIpSDnDMA=;
 b=S12MYMli41cXHlOWpkZmH+TnZtRX5sR4LJPgKoD6HWtjakYxK5YFSEd0LrqYBAKAo+8q4k
 HWGVzcmVcUM1F8H6TdyQck1KEPesS+bE6rQylnURvYX5iTv7XQNpBtNkhYDJAPRmnlZOgk
 esL8Adhlv1FBtXPwLC3P2d8KUAEua2Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555--PebGgTKMmafYRfw1AWeVA-1; Mon, 01 Nov 2021 19:44:56 -0400
X-MC-Unique: -PebGgTKMmafYRfw1AWeVA-1
Received: by mail-ed1-f72.google.com with SMTP id
 i22-20020a05640242d600b003e28aecc0afso4516229edc.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8hiU4jBSs673nJuzmbI+9Px2L2jLlgIA8UvIpSDnDMA=;
 b=n+SVoTdtw+85lATma5JUwSEyr4jJoohlZyWvU2cFB6bXa/AnwLMiplnRWBK8sBhLC8
 IM+ErYi/o0FRmFuL33+/qxoM1/26AhFTbBMlwEZ8yRWec9DIYdwXadqsv8n+74FgdONW
 kqmvf/3NYz+I/e/mMYVBQ9++sSbKWfL0IN4pNkIAeq5WguKBGw9/wG3L1lCXbBfbXMnG
 WALJXvLhZ+bjIO0FCrVSy4KQw0B7jKC/Scr6yM+g1xIXVnOkUdOr5cmc8gQHeWRTxGJx
 J2aKQVFk5BTKQdQwrS4z547Wt1svIs8rViIueUe30xAXqdc2Okf8dd1STDMJvYN3d1IL
 zK0A==
X-Gm-Message-State: AOAM532v75ODpjOvFiLWJnaJyuzhJ5ELO/MCd50WWZ/A5BqedPezUlqK
 1g66DBojJNumx9Ew/O2aKCvIn0gZG1ccqKGk+0GNKrkeXgGgH6CG5pphAaKpYM6QHtj3PFJ4xkG
 IklroF8qgYknnz7SQefhVIjWiaBgejHme6xqIsfST1FkY7l7c4SQrGVjYZeuT
X-Received: by 2002:a05:6402:4412:: with SMTP id
 y18mr9004963eda.103.1635810294100; 
 Mon, 01 Nov 2021 16:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1Mpg4pWFPGDo8TreGk65P1HtrG4BWXooRIzP52gfaO/uSQwAm5i3WsPtz7ikyY2+5aNPK5Q==
X-Received: by 2002:a05:6402:4412:: with SMTP id
 y18mr9004939eda.103.1635810293951; 
 Mon, 01 Nov 2021 16:44:53 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id t6sm9812281edj.27.2021.11.01.16.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:53 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] hw/i386: fix vmmouse registration
Message-ID: <20211101234358.582487-10-mst@redhat.com>
References: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

According to the logic of vmmouse_update_handler function,
vmmouse should be registered as an event handler when
it's status is zero.
vmmouse_read_id resets the status but does not register
the handler.
This patch adds vmmouse registration and activation when
status is reset.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <163524204515.1914131.16465061981774791228.stgit@pasha-ThinkPad-X280>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/vmmouse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index df4798f502..3d66368286 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -158,6 +158,7 @@ static void vmmouse_read_id(VMMouseState *s)
 
     s->queue[s->nb_queue++] = VMMOUSE_VERSION;
     s->status = 0;
+    vmmouse_update_handler(s, s->absolute);
 }
 
 static void vmmouse_request_relative(VMMouseState *s)
-- 
MST


