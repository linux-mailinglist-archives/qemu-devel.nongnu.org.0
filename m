Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD3543E32
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:07:01 +0200 (CEST)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2tI-0003Bc-5S
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nz2qj-0001lX-L3
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nz2qi-00048J-6N
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654722259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=j3Nz/ACzzNuOiSk8tGSrM9ZLKWcQ64Xrz23dnSYVlps=;
 b=aU+7lcd6MMLw+AgQEClMP6n9H18/o2OyAMKbA6qIUWDSazjG7fOCKW54eWETEjJatoSYrd
 Xh3j1QSq/h0+wCdSfr28fyT3Q0gQVed6Lwl/B+I9PfQ6lbN+9TNaskikoymWva61PIwq6z
 aC9KMcwsLMZzfz/EDbOrGSroHvSUx80=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-cAPV3E_VO06XEQAVfp0GLw-1; Wed, 08 Jun 2022 17:04:18 -0400
X-MC-Unique: cAPV3E_VO06XEQAVfp0GLw-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-f2bdeb5298so12906242fac.5
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3Nz/ACzzNuOiSk8tGSrM9ZLKWcQ64Xrz23dnSYVlps=;
 b=Lx6A4CGWR4cWp3svQTqsN4XxfoM5uORPpVB2jjN4wc0s76hE7uU3nw2PsQGSS7nFMX
 zAfpu4EC5Wu9QYK4A8cVOZ80Gbzb7jmtxHRRFenkxjzYl73Ut4H7MB3h0QeZPbC8pwv2
 jRykfJt0j3+4ux9DWTN0cs+L3qRw90uHpKdSH0nYrJGe+y2B2i29TfHuXAV1G/69AYz0
 xFYaoTlzOaSA6po9QR/j1IGTaOQncTQA3mSaP5NB3QHEwy/BmHQhk1rZOCUPaNaPKG4b
 334jT1+gjRkOoIHqkl1mSguoNFhxyuI5eVRfGMCu2vmrFEC4aEat7EF+mIT+e/X42sJw
 e2NA==
X-Gm-Message-State: AOAM531665HYaR8hXZurzuzrgO7ICgf0ut49e9PJrLEB22w8wB22E8w1
 Aq6ePNC/gUYt3LZzmI6P8m+MDOpycU0ai4jnFdmiaGMjtm/R86w22c97ucX0YABDAG2f9cnGond
 BHtVikKO3Nq3xJTE=
X-Received: by 2002:a05:6808:159a:b0:32b:80e3:f746 with SMTP id
 t26-20020a056808159a00b0032b80e3f746mr3605477oiw.144.1654722257208; 
 Wed, 08 Jun 2022 14:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrAa/ICAXvJ0vleNQxcdmKaA3kqbKS9J1VM/FPsc4wakmb7wLyPkpK0Nz6HbKp/skNnDUROA==
X-Received: by 2002:a05:6808:159a:b0:32b:80e3:f746 with SMTP id
 t26-20020a056808159a00b0032b80e3f746mr3605469oiw.144.1654722257029; 
 Wed, 08 Jun 2022 14:04:17 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f1:d1b1:8b15:218b:6b0e:5260])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a0568302b0e00b0060b66e2eaaesm11382384otv.38.2022.06.08.14.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:04:16 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>,
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] QIOChannelSocket: Reduce ifdefs to improve readability
Date: Wed,  8 Jun 2022 18:04:02 -0300
Message-Id: <20220608210403.84006-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
									...
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de1..ef7c7cfbac 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -554,6 +554,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     size_t fdsize = sizeof(int) * nfds;
     struct cmsghdr *cmsg;
     int sflags = 0;
+    bool zero_copy_enabled = false;
 
     memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
 
@@ -581,6 +582,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 #ifdef QEMU_MSG_ZEROCOPY
     if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
         sflags = MSG_ZEROCOPY;
+        zero_copy_enabled = true;
     }
 #endif
 
@@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
             return QIO_CHANNEL_ERR_BLOCK;
         case EINTR:
             goto retry;
-#ifdef QEMU_MSG_ZEROCOPY
         case ENOBUFS:
-            if (sflags & MSG_ZEROCOPY) {
+            if (zero_copy_enabled) {
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


