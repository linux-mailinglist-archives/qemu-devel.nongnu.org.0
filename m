Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6A1400D2B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:44:42 +0200 (CEST)
Received: from localhost ([::1]:35012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdSr-0000bm-Td
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLd-00060W-Fd
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLc-0001SL-2P
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9J1SZK6q/IrdiaUC0UN5jQCNpILg+MnT95UcKmm0bk=;
 b=NF99i+cKptmZqQThrPNyT+laIOwtlosZDKFrMYTP9BvgF1a/X6frNKr7tpsy4uoU+FuNxP
 Vj9zPLQ6dOa44F02bHkoWLXwjEdrDw3+oV0m3sX7n0/OZfAxxkbKCLIM1lW3SHHgumd0iX
 AbTHoiUUAPlfOaCeIW1L5t74nJAMHDw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-GCXaoOhoNDeklMCMGR409A-1; Sat, 04 Sep 2021 17:37:10 -0400
X-MC-Unique: GCXaoOhoNDeklMCMGR409A-1
Received: by mail-ed1-f69.google.com with SMTP id
 u2-20020aa7d982000000b003cda80fa659so250872eds.14
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h9J1SZK6q/IrdiaUC0UN5jQCNpILg+MnT95UcKmm0bk=;
 b=iBkn/jVdRprHyuxoItEr/+7FNFd7alh+u2AlbkGhU5Efd81Mj+hz9yD1ZViive2wJr
 vYyQdCSsmErol4XkquDieOyzzPHbRIGZcQwK62jHXKzsIggCCZhaEs3gEzm6BKY5Riwv
 TuCSV4XDzIfXIVk2zrd1e5iW/4nFAXvfhNyiQCxhNFfTAzSNmIWdSxiYAD2/f9TllDdH
 79a2iulGr+dgFxVn9tFzYtSLGzwn5HQ2cEEzHaTEibiAnDjiSbNrQxQLZZAzhwA+1Uqj
 DpaX1ztS5Tt/0s0OORymQpqprfEYqdLvjBMuxZ7Z/AlZdb0/9G23u3/zMsaWpr726ATl
 i3vA==
X-Gm-Message-State: AOAM531JN59mvrSHv42jh3ObdH0TuREzyBlbOYMOnD6vNgexeasYe1X2
 YCxfQRFYfY8dRQDxOmx1xKCTv8T3+Awnz6sChL15zzHX/GUn48KjY7xYWMDqtD89iotg14K+srF
 yZvP/okdGbYwyerQKOeY0PuLBKlZlGzRqAsKO4TGAJ5T1S8hprR6Vp0ARL/WN
X-Received: by 2002:a50:c905:: with SMTP id o5mr5746013edh.250.1630791428485; 
 Sat, 04 Sep 2021 14:37:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1GlYq6v28X055RtGUwCbQMOR6DrO+nzNYBBB6WdTio8vlz+L32Cw39QohE81yBVSKmXzHEA==
X-Received: by 2002:a50:c905:: with SMTP id o5mr5746003edh.250.1630791428326; 
 Sat, 04 Sep 2021 14:37:08 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id m6sm1874641edi.10.2021.09.04.14.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:07 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/35] tests/vhost-user-bridge.c: Sanity check socket path
 length
Message-ID: <20210904213506.486886-24-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The vhost-user-bridge binary accepts a UNIX socket path on
the command line. Sanity check that this is short enough to
fit into a sockaddr_un before copying it in.

Fixes: Coverity CID 1432866
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210901152632.25511-1-peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/vhost-user-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 24815920b2..cb009545fa 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -540,6 +540,11 @@ vubr_new(const char *path, bool client)
     CallbackFunc cb;
     size_t len;
 
+    if (strlen(path) >= sizeof(un.sun_path)) {
+        fprintf(stderr, "unix domain socket path '%s' is too long\n", path);
+        exit(1);
+    }
+
     /* Get a UNIX socket. */
     dev->sock = socket(AF_UNIX, SOCK_STREAM, 0);
     if (dev->sock == -1) {
-- 
MST


