Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32BE487649
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:12:55 +0100 (CET)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nB0-0005Gm-Si
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2K-0007jv-9i
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2I-0001qH-Op
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/nf9E9axwJOMcdCAGncabD48HF9k+D1ZiFHnSo9Ej0=;
 b=DZPiaXJ66e089+zS1CrqbPBMblZb6fwzX2V/tyiGvB4ub3ZZaRTx12BImcD1IeTHT0HtO/
 rykuesJpy1Z/7QEydKfuifnaOCae1J/98AasAkJqFOG1T+zwcSH1dl2XoMfx09Ot11CfSU
 deR2KFeC8dMkAksT9ndMMP+2SMzyM9M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-pK7FzylwPrCQft1xXE_1lg-1; Fri, 07 Jan 2022 06:03:53 -0500
X-MC-Unique: pK7FzylwPrCQft1xXE_1lg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d14-20020adfa34e000000b001a631cb3ab5so376096wrb.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v/nf9E9axwJOMcdCAGncabD48HF9k+D1ZiFHnSo9Ej0=;
 b=TpgcsV31dHeu6D1w1GxRO7Uk2RHnfl3SYcCEbojH0cT9riH+vaRRHd1GUop6jcfzzS
 nQse8wLRtWFlN3p+7bsu0PG0TFLxMLMgxgNh8FAsS536lY2l3UR12pYBbOUdvy13WAbR
 8IBh3gsYv1TVuImg+RtBGtXQEgVZ+2iIh5t++kcCptf2t9283uLQdgZJH5qlRQc4Mmu3
 xx6gpI54J2Fb2MMYWm6e/FHR6Y3Djk6UvvAdtOaMxKbeaWCKEW93TdHovNKV/Ljxnpjs
 N3MJiFbDtegkCJS3RytaPL2MMRhxLdwUdGnHXsh0GGu/6AVwIF3BnPvbjAbIBVrIF25P
 rajg==
X-Gm-Message-State: AOAM530pNobWvMvf2APE85rTspZL9FzaOlFolJe1aHeJqZjNKlyGaCgF
 Ww4kIYZe/RwFAXfHDZaPM0kdYrX4Ixwmf1eBztSv6ckoiqKaYrgHN0icIbjubzMG5CHmYp3NXUM
 NsN0WIOBBkNoIpa3lVBKRnZEkyRqc7PBJXZX0Q3QzO3pmfxrlMNSHhu/G7EGp
X-Received: by 2002:a5d:5689:: with SMTP id f9mr52830779wrv.124.1641553431556; 
 Fri, 07 Jan 2022 03:03:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzG3GaLtVoU80mirfdugtAhPxwPXBA9r/Iq9kBqMv7dkqiUxFM+ktqkcQ3naH6ixtdtAmfh3Q==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr52830761wrv.124.1641553431379; 
 Fri, 07 Jan 2022 03:03:51 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id b5sm4374463wrr.19.2022.01.07.03.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:51 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/55] chardev/char-socket: tcp_chr_recv: don't clobber errno
Message-ID: <20220107102526.39238-16-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

tcp_chr_recv communicates the specific error condition to the caller via
errno.  However, after setting it, it may call into some system calls or
library functions which can clobber the errno.

Avoid this by moving the errno assignment to the end of the function.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-3-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-socket.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index d619088232..3ddd98ed49 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -290,13 +290,6 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
                                      NULL);
     }
 
-    if (ret == QIO_CHANNEL_ERR_BLOCK) {
-        errno = EAGAIN;
-        ret = -1;
-    } else if (ret == -1) {
-        errno = EIO;
-    }
-
     if (msgfds_num) {
         /* close and clean read_msgfds */
         for (i = 0; i < s->read_msgfds_num; i++) {
@@ -325,6 +318,13 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
 #endif
     }
 
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        errno = EAGAIN;
+        ret = -1;
+    } else if (ret == -1) {
+        errno = EIO;
+    }
+
     return ret;
 }
 
-- 
MST


