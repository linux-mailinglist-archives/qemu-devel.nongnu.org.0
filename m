Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3328400D32
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:48:54 +0200 (CEST)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdWv-0002Xz-SK
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLg-0006B3-5k
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLe-0001VJ-Ow
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCTYA9qtrnGchUMuPb8pA4MhrNf+Qclj3/a+DtEJkUc=;
 b=OMwLB7CkWaMi+E5ChKZMvRuUDRSNkXkq9Z+lZaDIRhgfv2N8YC1QE5DreCdlspatkhBDyG
 NixkvyRd2VNrWM5Q3ep63dbRumUGxL1BPgl7OQyERh4049c0iqG7Duw+sEu5y3M93EIjzJ
 hQaJSjq6irnwzrXy52HVQjns68WtkfI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-PhP7_B53PDmJxP9TZdce7w-1; Sat, 04 Sep 2021 17:37:13 -0400
X-MC-Unique: PhP7_B53PDmJxP9TZdce7w-1
Received: by mail-ed1-f69.google.com with SMTP id
 z17-20020a05640240d100b003cac681f4f4so1347509edb.21
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lCTYA9qtrnGchUMuPb8pA4MhrNf+Qclj3/a+DtEJkUc=;
 b=H4XmujHaGWYzjj0uB+2jUu7ZmiVQ6se9v7QOuMLZa4DcBXmB7aOnRIsVC9YNsfllnN
 3A4MOOT/ET6WxR9DNYfB3FnloPSiAyaaWhTlTiBMuJvMgOEoqcRWcsGxSgF2lCSvlvdG
 g78sPjpSLH3EiKErkW5MTKx75KGtSH2JCirMS6UBnmmiS1mL3S1hCXn3iaUlVr+HLvoA
 UQ+cI0QKBaolic+Wj5DLtf3PeuC9kC/uuqfQJ747Ka5R/xV6d+Xzzdujnbh3Wjq/6sun
 CliEP/tNuu5l+2rMZHgETQE9+ZB8chU2R7vZ504spzpuIv8z/ik7DVChnJM2CfkNOhsQ
 KU8Q==
X-Gm-Message-State: AOAM533pPiCrl7KUxonoms9wTL+MmAHCarj/g4O2U3zCYALP+iXyPi+p
 lD0smp/osViQ6TWkf343p0xH/A7gnNK59MVuKgMD62VDjMvRlxoPps4zOl5PbplfF04X3e3JJj3
 ZifsIbPNB//rG+udoiOc7MPul+8axcrWUj0viFTT9m6NpNdMtReuEiLAKVfXd
X-Received: by 2002:a50:ab42:: with SMTP id t2mr5930644edc.113.1630791431527; 
 Sat, 04 Sep 2021 14:37:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU+cj4u6U7WAjiDmPlKGb24AB/RrMzBAGFm8lUE3+Ks0Ou8+OvYGS1bujCTsjMloCq8gU8GQ==
X-Received: by 2002:a50:ab42:: with SMTP id t2mr5930632edc.113.1630791431358; 
 Sat, 04 Sep 2021 14:37:11 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id cf11sm1901705edb.65.2021.09.04.14.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:10 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/35] tests/vhost-user-bridge.c: Fix typo in help message
Message-ID: <20210904213506.486886-25-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Fix a typo in the help message printed by vhost-user-bridge.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210901152713.25701-1-peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/vhost-user-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index cb009545fa..35088dd67f 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -831,7 +831,7 @@ main(int argc, char *argv[])
 out:
     fprintf(stderr, "Usage: %s ", argv[0]);
     fprintf(stderr, "[-c] [-H] [-u ud_socket_path] [-l lhost:lport] [-r rhost:rport]\n");
-    fprintf(stderr, "\t-u path to unix doman socket. default: %s\n",
+    fprintf(stderr, "\t-u path to unix domain socket. default: %s\n",
             DEFAULT_UD_SOCKET);
     fprintf(stderr, "\t-l local host and port. default: %s:%s\n",
             DEFAULT_LHOST, DEFAULT_LPORT);
-- 
MST


