Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE23754A8C1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:28:26 +0200 (CEST)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0z6I-000190-28
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o0ywN-0002xf-Rv
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o0ywL-00015J-IK
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655183889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7ZCZ0OsCHQKSRbMFL98ydjniCLZCKfuU+YvGP0q/4Q=;
 b=Xcjm+zUbWx7cfWZWNBhzbtp2wQOVFk6DWpVgftXjHGL+7OFrCW0YD/Eco16NbwaxMWhFvY
 Z2noCwFEvzH+goN1QhxzxVyCh5aEmn83mWt0ECWE1BYJ/WZB46rmEpdm6bQ8HRfJEuljeC
 stLNzF33GYB0iywUSWVxeLllaJeyvDg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-7eJb4iwmOdCgRARu9aS4Kg-1; Tue, 14 Jun 2022 01:18:06 -0400
X-MC-Unique: 7eJb4iwmOdCgRARu9aS4Kg-1
Received: by mail-qt1-f200.google.com with SMTP id
 a16-20020a05622a02d000b00304eb488a71so5882226qtx.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7ZCZ0OsCHQKSRbMFL98ydjniCLZCKfuU+YvGP0q/4Q=;
 b=kLwojrar8oZYljx1Ilto2Aj0iVq8s6SykPBnTG0MTjFbAjdX5GmqOT2AGDzjCGY2dz
 nfX4R1jcbrzCyU3E36FCp1VaipGmrJJu8xGu8boKDUMp9WI7G/duIeKtV9Feap2P5Lqq
 fk/FU95S65dLthQPnUFQS1RUJWO/faymC2MwoouIt0AyiACNmGnMhnU+Hom0ZmUQVIey
 dwMfruiyBq9wPyjMATRuD+zEby2Os6pb1awTNurZhZ4H+piXOGj1kAnr3gf2C7+4+agx
 m9xBRR+01C5LsKYQnHWIumR5r2LddD5Jf4HKbTGtFu0u1i9D2hnveherPQZTJ0Hj2u8S
 Qlsg==
X-Gm-Message-State: AOAM531EGdwQrQFJF5DYMubIxl/871F7Kor6/7fooYoz93Md3riKBM4s
 sbTC87+35nAAc1YVz8FtknVee0zwuazZtQboMqU77imIvYQkxmBv9UFtILDBIJN8By95LsbThWO
 UKbp7/fqTfOat1so=
X-Received: by 2002:ae9:e402:0:b0:6a7:86a3:752e with SMTP id
 q2-20020ae9e402000000b006a786a3752emr2687466qkc.300.1655183885924; 
 Mon, 13 Jun 2022 22:18:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyopeNJDzKAWruoy9PxDEIkjTkPfAUS6UqhgBuBW8k49lzD+29BinAXEITHiEeZEcy2xVVlfA==
X-Received: by 2002:ae9:e402:0:b0:6a7:86a3:752e with SMTP id
 q2-20020ae9e402000000b006a786a3752emr2687462qkc.300.1655183885699; 
 Mon, 13 Jun 2022 22:18:05 -0700 (PDT)
Received: from LeoBras.redhat.com ([177.9.73.5])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05620a268700b006a37eb728cfsm8974872qkp.1.2022.06.13.22.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:18:05 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>,
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] QIOChannelSocket: Fix zero-copy send so socket flush
 works
Date: Tue, 14 Jun 2022 02:17:26 -0300
Message-Id: <20220614051725.143985-2-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220614051725.143985-1-leobras@redhat.com>
References: <20220614051725.143985-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
part of the flushing mechanism got missing: incrementing zero_copy_queued.

Without that, the flushing interface becomes a no-op, and there is no
guarantee the buffer is really sent.

This can go as bad as causing a corruption in RAM during migration.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index cdce7b0b45..f31dd189a5 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -607,6 +607,11 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                          "Unable to write to socket");
         return -1;
     }
+
+    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+        sioc->zero_copy_queued++;
+    }
+
     return ret;
 }
 #else /* WIN32 */
-- 
2.36.1


