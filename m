Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5C664638
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:36:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6a-0003Xh-AD; Tue, 10 Jan 2023 11:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH61-0003CU-IE
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5z-00053l-3q
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9O3BN5gfcppFFZIaNOYVHyXQRdxB1gK+dJTzE8XK+ys=;
 b=Fcwmp6Ld8H4MiQiO5YgcpIy1kVEYnGzRVGyKsTFmPxnsGSyH0mWdztH5w4fzofuSIzseC+
 B0G32h3fZ5mjBUJEJY8dHtPzAcOedsfkEhVCpSXjYO6IT2l2sHt7J/wl0vDDe/p8DFCbYG
 BtInvRb3/y5uXN9IalwqI0OfXZVmN9o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-VYmA4IvrPZON7REe8EofRw-1; Tue, 10 Jan 2023 11:03:25 -0500
X-MC-Unique: VYmA4IvrPZON7REe8EofRw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so9210078wmq.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9O3BN5gfcppFFZIaNOYVHyXQRdxB1gK+dJTzE8XK+ys=;
 b=lUGCQQ9p0RJ6YkEg8H+IA1OIu7ZMJWCQTuqxNnYMXTpfhMLyUq9dl1TpVEM+ptu8p6
 hgVsxXnPMhkQn2rFhwoC9PPgl4xAWV3TPSLwO5otg+wx+Sv1ICEyLIEvVrm3BjQUQj6m
 LIggOOOxhWRTbweqqpVsK0VgI9juwnW49c3ws+4s2HLHpAGIVUKBPErWTPyCDfSkfMmN
 QqMrxrFJfe0nmrA+8tdIdasDUMj78wbumNfDUgrPjc19W5HlB8bAEtb30xgmOF37ogpb
 g6F5cLDekEeRPVjaBxA4c6285Bsong+4yuMOd+vE3UsnrOd90kw0MsQItsplf4Z9atq2
 7dZw==
X-Gm-Message-State: AFqh2kqXqm75RzloK87KCPh4L2Md5ed8TPsHokfQh78Qi0PSQllOK8Ae
 YAWbQXHDqIR1/ao7H8QENoaZ9ZP67MXwwNtWkqQD2G7BMznQs+HSXNksCFw9HFGtHp2l5P5xR5V
 y8SCyvTPqp6JS00jJxd9VWm+kTawRRkORQQqnV+9plTgpoyCEs9s18ZH0ovdyVE0pxFA=
X-Received: by 2002:a05:600c:539a:b0:3d9:efe8:a42d with SMTP id
 hg26-20020a05600c539a00b003d9efe8a42dmr5765815wmb.21.1673366603179; 
 Tue, 10 Jan 2023 08:03:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsDj3O29v41oFN7dVmACFVSkm6/GiIZpMoYyk/FFHg3c0AhZFO03X9va4GOXsM/7IPerOWXQQ==
X-Received: by 2002:a05:600c:539a:b0:3d9:efe8:a42d with SMTP id
 hg26-20020a05600c539a00b003d9efe8a42dmr5765779wmb.21.1673366602881; 
 Tue, 10 Jan 2023 08:03:22 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003c70191f267sm21621782wmo.39.2023.01.10.08.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Subject: [PULL 18/29] libvhost-user: Cast rc variable to avoid compiler warning
Date: Tue, 10 Jan 2023 17:02:22 +0100
Message-Id: <20230110160233.339771-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcel Holtmann <marcel@holtmann.org>

The assert from recvmsg() return value against an uint32_t size field
from a protocol struct throws a compiler warning.

  CC       libvhost-user.o
In file included from libvhost-user.c:27:
libvhost-user.c: In function ‘vu_message_read_default’:
libvhost-user.c:363:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘uint32_t’ {aka ‘unsigned int’} [-Werror=sign-compare]
  363 |         assert(rc == vmsg->size);
      |                   ^~

This is not critical, but annoying when the libvhost-user source are
used in an external project that has this compiler warning switched on.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Message-Id: <7a791e27b7bd3e0a8b8cc8fbb15090a870d226d5.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 67d75ece53b7..bcdf32a24f60 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -339,7 +339,7 @@ vu_message_read_default(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
             goto fail;
         }
 
-        assert(rc == vmsg->size);
+        assert((uint32_t)rc == vmsg->size);
     }
 
     return true;
-- 
2.38.1


