Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9AF550FC1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 07:46:02 +0200 (CEST)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3AEb-0000i0-53
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 01:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3A94-0006qW-Pw
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3A91-0001zq-4Z
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655703614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXyf3lUINAbMGgUajxz86xF+mCWXf+ius0hSj5jixiw=;
 b=B0OYUcrkOC2BU4E78rNwYnBEEPLWtXd3YCsSLc6wNMdEeiaq6/SPOlR2J2bDbkqkr34Ewd
 taC/jumCo/xBUkoYi49FbwdtfrRGEibM1aiWa1V+Qg6j4BJB2Axsanj2EewrYWmzsNqd9F
 BXiiqP5azRwy+eeGfiEwgwXL/jYGVTE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-Ou149WxyMXmzHEk_wPOGUw-1; Mon, 20 Jun 2022 01:40:10 -0400
X-MC-Unique: Ou149WxyMXmzHEk_wPOGUw-1
Received: by mail-ot1-f71.google.com with SMTP id
 j13-20020a056830014d00b0060c27fcfe63so5426382otp.9
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 22:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sXyf3lUINAbMGgUajxz86xF+mCWXf+ius0hSj5jixiw=;
 b=HtkxgsmqfO9rfZxxpP5PKKkK+C8hhzNLwrFaE08W0Y5H7qilByF0PucFc9WyslylRK
 sN2cU6ouyB6FWH+B3RVtBhPM0xT13psHJqepAiK931sMQR+WrEUMmpSmnGYB/vGHhBCU
 8JeEcJV+G+DEAnXwEMn6PvaKoW3LIkK6giwofJsgiV/61Tw1uPRzMpifP3GW2JgJd//n
 ie5f26ZyyyIpyje6zstHk4PYPQijQwhReI7wqDX2HPNiuNjR+0mvqMIbnqttTWZWTw8g
 a14lrPv0q1AtL2rH6C4VaD1dtBL9g/g0yBcwidUNa9kqvEibSczaoKRG1AC1sLwhbFRc
 3KYg==
X-Gm-Message-State: AJIora+bdNnVbcu+R7GL+V6Abb8aubOqS0A0IYvcvS89OOoQEYOpk5Mm
 7ioduyHl5L9swJZAbK+9J2ve1bx20mNwVOw05VRrSk5EPNjR8ZiOPIUXxR9rh8GrsOWANfJ7MPP
 3Y+8vaneRUiQiLiA=
X-Received: by 2002:a05:6870:170f:b0:101:c93f:2517 with SMTP id
 h15-20020a056870170f00b00101c93f2517mr4505805oae.78.1655703609802; 
 Sun, 19 Jun 2022 22:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vsl0CJKPYaApW1WdGGAYjdhNP6mZBwjF6HwVXQKZ+aGUP/2bIp1y8wsyOpmKoy+WHRRWb+pQ==
X-Received: by 2002:a05:6870:170f:b0:101:c93f:2517 with SMTP id
 h15-20020a056870170f00b00101c93f2517mr4505799oae.78.1655703609647; 
 Sun, 19 Jun 2022 22:40:09 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:d933:8f52:267a:639c:b4c0])
 by smtp.gmail.com with ESMTPSA id
 e94-20020a9d2ae7000000b0060c2845c175sm7021463otb.8.2022.06.19.22.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 22:40:09 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] QIOChannelSocket: Introduce assert and reduce ifdefs
 to improve readability
Date: Mon, 20 Jun 2022 02:39:42 -0300
Message-Id: <20220620053944.257547-2-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620053944.257547-1-leobras@redhat.com>
References: <20220620053944.257547-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
introduced, particularly at qio_channel_socket_writev().

Rewrite some of those changes so it's easier to read.

Also, introduce an assert to help detect incorrect zero-copy usage is when
it's disabled on build.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-socket.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de1..dac9e60c20 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -578,11 +578,17 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
         memcpy(CMSG_DATA(cmsg), fds, fdsize);
     }
 
-#ifdef QEMU_MSG_ZEROCOPY
     if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+#ifdef QEMU_MSG_ZEROCOPY
         sflags = MSG_ZEROCOPY;
-    }
+#else
+        /*
+         * We expect QIOChannel class entry point to have
+         * blocked this code path already
+         */
+        g_assert_unreachable();
 #endif
+    }
 
  retry:
     ret = sendmsg(sioc->fd, &msg, sflags);
@@ -592,15 +598,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
             return QIO_CHANNEL_ERR_BLOCK;
         case EINTR:
             goto retry;
-#ifdef QEMU_MSG_ZEROCOPY
         case ENOBUFS:
-            if (sflags & MSG_ZEROCOPY) {
+            if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
                 error_setg_errno(errp, errno,
                                  "Process can't lock enough memory for using MSG_ZEROCOPY");
                 return -1;
             }
             break;
-#endif
         }
 
         error_setg_errno(errp, errno,
-- 
2.36.1


