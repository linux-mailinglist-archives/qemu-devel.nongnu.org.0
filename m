Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA10D543B51
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 20:21:12 +0200 (CEST)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz0Ip-0001pp-BH
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 14:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nz0Gl-0000Ia-QD
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 14:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nz0Gj-00054H-0B
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 14:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654712339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ykVQD5k8eD9v6FvsSP1QkaBPJ4u6IdVy7bvsBWVCQv4=;
 b=XlktQWQfony8XrLY9HITspJ1RO77pnnkTfp00xjwVHeszRu3P5Q8NQ4asg0hfqOMGufuLA
 +Qsh+PVV0K715229po900SIb/zCWpSw7smVT/sOmMtR+MEYr7REPMpftJU9QnYFyH5+qPV
 yhrrw140Fe/vnH5tNmwS3fT9iRxiRjw=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-X4meat9IOgObOUYrfFetqw-1; Wed, 08 Jun 2022 14:18:56 -0400
X-MC-Unique: X4meat9IOgObOUYrfFetqw-1
Received: by mail-ot1-f72.google.com with SMTP id
 n18-20020a9d7112000000b0060bdd3bad6fso6083225otj.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 11:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykVQD5k8eD9v6FvsSP1QkaBPJ4u6IdVy7bvsBWVCQv4=;
 b=uHQ6uyqv301u6KUbj2CdhJG5zpvxhSuRR8OZ5e9YaLmVAdne5YK5UxKboNKwQILOnf
 IxeZcjknKPqRPU4j4XFJdpVD4qhGtK2+1KNlah2QRAa1CLNehV24e21ot8HiamGUW8f6
 hZ5f5CBmD9ykeTeovDaUIU1O5iQaKTisvt+HSKx2SWCeE3wolHGESw/2itwGh4LKTZX/
 Nfo/mWKpbW96x/Wid3U0F1mJXiv+skNcvbXMzvqsSQykeh/6vV7HKMetweIzGTtWlP4U
 CzoVC2rUWLGyb4E/yw1m2zO4Gf7lvdZM4kPedyxdOjDS2HD3b1vtCwHeWQ1hx2O/6i5p
 jh1w==
X-Gm-Message-State: AOAM5307eqyx9DlMp5lPmwtl07PymvcuvVK48QtkBn4IaPyBFrpCPKfd
 Xw698mEtKmktRuMRGb5JTLKuPgaioWVXgSM2ydB+8wUI3uzfI+geY2QzA0C+h3nlYCu+xoeyBe4
 j99t2Z2TTriZLkzw=
X-Received: by 2002:a05:6808:1453:b0:32b:93a7:effa with SMTP id
 x19-20020a056808145300b0032b93a7effamr3089253oiv.27.1654712335502; 
 Wed, 08 Jun 2022 11:18:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5NizU7z2eWOXVDUP+aacB5Y2qokRBiq5MuJDz9npImL3n+E1LGzyocUZ27K07Oqs0krRQoQ==
X-Received: by 2002:a05:6808:1453:b0:32b:93a7:effa with SMTP id
 x19-20020a056808145300b0032b93a7effamr3089242oiv.27.1654712335284; 
 Wed, 08 Jun 2022 11:18:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f1:d1b1:8b15:218b:6b0e:5260])
 by smtp.gmail.com with ESMTPSA id
 s42-20020a05683043aa00b0060613c844adsm10847656otv.10.2022.06.08.11.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 11:18:54 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>
Subject: [PATCH v1 1/1] QIOChannelSocket: Fix zero-copy send so socket flush
 works
Date: Wed,  8 Jun 2022 15:18:09 -0300
Message-Id: <20220608181808.79364-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
part of the flushing mechanism got missing: incrementing zero_copy_queued.

Without that, the flushing interface becomes a no-op, and there is no
garantee the buffer is really sent.

This can go as bad as causing a corruption in RAM during migration.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de1..ca4cae930f 100644
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
 
@@ -592,21 +594,24 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
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
                          "Unable to write to socket");
         return -1;
     }
+
+    if (zero_copy_enabled) {
+        sioc->zero_copy_queued++;
+    }
+
     return ret;
 }
 #else /* WIN32 */
-- 
2.36.1


