Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA7550FC5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 07:49:15 +0200 (CEST)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3AHi-0004li-M8
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 01:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3A99-0006tq-Ch
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3A96-00020w-KO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655703619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Uq2VEJQZ9VOMhyczZgNwmedJnriuLY1lhqwmBG90+s=;
 b=KYgw3orirAkqVFNmXhIKfTvhelLKebdGtk8nq6NZYl1xaRPFsu2Z8tpuinYBi6A3yqlFpZ
 GNfKl7VEUNn/YAMy3/ak6mOLJtBG0/7VsRgYwH+Az6OOuYX7c2s19mm/Lo0v5KoNRE+NoW
 CxZ6TVFAlHLmTqRiN5ChsRDo1JWL92c=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-tzKm_x7_Mp2JB3xvegn4CA-1; Mon, 20 Jun 2022 01:40:13 -0400
X-MC-Unique: tzKm_x7_Mp2JB3xvegn4CA-1
Received: by mail-oi1-f197.google.com with SMTP id
 bq1-20020a05680823c100b0033151511358so4192437oib.4
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 22:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Uq2VEJQZ9VOMhyczZgNwmedJnriuLY1lhqwmBG90+s=;
 b=5UsI8aUQ/oNLtTFGn8EAFp+97teX2nclVYfn77rseSvfptnCIdk6zjISZR8kQpLdbl
 DU+ENmJLmIEa7wl22qfpaTzD7zrsw1zU7tlLbnBe5xsByfwOqn5INVIThZaoSc41lsoT
 FvMEVwLFdqcQD26thT7FMXYUzfz7INpc7vNkufMEFvs1EMZ/cbrvKFnBTE+R42a2Dm2k
 b0YH5P+EhK9sqpbNEHG4PqkDUWINHal0c1VReWIpYZtD3uDmu4BE89TwzIapLhPdiQEP
 1NKltXLFpnhH0iS5GrgrkJfJUI9FoZ626bxSarS8Ix0FWkzo694Ds6KqMx2cmj/L3Py5
 WBZw==
X-Gm-Message-State: AJIora/R7QX+bDppBLMQr1qlMPDczZ0uwHYSm0I93uprc3ih9sdVnG4m
 hYub26d472ldG3QDS/EH4CPGs9DxVC0tmsnVsCkwjkH4uakr2uS14WVdg1D31LBr70ONVhnUuhv
 HbPHtv3tdQVOBA8M=
X-Received: by 2002:a05:6808:1898:b0:331:4343:7637 with SMTP id
 bi24-20020a056808189800b0033143437637mr9333909oib.83.1655703612837; 
 Sun, 19 Jun 2022 22:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sCTVlQuNaWwdy7xW3ldepRembLilNdxHJXW7iIweOTIwhj0g16P3lR5ZKHAMPB/UjJSKJMww==
X-Received: by 2002:a05:6808:1898:b0:331:4343:7637 with SMTP id
 bi24-20020a056808189800b0033143437637mr9333900oib.83.1655703612668; 
 Sun, 19 Jun 2022 22:40:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:d933:8f52:267a:639c:b4c0])
 by smtp.gmail.com with ESMTPSA id
 e94-20020a9d2ae7000000b0060c2845c175sm7021463otb.8.2022.06.19.22.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 22:40:12 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] QIOChannelSocket: Fix zero-copy send so socket flush
 works
Date: Mon, 20 Jun 2022 02:39:43 -0300
Message-Id: <20220620053944.257547-3-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620053944.257547-1-leobras@redhat.com>
References: <20220620053944.257547-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
part of the flushing mechanism got missing: incrementing zero_copy_queued.

Without that, the flushing interface becomes a no-op, and there is no
guarantee the buffer is really sent.

This can go as bad as causing a corruption in RAM during migration.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-socket.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index dac9e60c20..4fa0402f54 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -611,6 +611,11 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
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


