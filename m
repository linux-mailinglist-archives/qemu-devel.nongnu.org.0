Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C6374A03
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:17:56 +0200 (CEST)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOu3-00073n-VV
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOni-0008Os-K4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOng-0004Ir-0n
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XsKwZNupJ+4f3H9PdgeWNChZDELAQClzri8f7pUD+M=;
 b=Nj2zWNu42JRoqzySuk9CxLKBUbbFBVbf/StLmNHTHMRAgtQ70xBtQGaNKQ8ziQIEXtvJ5v
 twesmA+kDs+jgLNk01dPwg1HzpdYSt46TRc9b1l+CKSJgdRFkI3+jhyKNgAOJGZf8I31Tb
 Y8S8cQchgeSZ+628lGue/p69LkpvsOQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-qLHhiOy1NwO5E7hmKN5ARg-1; Wed, 05 May 2021 17:11:18 -0400
X-MC-Unique: qLHhiOy1NwO5E7hmKN5ARg-1
Received: by mail-wm1-f69.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so1969921wmg.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XsKwZNupJ+4f3H9PdgeWNChZDELAQClzri8f7pUD+M=;
 b=Z+lYNefEGFV9W7Ks1hHr/YFMCDGbs8Gdi2i/bR5W/RKGQg13z7RF0uXvFQ3/QdBHea
 tZS3fFShaPWkyQgDqozzfbZvkgGPKJggQ6CcomvxJPNiP1gNvMGK2XFVfk4597x/9Z3o
 A050U/zrlHXKHLfKuY1RFXVqs3M3tFNCxr9YH9h31TCOfgWfwoEDD8AVkDZp3+sj2gvJ
 6ku0fa1BV9QDhqxrKXwZjro+KL/8haeL7c3fhZMfVDFWKWMv2J3zzk846nyjXYtiHG6s
 yU0tJe9ZdKuG4nnhb/TuUGCJNrJJdUvtAvg0ESczVIVi7VJOJTOovOpIYAA84kGcTaaP
 dcQQ==
X-Gm-Message-State: AOAM532UFjmDxsW6BdaGNpxUo3oWjNRgyjHuDwDwvnVcOvDdYJZ6QuMv
 zT/Bx2Fskrx2uq4sHy+iMe57Ldnuje3aovUyH81cv5ND+J60oOECS5E2Wjqiu4Ng/3OT9+mIug/
 LqbqnDQxBpvrhfqZe+tjAk8XN6liicNd7covV+L0mJ3OM61Ai5RtdUcH+MKfHrwDd
X-Received: by 2002:adf:e5cd:: with SMTP id a13mr1000826wrn.303.1620249076689; 
 Wed, 05 May 2021 14:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHHkV8frGxn8o8BSzf/TM9ljlb72+T/9RYIbN9zU07xxuIRtGSed2exRv5kWaKaBCsAaiysA==
X-Received: by 2002:adf:e5cd:: with SMTP id a13mr1000803wrn.303.1620249076541; 
 Wed, 05 May 2021 14:11:16 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id h14sm814414wrq.45.2021.05.05.14.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/23] io/channel-websock: Replace strlen(const_str) by
 sizeof(const_str) - 1
Date: Wed,  5 May 2021 23:10:29 +0200
Message-Id: <20210505211047.1496765-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The combined_key[... QIO_CHANNEL_WEBSOCK_GUID_LEN ...] array in
qio_channel_websock_handshake_send_res_ok() expands to a call
to strlen(QIO_CHANNEL_WEBSOCK_GUID), and the compiler doesn't
realize the string is const, so consider combined_key[] being
a variable-length array.

To remove the variable-length array, we provide it a hint to
the compiler by using sizeof() - 1 instead of strlen().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 io/channel-websock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io/channel-websock.c b/io/channel-websock.c
index 03c1f7cb62f..cd7bba6bde7 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -32,7 +32,7 @@
 
 #define QIO_CHANNEL_WEBSOCK_CLIENT_KEY_LEN 24
 #define QIO_CHANNEL_WEBSOCK_GUID "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
-#define QIO_CHANNEL_WEBSOCK_GUID_LEN strlen(QIO_CHANNEL_WEBSOCK_GUID)
+#define QIO_CHANNEL_WEBSOCK_GUID_LEN (sizeof(QIO_CHANNEL_WEBSOCK_GUID) - 1)
 
 #define QIO_CHANNEL_WEBSOCK_HEADER_PROTOCOL "sec-websocket-protocol"
 #define QIO_CHANNEL_WEBSOCK_HEADER_VERSION "sec-websocket-version"
-- 
2.26.3


